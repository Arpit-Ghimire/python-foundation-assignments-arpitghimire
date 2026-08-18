# File Handling, Error Handling & Logging Assignment

This assignment focuses on working with files, handling errors, and using Python's logging system.

## Topics Covered
- Reading and writing files
- CSV files using `csv.DictReader`
- JSON files using the `json` module
- Custom exceptions
- `try` / `except` / `finally`
- Error handling
- Logging with the `logging` module
- File-based logging

## Questions

1. **Line & Word Counter**
   - Read a text file and count lines and words.

2. **Inventory Value from CSV**
   - Read product data from a CSV file and calculate total inventory value.

3. **Filtering a JSON Library Catalog**
   - Read JSON data, filter available books by publication year, and save the results.

4. **Custom Exception for User Registration**
   - Create and handle a custom `InvalidAgeError`.

5. **Order Pipeline with Logging**
   - Process orders from a CSV file, handle invalid data, save valid orders as JSON, and log errors.

## Challenges

- Converting CSV values from strings into the correct numeric types.
- Filtering data stored in JSON.
- Creating and raising custom exceptions.
- Setting up a logger with a `FileHandler`.
- Keeping track of valid and invalid records while processing a file.

## Learnings

Through this assignment, I learned how to:

- Read and write files safely using `with open()`.
- Work with CSV and JSON data.
- Convert and validate data read from files.
- Create custom exceptions in Python.
- Handle errors without stopping the entire program.
- Use `try`, `except`, and `finally`.
- Create logs using Python's `logging` module.
- Build a simple data-processing pipeline that combines file handling, validation, error handling, and logging.

## Files

- `Assignment_File_Error_Logging_Solved.ipynb` - Solutions to all five questions
- `diary.txt` - Sample text file
- `products.csv` - Sample inventory data
- `library.json` - Sample library data
- `orders.csv` - Sample order data