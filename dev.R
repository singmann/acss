require(devtools)
require(roxygen2)
dev_mode()
load_all()

options(error = recover)

require(testthat)
test_package("acss")
