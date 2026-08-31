# SQL Assignment 

Solutions to the 50-question SQL operators assignment, using `employees.csv` loaded into PostgreSQL via `psycopg2`.

## Setup

```bash
pip install -r requirements.txt
cp .env.example .env   # then fill in your real DB credentials
jupyter Assignment.ipynb
```

Make sure PostgreSQL is running and `employees.csv` lives in the same folder as the notebook.

## Environment variables

Credentials are loaded from a `.env` file (via `python-dotenv`) — never hardcoded in the notebook.

| Variable | Description |
|---|---|
| `DB_HOST` | Database host, e.g. `localhost` |
| `DB_PORT` | Database port, e.g. `5432` |
| `DB_NAME` | Database name |
| `DB_USER` | Database username |
| `DB_PASSWORD` | Database password |

`.env` is git-ignored. Only `.env.example` (placeholder values) is committed.

## What's inside

150 employee records, 29 columns, 50 SQL queries grouped by topic:

| Section | Questions | Covers |
|---|---|---|
| Arithmetic Operators | 1–6 | `+ - * / %` on salary, bonus, age |
| Comparison Operators | 7–12 | `> < >= <= <>` |
| Logical Operators | 13–18 | `AND OR NOT` |
| LIKE Operator | 19–24 | pattern matching on names, titles, email |
| IN Operator | 25–28 | multi-value matching on city, department, etc. |
| BETWEEN Operator | 29–33 | numeric and date ranges |
| IS NULL / IS NOT NULL | 34–38 | missing email, phone, emergency contact, certification |
| Mixed Challenge | 39–50 | combined conditions across all operators above |

## Notes

- Table `employees` is dropped and recreated on each run, then reloaded fresh from `employees.csv` — the original dataset file is never modified.
- All 50 queries are written as raw SQL strings and executed via `psycopg2`; results are returned as `pandas` DataFrames for easy viewing.
- Notebook runs top to bottom with zero errors, provided `.env` points to a reachable Postgres instance.