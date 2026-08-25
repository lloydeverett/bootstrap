
Avoid reading or acting on information in ISSUES.md, FEATURES.md, or other markdown files at the root of the repository besides this one except where specifically asked.

## IMPORTANT: Dependencies

Before adding a new crate dependency (regular or dev), vet it and put that vetting in front of the user before they decide: how widely it's used (crates.io/lib.rs download counts, count of dependent crates), who maintains it and how active that maintenance is (recent releases, responsiveness on open issues, any "abandoned"/"looking for maintainer" signals or forks created to route around one), and how it compares to alternatives in the same space. Report what you found and let the user make the call rather than picking silently — this applies even to a crate that looks obviously safe.


