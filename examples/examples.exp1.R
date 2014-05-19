
# load data
data(exp1)

# summary statistics
nrow(exp1)
summary(exp1$age)
mean(exp1$age)
sd(exp1$age)

\dontrun{
# this uses code from likelihood_d() to calculate the mean complexity K
# for all strings of length 10 with alphabet = 4:
tmp <- acss_data[nchar(rownames(acss_data)) == 10, "K.4", drop = FALSE]
tmp <- tmp[!is.na(tmp[,"K.4"]),,drop = FALSE]
tmp$count <- count_class(rownames(tmp), alphabet = 4)
(mean_K <- with(tmp, sum(K.4*count)/sum(count)))

t.test(acss(exp1$string, 4)[,"K.4"], mu = mean_K)
}

