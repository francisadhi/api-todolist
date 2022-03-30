module.exports = (sequelize, Sequelize) => {
    const UserBalanceHistory = sequelize.define("user_balance_histories", {
      balanceBefore: {
        type: Sequelize.INTEGER
      },
      balanceAfter: {
        type: Sequelize.INTEGER
      },
      activity: {
        type: Sequelize.STRING
      },
      type: {
        type: Sequelize.ENUM("debit","kredit")
      },
      ip: {
        type: Sequelize.STRING
      },
      location: {
        type: Sequelize.STRING
      },
      userAgent: {
        type: Sequelize.STRING
      },
      author: {
        type: Sequelize.STRING
      }
    });
  
    return UserBalanceHistory;
  };
  