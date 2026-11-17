# Job Application Tracker (SQL)

A relational database for tracking job applications, companies, and interview rounds, built with SQLite. It includes sample data and analytical queries for reviewing a job search.

## Features
- Three related tables: `companies`, `applications`, and `interviews`
- Foreign keys linking applications to companies and interviews to applications
- Status values restricted with a `CHECK` constraint
- Seven analytical queries using `JOIN`, `GROUP BY`, `HAVING`, `CASE`, and date functions

## Database Design
```
companies (id, name, city)
    │
    └── applications (id, company_id, role, applied_on, status, source)
            │
            └── interviews (id, application_id, interview_date, round, notes)
```

## Tools
- SQLite (no server installation needed)
- [DB Browser for SQLite](https://sqlitebrowser.org/) (free, runs on Windows)

## How to Run
1. Install DB Browser for SQLite and open it.
2. Click **New Database**, and save it as `jobs.db`.
3. Open the **Execute SQL** tab and run the files in this order:
   1. `schema.sql` creates the tables.
   2. `seed.sql` adds the sample data.
   3. `queries.sql` runs the reports. Run one query at a time by selecting it and pressing **Ctrl + Enter**.

The company names and data in `seed.sql` are fictional and only for testing.

## Project Structure
```
├── schema.sql    # Table definitions
├── seed.sql      # Sample data
├── queries.sql   # Analytical queries
└── README.md
```

## Author
Pranav More
