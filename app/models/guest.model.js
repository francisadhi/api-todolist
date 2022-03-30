module.exports = (sequelize, Sequelize) => {
  const Guest = sequelize.define("guests", {
    name: {
      type: Sequelize.STRING
    },
    address: {
      type: Sequelize.STRING
    },
    telephone: {
      type: Sequelize.STRING
    },
    enable: {
      type: Sequelize.BOOLEAN 
    }
  });

  return Guest;
};
