
const express = require('express');
const bodyParser = require('body-parser');
const kisiRoutes = require('./routes/kisiler');
const app = express();

app.use(bodyParser.json());


app.use('/kisiler',kisiRoutes);

app.listen(8000, ()=> {
    console.log("Server up");
});

