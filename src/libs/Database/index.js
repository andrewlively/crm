const knex = require('knex')({
  client: process.env.DB_CLIENT,
  connection: {
    host     : process.env.DB_HOST,
    port     : process.env.DB_PORT,
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_NAME
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
