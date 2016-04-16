const router = require(`express`).Router();
const User = require(`../../libs/User`);

router.get(`/`, async (req, res) => {
  try {
    const users = await User.get();

    res.render(`user_home`, { users });
  } catch (err) {
    res
      .status(500)
      .render(`error`, { message: `Failed to get users`, _page: `error` });
  }
});

module.exports = router;
