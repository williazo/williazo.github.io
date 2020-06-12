# blog post code 2020-06-11 ------
# install.packages("devtools") #uncomment if devtools has not been installed previously
devtools::install_github("williazo/rwindow.baseball")
library(rwindow.baseball)
library(tidyverse)
lad_dt <- tm_standings_schedule("LAD", start_year = 2015, end_year = 2019)
lad_dt <- lad_dt%>%
  filter(home_gm==1)%>% #only including home games
  group_by(Year)%>%
  mutate(home_gm_num=row_number())%>%
  ungroup()
lad_dt$july_forth <- ifelse(grepl("Jul 4", lad_dt$Date), 1, 0)

ggplot(data=lad_dt, aes(x=home_gm_num, y=Attendance, group=Year, color=Tm))+
  geom_point()+
  geom_line()+
  facet_wrap(~Year)+
  xlab("Home Game #")+
  scale_x_continuous(breaks=seq(1, 81, 10))+
  ylab("Total Attendance")+
  scale_color_manual(name="Team", values="#005A9C")


ggplot(data=lad_dt, aes(x=home_gm_num, y=Attendance, group=Year, color=Tm))+
  geom_point()+
  geom_line()+
  facet_wrap(~Year)+
  xlab("Home Game #")+
  scale_x_continuous(breaks=seq(1, 81, 10))+
  ylab("Total Attendance")+
  stat_smooth(method="loess", se=FALSE, color="black", linetype=2)+
  scale_color_manual(name="Team", values="#005A9C")+
  geom_vline(data=subset(lad_dt, july_forth==1), aes(xintercept=home_gm_num), col="red", linetype=3)+
  theme_bw()+
  guides(color=FALSE)
ggsave(filename="~/Documents/UCLA/git_projects/williazo.github.io/assets/images/posts_images/2020-06-11-plotly-ggplot2/attnd_update.png", dpi=300, height=4, width=8)

library(plotly)
attnd_loess <- loess(Attendance~home_gm_num+Year, data=lad_dt)
lad_dt_loess <- data.frame(lad_dt[, c("home_gm_num", "Year", "Tm")],
                           pred_attnd=attnd_loess_pred)
p <- plot_ly(data=lad_dt, x=~home_gm_num, y=~Attendance,
             linetype=~Year, split=~Year,
             mode='lines+markers', type='scatter',
             hovertemplate=~paste('<i>Home Game #</i>: %{x}',
                            '<br><i>Attendance</i>: %{y:,.0f}',
                            '<br>Date:', Date,
                            '<br>Current Streak', Streak))%>%
  add_lines(x=~home_gm_num, y=predict(attnd_loess), split=~Year,
            name='LOESS',
            hovertemplate=~paste('<i>Home Game #</i>: %{x}',
                                '<br><i>Smoothed Attendance</i>: %{y:,.0f}',
                                '<br>Year:', Year,
                                '<br>Date:', Date,
                                '<br>Current Streak', Streak))%>%
  add_trace(data=subset(lad_dt, july_forth==1),
            x=~home_gm_num, y=~Attendance, split=~Year,
            mode="markers", type="scatter", name="July 4th",
            marker=list(color='rgba(16, 78, 139, 1)',
                        line=list(color='rgba(16, 78, 139, .8)')),
            hovertemplate=~paste('<i>Home Game #</i>: %{x}',
                                 '<br><i>Attendance</i>: %{y:,.0f}',
                                 '<br>Year:', Year,
                                 '<br>Current Streak', Streak))%>%
  layout(xaxis=list(title='Home Game #', dtick=10, tick0=1),
         yaxis=list(title='Attendance'))
htmltools::save_html(p, file="~/Documents/UCLA/git_projects/williazo.github.io/assets/images/posts_images/2020-06-11-plotly-ggplot2/plotly_attnd.html")
