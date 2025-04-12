# 🏨 Canyon Ranch Database Project

This project designs and deploys a centralized relational database system for **Canyon Ranch**, a wellness resort, to improve reservation handling, staff coordination, and customer experience. It follows a structured development process across three milestones and includes both relational and data warehouse models.

---

## 🔧 Tech Stack

- **MS SQL Server** (database engine)
- **Cursor IDE** (code editing)
- **ERDPlus** (diagramming tool)
- **Markdown + Word** (documentation)
- **GPT-4** (sample data generation)

---

## 📂 Project Structure

```
canyon-ranch-db/
├── sql/                      # SQL scripts
│   ├── create_schema.sql     # Database schema creation script
│   ├── insert_sample_data.sql # Sample data population script
│   └── test_queries.sql      # Validation queries
│
├── docs/                     # Documentation
│   ├── entity_description.md # Entity details and attributes
│   ├── functional_dependencies.md # Functional dependencies documentation
│   ├── sql_schema_design.md  # SQL schema design decisions
│   ├── cloud_db_setup_notes.md # Cloud deployment guidelines
│   ├── Milestone1Report.docx # First milestone report
│   └── TeamProjectInstructions.docx # Project instructions
│
├── diagrams/                 # Visual representations
│   ├── er_diagram.png        # Entity-Relationship diagram
│   └── relational_schema.png # Relational schema diagram
│
├── backup/                   # Database backups
│   └── canyon_ranch_YYYYMMDD.bak # SQL Server backup file
│
├── workflow.md               # Project tracker with task status
├── iteration_log.md          # Log of all project updates
└── README.md                 # Project overview and instructions
```

---

## 🚀 How to Run

1. Open the project in **Cursor IDE**.
2. Run `create_tables.sql` in your SQL Server instance to create all tables.
3. Load mock data using `insert_sample_data.sql`.
4. Use `test_queries.sql` to validate table joins and foreign key integrity.
5. Generate backup file `.bak` using SQL Server Management Studio.

---

## 📌 Project Status

See `workflow.md` for detailed task tracking and milestone progress.

---

## 🧠 Authors

- Satkar Karki  
- Riti Dahal  
- Sabun Dhital  

University of South Dakota – DSCI 723 Spring 2025  
Instructor: Dr. Hanus
