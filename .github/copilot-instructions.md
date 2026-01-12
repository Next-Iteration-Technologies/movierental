<!-- Copilot / AI agent instructions for quick onboarding -->
# Copilot instructions — movie-rental refactoring exercises

This repository contains two small, self-contained refactoring exercises in Java:
- `gildedrose` (legacy imperative logic in `updateQuality()`)
- `movierental` (classic Movie/Rental example; `Customer.statement()` formats results)

Follow these targeted rules when generating or changing code:

**Build & test**
- Project uses Maven and Java 11. Build and run tests with: `mvn test`.
- Test reports appear under `target/surefire-reports`.
- The `pom.xml` sets `source`/`target` to 11. See [pom.xml](pom.xml#L1-L40).

**Big picture & intent**
- Two separate exercises live under `src/main/java`: [gildedrose](src/main/java/gildedrose) and [movierental](src/main/java/movierental). Changes should keep the exercises independent.
- The objective is to refactor for clarity while preserving existing behavior and test outputs — this repo is a refactoring workshop, not a feature app.

**Key files to reference**
- Movierental example: [src/main/java/movierental/Customer.java](src/main/java/movierental/Customer.java#L1-L200) (note: `statement()` returns a formatted string used by tests).
- Movierental domain types: [src/main/java/movierental/Movie.java](src/main/java/movierental/Movie.java#L1-L120) and [src/main/java/movierental/Rental.java](src/main/java/movierental/Rental.java#L1-L120).
- Gilded Rose example: [src/main/java/gildedrose/GildedRose.java](src/main/java/gildedrose/GildedRose.java#L1-L200) and [src/main/java/gildedrose/Item.java](src/main/java/gildedrose/Item.java#L1-L120).

**Project-specific patterns & constraints**
- Tests (and exercises) expect exact string outputs and legacy behaviors. Preserve literal formatting in `Customer.statement()` (e.g. the header "Rental Record for <name>", tab spacing and footer lines) unless you update tests accordingly.
- The `gildedrose` codebase relies on string equality checks against `Item.name` (e.g. "Aged Brie", "Backstage passes..."). If refactoring these checks, provide an adapter that preserves current behavior.
- `movierental.Movie` uses integer price-code constants (`REGULAR`, `NEW_RELEASE`, `CHILDRENS`). If you replace with enums, update all call sites and tests in the same commit.

**Coding style & workflow expectations**
- Follow repository coding standards: see [coding-standards.md](coding-standards.md#L1-L8) for naming, method size, and refactoring guidance.
- Prefer small, well-named methods when extracting behavior from large switch/case blocks (examples: `Customer.statement()` and `GildedRose.updateQuality()`).
- Always run `mvn test` after edits and include tests or updated assertions with refactor commits.

**Testing guidance**
- Tests use JUnit (pom declares junit:4.12). Run all tests with `mvn test`. To run a single test class: `mvn -Dtest=movierental.CustomerTest test`.
- If you modify public method signatures, update the tests in the same change to keep the commit self-consistent.

**What to avoid**
- Do not change string outputs or numeric behaviors in separate commits without updating tests; the exercises rely on preserved behavior.
- Avoid global renames that mix both exercises in one PR — keep `gildedrose` and `movierental` changes scoped.

If anything here is unclear or you'd like more examples (e.g., suggested refactor steps for `Customer.statement()` or `GildedRose.updateQuality()`), tell me which file to expand with inline guidance.
