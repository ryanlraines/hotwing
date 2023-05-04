const express = require('express')
const app = express()
const port = 80

app.get('/', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify({  "message": "Ryan",  "timestamp": Date.now()}));
});

app.listen(port, () => {
    console.log(`app listening at http://localhost`)
  });
