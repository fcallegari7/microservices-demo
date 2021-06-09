import { Listing } from "#root/db/models";

const setupRoutes = (app) => {
  app.get("/listings", async (req, res, next) => {
    try {
      const listings = await Listing.findAll();
      return res.json(listings);
    } catch (e) {
      return next(e);
    }
  });

  app.post("/listings", async (req, res, next) => {
    if (!req.body.title || !req.body.description) {
      return next(new Error("Invalid body!"));
    }

    try {
      const listing = await Listing.create({
        title: req.body.title,
        description: req.body.description,
      });
      return res.json(listing);
    } catch (e) {
      return next(e);
    }
  });
};

export default setupRoutes;
