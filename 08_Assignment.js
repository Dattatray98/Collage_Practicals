// Create / Use database
use collegeDB

// Insert data
db.students.insertMany([
  { student_id: 101, name: "Dattatray", age: 20, dept: "CS" },
  { student_id: 102, name: "Ashish", age: 22, dept: "IT" }
]);

// Read data
db.students.find();

// Update data
db.students.updateOne(
  { student_id: 101 },
  { $set: { age: 21 } }
);

// Delete data
db.students.deleteOne({ student_id: 102 });