const db = require("../models");
const config = require("../config/auth.config");
const User = db.user;

exports.allAccess = (req, res) => {
  res.status(200).send("Public Content.");
};

exports.userBoard = (req, res) => {
  // res.status(200).send("User Content.");
  User.findByPk(req.userId).then(user => {
    res.status(200).send({
      user: user
    });
    return;
  });
};

exports.adminBoard = (req, res) => {
  res.status(200).send("Admin Content.");
};

exports.chiefBoard = (req, res) => {
  res.status(200).send("Chief Content.");
};
