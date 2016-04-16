const router = require(`express`).Router();
const Customer = require(`../../libs/Customer`);

router.get(`/`, async (req, res) => {
  try {
    const customers = await Customer.get();

    res.render(`customer_home`, { customers });
  } catch (err) {
    res
      .status(500)
      .render(`error`, { message: `Failed to get customers`, _page: `error` });
  }
});

module.exports = router;
