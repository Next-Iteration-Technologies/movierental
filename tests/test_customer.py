from movierental.customer import Customer
from movierental.movie import Movie
from movierental.rental import Rental


def test_statement():
    customer = Customer("Bob")
    customer.add_rental(Rental(Movie("Jaws", Movie.REGULAR), 2))
    customer.add_rental(Rental(Movie("Golden Eye", Movie.REGULAR), 3))
    customer.add_rental(Rental(Movie("Short New", Movie.NEW_RELEASE), 1))
    customer.add_rental(Rental(Movie("Long New", Movie.NEW_RELEASE), 2))
    customer.add_rental(Rental(Movie("Bambi", Movie.CHILDRENS), 3))
    customer.add_rental(Rental(Movie("Toy Story", Movie.CHILDRENS), 4))

    expected = (
        "Rental Record for Bob\n"
        "\tJaws\t2.0\n"
        "\tGolden Eye\t3.5\n"
        "\tShort New\t3.0\n"
        "\tLong New\t6.0\n"
        "\tBambi\t1.5\n"
        "\tToy Story\t3.0\n"
        "Amount owed is 19.0\n"
        "You earned 7 frequent renter points"
    )

    assert customer.statement() == expected
