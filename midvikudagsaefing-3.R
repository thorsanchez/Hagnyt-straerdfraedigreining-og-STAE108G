#THOR

#DÆMI 5.5.14
# a) Reiknum z0.975
z_975 <- qnorm(0.975)
print(z_975)

# b) Reiknum t0.95,(40)
t_095_40 <- qt(0.95, 40)
print(t_095_40)

# c) Reiknum χ^2 0.95,(1)
chi_sq_095_1 <- qchisq(0.95, 1)
print(chi_sq_095_1)

# d) Reiknum F0.95,(10,20)
F_095_10_20 <- qf(0.95, 10, 20)
print(F_095_10_20)


#DÆMI 5.5.15

phi_neg_0.82 <- pnorm(-0.82)
print(phi_neg_0.82)

phi_1.96 <- pnorm(1.96)
print(phi_1.96)

phi_1.65 <- pnorm(1.65)
print(phi_1.65)

phi_0 <- pnorm(0)
print(phi_0)

#DÆMI 5.5.18

mean <- 21
sd <- 2.8 

prob_a <- pnorm(20, mean, sd)
print(prob_a)

prob_b <- 1 - pnorm(30, mean, sd)
print(prob_b)

prob_c <- pnorm(19, mean, sd) - pnorm(17, mean, sd)
print(prob_c)

prob_d <- pnorm(27, mean, sd) - pnorm(25, mean, sd)
print(prob_d)

prob_e <- pnorm(21, mean, sd) - pnorm(21, mean, sd)
print(prob_e)

#DÆMI 5.5.20

mean <- 8.2   # Meðaltal
sd <- 2.2     # Staðalfrávik

prob_a <- pnorm(8.2, mean, sd) - pnorm(8.2, mean, sd)
print(prob_a)

prob_b <- 1 - pnorm(10, mean, sd)
print(prob_b)

prob_c <- pnorm(12, mean, sd) - pnorm(10, mean, sd)
print(prob_c)

prob_d <- pnorm(3.7, mean, sd)
print(prob_d)

length_needed <- qnorm(0.1, mean, sd)
print(length_needed)

length_maximum <- qnorm(0.2, mean, sd)
print(length_maximum)

