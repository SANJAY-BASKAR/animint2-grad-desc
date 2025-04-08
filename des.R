# Contour/Function Plot
func.plot <- ggplot() +
  stat_function(fun = f, geom = "line", color = "grey") +
  geom_point(data = path.df,
             aes(x = x, y = y, clickSelects = iteration),
             color = "blue", size = 3) +
  geom_segment(data = arrows.df,
               aes(x = x, y = y, xend = xend, yend = yend, showSelected = iteration),
               arrow = arrow(length = unit(0.2,"cm")),
               color = "red") +
  ggtitle("Gradient Descent: Function Minimization") +
  theme_minimal()

# Objective over Iterations
obj.plot <- ggplot(path.df, aes(x = iteration, y = y)) +
  geom_line() +
  geom_point(aes(clickSelects = iteration), color = "purple") +
  geom_tallrect(aes(xmin = iteration - 0.5, xmax = iteration + 0.5, showSelected = iteration), fill = "lightgrey") +
  ylab("Objective Value") +
  theme_minimal()

# Animation controller
viz <- list(
  func = func.plot,
  objective = obj.plot,
  time = list(variable = "iteration", ms = 1000)
)

# Save to directory
animint2dir(viz, "grad-desc-viz")
