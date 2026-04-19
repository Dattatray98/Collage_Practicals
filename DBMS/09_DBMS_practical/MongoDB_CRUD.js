// Use or create a database
// use LibraryDB

// 1. CREATE (Insert)
db.students.insertMany([
    { student_id: 1, name: "Pushpraj Patil", dept: "CS", email: "pushpa@gmail.com", age: 20 },
    { student_id: 2, name: "Tejaswini Lagad", dept: "IT", email: "teju@gmail.com", age: 21 },
    { student_id: 3, name: "Amit Sharma", dept: "CS", email: "amit@gmail.com", age: 22 }
]);

// 2. READ (Find)
// Find all students in CS department
// db.students.find({ dept: "CS" });

// Find students with age > 20 using logical operator
// db.students.find({ age: { $gt: 20 } });

// 3. UPDATE
// Update email for student_id 1
db.students.updateOne(
    { student_id: 1 },
    { $set: { email: "p_patil_new@gmail.com" } }
);

// Increment age for all CS students
db.students.updateMany(
    { dept: "CS" },
    { $inc: { age: 1 } }
);

// 4. DELETE
// Delete student with student_id 3
db.students.deleteOne({ student_id: 3 });

// 5. Save method (Alternative for insert/update)
// db.students.save({ student_id: 4, name: "New Student", dept: "Mech" }); 
// Note: save() is deprecated in newer mongo shells in favor of insertOne/replaceOne
