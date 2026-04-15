namespace MovieRental;

/// <summary>
/// Represents a customer renting a movie.
/// </summary>
public class Rental
{
    private Movie _movie;
    private int _daysRented;

    public Rental(Movie movie, int daysRented)
    {
        _movie = movie;
        _daysRented = daysRented;
    }

    public Movie Movie => _movie;

    public int DaysRented => _daysRented;
}
