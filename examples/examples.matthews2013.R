
\dontrun{
data(matthews2013)

spans <- 3:11
# note, the next loop takes more than 5 minutes.
for (i in spans) {
  matthews2013[,paste0("K2_span", i)] <- 
    sapply(local_complexity(matthews2013$string, alphabet=2, span = i), mean)
}

lm_list <- vector("list", 8)
for (i in seq_along(spans)) {
  lm_list[[i]] <- lm(as.formula(paste0("mean ~ K2_span", spans[i])), matthews2013)
}

plot(spans, sapply(lm_list, function(x) summary(x)$r.squared), type = "o")

# do more predictors increase fit?
require(MASS)
m_initial <- lm(mean ~ 1, matthews2013)
m_step <- stepAIC(m_initial, 
                  scope = as.formula(paste("~", paste(paste0("K2_span", spans), 
                  collapse = "+"))))
summary(m_step)

m_initial2 <- lm(as.formula(paste("mean ~", paste(paste0("K2_span", spans), 
                  collapse = "+"))), matthews2013)
m_step2 <- stepAIC(m_initial2)
summary(m_step2)

}
