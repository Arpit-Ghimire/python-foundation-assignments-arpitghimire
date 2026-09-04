# Cedar Grove Public Library: Checkouts — Solved

Solutions to the 5-problem pandas + API assignment, using `data/checkouts.csv`.

## Setup

```bash
pip install -r requirements.txt
jupyter lab 7_Library_Checkout_Assignment_Solved.ipynb
```

Make sure `checkouts.csv` lives at `data/checkouts.csv` relative to the notebook.

## What's inside

| # | Question | Answer |
|---|----------|--------|
| 1 | Load & orient | 160 total checkouts, 48 still checked out |
| 2 | Clean data | Added `is_returned` bool; filled missing `late_fee` with 0 |
| 3 | Worst genre for late fees | **Dystopian** (avg ~$0.67) |
| 4 | Book facts via Open Library API | `get_book_facts()` with backup-dict fallback; 12 unique titles looked up |
| 5 | Costliest author in late fees | **Aldous Huxley** ($7.75 total) |

## Notes

- Problem 4 calls the live [Open Library](https://openlibrary.org/) API and falls back to a hardcoded `BACKUP_BOOK_FACTS` dict if the request fails — no internet connection required to complete the assignment.
- All "check yourself" `assert` cells pass when run top to bottom.
