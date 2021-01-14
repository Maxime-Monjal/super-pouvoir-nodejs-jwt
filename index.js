const express = require('express');
const cors = require('cors');
require('dotenv').config();
const connection = require('./databases/database');

const { SERVER_PORT, CLIENT_URL } = process.env; // (attention!!!)

const app = express();

app.use(
  cors({
    origin: CLIENT_URL,
  })
);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* super_power list */

app.get('/', (request, response) => {
  connection.query('SELECT * FROM super_pouvoir', (error, result) => {
      if(error) {
        response.status(500).send(error);
      }
      if(result.lenght === 0) {
        response.sendStatus(404);
      } else {
        response.status(200).json(result);
      }
  });
});


// Don't write anything below this line!
app.listen(SERVER_PORT, () => {
  console.log(`Server is running on port ${SERVER_PORT}.`);
});
