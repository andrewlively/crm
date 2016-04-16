const Customer = require(`../Database`).Customer;

exports.get = id => {
  if (id) {
    return Customer
      .where({ id })
      .fetch()
      .then(result => { return result.toJSON() });
  }

  return Customer.fetchAll().then(result => { return result.toJSON() });
};

exports.updateName = (id, name) => {
  return new Customer({ id })
    .save(
      { name },
      { patch: true }
    );
};

exports.updateLocation = (id, latitude, longitude) => {
  return new Customer({ id })
    .save(
      { location: `(${ latitude },${ longitude })` },
      { patch: true }
    );
};

exports.searchByName = name => {
  return Customer
    .query(qb => {
      qb.where(`name`, `LIKE`, `%${ name }%`);
    })
    .fetchAll()
    .then(result => { return result.toJSON() });
};

exports.create = (name, latitude, longitude) => {
  if (!name) {
    return Promise.reject(`Invalid name provided`);
  }

  return Customer
    .forge({
      name,
      location: `(${ latitude },${ longitude })`
    })
    .save()
    .then(result => { return result.toJSON() });
};
