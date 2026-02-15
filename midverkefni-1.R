#Thor Sanchez
#miðvikudags verkefni 1


##############
install.packages("tidyverse")
library(tidyverse)
##############

#Liður 1
# Lesa gagnaskrána
dat <- read.table("https://ahj.hi.is/spurningar_um_lifid_24.csv", 
                  header = TRUE, sep = ";", dec = ",")


#Liður 2
# Velja einhverja flokkabreytu, t.d. 'is'
selected_variable <- "is"

# Búa til súlurit með ggplot
ggplot(dat, aes(x = dat[[selected_variable]])) +
  geom_bar() +
  labs(title = paste("Graf af", selected_variable),
       x = selected_variable,
       y = "Fjöldi") +
  theme_minimal()

#Liður 3
# Velja eina talnabreytu, t.d. 'aramotaskaupid'
selected_variable <- "aramotaskaupid"

# Búa til súlurit með ggplot2
ggplot(dat, aes(x = dat[[selected_variable]], y = 1)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = paste("Graf af", selected_variable),
       x = selected_variable,
       y = "Ás") +
  theme_minimal()

#Liður 4
ggplot(dat,aes(x=is, y=aramotaskaupid)) + geom_point() +
  labs(x = "Ís", y = "Áramótaskaupið")

#Liður 5
ggplot(dat,aes(x=ferdatimi_skoli, y=likamsraekt_dagar)) + geom_point() +
  labs(x = "gym", y = "skoli")

#Liður 6
# Velja námskeið og ferðamáta nemenda
selected_columns <- c("namskeid", "ferdamati_skoli")

# Endurvinna gögnin
dat[selected_columns] <- lapply(dat[selected_columns], as.character)

# tafla með fjölda nemenda fyrir hvert námskeið
summary_table <- dat %>%
  group_by(namskeid, ferdamati_skoli) %>%
  summarise(nemendur_fjoldi = n()) %>%
  arrange(namskeid, ferdamati_skoli)

# Prenta töfluna
print(summary_table)

#Liður 7
# Velja námskeið og ferðamáta nemenda
selected_columns <- c("namskeid", "ferdamati_skoli")

# Endurvinna gögnin
dat[selected_columns] <- lapply(dat[selected_columns], as.character)

# Búa til töflu með hlutföllum nemenda fyrir hvert námskeið og ferðamát
summary_table <- dat %>%
  group_by(namskeid, ferdamati_skoli) %>%
  summarise(hlutfall_nemenda = n() / nrow(dat)) %>%
  arrange(namskeid, ferdamati_skoli)

# Prenta töfluna
print(summary_table)
