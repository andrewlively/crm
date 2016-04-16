const router = require(`express`).Router();
const Customer = require(`../../libs/Customer`);

router.get(`/`, async (req, res) => {
  try {
    const customers = await Customer.searchByName(req.query.q);
console.log(customers);
    res.render(`search_results`, { customers, query: req.query.q });
  } catch (err) {
    res
      .status(500)
      .render(`error`, { message: `Failed to search customers`, _page: `error` });
  }
});

module.exports = router;
