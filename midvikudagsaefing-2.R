#Thor Sanchez
#Miðvikudagsæfing 2

#Dæmi 5.5.1

result <- choose(8, 2)
print(result)

#Dæmi 5.5.3
#a)
k <- 3
n <- 8

p_success <- 1/6
result <- dbinom(k, n, p_success)
print(result)

#b)
k <- 2

p_success <- 1/6
result <- pbinom(k, n, p_success)
print(result)
#c)
k <- 3
p_success <- 1/6

result <- pbinom(k - 1, n, p_success)
print(result)
#d)
k <- 4
p_success <- 3/6  

result <- dbinom(k, n, p_success)
print(result)

#Dæmi 5.5.5
lambda <- 2

result <- ppois(0, lambda)
print(result)

#Dæmi 5.5.8
n <- 6
p_success <- 0.48
k <- 3

result <- dbinom(k, n, p_success)
print(result)

#5.5.11
#a)
n <- 5
p_success <- 0.4

k <- 4
result_a <- dbinom(k, n, p_success)
print(result_a)

#b)
k_min <- 4
result_b <- pbinom(k_min - 1, n, p_success)
print(result_b)

#c)
k_max <- 1
result_c <- pbinom(k_max, n, p_success)
print(result_c)

#d)
k_max_2 <- 2

result_d <- pbinom(k_max_2, n, p_success)
print(result_d)

#5.5.12
#a)
lambda <- 1.8
x <- 0

result_a <- dpois(x, lambda)
print(result_a)

#b)
x_b <- 2
result_b <- dpois(x_b, lambda)
print(result_b)

#c)
x_c_max <- 1
result_c <- ppois(x_c_max, lambda)
print(result_c)

#d)
x_d_min <- 1
result_d <- ppois(x_d_min - 1, lambda)
print(result_d)
