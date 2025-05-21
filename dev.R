require(devtools)
require(roxygen2)
load_all()
urlchecker::url_check()
#dev_mode()
document()
test()
options(error = recover)

check()

require(testthat)
test_package("acss")
help(package = "acss")
release(check=FALSE)


build_vignettes()
rhub::rhub_setup(overwrite = TRUE)
rhub::rhub_check()
