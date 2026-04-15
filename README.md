# MovieRental Refactoring Exercise (C#)

This is the C# port of Martin Fowler's classic Movie Rental refactoring kata from *Refactoring: Improving the Design of Existing Code*.

> When you find you have to add a feature to a program, and the program's code is not structured in a convenient way to add the feature, first refactor the program to make it easy to add the feature, then add the feature.

## Problem Statement

Read [MovieRentalRequirements.md](MovieRentalRequirements.md) thoroughly before attempting the exercise.

The `Statement()` method in `Customer` currently produces plain text output. Your goal is to:

1. Identify the code smells present in the existing code.
2. Refactor systematically — keeping the test green at every step.
3. Add the new `HtmlStatement()` feature cleanly.

## Project Structure

```
movierental/
├── MovieRental.sln
├── README.md
├── MovieRentalRequirements.md
├── src/
│   └── MovieRental/
│       ├── MovieRental.csproj
│       ├── Movie.cs
│       ├── Rental.cs
│       └── Customer.cs
└── tests/
    └── MovieRental.Tests/
        ├── MovieRental.Tests.csproj
        └── CustomerTests.cs
```

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) or later

## Build

```bash
dotnet build
```

## Run Tests

```bash
dotnet test
```

Tests use [xUnit](https://xunit.net/).

## Hints

Start by reading `Customer.cs`. Notice the long `Statement()` method with a `switch` on price code — this is the central code smell to address. Good luck!
