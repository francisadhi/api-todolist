module.exports = (sequelize, Sequelize) => {
  const Event = sequelize.define("events", {
    name: {
      type: Sequelize.STRING
    },
    location: {
      type: Sequelize.STRING
    },
    date: {
      type: Sequelize.DATE
    },
    description: {
      type: Sequelize.STRING 
    }
  });

  return Event;
};
