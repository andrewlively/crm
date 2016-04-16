exports.passPage = page => {
  return (req, res, next) => {
    res.locals._page = page;

    next();
  };
};

exports.checkSession = (req, res, next) => {
  if (!req.session || !req.session.user) {
    return res.redirect(`/login`);
  }

  next();
};
