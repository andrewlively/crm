const Communication = require(`../Database`).Communication;

exports.get = () => {
  return Communication.fetchAll();
};

exports.getAllForCommunicationType = communicationType => {
  return Communication
    .where({ communicationType })
    .fetch();
};

exports.getAllForCustomer = customer => {
  return Communication
    .where({ customer })
    .fetch();
};

exports.getAllForUser = user => {
  return Communication
    .where({ user })
    .fetch();
};

exports.create = (communicationType, customer, user) => {
  return Communication
    .forge({
      communicationType,
      customer,
      user
    })
    .save();
};
