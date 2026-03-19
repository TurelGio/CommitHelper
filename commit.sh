#!/bin/bash

# ── Colors & styles ───────────────────────────────────────────────────────────
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

WHITE="\033[97m"
GREEN="\033[32m"
YELLOW="\033[33m"

BG_GREEN="\033[42m"
BG_BLUE="\033[44m"
BG_PURPLE="\033[45m"
BG_RED="\033[41m"
BG_YELLOW="\033[43m"
BG_CYAN="\033[46m"
BG_DARK="\033[100m"
BG_MAGENTA="\033[105m"
BG_ORANGE="\033[48;5;208m"

# ── Helpers ───────────────────────────────────────────────────────────────────
badge() {
  local bg="$1" label="$2" desc="$3" flags="$4"
  printf "  ${bg}${WHITE}${BOLD} %-9s${RESET}  ${BOLD}%-44s${RESET} ${DIM}%s${RESET}\n" \
    "$label" "$desc" "$flags"
}

detail() {
  local bg="$1" label="$2" desc="$3" flags="$4" when="$5" example="$6"
  echo ""
  printf "  ${bg}${WHITE}${BOLD} %-9s${RESET}  ${BOLD}%s${RESET}\n" "$label" "$desc"
  echo ""
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
  printf "  ${DIM}Flags   ${RESET}%s\n" "$flags"
  printf "  ${DIM}When    ${RESET}%s\n" "$when"
  echo ""
  printf "  ${DIM}Example${RESET}\n"
  printf "  ${GREEN}\$${RESET} git commit -m ${YELLOW}\"${example}\"${RESET}\n"
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
  echo ""
}

header() {
  echo ""
  printf "  ${BOLD}Git commit types${RESET}  ${DIM}usage: $(basename "$0") [flag]${RESET}\n"
  echo ""
  printf "  ${DIM}%-9s  %-44s %s${RESET}\n" "TYPE" "DESCRIPTION" "FLAGS"
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
}

# ── Compact functions ─────────────────────────────────────────────────────────
release()  { badge "$BG_GREEN"   "RELEASE"  "Mark a new stable version"                      "-r   / --release";  }
init()     { badge "$BG_BLUE"    "INIT"     "Initialize a project or folder"                 "-i   / --init";     }
feat()     { badge "$BG_PURPLE"  "FEAT"     "Add a new feature"                              "-fe  / --feat";     }
fix()      { badge "$BG_RED"     "FIX"      "Correct a bug"                                  "-fi  / --fix";      }
docs()     { badge "$BG_GREEN"   "DOCS"     "Affect documentation only"                      "-d   / --docs";     }
style()    { badge "$BG_CYAN"    "STYLE"    "Formatting, no meaning change"                  "-s   / --style";    }
refactor() { badge "$BG_YELLOW"  "REFACTOR" "Rewrite code, no bug fix or feature"            "-rf  / --refactor"; }
perf()     { badge "$BG_CYAN"    "PERF"     "Special refactor geared toward performance"     "-p   / --perf";     }
test()     { badge "$BG_PURPLE"  "TEST"     "Add or correct tests"                           "-t   / --test";     }
chore()    { badge "$BG_DARK"    "CHORE"    "Misc, no src or test file changes"              "-c   / --chore";    }
ci()       { badge "$BG_BLUE"    "CI"       "Continuous integration related"                 "-ci  / --ci";       }
ops()      { badge "$BG_ORANGE"  "OPS"      "Infrastructure, deployment, backup, recovery"   "-o   / --ops";      }
build()    { badge "$BG_MAGENTA" "BUILD"    "Build system, dependencies, project version"    "-b   / --build";    }
revert()   { badge "$BG_RED"     "REVERT"   "Revert a previous commit"                       "-rv  / --revert";   }

# ── Extended functions ────────────────────────────────────────────────────────
release_x() {
  detail "$BG_GREEN" "RELEASE" "Mark a new stable version" \
    "-r / --release" \
    "Use when tagging a production-ready version of the project." \
    "[RELEASE] v2.1.0 - stable build with payment integration"
}

init_x() {
  detail "$BG_BLUE" "INIT" "Initialize a project or folder" \
    "-i / --init" \
    "Use for the very first commit or when bootstrapping a new module." \
    "[INIT] project scaffold with Vite, ESLint and Prettier"
}

feat_x() {
  detail "$BG_PURPLE" "FEAT" "Add a new feature" \
    "-fe / --feat" \
    "Use when introducing new user-facing functionality." \
    "[FEAT] add dark mode toggle to user settings"
}

fix_x() {
  detail "$BG_RED" "FIX" "Correct a bug" \
    "-fi / --fix" \
    "Use when patching broken behaviour, not adding new functionality." \
    "[FIX] resolve null pointer on empty cart checkout"
}

docs_x() {
  detail "$BG_GREEN" "DOCS" "Affect documentation only" \
    "-d / --docs" \
    "Use for README changes, inline comments, or API docs — no logic changed." \
    "[DOCS] update API auth section with OAuth2 examples"
}

style_x() {
  detail "$BG_CYAN" "STYLE" "Formatting, no meaning change" \
    "-s / --style" \
    "Use for whitespace, missing semicolons, formatting — does not affect code meaning." \
    "[STYLE] apply Prettier formatting across src/"
}

refactor_x() {
  detail "$BG_YELLOW" "REFACTOR" "Rewrite code, no bug fix or feature" \
    "-rf / --refactor" \
    "Use when restructuring or rewriting code without changing what it does." \
    "[REFACTOR] extract auth logic into useAuth hook"
}

perf_x() {
  detail "$BG_CYAN" "PERF" "Special refactor geared toward performance" \
    "-p / --perf" \
    "Like refactor, but the goal is measurably improving speed or resource usage." \
    "[PERF] memoize product list to avoid redundant re-renders"
}

test_x() {
  detail "$BG_PURPLE" "TEST" "Add or correct tests" \
    "-t / --test" \
    "Use when adding missing tests or fixing existing ones — no production code changed." \
    "[TEST] add unit tests for password validation edge cases"
}

chore_x() {
  detail "$BG_DARK" "CHORE" "Misc, no src or test file changes" \
    "-c / --chore" \
    "Use for miscellaneous tasks unrelated to a fix or feature (e.g. updating .gitignore, dependencies)." \
    "[CHORE] update .gitignore to exclude .env files"
}

ci_x() {
  detail "$BG_BLUE" "CI" "Continuous integration related" \
    "-ci / --ci" \
    "Use for changes to CI pipelines, workflows, or related configuration files." \
    "[CI] add GitHub Actions workflow for pull request checks"
}

ops_x() {
  detail "$BG_ORANGE" "OPS" "Infrastructure, deployment, backup, recovery" \
    "-o / --ops" \
    "Use for operational changes: server config, deployment scripts, backup or recovery procedures." \
    "[OPS] add automated nightly database backup script"
}

build_x() {
  detail "$BG_MAGENTA" "BUILD" "Build system, dependencies, project version" \
    "-b / --build" \
    "Use for changes to the build tool, CI pipeline, dependencies, or project version." \
    "[BUILD] upgrade webpack to v5 and update build config"
}

revert_x() {
  detail "$BG_RED" "REVERT" "Revert a previous commit" \
    "-rv / --revert" \
    "Use when undoing a previous commit, referencing its hash or message." \
    "[REVERT] undo feat: add dark mode toggle (breaks IE11)"
}

# ── Rules ────────────────────────────────────────────────────────────────────
rules() {
  local TICK="${GREEN}✓${RESET}"
  echo ""
  printf "  ${BOLD}Writing a great commit message${RESET}\n"
  echo ""
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
  echo ""
  printf "  ${TICK}  ${BOLD}Keep the subject under 50 characters${RESET}\n"
  printf "     ${DIM}Forces clarity. If you can't summarise it, the commit is too big.${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}Capitalise the subject line${RESET}\n"
  printf "     ${DIM}Start with an uppercase letter, like the first word of a sentence.${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}No period at the end of the subject${RESET}\n"
  printf "     ${DIM}It's a title, not a sentence. The dot wastes one of your 50 characters.${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}Use the imperative mood${RESET}\n"
  printf "     ${DIM}Write as if giving a command: \"Add tests\", not \"Added\" or \"Adding\".${RESET}\n"
  printf "     ${DIM}A good test: the message should complete the sentence${RESET}\n"
  printf "     ${DIM}\"If applied, this commit will...\" → \"Add unit tests for auth\"${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}Separate subject from body with a blank line${RESET}\n"
  printf "     ${DIM}Git treats the first line as the subject and everything after the${RESET}\n"
  printf "     ${DIM}blank line as the body. Many tools depend on this convention.${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}Wrap the body at 72 characters${RESET}\n"
  printf "     ${DIM}Git doesn't wrap text automatically. Keeping lines short ensures${RESET}\n"
  printf "     ${DIM}the body is readable in any terminal or git log viewer.${RESET}\n"
  echo ""
  printf "  ${TICK}  ${BOLD}Use the body to explain what and why, not how${RESET}\n"
  printf "     ${DIM}The code shows how. The commit message should explain the reason${RESET}\n"
  printf "     ${DIM}behind the change and any context a future reader would need.${RESET}\n"
  echo ""
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
  printf "  ${DIM}Example with body${RESET}\n"
  echo ""
  printf "  ${GREEN}\$${RESET} git commit -m ${YELLOW}\"[FEAT] Add OAuth2 login via Google\n\n"
  printf "  Users can now sign in with their Google account.\n"
  printf "  Removed the old session-based flow which required\n"
  printf "  a separate password reset service.\"${RESET}\n"
  printf "  ${DIM}%s${RESET}\n" "─────────────────────────────────────────────────────────────────"
  echo ""
}

# ── Routing ───────────────────────────────────────────────────────────────────
case "$1" in
  -a|--all|"")
    header
    release; init; feat; fix; docs; style; refactor; perf; test; chore; ci; ops; build; revert
    echo ""
    printf "  ${DIM}Run $(basename "$0") --rules for commit message guidelines${RESET}\n"
    echo ""
    ;;
  -r|--release)   release_x  ;;
  -i|--init)      init_x     ;;
  -fe|--feat)     feat_x     ;;
  -fi|--fix)      fix_x      ;;
  -d|--docs)      docs_x     ;;
  -s|--style)     style_x    ;;
  -rf|--refactor) refactor_x ;;
  -p|--perf)      perf_x     ;;
  -t|--test)      test_x     ;;
  -c|--chore)     chore_x    ;;
  -ci|--ci)       ci_x       ;;
  -o|--ops)       ops_x      ;;
  -b|--build)     build_x    ;;
  -rv|--revert)   revert_x   ;;
  --rules)        rules      ;;
  *)
    echo ""
    printf "  ${BG_RED}${WHITE}${BOLD} ERROR ${RESET}  Unknown flag: ${BOLD}$1${RESET}\n"
    printf "  Run ${BOLD}$(basename "$0")${RESET} with no arguments to see all types.\n"
    echo ""
    exit 1
    ;;
esac