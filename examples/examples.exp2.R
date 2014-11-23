
# load data
data(exp2)

exp2$K <- acss(exp2$string, 6)[,"K.6"]

m_log <- glm(response ~ K, exp2, family = binomial)
summary(m_log)

# odds ratio of K:
exp(coef(m_log)[2])

# calculate threshold of 0.5
(threshold <- -coef(m_log)[1]/coef(m_log)[2])

require(effects)
require(lattice)
plot(Effect("K", m_log), rescale.axis = FALSE, ylim = c(0, 1))
trellis.focus("panel", 1, 1)
panel.lines(rep(threshold, 2), c(0, 0.5), col = "black", lwd = 2.5, lty = 3)
panel.lines(c(33,threshold), c(0.5, 0.5), col = "black", lwd = 2.5, lty = 3)
trellis.unfocus()
