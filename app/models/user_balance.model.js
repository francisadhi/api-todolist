module.exports = (sequelize, Sequelize) => {
    const UserBalance = sequelize.define("user_balances", {
      balance: {
        type: Sequelize.INTEGER
      },
      balanceAchieve: {
        type: Sequelize.INTEGER
      }
    });
  
    return UserBalance;
  };
  