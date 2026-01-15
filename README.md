# Concepts of Programming Languages

## 🧩 Milestone 1: Logic Programming (Prolog)

**Project:** Automated Class Scheduling System

*See the `/Prolog-Scheduler (Milestone 1)` directory for full documentation and knowledge base files.*

* **Core Concept:** Constraint Satisfaction.
* **Key Feature:** Automated clash detection and multi-student availability analysis ("Assembly Hours").

### 🎯 Project Objective

The goal is to assist students at the German University in Cairo (GUC) in creating a weekly schedule that:

1. **Prevents Clashes:** Ensures no two courses are scheduled in the same slot on the same day for a single student.
2. **Enforces Work-Life Balance:** Limits the number of study days to allow for at least **2 days off** per week.
3. **Identifies "Assembly Hours":** Finds common free slots across all students' schedules for group meetings or extracurricular activities.

---

## 🏗️ System Architecture (Milestone 1)

The system is built on a provided Knowledge Base (`studentKB.pl`) containing:

* `studies(Student, Course)`: Maps students to their enrolled subjects.
* `day_schedule(Day, Schedule)`: Defines the university's master timetable (5 slots per day).

### Core Constraints

* **Zero-Clash Policy:** A student cannot be in two places at once.
* **Day Count Constraint:** No student can have slots allocated on more than a predefined number of days (e.g., 4 days maximum to ensure a 3-day weekend).

---

## 🛠️ Required Predicates

The implementation focuses on five primary predicates, developed using recursive logic and list manipulation:

| Predicate | Description |
| --- | --- |
| `university_schedule(S)` | Aggregates schedules for all registered students into a single structure. |
| `student_schedule(ID, Slots)` | Binds a list of `slot(Day, Number, Course)` for a specific student ID. |
| `no_clashes(Slots)` | A validation predicate that succeeds if no two slots in the list overlap. |
| `study_days(Slots, Max)` | Ensures the number of unique days in a schedule does not exceed `Max`. |
| `assembly_hours(Scheds, AH)` | Calculates a list of slots where every student is free and currently on campus. |

---

## 🔢 Milestone 2: Functional Programming (Haskell)

**Project:** Railway Network System

**Deadline:** May 19, 2025

### 🎯 Objective

Implementation of a railway network modeled as a directed, weighted graph. The project focuses on utilizing Haskell's strong typing and recursive data structures to calculate the most efficient path between stations using **Dijkstra's Shortest Path Algorithm**.

### 🏗️ Data Structures & Logic

To manage the network state and algorithm efficiency, the following custom algebraic data types were implemented:

* **`PriorityQueue`**: A recursive data structure that maintains `PQNodes` in ascending order based on their traversal cost.
* **`PQNode`**: Represents a station with its unique identifier and the current cumulative cost (key) to reach it.
* **Adjacency Matrix**: Represented as a nested list `[[Int]]`, where `matrix !! (i-1) !! (j-1)` denotes the cost from station $i$ to station $j$.

### 🛠️ Key Functions

* **`railsNetwork`**: Generates a pseudo-random adjacency matrix representing the station connections.
* **`pullLever`**: A modifier function that updates edge weights, demonstrating Haskell's approach to immutability (returning a new matrix).
* **`computeShortestPathCost`**: The core engine implementing Dijkstra's algorithm. It recursively processes the `PriorityQueue`, performs edge relaxation, and returns the minimum cost to reach the destination.

---

## 💻 Example Usage

### Prolog (Milestone 1)

To run the scheduler, consult the file in any standard Prolog interpreter (like **SWI-Prolog**):

```prolog
?- [project_m1].
?- student_schedule(student_0, X).
X = [slot(saturday, 2, csen202), slot(sunday, 2, mech202), slot(monday, 2, physics201)] ;
...

```

To find common free time for a group of students:

```prolog
?- university_schedule(S), assembly_hours(S, AH).
AH = [slot(saturday, 3), slot(saturday, 4), slot(saturday, 5)].

```

### Haskell (Milestone 2)

1. Load the module in **GHCi**:
```haskell
ghci Project2_TeamID.hs

```

2. Generate a network and find the shortest path:
```haskell
let network = railsNetwork 5 12345
let source = initializeSource 5 network
computeShortestPathCost 1 network source

```

---

## 🚀 Technical Takeaways

This course highlights the fundamental shift in thinking required for different paradigms:

1. **Declarative (Prolog):** Describing *what* the solution looks like (constraints) and letting the engine backtrack to find it.
2. **Functional (Haskell):** Describing *how* data transforms through pure functions, recursion, and lazy evaluation without side effects.

---

## 📂 Project Structure

* `Prolog-Scheduler (Milestone 1)/`: Prolog scheduling system with KB files and predicates.
* `Haskell-Project (Milestone 2)/`: Haskell railway network implementation with Dijkstra's algorithm.
* `README.md`: This comprehensive documentation file.

---

### 💡 Implementation Notes

**Milestone 1 (Prolog):** The project follows a **bottom-up implementation** strategy. We first define what constitutes a clash and how to count unique days, then move toward the complex task of assembling a full university schedule.

**Milestone 2 (Haskell):** Strong emphasis on **type safety** and **immutability**, with careful management of the priority queue to maintain the ascending order invariant throughout Dijkstra's algorithm execution.

---

## 📊 Your GitHub Profile Snippet

Now that you have completed both, your profile snippet should look even more impressive:

* **[Concepts of Programming Languages](https://github.com/YassinSabek2k05/Concepts)**
* *Description:* A dual-paradigm study. Includes a **Prolog** constraint-solver for university scheduling and a **Haskell** implementation of Dijkstra's algorithm for railway cost optimization.
* *Tech:* Haskell, Prolog, Functional Programming, Graph Theory.



