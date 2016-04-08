test_that("bdm works", {
  multi <- c(
    "SSOOXFXFOXXOXOXFFXXXSOTTO",
    "SSODXFXDOXXOXOXFFXRRSORTO",
    "DXXXXRRXXXSSOOOXOFFFOOOOO"
  )
  expect_is(bdm(multi[1]), "numeric")
  expect_is(bdm(multi), "numeric")
})
