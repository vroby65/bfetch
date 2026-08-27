# AGENTS.md

Guidelines for AI agents (and humans) working on this repository.

## Project overview

`bfetch` is a **mini neofetch** written as a single pure-Bash script with no
external dependencies beyond standard Linux utilities (`uname`, `uptime`,
`df`, `free`, `lspci`, `grep`, `awk`, `sed`, `cut`). It prints basic system
information with an ASCII distro logo aligned on the right.

## Repository layout

- `bfetch` — the entire tool: a single executable Bash script.
- `README.md` — user-facing documentation.

## Language

Everything in this repository must be in **English**: code comments, README,
AGENTS.md, and commit messages.

## How to run and test

- Run: `./bfetch`
- Syntax check: `bash -n bfetch`
- Manual check: the script must print the info lines (OS, Distro, Kernel,
  Uptime, Shell, Term, CPU, Memory, Disk, GPU) with the logo on the right and
  exit with status 0.

## Architecture

The script is organized in sections, in this order:

1. **Colors** — ANSI color variables `c0`-`c16`.
2. **System info** — one variable per field (`OS`, `KERNEL`, `UPTIME`,
   `SHELL`, `TERM`, `MEM`, `DISK`, `GPU`, `DISTRO`, `ID`, `CPU`).
3. **Logo selection** — `alias_id()` maps distro IDs to logo names,
   `user_logo()` reads a user override from `~/.asciidistro/<id>.ansi`,
   `get_logo()` emits the built-in logos (plus a default Tux fallback).
4. **Logo picking** — the chosen logo is cached in `LOGO`; `l()` extracts
   the Nth line.
5. **Printing** — one `printf` per field, values left-padded to 50 chars
   with the logo line on the right.

## Conventions

- Keep the tool a single file and dependency-free.
- When adding a system info field:
  - add the variable in the "sys info" section,
  - add a `printf` line in the print section, aligned like the others
    (`%-50s` padding, color prefix `c6`),
  - update `README.md` if it lists the displayed fields.
- When adding a distro logo:
  - add a `case` entry in `get_logo()`, keeping entries in alphabetical
    order,
  - use the same ANSI truecolor block format as existing logos (`<fg><bg>▀`
    pairs with `38;2`/`48;2` escapes),
  - make it at least 10 lines tall: the print section reads logo lines
    `l 1` through `l 10` (missing lines render as blank art).
- Match the existing style: `# -- section --` headers, two-space indent in
  `case` bodies, `printf` with `%-50s` padding.
- Prefer simple, readable Bash. Do not add abstractions or configurability
  unless the task requires it.
- Keep comments in English.

## Commit guidelines

- Commit messages in English, imperative mood, one line (e.g.
  `Add support for X`).
- Keep commits focused; do not mix unrelated changes.
