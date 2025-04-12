# 🧾 Iteration Log — Canyon Ranch DB Project

This log tracks all major updates and file changes made throughout the project across all milestones. It ensures traceability and structured collaboration.

---

### 📅 April 12, 2025

- ✅ Created project folder and directory structure on local machine
- ✅ Finalized and exported ER diagram (`er_diagram.png`)
- ✅ Created initial version of `workflow.md` to track project tasks
- ✅ Added `entity_description.md` with all entity attributes and logic
- ✅ Created `schema_drawings.md` to explain schema transformation and diagram design
- ✅ Decided to use GPT-4 for AI-powered sample data generation instead of using generatedata.com

---

### 📅 April 13, 2025

- ✅ Created GitHub repository and uploaded full folder from local
- ✅ Cloned the GitHub repo into Cursor IDE for structured development
- ✅ Updated `README.md` with file structure, tech stack, and run instructions
- ✅ Integrated workflow tracker into Milestone 1 report as Appendix A
- ✅ Reorganized documentation folder (`/docs`) and finalized Markdown files for entity descriptions, dependencies, and design notes

---

### 📅 April 14, 2025

- ✅ Created comprehensive SQL schema design documentation in `docs/sql_schema_design.md`
- ✅ Implemented complete database schema with all tables, relationships and constraints in `sql/create_schema.sql`
- ✅ Added proper data types for all columns based on entity requirements
- ✅ Implemented foreign key relationships to maintain referential integrity
- ✅ Added appropriate constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, DEFAULT)
- ✅ Created performance-enhancing indexes for commonly joined tables
- ✅ Updated `workflow.md` to mark physical design tasks as completed
- ✅ Created `docs/cloud_db_setup_notes.md` with best practices for database deployment in a cloud environment

---

### 📅 April 15, 2025

- ✅ Created comprehensive sample data with `sql/insert_sample_data.sql`
- ✅ Generated 50+ realistic records across all tables including:
  - 5 facilities with different types and locations
  - 15 customers with diverse preferences and medical histories
  - 18 staff members with various specialties
  - 20 reservations spanning multiple dates
  - 45+ reservation services with appropriate relationships
  - Complete set of payments, feedback, and loyalty program entries
- ✅ Implemented careful ordering of INSERT statements to maintain referential integrity
- ✅ Added data cleanup and identity reset commands for rerunnable script
- ✅ Updated `workflow.md` to mark sample data tasks as completed

---

### 📅 [Future Updates Template]

> Use this format for each new update:
- [ ] Updated `filename.ext` – description of what changed and why
- [ ] Added `newfile.ext` – brief reason for new file
- [ ] Fixed schema issues or naming conventions in `create_tables.sql`
- [ ] Added GPT-generated data to `insert_sample_data.sql`

---

📌 *Keep this file updated as you progress through Milestone 2 and Milestone 3.*
