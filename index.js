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

/* filter sub-categories */

app.get('/categories/inutile/max-effet', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "inutile" AND time <= ?`,
    [req.query.duree],
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

/* filter categories */

app.get('/categories/inutile', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "inutile"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/environnemental', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "environnemental"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/corporel', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "corporel"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/classique', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "classique"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

app.get('/categories/flippant', (req, res) => {
  connection.query(
    `SELECT * FROM super_pouvoir sp JOIN categorie cat ON sp.categorie_idcategorie = cat.idcategorie WHERE cat.name = "flippant"`,
      (error, result) => {
        if (error) {
          res.status(500).json({ errorMessage: error.message });
        } else {
          res.status(201).json({...result});
        }
      }
    );
  }
);

// Don't write anything below this line!
app.listen(SERVER_PORT, () => {
  console.log(`Server is running on port ${SERVER_PORT}.`);
});
