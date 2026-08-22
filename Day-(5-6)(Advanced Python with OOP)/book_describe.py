class Book:
    def __init__(self,title,author):
        self.title = title
        self.author = author

    def describe(self):
        print(f'{self.title} by {self.author}')

b1 = Book('The Power of your subconscious mind','Joseph Murphy')
b2 = Book('Tantra, the supreme understanding','Osho')

b1.describe()
b2.describe()
