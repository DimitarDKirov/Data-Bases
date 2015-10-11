**Homework Database Systems - Overview**
===============

 1. What database models do you know?
 - Tree-hierarchical - data is organized in hierarchical tree-like structure where a group of data in the leaf has single parent
 - Network/graph - here each record may have several parents
 - Relational - data is organized in tables according as each table store data with the same structure
 - Object-oriented aims to store data like it was done in Object-oriented programming languages

2. Which are the main functions performed by a Relational Database Management System (RDBMS)?
- store data in tables together with relationships between tables
- create/update (alter)/delete tables and relationships
- add, update, delete, search data stored in the tables by using SQL language

3. Define what is "table" in database terms. 
- a set of data values organized with the same structure organized in columns and rows

4. Explain the difference between a primary and a foreign key.
- Primary key identifies each row in a table as unique, so a row could be identified by its primary key.
- Secondary key sets a relationship between data in two tables. In fact it is a column in a given table which stores the primary key of a row in another table and so it supports the relationship between the data in the two tables

 5. Explain the different kinds of relationships between tables in relational databases.
 - one-to-one relationship - a row in a table could be linked to only one row in another table and vice-versa
 - one-to-many relationship - a row in a table could be linked to many rows in another table, while a row in the sesond table could be linked to only one row in the first table
 - many-to-may relationship - a row in a table could be linked to many rows in another table as well as a row in the sesond table could be linked to many rows in the first table. It is implemented by additional table which supports relationship one-to-many to the other 2 tables
 
 6. When is a certain database schema normalized?
 - A given database schema is normalized when the data in it is not repeated. Normalization is achieved by extracting repeated data to additional table usually. A normalized databse schema stores less data than non-normalized, update of a value is done in a single place instead of many places so data is kept consistent and reliable

 7. What are database integrity constraints and when are they used?
 - Integriry contraints are rules on data which are followed strictly.
 Constraints like Primary key and Foreign key are used in (almost) all tables. Together with Unique key, check contraint and others they suuport data integrity and reliability.

 8. Point out the pros and cons of using indexes in a database.
 - By usage of indexes, search of a particular value in a column could be dramatically faster, while addition of a new data and update of an existing one could be slowed down due to the support of additional data strucuture for the index.

9. What's the main purpose of the SQL language?
- SQL language is used for management and manipulation of relational databases

