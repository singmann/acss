
acss("SSOOXFXFOXXOXOXFFXXXSOTTO")  # too long

bdm("SSOOXFXFOXXOXOXFFXXXSOTTO") # default span is 10
bdm("SSOOXFXFOXXOXOXFFXXXSOTTO", span = 4)
bdm("SSOOXFXFOXXOXOXFFXXXSOTTO", span = 6)
bdm("SSOOXFXFOXXOXOXFFXXXSOTTO", span = 11) # gives warning

multi <- c(
  "SSOOXFXFOXXOXOXFFXXXSOTTO",
  "SSODXFXDOXXOXOXFFXRRSORTO",
  "DXXXXRRXXXSSOOOXOFFFOOOOO"
)

bdm(multi)
bdm(multi, span = 5, delta = 2) 
bdm(multi, delta = 5)


# binary bdm should give 57.5664 in this case 
bdm("010101010101010101", alphabet = 2, span = 12, delta = 1)

# uses a substring of size less than 12:
bdm("010101010101010101", alphabet = 2, span = 12, delta = 12)

