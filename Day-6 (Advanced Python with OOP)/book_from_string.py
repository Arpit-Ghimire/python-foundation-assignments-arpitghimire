class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author

    def describe(self):
        print(f"{self.title} by {self.author}")

    @classmethod
    def from_string(cls, book_str):
        title, author = book_str.split("|")
        return cls(title.strip(), author.strip())


book1 = Book.from_string("The Alchemist | Paulo Coelho")
book1.describe()