const router = require(`express`).Router();
const Sale = require(`../../libs/Sale`);

router.get(`/`, async (req, res) => {
  try {
    const sales = await Sale.get();

    res.render(`sale_home`, { sales });
  } catch (err) {
    res
      .status(500)
      .render(`error`, { message: `Failed to get sales`, _page: `error` });
  }
});

module.exports = router;
