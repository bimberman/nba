require('dotenv/config');
const express = require('express');

const db = require('../database');
const ClientError = require('../client-error');
const staticMiddleware = require('../static-middleware');
const sessionMiddleware = require('../session-middleware');

const app = express();
const router = express.Router();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

router.get('/all', (req, res, next) => {
  const queryStr = 'SELECT * from users';
  db.query(queryStr)
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

router.get('/:userId', (req, res, next) => {
  const { userId } = req.params;
  if (!userId) return next(new ClientError('A userId is required', 400));
  if (isNaN(parseInt(userId)) || userId <= 0) {
    return next(new ClientError(`Expected a positive integer. ${userId} is not a valid user id.`, 400));
  }

  const queryStr = `SELECT * from users
                    WHERE user_id = $1`;
  const queryValue = [userId];
  db.query(queryStr, queryValue)
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

router.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

module.exports = router;
