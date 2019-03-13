# Title: Shot Data Preparer
# Description: This script produces shots-data.csv, a data file that can be used to graph shot data.
# Input(s): Player shot data (eg. andre-iguodala.csv). See data-dictionary.md for more information.
# Output: A data file named shots-data.csv that can be used to graph shot data.

data_types = c("factor", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer")
iguodala = read.csv("../data/andre-iguodala.csv", colClasses = data_types)
green = read.csv("../data/draymond-green.csv", colClasses = data_types)
durant = read.csv("../data/kevin-durant.csv", colClasses = data_types)
thompson = read.csv("../data/klay-thompson.csv", colClasses = data_types)
curry = read.csv("../data/stephen-curry.csv", colClasses = data_types)

iguodala$name = factor("Andre Iguodala")
green$name = factor("Draymond Green")
durant$name = factor("Kevin Durant")
thompson$name = factor("Klay Thompson")
curry$name = factor("Stephen Curry")

iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] = "shot_yes" 
green$shot_made_flag[green$shot_made_flag == "y"] = "shot_yes" 
durant$shot_made_flag[durant$shot_made_flag == "y"] = "shot_yes" 
thompson$shot_made_flag[thompson$shot_made_flag == "y"] = "shot_yes" 
curry$shot_made_flag[curry$shot_made_flag == "y"] = "shot_yes" 

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] = "shot_no" 
green$shot_made_flag[green$shot_made_flag == "n"] = "shot_no" 
durant$shot_made_flag[durant$shot_made_flag == "n"] = "shot_no" 
thompson$shot_made_flag[thompson$shot_made_flag == "n"] = "shot_no" 
curry$shot_made_flag[curry$shot_made_flag == "n"] = "shot_no"

# Converting shot_made_flag to factor after mutating values
iguodala$shot_made_flag = factor(iguodala$shot_made_flag)
green$shot_made_flag = factor(green$shot_made_flag)
durant$shot_made_flag = factor(durant$shot_made_flag)
thompson$shot_made_flag = factor(thompson$shot_made_flag)
curry$shot_made_flag = factor(curry$shot_made_flag)


iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
thompson$minute = thompson$period * 12 - thompson$minutes_remaining
curry$minute = curry$period * 12 - curry$minutes_remaining

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

shots_data = rbind(iguodala, green, durant, thompson, curry)
write.csv(shots_data, "../data/shots-data.csv", row.names = FALSE, quote = FALSE)

sink(file = "../output/shots-data-summary.txt")
summary(shots_data)
sink()

