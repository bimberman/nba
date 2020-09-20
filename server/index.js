require('dotenv/config');
const express = require('express');

// eslint-disable-next-line
const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

// health-check routes
const healthCheck = require('./routes/health-check');
app.use('/api/health-check', healthCheck);

// user routes
const user = require('./routes/user');
app.use('/api/user', user);

// teams routes
const teams = require('./routes/teams');
app.use('/api/teams', teams);

// games routes
const games = require('./routes/games');
app.use('/api/games', games);

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
