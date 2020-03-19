## ---- library
library(lubridate)
library(gganimate)
library(magrittr)
library(ggplot2)
library(magick)
library(scales)

## ---- data
corona_SL <- data.frame(date = seq(as.Date("2020-1-27"), as.Date("2020-3-18"), by="days"),
                        cum.count = c(rep(1, 43), 2L, 2L,3L, 6L, 11L, 18L, 28L, 43L, 51L),
                        time=1:52)

## ---- plotting
## ---- date: 18 March 2020

coronaSL <- ggplot(corona_SL, aes(date, cum.count)) + 
  geom_path(colour="#1b9e77")+
  geom_point(colour="#d95f02", size=2, shape=8, stroke=5) + 
 transition_reveal(along = date, keep_last = TRUE)+
  ease_aes('cubic-in-out')+
  shadow_mark(colour="#1b9e77")+
  scale_x_date(limits = as.Date(c("2020-1-27","2020-3-18"), by="days"))+
 coord_cartesian(clip = 'off') +
  labs(title = 'Total confirmed cases of COVID-19 in Sri Lanka', y = 'Cumulative count', x = 'Date', caption="StatisticsMART") + 
  theme(plot.margin = margin(5.5, 5.5, 5.5, 5.5))

animate(coronaSL)
anim_save(here::here("corona_SriLanka.gif"))

#anim_save("coronaSL.gif", coronaSL)
