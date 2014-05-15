strings1 <- c("010011010001", "0010203928837", "0000000000")
strings2 <- c("001011", "01213", "010101010101")

entropy(strings1)
entropy("XYXXYYXYXXXY") # "same" string as strings1[1]
entropy(c("HUHHEGGTE", "EGGHHU"))

entropy2(strings1)
entropy2("XYXXYYXYXXXY")

entropy2(strings2)

change_complexity(strings1)
change_complexity("XYXXYYXYXXXY")
