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

revdepcheck::revdep_check(num_workers = 4)

build_vignettes()
rhub::rhub_setup(overwrite = TRUE)
rhub::rhub_check()

devtools::build(path = "development/", args = "--compact-vignettes=both")
devtools::check_built(path = "development/acss_0.3-2.tar.gz")

devtools::check_win_devel(args = "--compact-vignettes=both")
devtools::check_mac_release(args = "--compact-vignettes=both")

devtools::submit_cran(args = "--compact-vignettes=both")
