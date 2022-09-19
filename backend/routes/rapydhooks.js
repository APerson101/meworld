var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send("HELLO WORLD");
});

router.get('/where', function (req, res, next) {
  res.send("Sherifah, i want you to understand that \nyou will always be mine no matter what");
})

module.exports = router;


//nodemon --exec npm start

// Bypass-Tunnel-Reminder localtunnel