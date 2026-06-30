# MovieRental Refactoring Exercise (Python)

This is the Python port of Martin Fowler's classic Movie Rental refactoring kata from *Refactoring: Improving the Design of Existing Code*.

> When you find you have to add a feature to a program, and the program's code is not structured in a convenient way to add the feature, first refactor the program to make it easy to add the feature, then add the feature.

## Problem Statement

Read [MovieRentalRequirements.md](MovieRentalRequirements.md) thoroughly before attempting the exercise.

The `statement()` method on `Customer` currently produces plain text output. Your goal is to:

1. Identify the code smells present in the existing code.
2. Refactor systematically — keeping the tests green at every step.
3. Add the new `html_statement()` feature cleanly.

## Project Structure

```
movierental/
├── pyproject.toml
├── README.md
├── MovieRentalRequirements.md
├── src/
│   └── movierental/
│       ├── __init__.py
│       ├── movie.py
│       ├── rental.py
│       └── customer.py
└── tests/
    └── test_customer.py
```

## Prerequisites

- [Python 3.10](https://www.python.org/downloads/) or later

## Setup

```bash
python -m venv .venv
source .venv/bin/activate
pip install -e ".[test]"
```

## Run Tests

```bash
pytest
```

Tests use [pytest](https://docs.pytest.org/).

## Hints

Start by reading `customer.py`. Notice the long `statement()` method with an `if`/`elif` chain on price code — this is the central code smell to address. Good luck!
