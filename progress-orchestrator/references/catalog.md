# Progress Indicator Catalog

## Progress Bars
- Classic bar: [████░░░░] 50%
- Modern gradient bar with ETA and speed
- Arrow bar: [==============> ]
- Unicode bar: ▰▰▰▱▱▱ 50%
- Minimalist: 50% [150/300] ████████░░░░░░
- Decorative boxed bar
- Extended info bar with phases, successes, errors, velocity, ETA

## Spinners
- Dots: ⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏
- Lines: | / - \
- Clock: 🕐🕑🕒🕓
- Moon: 🌑🌒🌓🌔
- Arrow: ← ↑ → ↓
- Bounce: [●    ] [ ●   ] [  ●  ] [   ● ]
- Star: ✦✧
- Wave: ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
- Minimalist: · o O o

## Selection Criteria
- Small tasks (<=10): spinner
- Medium tasks (11-100): simple bar
- Large tasks (>100): extended bar
- Very large (>1000): bar with ETA and speed
- Unknown duration: spinner
- Known duration: progress bar
- Parallel: MultiProgress
- TTY: full indicator with colors and animation
- CI/pipe: plain text
- No Unicode: ASCII fallback

## Libraries by Language
- Node.js: ora, cli-progress, multibar, progress
- Python: tqdm, rich.progress, alive-progress, halo
- Rust: indicatif, dialoguer, console
- Go: progressbar, spinner, uiprogress
- Bash: pv, manual ASCII spinners, block character bars
