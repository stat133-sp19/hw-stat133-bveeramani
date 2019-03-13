# Title: Short Chart Creator
# Description: This script produces charts of shot data.
# Input(s): The data file named shot-data.csv.
# Output: Graphics about shot data.

library(ggplot2)
library(jpeg)
library(grid)

court_file = "../images/nba-court.jpg"

court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

shots_data = read.csv("../data/shots-data.csv")

iguodala = shots_data[shots_data$name == "Andre Iguodala", ]
iguodala_shot_chart = ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
ggsave("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5, units = "in")

green = shots_data[shots_data$name == "Draymond Green", ]
green_shot_chart = ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
ggsave("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5, units = "in")

durant = shots_data[shots_data$name == "Kevin Durant", ]
durant_shot_chart = ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
ggsave("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5, units = "in")

thompson = shots_data[shots_data$name == "Klay Thompson", ]
thompson_shot_chart = ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
ggsave("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5, units = "in")

curry = shots_data[shots_data$name == "Stephen Curry", ]
curry_shot_shart = ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
ggsave("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5, units = "in")

shot_chart = ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = 0.5) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: GSW (2016 season)") +
  facet_wrap(~ name) +
  theme_minimal()
ggsave("../images/gsw-shot-chart.pdf", width = 8, height = 7, units = "in")
ggsave("../images/gsw-shot-chart.png", width = 8, height = 7, units = "in")