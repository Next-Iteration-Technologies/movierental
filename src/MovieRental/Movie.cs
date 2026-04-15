namespace MovieRental;

public class Movie
{
    public const int Regular = 0;
    public const int NewRelease = 1;
    public const int Childrens = 2;

    private string _title;
    private int _priceCode;

    public Movie(string title, int priceCode)
    {
        _title = title;
        _priceCode = priceCode;
    }

    public string Title => _title;

    public int PriceCode
    {
        get => _priceCode;
        set => _priceCode = value;
    }
}
