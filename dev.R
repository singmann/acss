require(devtools)
require(roxygen2)
load_all()
#dev_mode()
roxygenise()
test()
options(error = recover)

require(testthat)
test_package("acss")
help(package = "acss")
release(check=FALSE)


build_vignettes()
