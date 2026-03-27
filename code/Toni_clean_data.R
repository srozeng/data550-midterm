# Load packages
library(tidyverse)
library(here)

# Step 1 - Load data
data <- read_csv(here("nba_2026-02-27"))

# Step 2 - Filter to YOUR rows (players 282-562)
toni_data <- data %>% 
  filter(as.numeric(Rk) >= 282 & as.numeric(Rk) <= 562)

# Step 3 - Keep only the 8 required columns
toni_data <- toni_data %>% 
  select(Player, Pos, Age, Team, G, MP, PTS, DRB)

# Step 4 - Fix position column (keep only first position listed)
toni_data <- toni_data %>% 
  mutate(Pos = str_extract(Pos, "^[A-Z]+"))

# Step 5 - Handle duplicates (keep only TOT row for players on multiple teams)
toni_data <- toni_data %>% 
  group_by(Player) %>% 
  filter(n() == 1 | Team == "TOT") %>% 
  ungroup()

# Step 6 - Remove rows with any missing values
toni_data <- toni_data %>% drop_na()

# Step 7 - Keep only players with at least 100 minutes played
toni_data <- toni_data %>% filter(MP >= 100)

# Step 8 - Rename columns to match Ana's
toni_data <- toni_data %>% 
  rename(
    player = Player,
    position = Pos,
    age = Age,
    team = Team,
    games = G,
    mins_played = MP,
    pts = PTS,
    rebounds_defensive = DRB
  )

# Step 9 - Save clean file to send to Ana
write_csv(toni_data, here("toni_clean.csv"))
