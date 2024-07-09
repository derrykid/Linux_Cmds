[toc]
# Course1 -  What's a database?

- Data: Known facts that can be recorded and have an implicit meaning
- Database: it's a collection of related date

Database is logically related and comprises of 
- entities
- attributes
- relationships

### Data storage
Limitations of digital file-based approach
- separation and isolation of data - each program manage its own database
- duplication of data

# What is DBMS (database management system)
It's a software system used to create and maintain a computerised database

![dbms-sys](/home/derry/lyit/db/images/dbms_sys_env.png) 

##### define database in terms of
- structure
- data types
- constraints

##### construct or load the database contents - retrieve from disk storage

##### Manipulating the database
- Retrieval: query, generating reports
- Modification: CRUD - create, revise, update, delete
- Accessing the database via web apps

##### Processing and sharing data
- many applications involve concurrent users and program
- The DBMS will ensure validity and consistency of shared data


### Characteristics of database approach
DBMS catalogue stores the description of a particular db

The description is called **meta-data** 

It allows the DBMS to work with different database application

#### Data definition language (DDL) vs. Data manipulation language (DML)
###### DDL
> used to specify data types, structure of the data and data constraints

>specifications typically stored within the database


###### DML
> It's used to query the database

###### Insulation between programs and data

it's called program-data independence.
It allows changing data structures and storage organisation w/o having to change the access programs


###### Sharing of data and multi-user transaction process
- Allow concurrent users
- Concurrency control - each transaction is correctly executed
- Recovery subsystem ensures each transaction has its effect permanently.
- OLTP(Online Transaction Processing) - Major part of db applications 

### Advantages of using db approach
- Controlling redundancy
- Restricting unauthorised access to data
- Providing persistent storage
- Providing Storage structures for efficient Query processing

### Disadvantages
- Complexity
- Size
- Cost the DBMS
- Additional hardware costs
- Cost of conversion
- Performance
- Higher impact of a failure


There are 3 types of database users
1. database administrator - authorise access, minitor, acquire resources, and control its use and efficiency.

2. database designer - Responsible for defining: the content, the structure, the constraints, etc.

They communicate with the end-users and have their needs
3. end user

They might be
- Casual user - access db whenever needed
- Naive or Parametric - represent most end users - query the db using standard types of queries called *"canned transactions"* 
- Sophisticated - might be business analysts, scientists, engineers, etc
- Stand-alone - mostly maintain personal db using applications


# Course2 -  Database system concepts and architecture
## Data model

> A collection of concepts used to describe the structure of the database

Structure defined in terms of:
- Data types
- Relationships
- Constraints on the data

**structure**
- Conceptual constructs
- common elements include entity (relations, records, tables)

**Constraints** 
- Specify restrictions on valid data and relationships between data

**Operations**  - CRUD
- Retrieve or update the data within the db
- refer to the constructs of the data model

**User defined operations** 
- update orders from current inventory

### Categories of data model
##### Conceptual (high level, sematic) data models:
It provides concepts that allow us to understand and model the data(entity-based or object-based)

##### Physical (low-level, internal) data models:
Concepts that describe details of how data is stored on the computer

##### Implementation (representational) data models:
Provides concepts that fall between the conceptual and physical. E.g. relational data models

#### Self-describing data model
Combine description and data with the values. E.g. **XML, some NOSQL system** 

### Schema versus instances
Database schema:
- The description of a db
- Includes descriptions of the db structure, data types, and the constraints on the db.

Schema Diagram:
- An illustrative display of a database schema

Schema Construct:

A component of the schema or an object within the scheme, e.g. STUDENT, COURSE.

##### Database instance
it's the actual stored data in a database at a particular moment in time

## Three-schema architecture
Database approach separates
- Database description
- Data
- User views of the data

The three-schema architecture separates the user application from the physical database

![three-schema architecture](/home/derry/lyit/db/images/3_scheme_arc.jpg) 

## Database Languages and interface
Data definition language (DDL):
- specify the conceptual schema
- used to define internal and external schemas
- Separate **storage definition language (SDL)** and **view definition language (VDL)** used to define internal and external schemas.
- - SDL is realised via DBMS commands provided to the DBA(db administrator) and db designers

Data Manipulation Language (DML):
- used to specify database retrievals and updates
- High level or non-procedural languages: these include the relational language SQL

# Course 3 - The relational model
## Ted Codd relational model
It represents the database as a collection of relations(tables).

>“Given sets S1, S2,...,Sn (not necessarily distinct), R is a 
relation on these n sets if it is a set of n-tuples
each of which has its first element from S1, its second element
from S2, and so on. We shall refer to Sj as the jth domain of 
R.”

- Relations may look like a **table** 
- Relation contains a set of tuples (rows)
- Each tuple represents a real-world **entity** or **relationship** 
- Each **column** has a column header (attribute) that gives an indication of meaning of the data items in that column
- **Domain** is the set of allowable values for one or more attributes.

### Formal definition
The **Schema** of a relation:
- denoted by Relations (R)
- The attributes of the relations are names, number...

E.g. **Customer** while customer is the relation name. Cust-id, Cust-name is the attributes to define.

- Each attribute has a **domain**  or a set of valid values - data type of that column
- **Relation state** is a subset of the Cartesian product of the domains of its attributes

## Characteristics of relations
- Relation name is **distinct** from all other relation names in a relational schema
- A relation is not sensitive to the ordering of tuples
- Each cell of a relation contains exactly one atomic (single value)
- The order of attributes has no significance
- Each attribute has a distinct name and it's from the same domain
- Each tuple is **distinct** (no duplicates)

### keys
[keys explanation in my blog](derry.club/keys-in-database-what-is-difference-between-super-key-and-primary-key/)

### Constraints
Domain constraints specify that within each tuple, the attribute must be an atomic value from the domain.

To ensure entity integrity, no primary key value can be null.

### Referential integrity
- Referential integrity constraint is specified between two relations
- it's used to maintain the consistency among tuples
- Foreign key must match a candidate key value in the same or different relation

# Lecture 4 db design approach
### objectives
- design db that meets the need of org
- minimised duplication of data
- constraints are incorporated within the design
- data and entity integrity

1. ER modelling - top down approach - diagram
2. normalisation - bottom up - with separate data


#### Good quality of a good relational schema design
1. semantics of the relation and attributes are clear
1. redundant and duplicate info in tuples is minimal
1. minimal numbers of NULL values in tuples
1. prevent spurious tuples
1. ensure referential and entity integrity

#### Clear semantics 
Guideline: each tuple should represent one entity or relationship instance, it should be easily interpret

Attributes of different entities shouldn't be mixed in the same relation, while only **foreign key** should be used to refer to.

#### Poor DB design
Poorly designed db can result in
- wasted storage
- update anomalies
- - insertion anomalies
- - deletion anomalies
- - modification anomalies

Avoid anomalies

attributes that are NULL frequently can be placed in separate relations

Reason for NULL:
- Attribute not applicable
- Attribute value unknown
- value know to exist, but not available

#### Spurious tuples
Bad designs may result in erroneous results for certain **JOIN** operations

Guideline: 

The relations should be designed to satisfy the lossless join condition
No spurious tuples should be generated by doing a natural-join of any relations

### Functional dependencies (fd)
> essentially a constraint between two sets of attributes within a relation

![functional dependency](/home/derry/lyit/db/ab_func.jpg) 

Attribute B is fully functionally dependent on attribute A, if knowing the value of 'A' uniquely determines the value of B.

**Determinant** the attribute or group of attributes of the arrow of a functional dependency. E.g. Primary key

#### Types of FD
1. Full functional dependency
1. Partial functional dependency
1. Transitive functional dependency

1. Full functional dependency
> A condition where A, B are attributes of a relation 

2. Partial functional dependency
> A condition where A, B attributes of a relation such that: an attribute can be removed from A and the dependency still holds.

3. Transitive functional dependency
> A condition where you can determine C by B via A.

## Normalisation

Aims to create a set of stable relations that comply with design guidelines:
- Clear semantics
- No redundant data
- Minimal NULL values
- Prevent spurious tuples
- Ensure referential and entity integrity

### Normalisation process
>Normalisation is a data analysis technique to design a database system. It allows the 
database designer to understand the current data structures in an organisation. Furthermore, 
it aids any future changes and enhancements to the system. 

Analyse relation schema to ensure attributes are fully dependent on the PK.
If not, we decompose it further by
- minimise redundancy and duplicate data
- avoid insertion, deletion, and update anomalies

**Normalisation is the process of decomposing unsatisfactory bad relations by breaking up their attributes into smaller relations** 

Normal form: condition using keys and DFs of a relation to certify whether a relation schema is in a particular normal form

![np](/home/derry/lyit/db/images/nf-process.jpg) 

UNF: a table that contains one or more repeating groups
- List all attributes, put the data into a relation with columns and rows

1NF: the interaction of each row and column contains one only value
- A single value at the intersection of each row

Must identify and remove
1. Composite attributes
2. Multivalued attributes
3. Repeating groups
4. Nested relations

**Getting to 1NF from UNF** 
> select an attribute or group of attributes to be PK
> identify and remove the duplicates


2NF: 1NF and non-primary key is fully FD
**1NF to 2NF** 
> Determine if it's fully DF on the primary key
> if partial dependencies exist, remove them by placing in a new relationship along with a copy of their determinant

3NF: a relation that no non-primary key attribute is transitively dependent on the PK

**2NF to 3NF** 
> identify PK and functional dependencies in the relation
> if transitive dependencies exist on PK, remove them by placing them in a new relation with a copy of their dominant.

#### Normalization example

| Full name   | Address      | Movies rented                                  | Salutation |
|-------------|--------------|------------------------------------------------|------------|
| Janet Jones | First Street | Pirates of the Caribbean, Clash of the Titans  | Ms.        |
| Robert Phil | 3rd Street   | Forgetting Sarah Marshal, Daddy's Little Girls | Mr.        |
| Robert Phil | 5th Avenue   | Star War                                       | Mr.        |

1. 1NF(first normal form)
- Each record is unique. So the movies in one column is now in a single row


| Full name   | Address      | Movies rented            | Salutation |
|-------------|--------------|--------------------------|------------|
| Janet Jones | First Street | Pirates of the Caribbean | Ms.        |
| Janet Jones | First Street | lash of the Titans       | Ms.        |
| Robert Phil | 3rd Street   | Daddy's Little Girls     | Mr.        |
| Robert Phil | 3rd Street   | Forgetting Sarah Marshal | Mr.        |
| Robert Phil | 5th Avenue   | Star War                 | Mr.        |

2. 2NF
- Single Column Primary Key that does not functionally dependant on any subset of candidate key relation

| Member ID | Full name   | Address      | Salutation |
|-----------|-------------|--------------|------------|
| 1         | Janet Jones | First Street | Ms.        |
| 2         | Robert Phil | 3rd Street   | Mr.        |
| 3         | Robert Phil | 5th Avenue   | Mr.        |

| Member ID | Movie rented             |
|-----------|--------------------------|
| 1         | Pirates of the Caribbean |
| 1         | lash of the Titans       |
| 2         | Daddy's Little Girls     |
| 2         | Forgetting Sarah Marshal |
| 3         | Star War                 |

 3. 3NF
 - Has no transitive functional dependencies

| Member ID | Full name   | Address      | Salutation |
|-----------|-------------|--------------|------------|
| 1         | Janet Jones | First Street | 3          |
| 2         | Robert Phil | 3rd Street   | 1          |
| 3         | Robert Phil | 5th Avenue   | 1          |

| Member ID | Movie rented             |
|-----------|--------------------------|
| 1         | Pirates of the Caribbean |
| 1         | lash of the Titans       |
| 2         | Daddy's Little Girls     |
| 2         | Forgetting Sarah Marshal |
| 3         | Star War                 |

| Salutation Id | Salutation |
|---------------|------------|
| 1             | Mr.        |
| 2             | Mrs.       |
| 3             | Ms.        |
| 4             | Dr.        |

# SQL
- Data Definition Language (DDL)
- Data Manipulation Language (DML)
- Data Control Language (DCL)

SQL is not case sensitive

## DDL 

To create, delete tables, schemas, domains, indexes

Three **verbs** accomplish these tasks
1. Create - identifies the table name, columns, indexes, and data types
2. Alter - changes the table
3. Drop - deletes table from database

### SQL - Create
```
# create a schema
CREATE SCHEMA new_schema;

# create a table
CREATE TABLE table_name(
	column1 datatype,
	column2 datatype constraint,
	PRIMARY KEY (column1)
	...
);

# Create w/ Foreign key
CREATE TABLE Review (
	ID INT NOT NULL,
	Rest_FK INT,
	FOREIGN KEY (Rest_FK) REFERENCES resturant(ID)
);
```

### SQL - Alter
```
# basic syntax
ALTER TABLE table_name
ADD column_name datatype;

# an example
ALTER TABLE review
ADD Date_thatday DATETIME;

# rename a column
ALTER TABLE review 
RENAME COLUMN Date_thatday TO D_T

# delete a column
ALTER TABLE review
DROP COLUMN DateofReview

# change column constranit/data type
ALTER TABLE review
MODIFY COLUMN D_T DATE

# Add a foreign key w/o naming it
ALTER TABLE review
ADD FOREIGN KEY (Rest_FK) REFERENCES resturant(ID);

# Add a FK and naming it - simply add CONSTRAINT `name`
ALTER TABLE review
ADD CONSTRAINT `Rest_FK` FOREIGN KEY (Rest_FK) REFERENCES resturant(ID);

# Remove a FK - specify the name of FK constraint, not the name of column
ALTER TABLE reivew
DROP FOREIGN KEY Rest_FK;
```

### SQL - Drop
```
# delete schema
DROP SCHEMA new_schema;
```

## DML - Follow CRUD model (Create, read, update, delete)

### SQL - INSERT
```
INSERT INTO table_name (c1, c2, c3, ...) VALUES
(v1, v2, v3, ...),
(v1, v2, v3, ...);  // if multiple rows
```

### SQL -SELECT - retrieve data
```
SELECT c1, c2 FROM table_name;

# All columns
SELECT * FROM users;

# with conditions
SELECT * FROM users
WHERE condition;

# simple 'WHERE' example
SELECT * FROM user
WHERE Salary BETWEEN 100 AND 500;

# give alias
SELECT RestName AS "Resturant name" FROM resturant;

# dinstinct values only
SELECT DISTINCT Cuisine FROM Resturant;

# Order
SELECT score FROM reivew
WHERE score > 3
ORDER BY score DESC;

# Show distinct group
SELECT c1, c2 FROM department
GROUP BY dept_name;
```

### SQL UPDATE - update data in tables
```
UPDATE table_name
SET column1 = v1, c2 = v2, ...
WHERE condition;

# Example
UPDATE users
SET Name = "Shane Wilson"
WHERE ID = 1001;

UPDATE users
SET admin = 0;
```

### SQL DELETE - delete one or more rows in a table
```
# basic syntax
DELTE FROM table_name
WHERE condition;

DELETE FROM users
WHERE ID = 1001;

DELETE FROM resturant
WHERE Avg_Score < 3.9;
```


## DCL - Use after you make changes

4 main commands
1. COMMIT
2. COMMIT WORK
3. ROLLBACK - restores system to previous state prior to changes you made 
4. GRANT, REVOKE - deal with access to database


Simple example
```
GRANT SELECT
ON CD
TO MICK

GRANT UPDATE
ON CD
TO MARY
```

| -   | CREATE- | READ   | UPDATE        | DELETE |
|-----|---------|--------|---------------|--------|
| DDL | CREATE  | SHOW   | ALTER         | DROP   |
| DML | INSERT  | SELECT | UPDATE        | DELETE |
| DCL | GRANT   | SHOW   | GRANT, REVOKE | REVOKE |


[SQL Cheat sheet](https://www.sqltutorial.org/sql-cheat-sheet/)
