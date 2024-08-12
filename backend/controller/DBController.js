require('dotenv').config();

const mysql = require("mysql2");

const pool = mysql.createConnection({
  host: process.env.host,
  user: process.env.user,
  password: process.env.password,
  database: process.env.name,
});

pool.connect();

module.exports = pool;