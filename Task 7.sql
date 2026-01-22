7. Install an Open Source NoSQL  Data base MongoDB & perform basic CRUD(Create, Read, Update & Delete) operations. Execute MongoDB basic Queries using CRUD operations.Data Management

Performing Basic CRUD Operations:
1. Create Operation:

use basictask;
2. Insert Operation:

◉ Insert single documents:

db.users.insertOne({
      name: "Braham Kumar",
      age: 25,
      email: "braham@gmail.com",
      status: "inactive"
});
◉ Insert multiple documents:

db.users.insertMany([
    {
        name: "Braham Kumar",
        age: 25,
        email: "braham@gmail.com",
        status: "inactive"
    },
    {
        name: "Shubham Kumar",
        age: 35,
        email: "shubham@gmail.com",
        status: "active"
    },
    {
        name: "Bikash Singh",
        age: 28,
        email: "bikash@gmail.com",
        status: "active"
    },
    {
        name: "Shoaib Akhtar",
        age: 28,
        email: "shoaib@gmail.com",
        status: "active"
    }
]);
3. Read Query:

◉ Find all documents:

db.users.find();
OUTPUT:

[
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf6'),
    name: 'Braham Kumar',
    age: 25,
    email: 'braham@gmail.com',
    status: 'inactive'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf7'),
    name: 'Shubham Kumar',
    age: 35,
    email: 'shubham@gmail.com',
    status: 'active'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf8'),
    name: 'Bikash Singh',
    age: 28,
    email: 'bikash@gmail.com',
    status: 'active'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf9'),
    name: 'Shoaib Akhtar',
    age: 28,
    email: 'shoaib@gmail.com',
    status: 'active'
  }
]
◉ Find documents with specific criteria (e.g., find all users with age greater than 25):

db.users.find({ age: { $gt: 25 } });
OUTPUT:

[
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf7'),
    name: 'Shubham Kumar',
    age: 35,
    email: 'shubham@gmail.com',
    status: 'active'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf8'),
    name: 'Bikash Singh',
    age: 28,
    email: 'bikash@gmail.com',
    status: 'active'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf9'),
    name: 'Shoaib Akhtar',
    age: 28,
    email: 'shoaib@gmail.com',
    status: 'active'
  }
]
4. Update Query:

◉ Update a single document:

db.users.updateOne(
  { name: "Bikash Singh" },
  { $set: { age: 31 } }
);
db.users.find({ age: { $gt: 31 } });
OUTPUT:

[
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf7'),
    name: 'Shubham Kumar',
    age: 35,
    email: 'shubham@gmail.com',
    status: 'active'
  }
]
◉ Update multiple documents:

db.users.updateMany(
  { age: { $gt: 28 } },
  { $set: { status: "inactive" } }
);
db.users.find({ age: { $gt: 28 } });
OUTPUT:

[
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf7'),
    name: 'Shubham Kumar',
    age: 35,
    email: 'shubham@gmail.com',
    status: 'inactive'
  },
  {
    _id: ObjectId('666c78f13c52fc36f3cdcdf8'),
    name: 'Bikash Singh',
    age: 31,
    email: 'bikash@gmail.com',
    status: 'inactive'
  }
]
5. Delete Query:

◉ Delete a single document:

db.users.deleteOne({ name: "Bikash Singh" });
◉ Delete multiple documents:

db.mycollection.deleteMany({ age: { $gt: 28 } });
5. Basic Queries:

◉ Count documents in a collection:

db.users.count();
◉ Sorting documents:

db.users.find().sort({ age: 1 });  // Ascending order
db.users.find().sort({ age: -1 }); // Descending order
◉ Limiting the number of documents returned:

db.users.find().limit(5);
◉ Aggregation queries (e.g., group by and aggregate functions):

db.users.aggregate([
  { $group: { _id: "$age", count: { $sum: 1 } } }
]);