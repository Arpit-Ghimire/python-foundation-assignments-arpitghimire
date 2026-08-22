class Book:
    count = 0

    def __init__(self,title,author):
        self.title = title
        self.author = author
        Book.count += 1

    def describe(self):
        print(f'{self.title} by {self.author}')


b1 = Book('The Power of your subconscious mind','Joseph Murphy')
b2 = Book('Tantra, the supreme understanding','Osho')
b3 = Book("The Alchemist", "Paulo Coelho")

print("Total no of books : ",Book.count)
