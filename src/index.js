const express = require('express');
const morgan = require('morgan');

const tasksRoutes = require('./routes/tasks.routes');

const app = express();

app.use(morgan('dev'))

app.use(tasksRoutes);

app.listen(4000)
console.log("Server on port 4000")