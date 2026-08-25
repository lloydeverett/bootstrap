
Avoid reading or acting on information in ISSUES.md, FEATURES.md, or other markdown files at the root of the repository besides this one except where specifically asked.

## IMPORTANT: Dependencies

Before adding a new crate dependency (regular or dev), vet it and put that vetting in front of the user before they decide: how widely it's used (crates.io/lib.rs download counts, count of dependent crates), who maintains it and how active that maintenance is (recent releases, responsiveness on open issues, any "abandoned"/"looking for maintainer" signals or forks created to route around one), and how it compares to alternatives in the same space. Report what you found and let the user make the call rather than picking silently — this applies even to a crate that looks obviously safe.

## Documentation style

Keep new or edited documentation short and focused on what a reader needs right now to use the item correctly:

- State what the item does and any real constraint or gotcha, not the history of how it got that way. A doc comment isn't a changelog — don't narrate a prior design, why an earlier approach fell short, or what changed and when. It's fine to mention a genuine drawback of a naive/obvious approach if it heads off a mistake (e.g. "a plain X would Y, so this does Z instead"), but keep it brief.
- Don't note that a function or field "isn't used/invoked anywhere yet". That's a fact about the codebase's current state, not about the interface — it goes stale the moment a caller shows up, and grep/cargo check answer the question directly for anyone who needs it.
- Don't over-describe specific existing consumers. An interface's docs shouldn't read like they know everything that currently implements or calls it — that couples the doc to code that's free to change independently. An occasional example or "see X for the pattern" pointer is fine when it genuinely helps, but don't enumerate every current caller/implementor or explain their individual reasoning.

## CLI help style

- Keep every rendered --help line at or under 80 columns (a typical terminal width).
- Write each flag's doc comment as one sentence: uppercase start, no trailing full stop (e.g. show Nerd Font icons next to entries). This matches the terse convention most CLI tools use for individual flags.

