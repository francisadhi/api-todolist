const db = require("../models");
const config = require("../config/auth.config");
const UserBalance = db.user_balance;
const UserBalanceHistory = db.user_balance_history;
const User = db.user;

exports.insertUserBalance = (req, res) => {

    User.findByPk(req.userId).then(user => {
        // Save User to Database
        UserBalance.findAll({
            limit: 1,
            where: {
                //your where conditions, or without them if you need ANY entry
            },
            order: [['createdAt', 'DESC']]
        }).then(function (entries) {
            // res.send({ balance: entries.length })
            let balanceAchieve = 0
            let balanceBefore = 0
            if (entries.length !== 0) {
                balanceAchieve = entries[0].balanceAchieve + req.body.balance
                balanceBefore = entries[0].balanceAchieve
            } else {
                balanceAchieve = 0 + req.body.balance
            }
            UserBalance.create({
                userId: user.id,
                balance: req.body.balance,
                balanceAchieve: balanceAchieve
            })
                .then(user_balance => {
                    if (user_balance) {
                        UserBalanceHistory.create({
                            userBalanceId: user_balance.id,
                            balanceBefore: balanceBefore,
                            balanceAfter: balanceAchieve,
                            activity: req.body.activity,
                            type: req.body.type,
                            ip: req.body.ip,
                            location: req.body.location,
                            userAgent: req.headers["User-Agent"],
                            author: req.body.author
                        }).then(balanceHistory => {
                            if (balanceHistory) {
                                res.send({ message: "User balance inserted successfully!" });
                            }
                        })
                    } else {
                        res.status(400).send('Error in insert new record');
                    }

                })
                .catch(err => {
                    res.status(500).send({ message: err.message });
                });
        });
        // 

    });
};

exports.insertBankBalance = (req, res) => {

    User.findByPk(req.userId).then(user => {
        // Save User to Database
        UserBalance.create({
            userId: user.id,
            balance: req.body.balance,
            balanceAchieve: req.body.balanceAchieve
        })
            .then(user_balance => {
                // user role = 1
                if (user_balance) {
                    res.send({ message: "Bank balance inserted successfully!" });
                } else {
                    res.status(400).send('Error in insert new record');
                }

            })
            .catch(err => {
                res.status(500).send({ message: err.message });
            });

    });
};