
# Blog Database System

## Overview

This project implements the backend database for a minimalist blog or forum platform. It is designed to manage core functionalities such as user registration, post creation, commenting, and content categorization. The database schema is built with **PostgreSQL** and focuses on establishing clear relationships between users, their posts, and comments, including support for hierarchical (nested) comments. This project serves as a solid foundation for a web application and showcases essential database design and SQL manipulation techniques.

## Database and Tools

* **PostgreSQL:** The robust relational database management system chosen for its reliability, powerful features, and widespread use.
* **pgAdmin 4:** The primary graphical administration and development tool used for PostgreSQL, facilitating database design, script execution, and data inspection.

## Database Schema

The database is structured to efficiently store and manage blog-related content. It comprises the following tables:

* **`users`**: Stores user account information (username, email, hashed password, registration date).
  * *Constraints:* `username` and `email` are unique.
* **`posts`**: Contains details about each blog post (title, content, creation/update dates, and a link to the `user` who created it).
* **`comments`**: Manages user comments on posts. It includes the comment content, creation date, a link to the `user` who made the comment, and importantly, a **self-referencing foreign key (`parent_comment_id`)** to support nested replies.
* **`categories`**: Defines different content categories or tags (e.g., 'Technology', 'Science', 'Travel').
* **`postCategories`**: A junction table (`many-to-many` relationship) linking `posts` to `categories`, allowing a single post to belong to multiple categories and vice-versa.

The relationships ensure data integrity:

* A `user` can have many `posts` and many `comments`.
* A `post` can have many `comments`.
* A `comment` can optionally have a `parent_comment` (another comment).
* A `post` can be associated with multiple `categories`, and a `category` can be associated with multiple `posts`.

## SQL Scripts

The project includes three sequential SQL scripts to set up and interact with the database:

1. **`1_blog_schema.sql`**:

   * This Data Definition Language (DDL) script is responsible for creating all the necessary tables (`users`, `posts`, `comments`, `categories`, `postCategories`).
   * It defines primary keys (`pk_user_id`, `pk_post_id`, etc.), unique constraints (`uq_email`, `uq_username`), and foreign key relationships (`fk_user_id`, `fk_post_id`, `fk_parent_comment_id`, `fk_cat_id`).
   * Notably, it includes a self-referencing foreign key on the `comments` table (`parent_comment_id`) to enable hierarchical comment structures (replies to comments).
   * `ON UPDATE CASCADE` and `ON DELETE CASCADE` are implemented for relevant foreign keys to manage data consistency automatically.
2. **`2_seed_blog_data.sql`**:

   * This script populates the database with initial, realistic dummy data for `users`, `posts`, `comments`, and `categories`.
   * It's crucial for quickly setting up a functional dataset for development, testing, and demonstration.
   * `TRUNCATE TABLE ... RESTART IDENTITY CASCADE` is used at the beginning to ensure a clean slate for seeding if run multiple times.
3. **`3_dml.sql`**:

   * This script contains various Data Manipulation Language (DML) operations and example queries demonstrating how to interact with the blog database.
   * **DML Operations:** Examples of `INSERT` (new users, posts, comments), `UPDATE` (user profiles, post content), and `DELETE` (posts, comments) statements.
   * **Query Examples:** Showcases how to retrieve information such as:
     * Listing all posts (newest first, or by popularity).
     * Retrieving all comments for a specific post.
     * Listing all posts written by a particular user.
     * Searching posts by keywords in their title or content.
     * Finding posts belonging to a specific category.
     * Identifying users with the most posts or comments.

## Key Features & Demonstrated Queries

The project demonstrates the core functionalities of a blog database system:

* **User Management:** Registering new users and updating their profiles.
* **Post Management:** Creating, viewing, updating, and deleting blog posts.
* **Comment System:** Adding comments to posts, retrieving all comments for a post, and supporting nested replies for threaded discussions.
* **Content Categorization:** Assigning posts to categories and querying posts by category.
* **Content Discovery:**
  * Listing posts ordered by creation date or popularity (number of comments).
  * Searching posts by keywords in title or content.
  * Retrieving all posts by a specific author.
* **Data Integrity:** Enforced through comprehensive use of constraints and foreign keys.

## PostgreSQL Concepts Demonstrated

This project is a practical application of several fundamental and advanced PostgreSQL concepts:

* **Data Definition Language (DDL):** `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `COMMENT ON`.
* **Data Manipulation Language (DML):** `INSERT INTO`, `UPDATE`, `DELETE`.
* **Constraints:** `PRIMARY KEY`, `FOREIGN KEY` (`ON UPDATE CASCADE`, `ON DELETE CASCADE`), `UNIQUE`, `NOT NULL`, `DEFAULT`.
* **Relationships:** Implementation of one-to-many and many-to-many relationships (via junction tables).
* **Self-Referencing Foreign Keys:** Used in the `comments` table to build a hierarchical (tree-like) structure for threaded discussions.
* **Data Types:** Appropriate use of `BIGSERIAL`, `VARCHAR`, `TEXT`, `TIMESTAMP`, `BOOLEAN`.
* **Functions & Operators:** `CURRENT_TIMESTAMP`, `NOW()`, `LIKE` for pattern matching.
* **Complex JOINs:** Utilizing `INNER JOIN`, `LEFT JOIN` for combining data from multiple tables (e.g., joining posts with users, comments with posts and users).
* **Aggregation:** `COUNT` with `GROUP BY` for summarizing data (e.g., counting comments per post, posts per user).

## Setup and Usage

To set up and interact with this database on your local machine:

1. **Install PostgreSQL and pgAdmin 4:** Ensure you have both PostgreSQL (the database server) and pgAdmin 4 (the management tool) installed.
2. **Clone the Repository:**

   ```bash
   git clone [https://github.com/juto-shogan/blog-database-system.git](https://github.com/juto-shogan/blog-database-system.git)
   cd blog-database-system
   ```

   *(Remember to replace `blog-database-system.git` with your actual repository name if different)*
3. **Create a New Database:**
   Open pgAdmin 4, connect to your PostgreSQL server, and create a new database (e.g., `blog_db`).
4. **Execute SQL Scripts in Order:**
   Open the SQL files in pgAdmin 4 (or use a psql client) and run them in the following sequence:

   * `1_blog_schema.sql`: This will create all tables and define their relationships and constraints.
   * `2_seed_blog_data.sql`: This will populate the database with initial dummy data for testing.
   * `3_dml.sql`: This script contains various DML examples and analytical queries you can execute to explore the database's functionalities and retrieve specific information.
5. **Explore and Query:**
   Once the scripts are run, you can use pgAdmin 4's query tool to write and execute your own SQL queries to interact with the database and retrieve desired information.

## Important Notes

* The data provided in `2_seed_blog_data.sql` is **dummy data** for demonstration purposes only.
* The SQL scripts are numbered (`1_`, `2_`, `3_`) to clearly indicate the recommended order of execution for setting up the database from scratch.

## Author

Somto Mbonu

Data Analyst
GitHub Profile: [https://github.com/juto-shogan](https://github.com/juto-shogan)
