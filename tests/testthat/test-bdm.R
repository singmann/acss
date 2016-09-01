test_that("bdm works", {
  multi <- c(
    "SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX",
    "SSODXFXDOXXOXOXFFXRRSORTOXDOXX",
    "DXXXXRRXXXSSOOOXOFFFOOOOORFODD"
  )
  expect_is(bdm(multi[1]), "numeric")
  expect_is(bdm(multi), "numeric")
})

test_that("bdm produces correct results", {
  expect_equal(suppressWarnings(bdm("010101010101010101", alphabet = 2, blocksize = 12, delta = 1)), 57.5664, tolerance = 0.00001, check.attributes=FALSE)
  
  expect_equal(suppressWarnings(bdm("010101010101010101", alphabet = 2, blocksize = 12, delta = 12)), 41.4481, tolerance = 0.00001, check.attributes=FALSE)
  
  expect_equal(suppressWarnings(bdm("010101010101010101010101010101010101", alphabet = 2, blocksize = 8)), 30.0948874022513, tolerance = 0.00001, check.attributes=FALSE)
})
