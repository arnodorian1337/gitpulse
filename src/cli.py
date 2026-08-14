"""gitpulse — summarize commit activity for a git repository."""
import argparse
import subprocess


def commit_count(repo: str) -> int:
    out = subprocess.run(
        ["git", "-C", repo, "rev-list", "--count", "HEAD"],
        capture_output=True, text=True,
    )
    return int(out.stdout.strip() or 0)


def main() -> None:
    ap = argparse.ArgumentParser(description="Summarize git commit activity")
    ap.add_argument("--repo", default=".", help="path to the git repo")
    args = ap.parse_args()
    print(f"{args.repo}: {commit_count(args.repo)} commits")


if __name__ == "__main__":
    main()
