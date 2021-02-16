# Apartment Database  
### Getting started

* Fork and clone this as normal
* Each part has a corresponding `.sql` file for you to do your work in. 
* Add, commit, and push your changes when you finish each part
* Make a pull request!

### Part 0: Draw an ERD
You should always make a schema diagram (also known as an _E_ ntity _R_ elationship _D_ iagram) before you start writing code. Think of this as pseudocoding or making wireframes, but for your database instead of for your js or html.

There are many ERD building tools out there, this one is free and can be used in the browser: https://app.dbdesigner.net/designer/schema/new. You should bookmark it and use it whenever you need to make an ERD.

You're going to create two tables, the columns for which are described below. Think about what data type each column should be.

- Create a table called `owners`, which should consist of:
  + `id` (this should be the primary key as well as a unique number that increments automatically)
  + `name` - name of owner
  + `age` - age of owner
- Create a `properties` table which should consist of:
  + `id` (this should be the primary key as well as a unique number that increments automatically)
  + `name` - name of property
  + `units` - number of units

When you're done making your ERD, take a screenshot and place the image file in this directory. Add, commit, and push it!

### Part 1: Create Tables
Time to turn our ERD into a real database! For the rest of this lab, you might find it helpful to do your work in the corresponding `.sql` file, then copy-paste it into your psql. If it doesn't work, you can edit it in your text editor and try again.

If you need syntax help, here are some helpful google ideas: "sql create table", "sql primary key", "sql auto increment".

Once you've created each table, look at it in psql (using `\d <your-table-name>`) and make sure all the columns look the way you want.

### Part 2: one-to-many relationship
We want a single user to be able to have many properties. Each property should belong to just 1 user. To do this, we will need to add a _foreign key_, which will be a column on one of our tables.

Think about which of the two tables this column should go on? It helps to think about which entity is the parent and which is the child in this relationship.

What data type should it be? 

To get a clue on the syntax, look into "sql add column to table".

<details>
  <summary>Which table should it go on?</summary>
  properties: If it went on owners, that would mean that each owner can have only 1 property, and that each property can have many owners. This is the opposite of what we want.
</details>

<details>
  <summary>What data type should it be?</summary>
  Integer: this foreign key column will correspond to the primary key of the `owners` table, so it should be the same data type as that column.
</details>

<details>
  <summary>What sql command creates the column?</summary>
  ALTER TABLE properties
  ADD owner_id int;
</details>

### Part 3: Insert Data
Note that for each table, you can use separate `INSERT INTO` statements or just one. You might have to google something like "sql insert many" to find the syntax to insert many at once!

* Insert the following owners
    * William - age 29
    * Jane - age 43
    * Yuki - Age 67
    * Add 3 more people (you choose name / age)

* Insert the following properties
    * Archstone - 20 units - belongs to Yuki
    * Zenith Hills - 10 units - belongs to Yuki
    * Willowspring - 30 units - belongs to Jane
    * Add 3 more properties (you choose name / units / property owners)

### Part 4: Use Your Database
Follow the prompts in `part-4.sql`! Beyond the basic CRUD commands, you'll need the `JOIN` operator.

Note that our 2 tables have some column names in common. When you join these tables and select from them, it will be ambiguous which "name" or "id" column you are asking for.

This will get confused as to whether you're asking for the name of the owners or the properties:
```sql
SELECT name FROM owners
  JOIN properties
  ON owner.id = property.owner_id
```

But this will be interpreted unambiguously:
```sql
SELECT owners.name FROM owners
  JOIN properties
  ON owner.id = property.owner_id
```
