require('dotenv/config');
const express = require('express');

const db = require('../database');
const staticMiddleware = require('../static-middleware');
const sessionMiddleware = require('../session-middleware');

const app = express();
const router = express.Router();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

router.get('/', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

module.exports = router;
