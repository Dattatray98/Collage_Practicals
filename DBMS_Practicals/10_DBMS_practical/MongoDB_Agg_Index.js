// 1. AGGREGATION
// Calculate count of students in each department
db.students.aggregate([
    { $group: { _id: "$dept", totalStudents: { $sum: 1 } } }
]);

// Find average age of students in CS department
db.students.aggregate([
    { $match: { dept: "CS" } },
    { $group: { _id: "$dept", avgAge: { $avg: "$age" } } }
]);

// Pipeline: Match CS students -> Project name/age -> Sort by age desc
db.students.aggregate([
    { $match: { dept: "CS" } },
    { $project: { _id: 0, name: 1, age: 1 } },
    { $sort: { age: -1 } }
]);

// 2. INDEXING
// Create a unique index on student_id
db.students.createIndex({ student_id: 1 }, { unique: true });

// Create a compound index on department and name
db.students.createIndex({ dept: 1, name: 1 });

// List all indexes
// db.students.getIndexes();

// Using explain to see if index is used
// db.students.find({ student_id: 1 }).explain("executionStats");
