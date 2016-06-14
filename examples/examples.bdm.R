acss("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX")  # too long

bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX") # default span is 10
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", span = 5)
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", span = 7) # gives warning
bdm("SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX", span = 7, delta = 1) 

multi <- c(
  "SSOOXFXFOXXOXOXFFXXXSOTTOFFFXX",
  "SSODXFXDOXXOXOXFFXRRSORTOXDOXX",
  "DXXXXRRXXXSSOOOXOFFFOOOOORFODD"
)

bdm(multi)
bdm(multi, delta = 1)
bdm(multi, span = 5) 


# binary bdm should give 57.5664 in this case 
bdm("010101010101010101", alphabet = 2, span = 12, delta = 1)

# uses a substring of size less than 12:
bdm("010101010101010101", alphabet = 2, span = 12)

