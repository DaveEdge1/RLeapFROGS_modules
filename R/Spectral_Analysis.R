#Import packages
library(akima)
library(ggplot2)
library(dplyr)
library(cowplot)

#Import data
lr04 <- readRDS("C:/Users/dce25/Documents/R Projects/RLeapFROGS/data/lr04.rds")

#Initial viz
ggplot(data = lr04, mapping = aes(x=Year,y=d18O))+geom_line() + scale_y_reverse() +
  labs(title = "57 globally distributed benthic δ18O records, Lisiecki et al., 2005",
       x = "Year (ky BP)",
       y = "\u03B418O (\u2030)") +
  theme_light()

#Trim data
lr04_trimmed <- lr04 %>%
  filter(Year < 3000)


p1 <- ggplot(data = lr04_trimmed, mapping = aes(x=Year,y=d18O))+geom_line() + scale_y_reverse() +
  labs(title = "57 globally distributed benthic δ18O records, Lisiecki et al., 2005",
       x = "Year (ky BP)",
       y = "\u03B418O (\u2030)") +
  theme_light()

Year_interp <- seq(ceiling(min(lr04_trimmed$Year)), floor(max(lr04_trimmed$Year)), by = 1)
d18O_interp <- approx(lr04_trimmed$Year, lr04_trimmed$d18O, xout = Year_interp, f = 0.5)$y

lr04_interp <- data.frame(Year=Year_interp,
                          d18O=d18O_interp)

p2 <- ggplot(data = lr04_interp, mapping = aes(x=Year,y=d18O))+geom_line() + scale_y_reverse() +
  labs(title = "57 globally distributed benthic δ18O records, annually interpolated",
       x = "Year (ky BP)",
       y = "\u03B418O (\u2030)") +
  theme_light()

#check interpolation
plot_grid(p1,p2,ncol = 1)
head(lr04_trimmed)
head(lr04_interp)
#zoom in
p3 <- ggplot(data = lr04_trimmed <- lr04_trimmed %>%
               filter(Year < 100), mapping = aes(x=Year,y=d18O))+geom_line() + scale_y_reverse() +
  labs(title = "57 globally distributed benthic δ18O records, Lisiecki et al., 2005",
       x = "Year (ky BP)",
       y = "\u03B418O (\u2030)") +
  theme_light()
p4 <- ggplot(data = lr04_interp <- lr04_interp %>%
               filter(Year < 100), mapping = aes(x=Year,y=d18O))+geom_line() + scale_y_reverse() +
  labs(title = "57 globally distributed benthic δ18O records, Lisiecki et al., 2005",
       x = "Year (ky BP)",
       y = "\u03B418O (\u2030)") +
  theme_light()
plot_grid(p3,p4,ncol = 1)

spectrum(lr04_interp$d18O)
