const express = require("express");

const router = express.Router();

router.get("/", (req, res, next) => {
  res.status(200).json({
    message: "get request",
  });
});

//with req body
router.post("/", (req, res, next) => {
  const name = req.body.name;
  res.status(200).json({
    message: "post request",
    name: name,
  });
});

// router.post("/", (req, res, next) => {
//   res.status(200).json({
//     message: "post request",
//   });
// });

router.get("/:id", (req, res, next) => {
  const id = req.params.id;
  if (id === "special") {
    res.status(200).json({
      messgae: "you discovered special id",
      id: id,
    });
  } else {
    res.status(200).json({
      message: "you passed an id",
      id: id,
    });
  }
});

module.exports = router;
