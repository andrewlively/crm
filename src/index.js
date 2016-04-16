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

app.use(`/`, require(`./routes/Index`));
app.use(`/search`, middleware.checkSession, middleware.passPage(`search`), require(`./routes/Search`));

app.listen(config.port);
console.log(`App listening on port ${ config.port }`);
