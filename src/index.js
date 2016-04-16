require(`babel-polyfill`);

const config = require(`../config.json`);
const express = require(`express`);
const app = express();
const bodyParser = require(`body-parser`);
const session = require(`express-session`);
const uuid = require(`node-uuid`);
const middleware = require(`./libs/Middleware`);

app.set(`view engine`, `ejs`);
app.set(`views`, `${ __dirname }/../views`);
app.use(express.static(`${ __dirname }/../public`));
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());
app.use(session({
  genid: () => { return uuid.v4(); },
  secret: config.sessionSecret,
  resave: true,
  saveUninitialized: true
}));

app.locals.isActive = (page, currentPage) => {
  return page === currentPage ? `class="active"` : ``;
};
app.locals.query = ``;

app.use(`/`, require(`./routes/Index`));
app.use(`/customer`, middleware.checkSession, middleware.passPage(`customer`), require(`./routes/Customer`));
app.use(`/sale`, middleware.checkSession, middleware.passPage(`sale`), require(`./routes/Sale`));
app.use(`/search`, middleware.checkSession, middleware.passPage(`search`), require(`./routes/Search`));
app.use(`/user`, middleware.checkSession, middleware.passPage(`user`), require(`./routes/User`));

app.listen(config.port);
console.log(`App listening on port ${ config.port }`);
