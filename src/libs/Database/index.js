const config = require(`../../../config.json`);
const knex = require('knex')({
  client: config.db.client,
  connection: {
    host     : config.db.host,
    port     : config.db.port,
    user     : config.db.user,
    password : config.db.password,
    database : config.db.name
  }
});
const database = require('bookshelf')(knex);

exports.Communication = database.Model.extend({
  tableName: 'communication'
});

exports.CommunicationType = database.Model.extend({
  tableName: 'communication_type'
});

exports.Customer = database.Model.extend({
  tableName: 'customer'
});

exports.Service = database.Model.extend({
  tableName: 'service'
});

exports.Sale = database.Model.extend({
  tableName: 'sale'
});

exports.User = database.Model.extend({
  tableName: 'user'
});
