# Practical 10: Aggregation and Indexing in MongoDB

## Objective
Design and execute MongoDB queries using aggregation and indexing techniques with suitable examples.

## Steps Performed
1.  **Aggregation Pipeline**: Used `$match`, `$group`, `$sort`, and `$project` to summarize student data by department.
2.  **Indexing**: Created a single-field index on `student_id` and a compound index on `name` and `dept` to optimize query performance.
3.  **Performance Analysis**: Used `explain()` to verify that queries are using the indexes created.

## Files in this Portfolio
- `MongoDB_Agg_Index.js`: MongoDB shell commands for aggregation and indexing.
