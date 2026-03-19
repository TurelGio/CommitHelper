# CommitHelper
<<<<<<< HEAD
# commit
=======
>>>>>>> 42299f3 ([RELEASE] v1.0 - first stable build)

A Bash script that brings structure and consistency to your Git commit messages — right from the terminal. Look up any commit type, see when to use it, and get a ready-to-copy example in seconds.

---

## Features

- 14 commit types with color-coded badges
- Compact overview of all types at a glance
- Detailed view per type with usage guidance and an example
- Built-in commit message writing rules
- Works on any POSIX-compliant system

---

## Installation

**1. Clone the repo**

```bash
git clone https://github.com/your-username/commit.git
cd commit
```

**2. Make the script executable**

```bash
chmod +x commit.sh
```

**3. Install it as a global command** (recommended)

```bash
sudo cp commit.sh /usr/local/bin/commit
```

Once installed, you can call `commit` from anywhere in your terminal without a path or alias.

---

## Usage

```bash
commit              # show all types
commit [flag]       # show detailed view for a specific type
commit --rules      # show commit message writing guidelines
```

---

## Commit types

| Type | Flag | Description |
|---|---|---|
| `RELEASE` | `-r` / `--release` | Mark a new stable version |
| `INIT` | `-i` / `--init` | Initialize a project or folder |
| `FEAT` | `-fe` / `--feat` | Add a new feature |
| `FIX` | `-fi` / `--fix` | Correct a bug |
| `DOCS` | `-d` / `--docs` | Affect documentation only |
| `STYLE` | `-s` / `--style` | Formatting, no meaning change |
| `REFACTOR` | `-rf` / `--refactor` | Rewrite code, no bug fix or feature |
| `PERF` | `-p` / `--perf` | Special refactor geared toward performance |
| `TEST` | `-t` / `--test` | Add or correct tests |
| `CHORE` | `-c` / `--chore` | Misc, no src or test file changes |
| `CI` | `-ci` / `--ci` | Continuous integration related |
| `OPS` | `-o` / `--ops` | Infrastructure, deployment, backup, recovery |
| `BUILD` | `-b` / `--build` | Build system, dependencies, project version |
| `REVERT` | `-rv` / `--revert` | Revert a previous commit |

---

## Examples

**List all types**
```bash
commit
```

**Get details on a specific type**
```bash
commit --feat
```
```
  FEAT       Add a new feature

  ─────────────────────────────────────────────────────────────────
  Flags   -fe / --feat
  When    Use when introducing new user-facing functionality.

  Example
  $ git commit -m "[FEAT] Add dark mode toggle to user settings"
  ─────────────────────────────────────────────────────────────────
```

**Show commit message rules**
```bash
commit --rules
```

---

## Commit message rules

A quick summary of what `commit --rules` covers:

- Keep the subject under **50 characters**
- **Capitalise** the subject line
- **No period** at the end of the subject
- Use the **imperative mood** — "Add tests", not "Added" or "Adding"
- Separate subject from body with a **blank line**
- Wrap the body at **72 characters**
- Use the body to explain **what and why**, not how

A reliable self-check: the message should complete the sentence _"If applied, this commit will..."_

---

## Requirements

- Bash 3.2 or later
- A terminal with ANSI color support (any modern terminal on Linux or macOS)
<<<<<<< HEAD
=======

---

## License

MIT
>>>>>>> 42299f3 ([RELEASE] v1.0 - first stable build)
