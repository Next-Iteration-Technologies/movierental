# Movie Rental Requirements

In this MovieRental codebase, the `Statement()` method on `Customer` prints out a simple text rental statement:

```
Rental Record for martin
	Ran	3.5
	Trois Couleurs: Bleu	2
Amount owed is 5.5
You earned 2 frequent renter points
```

## Goal

We want to write an HTML version of the statement method:

```html
<h1>Rental Record for <em>martin</em></h1>
<table>
  <tr><td>Ran</td><td>3.5</td></tr>
  <tr><td>Trois Couleurs: Bleu</td><td>2</td></tr>
</table>
<p>Amount owed is <em>5.5</em></p>
<p>You earned <em>2</em> frequent renter points</p>
```

## Build

All you need is the [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) or later.

```bash
dotnet build
```

## Testing

Unit tests can be run using the .NET CLI:

```bash
dotnet test
```

Tests are located in `tests/MovieRental.Tests/` and use xUnit.
