############################################################
# Learning R - Lecture Notes & Practice
# Course: Applied Calculus / Numerical Computing
# Description:
# notes and examples from lectures
# while learning the R programming language. Topics include:
# - Basic syntax
# - Variables and vectors
# - Functions
# - Plotting
# - Numerical differentiation & integration
# - Optimization
# - Matrices
############################################################

############################
# 1. BASIC R SYNTAX
############################

# Print text to console
print("Hello, R!")

# Simple calculations
2 + 2
10 - 3
4 * 5
20 / 4
2^3   # power

############################
# 2. VARIABLES
############################

x <- 10
y <- 5

sum_xy <- x + y
diff_xy <- x - y
prod_xy <- x * y
div_xy <- x / y

sum_xy
diff_xy
prod_xy
div_xy

############################
# 3. VECTORS
############################

numbers <- c(1, 2, 3, 4, 5)
numbers

# Access elements
numbers[1]
numbers[3]

# Vector operations
numbers * 2
numbers + 10

# Sequence of numbers
seq1 <- seq(0, 10, by = 1)
seq1

############################
# 4. BASIC FUNCTIONS
############################

mean(numbers)
max(numbers)
min(numbers)
sd(numbers)
sum(numbers)

############################
# 5. WRITING OUR OWN FUNCTIONS
############################

square <- function(x) {
  return(x^2)
}

square(5)
square(10)

# Function for derivative approximation
derivative_approx <- function(f, x, h = 0.0001) {
  (f(x + h) - f(x)) / h
}

############################
# 6. PLOTTING FUNCTIONS
############################

f <- function(x) {
  x^2
}

x_vals <- seq(-10, 10, by = 0.1)
y_vals <- f(x_vals)

plot(x_vals, y_vals,
     type = "l",
     col = "blue",
     main = "Plot of f(x) = x^2",
     xlab = "x",
     ylab = "f(x)")

############################
# 7. NUMERICAL DIFFERENTIATION
############################

derivative_approx(f, 2)
derivative_approx(f, 5)

############################
# 8. NUMERICAL INTEGRATION
############################

trapezoidal_rule <- function(f, a, b, n) {
  h <- (b - a) / n
  x <- seq(a, b, by = h)
  y <- f(x)
  
  integral <- h * (sum(y) - 0.5 * (y[1] + y[length(y)]))
  return(integral)
}

# Integrate f(x) = x^2 from 0 to 5
trapezoidal_rule(f, 0, 5, 100)

############################
# 9. OPTIMIZATION
############################

g <- function(x) {
  (x - 3)^2 + 2
}

result <- optimize(g, interval = c(-10, 10))
result

############################
# 10. MATRICES
############################

A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

A
B

A + B
A %*% B

det(A)
solve(A)

############################
# 11. SOLVING SYSTEMS
############################

C <- matrix(c(2, 1, 1, 3), nrow = 2)
d <- c(8, 13)

solve(C, d)

############################
# 12. SIMPLE DATA VISUALIZATION
############################

x <- seq(0, 10, by = 1)
y <- x^2

plot(x, y,
     pch = 19,
     col = "red",
     main = "Scatter Plot",
     xlab = "x",
     ylab = "y")

############################
# 13. USING LOOPS
############################

squares <- numeric()

for (i in 1:10) {
  squares[i] <- i^2
}

squares

############################
# 14. USING IF STATEMENTS
############################

check_number <- function(x) {
  if (x > 0) {
    return("Positive")
  } else if (x < 0) {
    return("Negative")
  } else {
    return("Zero")
  }
}

check_number(10)
check_number(-3)
check_number(0)

############################
# 15. SIMPLE PROJECT
############################
# Investigating how the trapezoidal rule accuracy improves
# as n increases

n_values <- c(10, 50, 100, 500, 1000)
results <- numeric()

for (i in 1:length(n_values)) {
  results[i] <- trapezoidal_rule(f, 0, 5, n_values[i])
}

results

plot(n_values, results,
     type = "b",
     pch = 19,
     main = "Trapezoidal Rule Convergence",
     xlab = "Number of subintervals (n)",
     ylab = "Approximate Integral")


############################################################
# Learning R - Data Frames & Visualization
# Description:
# with data frames and visualization in R
############################################################

############################
# 1. WORKING WITH DATA FRAMES
############################

# Creating a simple data frame
students <- data.frame(
  name = c("Anna", "Ben", "Chris", "Diana", "Eva"),
  exam1 = c(78, 85, 90, 72, 88),
  exam2 = c(80, 87, 92, 75, 91)
)

students

# Structure of data frame
str(students)

# Summary statistics
summary(students)

############################
# 2. ACCESSING DATA
############################

students$name
students$exam1

students[1, ]     # first row
students[, 2]     # second column
students[3, 3]    # row 3, column 3

############################
# 3. ADDING NEW COLUMNS
############################

students$average <- (students$exam1 + students$exam2) / 2
students

############################
# 4. FILTERING DATA
############################

# Students with average >= 85
high_scores <- students[students$average >= 85, ]
high_scores

############################
# 5. SORTING DATA
############################

students_sorted <- students[order(students$average, decreasing = TRUE), ]
students_sorted

############################
# 6. BASIC PLOTS WITH BASE R
############################

plot(students$exam1, students$exam2,
     pch = 19,
     col = "blue",
     main = "Exam 1 vs Exam 2",
     xlab = "Exam 1 Score",
     ylab = "Exam 2 Score")

############################
# 7. BAR CHART
############################

barplot(students$average,
        names.arg = students$name,
        col = "green",
        main = "Average Score per Student",
        ylab = "Average")

############################
# 8. INTRO TO GGPLOT2
############################

# Install once if needed
# install.packages("ggplot2")

library(ggplot2)

ggplot(students, aes(x = name, y = average)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Average Score per Student",
       x = "Student",
       y = "Average Score")

############################
# 9. LINE PLOT WITH GGPLOT2
############################

weeks <- data.frame(
  week = 1:10,
  study_hours = c(5, 6, 7, 8, 7, 9, 10, 9, 11, 12)
)

ggplot(weeks, aes(x = week, y = study_hours)) +
  geom_line() +
  geom_point() +
  labs(title = "Study Hours Over Time",
       x = "Week",
       y = "Hours")

############################
# 10. HISTOGRAM
############################

ggplot(students, aes(x = average)) +
  geom_histogram(binwidth = 2, fill = "orange") +
  labs(title = "Distribution of Averages",
       x = "Average",
       y = "Count")

############################
# 11. SIMPLE DATA CLEANING
############################

raw_data <- data.frame(
  value = c(10, 12, NA, 15, 14, NA, 18)
)

raw_data

clean_data <- na.omit(raw_data)
clean_data

############################
# 12. USING APPLY FUNCTIONS
############################

exam_scores <- students[, c("exam1", "exam2")]

apply(exam_scores, 1, mean)
apply(exam_scores, 2, mean)

############################
# 13. SIMPLE MINI PROJECT
############################
# Simulate random data and analyze it

set.seed(123)

sim_data <- data.frame(
  group = rep(c("A", "B"), each = 50),
  value = c(rnorm(50, mean = 10, sd = 2),
            rnorm(50, mean = 12, sd = 2))
)

summary(sim_data)

ggplot(sim_data, aes(x = group, y = value)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Comparison of Two Groups",
       x = "Group",
       y = "Value")

############################
# 1. BASIC STATISTICS
############################

data <- c(4, 7, 10, 12, 15, 18, 21, 24)

mean(data)
median(data)
var(data)
sd(data)
min(data)
max(data)

############################
# 2. QUANTILES
############################

quantile(data)
quantile(data, probs = c(0.25, 0.5, 0.75))

############################
# 3. RANDOM NUMBERS
############################

set.seed(1)

runif(10)        # uniform distribution
rnorm(10)        # normal distribution
rpois(10, 3)     # poisson distribution

############################
# 4. VISUALIZING DISTRIBUTIONS
############################

hist(rnorm(1000),
     main = "Normal Distribution",
     col = "lightblue")

hist(runif(1000),
     main = "Uniform Distribution",
     col = "lightgreen")

############################
# 5. SAMPLING
############################

population <- 1:100
sample(population, 10)
sample(population, 10, replace = TRUE)

############################
# 6. CONFIDENCE INTERVAL (BASIC)
############################

sample_data <- rnorm(30, mean = 50, sd = 5)

x_bar <- mean(sample_data)
s <- sd(sample_data)
n <- length(sample_data)

error <- qt(0.975, df = n-1) * s / sqrt(n)

lower <- x_bar - error
upper <- x_bar + error

lower
upper

############################
# 7. T-TEST
############################

group1 <- rnorm(30, mean = 10, sd = 2)
group2 <- rnorm(30, mean = 11, sd = 2)

t.test(group1, group2)

############################
# 8. CORRELATION
############################

x <- rnorm(50)
y <- x + rnorm(50)

cor(x, y)

plot(x, y,
     main = "Correlation Example")

############################
# 9. LINEAR REGRESSION
############################

model <- lm(y ~ x)
summary(model)

plot(x, y)
abline(model)

############################
# 10. BOOTSTRAP SIMULATION
############################

data <- rnorm(100, mean = 5, sd = 2)

bootstrap_means <- numeric(1000)

for (i in 1:1000) {
  sample_data <- sample(data, replace = TRUE)
  bootstrap_means[i] <- mean(sample_data)
}

hist(bootstrap_means,
     main = "Bootstrap Means",
     col = "orange")

############################
# 11. MONTE CARLO ESTIMATION OF PI
############################

n <- 10000
x <- runif(n)
y <- runif(n)

inside <- (x^2 + y^2) <= 1
pi_estimate <- 4 * mean(inside)

pi_estimate

############################
# 12. MINI PROJECT
############################
# Simulate exam scores and analyze

set.seed(42)

scores <- data.frame(
  math = rnorm(100, mean = 75, sd = 10),
  physics = rnorm(100, mean = 70, sd = 12)
)

summary(scores)

cor(scores$math, scores$physics)

plot(scores$math, scores$physics,
     main = "Math vs Physics Scores",
     xlab = "Math",
     ylab = "Physics")

