acss("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX")  # too long

bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX") # default blocksize is 10
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", blocksize = 5)
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", blocksize = 7) # gives warning
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", blocksize = 7, delta = 1) 

multi <- c(
  "SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX",
  "SSODXFXDOXXOXOXFFXRRSORTOXDOXX",
  "DXXXXRRXXXSSOOOXOFFFOOOOORFODD"
)

bdm(multi)
bdm(multi, delta = 1)
bdm(multi, blocksize = 5) 


# binary bdm should give 57.5664 in this case 
bdm("010101010101010101", alphabet = 2, blocksize = 12, delta = 1)

# show all blocks:
bdm("010101010101010101", alphabet = 2, blocksize = 12, delta = 1, print_blocks = TRUE)

# uses a block of size less than 12:
bdm("010101010101010101", alphabet = 2, blocksize = 6)

