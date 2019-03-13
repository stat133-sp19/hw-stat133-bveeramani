# Data Dictionary
Each data file contains information about shots made by a given player(s). Each row in a datafile describes a single shot.

| Field Name        | Data Type | Description          
|-------------------|-----------|----------------------------------------------------------------------------------------------------
| team_name         | character | The player's team name.
| game_date         | characte  | The date on which the shot was made.                                                                 
| season            | integer   | The season in which the shot was made.                                                              
| period            | integer   | The period during which the show was made. Each period is 12 minutes long, and there are 4 periods. 
| minutes_remaining | integer   | The number of whole minutes remaining when the shot was made.                                       
| seconds_remaining | integer   | The number of seconds remaining when the shot was made (see note below).                        
| shot_made_flag    | character | Indicates whether the shot was succesful.
| action_type       | character | The type of move used to make the shot.
| shot_type         | character | Indicates whether shot was worth 2 or 3 points. 
| shot_distance     | integer   | Distance to the basket in feet.
| opponent          | character | The opposing team during the game in which the was made.
| x                 | integer   | The x-position of the player where the shot was made in inches.
| y                 | integer   | The y-position of the player where the shot was made in inches.

**NOTE:** If a shot was made 2 minutes and 35 seconds before the buzzer, the value of `minutes_remaining` would be 2 and the value of `seconds_remaining` would be 35.
