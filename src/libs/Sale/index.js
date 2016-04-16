const Sale = require(`../Database`).Sale;

exports.get = () => {
  return Sale.fetchAll().then(result => { return result.toJSON() });
};

exports.getAllForCustomer = customer => {
  return Sale
    .where({ customer })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.getAllForService = service => {
  return Sale
    .where({ service })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.getAllForUser = user => {
  return Sale
    .where({ user })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.create = (customer, service, user) => {
  return Communication
    .forge({
      customer,
      service,
      user
    })
    .save();
};
