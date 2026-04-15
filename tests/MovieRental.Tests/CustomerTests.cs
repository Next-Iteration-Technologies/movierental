using Xunit;

namespace MovieRental.Tests;

public class CustomerTests
{
    [Fact]
    public void Statement_WithAllMovieTypes_ReturnsCorrectStatement()
    {
        var customer = new Customer("Bob");
        customer.AddRental(new Rental(new Movie("Jaws", Movie.Regular), 2));
        customer.AddRental(new Rental(new Movie("Golden Eye", Movie.Regular), 3));
        customer.AddRental(new Rental(new Movie("Short New", Movie.NewRelease), 1));
        customer.AddRental(new Rental(new Movie("Long New", Movie.NewRelease), 2));
        customer.AddRental(new Rental(new Movie("Bambi", Movie.Childrens), 3));
        customer.AddRental(new Rental(new Movie("Toy Story", Movie.Childrens), 4));

        string expected =
            "Rental Record for Bob\n" +
            "\tJaws\t2\n" +
            "\tGolden Eye\t3.5\n" +
            "\tShort New\t3\n" +
            "\tLong New\t6\n" +
            "\tBambi\t1.5\n" +
            "\tToy Story\t3\n" +
            "Amount owed is 19\n" +
            "You earned 7 frequent renter points";

        Assert.Equal(expected, customer.Statement());
    }
}
