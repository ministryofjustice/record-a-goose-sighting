const express = require('express')
const router = express.Router()

router.get('steps/geese-liked', function (req, res) {
  res.render('steps/geese-liked');
});

router.get('steps/goose-type', function (req, res) {
  res.render('steps/goose-type');
});

router.get('steps/date-saw-goose', function (req, res) {
  res.render('steps/date-saw-goose');
});

router.get('steps/check-your-answers', function (req, res) {
  res.render('steps/check-your-answers');
});

router.get('steps/end', function (req, res) {
  res.render('steps/end');
});

module.exports = router
