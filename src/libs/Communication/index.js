const Communication = require(`../Database`).Communication;

exports.get = () => {
  return Communication.fetchAll().then(result => { return result.toJSON() });
};

exports.getAllForCommunicationType = communicationType => {
  return Communication
    .where({ communicationType })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.getAllForCustomer = customer => {
  return Communication
    .where({ customer })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.getAllForUser = user => {
  return Communication
    .where({ user })
    .fetchAll()
    .then(result => { return result.toJSON() });
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
