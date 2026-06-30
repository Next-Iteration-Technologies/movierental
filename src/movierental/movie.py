class Movie:
    REGULAR = 0
    NEW_RELEASE = 1
    CHILDRENS = 2

    def __init__(self, title, price_code):
        self._title = title
        self._price_code = price_code

    @property
    def title(self):
        return self._title

    @property
    def price_code(self):
        return self._price_code

    @price_code.setter
    def price_code(self, value):
        self._price_code = value
