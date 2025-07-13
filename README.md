# Formula 1 SQL Analysis

This project uses PostgreSQL to explore and analyze Formula 1 data from 1950–2023. It includes full schema design, data import scripts, and analytical queries.

## Project Structure

- `schema/`: Contains SQL scripts for table creation and data loading.
- `queries/`: Contains analytical SQL queries for fastest laps, driver standings, etc.
- `archive/`: CSV files from [F1 dataset on Kaggle](https://www.kaggle.com/datasets/).

## Sample Queries

- Fastest lap per driver per race
- Ranking drivers by speed in each Grand Prix
- Standings across constructors or seasons(pending)

## Tech Stack

- PostgreSQL
- SQL
- CSV (Kaggle F1 Dataset)

## To Run

1. Create a PostgreSQL database.
2. Run `schema/create_tables.sql`
3. Run `schema/load_data.sql`
4. Explore with queries in `queries/`

## 👤 Author

Walter Feliu – [@donniedarko55](https://github.com/yourGitHub)
