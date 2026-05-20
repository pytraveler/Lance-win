# ---------------------------------------------------------
# lance_download_models.py
# Lance Model Downloader with interactive menu
#
# Downloads model files from HuggingFace using direct HTTP
# (pycurl / system curl) with resume support — bypasses the
# standard huggingface-cli which has connectivity issues in
# certain regions.
# ---------------------------------------------------------

import os
import sys
import subprocess
import shutil
import argparse
from typing import Optional

from tqdm import tqdm

# ========================= Constants =========================

VERSION = "1.0.0"

HF_REPO = "bytedance-research/Lance"
HF_BASE_URL = f"https://huggingface.co/{HF_REPO}/resolve/main"

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DOWNLOADS_DIR = os.path.join(SCRIPT_DIR, "downloads")

# ========================= ANSI Colors =========================


class C:
    """ANSI color helpers."""
    RST = "\033[0m"
    RED = "\033[91m"
    GRN = "\033[92m"
    YEL = "\033[93m"
    BLU = "\033[94m"
    MAG = "\033[95m"
    CYN = "\033[96m"
    WHT = "\033[97m"
    GRAY = "\033[90m"
    BOLD = "\033[1m"


def _c(color: str, text: str) -> str:
    return f"{color}{text}{C.RST}"


# ========================= Manifests =========================
# Each manifest: list of (relative_path, label)
# relative_path is relative to downloads/ and mirrors the HF repo layout.

MANIFEST_LANCE_3B_VIDEO = [
    ("Lance_3B_Video/generation_config.json", "generation_config.json"),
    ("Lance_3B_Video/llm_config.json",        "llm_config.json"),
    ("Lance_3B_Video/merges.txt",             "merges.txt"),
    ("Lance_3B_Video/model.safetensors",      "model.safetensors  (~26.5 GB)"),
    ("Lance_3B_Video/tokenizer.json",         "tokenizer.json"),
    ("Lance_3B_Video/tokenizer_config.json",  "tokenizer_config.json"),
    ("Lance_3B_Video/vocab.json",             "vocab.json"),
]

MANIFEST_LANCE_3B = [
    ("Lance_3B/generation_config.json", "generation_config.json"),
    ("Lance_3B/llm_config.json",        "llm_config.json"),
    ("Lance_3B/merges.txt",             "merges.txt"),
    ("Lance_3B/model.safetensors",      "model.safetensors  (~23.0 GB)"),
    ("Lance_3B/tokenizer.json",         "tokenizer.json"),
    ("Lance_3B/vocab.json",             "vocab.json"),
]

MANIFEST_VIT = [
    ("Qwen2.5-VL-ViT/config.json",     "config.json"),
    ("Qwen2.5-VL-ViT/vit.safetensors", "vit.safetensors  (~1.2 GB)"),
]

MANIFEST_VAE = [
    ("Wan2.2_VAE.pth", "Wan2.2_VAE.pth  (~2.6 GB)"),
]


def _manifest_key(manifest):
    """Return the directory prefix used to check if a manifest group is complete."""
    first_path = manifest[0][0]
    return first_path.split("/")[0] if "/" in first_path else first_path


# ========================= Download engine =========================


def download_file_with_resume(url: str, dest_path: str) -> None:
    """Download *url* to *dest_path* with resume support.

    Priority: pycurl → system curl.  Skips if the file already exists.
    """
    os.makedirs(os.path.dirname(dest_path), exist_ok=True)

    if os.path.exists(dest_path):
        return  # already done

    tmp_path = dest_path + ".tmp"
    existing_size = 0
    if os.path.exists(tmp_path):
        existing_size = os.path.getsize(tmp_path)

    # ── 1. Try pycurl ──────────────────────────────────────────
    try:
        import pycurl  # noqa: lazy import

        # HEAD request for total size
        total_size = 0
        c_head = pycurl.Curl()
        c_head.setopt(pycurl.URL, url)
        c_head.setopt(pycurl.NOBODY, 1)
        c_head.setopt(pycurl.FOLLOWLOCATION, 1)
        c_head.setopt(pycurl.CONNECTTIMEOUT, 30)
        c_head.setopt(pycurl.TIMEOUT, 60)
        c_head.perform()
        if c_head.getinfo(pycurl.RESPONSE_CODE) == 200:
            total_size = int(c_head.getinfo(pycurl.CONTENT_LENGTH_DOWNLOAD))
        c_head.close()

        c = pycurl.Curl()
        c.setopt(pycurl.URL, url)
        c.setopt(pycurl.FOLLOWLOCATION, 1)
        c.setopt(pycurl.CONNECTTIMEOUT, 30)
        c.setopt(pycurl.TIMEOUT, 0)  # no global timeout for large files

        if existing_size > 0:
            c.setopt(pycurl.RESUME_FROM, existing_size)
        elif os.path.exists(tmp_path):
            os.remove(tmp_path)

        basename = os.path.basename(dest_path)
        with tqdm(
            total=total_size if total_size > 0 else None,
            initial=existing_size,
            unit="B",
            unit_scale=True,
            desc=f"  {basename}",
            ascii=True,
            bar_format="{desc} {percentage:3.0f}%|{bar}| {n_fmt}/{total_fmt} [{rate_fmt}]",
        ) as bar:

            def _progress(download_t, download_d, upload_t, upload_d):
                bar.total = download_t if download_t > 0 else bar.total
                bar.n = download_d + existing_size
                bar.refresh()

            c.setopt(pycurl.NOPROGRESS, 0)
            c.setopt(pycurl.XFERINFOFUNCTION, _progress)

            with open(tmp_path, "ab" if existing_size > 0 else "wb") as f:
                c.setopt(pycurl.WRITEDATA, f)
                try:
                    c.perform()
                except pycurl.error as exc:
                    raise RuntimeError(f"pycurl download failed: {exc}") from exc

        resp_code = c.getinfo(pycurl.RESPONSE_CODE)
        c.close()

        if total_size > 0 and os.path.getsize(tmp_path) < total_size:
            raise RuntimeError("Download incomplete")

        os.replace(tmp_path, dest_path)
        return

    except ImportError:
        pass  # pycurl not available → fallback
    except Exception:
        if os.path.exists(tmp_path):
            os.remove(tmp_path)
        raise

    # ── 2. Fallback: system curl ───────────────────────────────
    if shutil.which("curl"):
        cmd = ["curl", "-L", "-C", "-", "--progress-bar", "-o", tmp_path, url]
        proc = subprocess.run(cmd)
        if proc.returncode == 0:
            os.replace(tmp_path, dest_path)
            return
        if os.path.exists(tmp_path):
            os.remove(tmp_path)
        raise RuntimeError(f"curl exited with code {proc.returncode}")

    raise RuntimeError("Neither pycurl nor system curl available. Install pycurl or add curl to PATH.")


# ========================= Manifest processor =========================


def check_manifest_complete(manifest):
    """Return (complete_count, total_count, missing_paths)."""
    complete = 0
    missing = []
    for rel_path, _label in manifest:
        full = os.path.join(DOWNLOADS_DIR, rel_path)
        if os.path.exists(full):
            complete += 1
        else:
            missing.append(rel_path)
    return complete, len(manifest), missing


def download_manifest(manifest, *, show_checkmarks: bool = False):
    """Download all files in *manifest*.  Returns list of failed filenames."""
    failed = []
    total = len(manifest)

    for idx, (rel_path, label) in enumerate(manifest, 1):
        dest_path = os.path.join(DOWNLOADS_DIR, rel_path)
        url = f"{HF_BASE_URL}/{rel_path}"

        if os.path.exists(dest_path):
            size_mb = os.path.getsize(dest_path) / (1024 * 1024)
            size_str = f"({size_mb:.0f} MB)" if size_mb >= 1 else ""
            if show_checkmarks:
                print(f"  [{_c(C.GRN, '✓')}] {idx:>2}/{total}  {label}  {size_str}")
            else:
                print(f"       {idx:>2}/{total}  {label}  {_c(C.GRN, 'exists')} {size_str}")
            continue

        print(f"  {_c(C.YEL, '⬇')}   {idx:>2}/{total}  {label}")
        try:
            download_file_with_resume(url, dest_path)
            print(f"  [{_c(C.GRN, '✓')}] {idx:>2}/{total}  {label}  {_c(C.GRN, 'done')}")
        except Exception as exc:
            print(f"  [{_c(C.RED, '✗')}] {idx:>2}/{total}  {label}  {_c(C.RED, str(exc))}")
            failed.append(rel_path)

    return failed


# ========================= Menu helpers =========================


def _menu_label(manifest, title: str, show_checkmark: bool = False) -> str:
    done, total, _ = check_manifest_complete(manifest)
    if show_checkmark and done == total:
        tag = _c(C.GRN, "✓")
    else:
        tag = ""
    return f"{title}  [{done}/{total}]{tag}"


MENU_ITEMS = [
    # (id, manifests_list, title, show_checkmark)
    (1, [MANIFEST_LANCE_3B_VIDEO, MANIFEST_VIT, MANIFEST_VAE],
     "Lance_3B_Video + Qwen2.5-VL-ViT + Wan2.2_VAE", False),
    (2, [MANIFEST_LANCE_3B, MANIFEST_VIT, MANIFEST_VAE],
     "Lance_3B + Qwen2.5-VL-ViT + Wan2.2_VAE", False),
    (3, [MANIFEST_LANCE_3B],
     "Lance_3B", True),
    (4, [MANIFEST_LANCE_3B_VIDEO],
     "Lance_3B_Video", True),
    (5, [MANIFEST_VIT],
     "Qwen2.5-VL-ViT", True),
    (6, [MANIFEST_VAE],
     "Wan2.2_VAE", True),
]


def print_menu():
    print()
    print(_c(C.BOLD, "╔══════════════════════════════════════════════════════════╗"))
    print(_c(C.BOLD, "║          Lance Model Downloader                         ║"))
    print(_c(C.BOLD, f"║          Repo: {HF_REPO:<43s}║"))
    print(_c(C.BOLD, "╚══════════════════════════════════════════════════════════╝"))
    print()
    print(f"  Destination: {_c(C.CYN, DOWNLOADS_DIR)}")
    print()
    print(f"  {_c(C.GRN, '✓')} = all files present     {_c(C.YEL, '⬇')} = needs download     {_c(C.RED, '✗')} = failed")
    print()
    print(_c(C.BOLD, "  ── Combined Sets ──"))
    for mid, manifests, title, show_ck in MENU_ITEMS[:2]:
        # For combined sets, combine the manifest counts
        total_done = sum(check_manifest_complete(m)[0] for m in manifests)
        total_count = sum(check_manifest_complete(m)[1] for m in manifests)
        print(f"  {mid}) {title}  [{total_done}/{total_count}]")
    print()
    print(_c(C.BOLD, "  ── Individual Components ──"))
    for mid, manifests, title, show_ck in MENU_ITEMS[2:]:
        label = _menu_label(manifests[0], title, show_checkmark=show_ck)
        print(f"  {mid}) {label}")
    print()
    print(f"  0) {_c(C.GRAY, 'Exit')}")
    print()


def handle_choice(choice: int):
    for mid, manifests, title, show_ck in MENU_ITEMS:
        if choice == mid:
            print()
            print(_c(C.MAG, f"▶ {title}"))
            print()
            all_failed = []
            for mf in manifests:
                # Determine subsection header from first file's directory
                first = mf[0][0]
                section = first.split("/")[0] if "/" in first else first
                print(f"  {_c(C.CYN, '──')} {_c(C.BOLD, section)} {_c(C.CYN, '──')}")
                failed = download_manifest(mf, show_checkmarks=show_ck)
                if failed:
                    all_failed.extend(failed)
                print()
            if all_failed:
                print(_c(C.RED, f"  ✗ Failed files: {all_failed}"))
            else:
                print(_c(C.GRN, f"  ✓ All files for \"{title}\" downloaded successfully."))
            print()
            return
    print(_c(C.RED, f"  Invalid choice: {choice}"))


# ========================= Dependency installer =========================


def ensure_dependencies(uv_exe: Optional[str]):
    """Install pycurl and tqdm if missing."""
    python_exe = sys.executable
    missing = []
    for pkg in ("pycurl", "tqdm"):
        try:
            __import__(pkg)
        except ImportError:
            missing.append(pkg)

    if not missing:
        return

    print(_c(C.YEL, f"  Installing missing packages: {', '.join(missing)}"))
    if uv_exe and os.path.exists(uv_exe):
        cmd = [uv_exe, "pip", "install", "--python", python_exe] + missing
    else:
        cmd = [sys.executable, "-m", "pip", "install"] + missing

    result = subprocess.run(cmd)
    if result.returncode != 0:
        print(_c(C.RED, f"  Failed to install {missing}. Please install manually."))
        sys.exit(1)
    print(_c(C.GRN, f"  ✓ Installed: {', '.join(missing)}"))
    print()


# ========================= Main =========================


def main():
    parser = argparse.ArgumentParser(description="Lance Model Downloader")
    parser.add_argument("--uv", default=None, help="Path to uv.exe for pip installs")
    args = parser.parse_args()

    os.system("cls" if os.name == "nt" else "clear")
    os.makedirs(DOWNLOADS_DIR, exist_ok=True)

    ensure_dependencies(args.uv)

    while True:
        print_menu()
        try:
            raw = input(_c(C.BOLD, "  Select > ")).strip()
        except (KeyboardInterrupt, EOFError):
            print()
            break

        if not raw:
            continue

        if raw == "0":
            break

        try:
            choice = int(raw)
        except ValueError:
            print(_c(C.RED, f"  Invalid input: {raw}"))
            continue

        if choice == 0:
            break

        handle_choice(choice)

        input(_c(C.GRAY, "  Press Enter to continue..."))

    print()
    print(_c(C.GRN, "  Bye!"))
    print()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print()
        sys.exit(0)
