const Service = require(`../Database`).Service;

exports.get = () => {
  return Service.fetchAll();
};

exports.updateName = (id, name) => {
  return new Service({ id })
    .save(
      { name },
      { patch: true }
    );
};

exports.updatePrice = (id, price) => {
  return new Service({ id })
    .save(
      { price },
      { patch: true }
    );
};

exports.create = (name, price) => {
  return Service
    .forge({
      name,
      price
    })
    .save();
};
