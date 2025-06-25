# 🧱 BondBrothers Minecraft Database Management System

A command-line database application simulating Minecraft world management. Built using Python and MySQL, it features an ER-modeled, fully normalized schema supporting both player and developer functionality, real-time analytics, and dynamic world interaction.

---

## 📌 Overview

This project was developed as part of a university DBMS course, showcasing:
- Full-cycle **ER-to-Relational modeling**
- Schema normalization (1NF → 3NF)
- SQL query design for **retrieval, analysis, and modification**
- Python-based command-line interface using **PyMySQL**

---

## 🔧 Tech Stack

- **Python 3**
- **MySQL 8+**
- **PyMySQL**
- **Tabulate (for terminal formatting)**
- SQL (DDL, DML, Joins, Aggregates)

---

## 👤 Roles and Features

### 🕹️ Player Role
| Feature             | Description |
|---------------------|-------------|
| 🌍 Manage Worlds     | Create, view, delete worlds, update spawn points |
| 🧑‍🤝‍🧑 Social         | Add/delete friends, view friend list |
| 🔍 Game Info        | View mobs, flammable blocks, search biomes & items |
| 💰 Economy          | Buy minecoins, check player stats |
| 📊 Analytics        | Track total blocks placed, items crafted, mobs killed |

### 👨‍💻 Developer Role
| Feature              | Description |
|----------------------|-------------|
| 🔬 Game Balancing     | View aggregated mob kills & item usage (MAX, MIN, AVG, SUM) |
| ❤️ Mob Configuration | Change mob health, add item drops |
| 🎨 Item Design       | Update item textures directly into DB (BLOBs) |

---

## 📁 Project Structure

```

minecraft-dbms-cli/
├── README.md
├── main.py
├── dump.sql
├── requirements.txt
├── demo.mp4
├── docs/
│   ├── DnA\_Project\_Phase\_1.pdf
│   ├── DnA\_Project\_Phase\_2.pdf
│   ├── Phase3.pdf
│   ├── Phase4.pdf
│   ├── 5.pdf
│   ├── 5-1.pdf
│   ├── 5-2.pdf
└── assets/
├── sample\_skin.png
└── schema\_screenshot.png

````

---

## ▶️ Demo

Watch a 5-minute walkthrough of the app in action:

**📹 [`demo.mp4`](./demo.mp4)**

---

## 🗃️ Database Schema

The project includes a fully normalized ER model implemented in MySQL.

- Composite, multivalued, and derived attributes
- Subclasses (e.g., armaments, consumables)
- Many-to-many and N-ary relationships

📄 See detailed phase-wise documentation in [`/docs`](./docs)  
📥 Load the schema using:  
```bash
mysql -u root -p < dump.sql
````

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/minecraft-dbms-cli.git
cd minecraft-dbms-cli
```

### 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 3. Set Up MySQL

* Start your MySQL server
* Import the database schema:

```bash
mysql -u root -p < dump.sql
```

### 4. Run the Application

```bash
python main.py
```

---

## 📄 Functional Requirements (Implemented)

* Selection, Projection, Aggregate, and Partial Match Queries
* Integrity-constrained Inserts, Updates, Deletes
* Analytics: e.g., most powerful mob, average kills, rarest item

---

## 🧠 Educational Context

This project was built as a 4-phase submission for the **Data and Applications (CS4.301)** course at IIIT-Hyderabad. It demonstrates proficiency in:

* ER modeling and design thinking
* SQL-based relational systems
* Scripting interactive database systems

---

## 📜 License

This project is released for academic and learning purposes. You may fork and build upon it. If you'd like to contribute, feel free to open issues or PRs.

---
