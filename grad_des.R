library(animint2)
library(ggplot2)

# Function to minimize
f <- function(x) x^2 + 3

# Gradient
grad <- function(x) 2*x

# Gradient Descent iterations
x <- numeric(10)
x[1] <- 5
for(i in 2:10){
  x[i] <- x[i-1] - 0.3 * grad(x[i-1])
}

iteration <- 1:10
y <- f(x)

# Data for points and arrows
path.df <- data.frame(iteration = iteration, x = x, y = y)
arrows.df <- data.frame(
  x = x[-length(x)], xend = x[-1],
  y = y[-length(y)], yend = y[-1],
  iteration = iteration[-length(iteration)]
)
