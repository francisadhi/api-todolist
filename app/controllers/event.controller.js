const db = require("../models");
const Event = db.event;

exports.insertEvent = (req, res) => {
    Event.create({
        name: req.body.name,
        address: req.body.address,
        telephone: req.body.telephone,
        enable: req.body.enable,
    }).then(balanceHistory => {
        if (balanceHistory) {
            res.send({ message: "User balance inserted successfully!" });
        } else {
            res.status(400).send('Error in insert new record');
        }
    })
};