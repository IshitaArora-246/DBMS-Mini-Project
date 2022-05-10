const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require("cors");
const app = express();
const port = process.env.PORT || 8080;

// Parsing middleware
// Parse application/x-www-form-urlencoded
// app.use(bodyParser.urlencoded({ extended: false })); // Remove
app.use(express.urlencoded({ extended: true })); // New
// Parse application/json
// app.use(bodyParser.json()); // Remove
app.use(express.json()); // New

app.use(cors());

// MySQL Code goes here

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`));

const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  database: "employee_db",
});

//* ******************************************** Department ********************************************

app.get("/departments", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    connection.query("SELECT * from department", (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from dept. table are: \n", rows);
    });
  });
});

app.post("/add_department", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);

    const params = req.body;
    connection.query("INSERT INTO department SET ?", params, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.send("Added Successfully!");
      } else {
        console.log(err);
        res.status(400).send(err.message);
      }

      // if(err) throw err
      console.log("The data from dept. table are: \n", rows);
    });
  });
});

app.post("/update_department", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);

    const { dept_id, dept_name } = req.body;
    connection.query(
      "UPDATE department SET `dept_name` = ? WHERE department.dept_id = ?;",
      [dept_id, dept_name],
      (err, rows) => {
        connection.release(); // return the connection to pool

        if (!err) {
          console.log(rows);
          res.send(rows);
        } else {
          console.log(err);
          res.status(400).send(err.message);
        }

        // if(err) throw err
        console.log("The data from dept. table are: \n", rows);
      }
    );
  });
});

//* ******************************************** Employees ********************************************

app.get("/employees", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    connection.query("SELECT * from emp_info", (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from dept. table are: \n", rows);
    });
  });
});

app.post("/add_employee", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);

    const params = req.body;
    connection.query("INSERT INTO emp_info SET ?", params, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.status(200).send("Added Successfully!");
      } else {
        console.log(err);
        // res.status(400).send(err.message);
      }

      // if(err) throw err
      console.log("The data from emp_info. table are: \n", rows);
    });
  });
});

//* ******************************************** Projects ********************************************

app.get("/projects", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    connection.query("SELECT * from project", (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from project. table are: \n", rows);
    });
  });
});

app.post("/add_project", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);

    const params = req.body;
    connection.query("INSERT INTO project SET ?", params, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        console.log(rows);
        res.send("Added Successfully!");
      } else {
        console.log(err);
        res.status(400).send(err.message);
      }

      // if(err) throw err
      console.log("The data from emp_info. table are: \n", rows);
    });
  });
});
