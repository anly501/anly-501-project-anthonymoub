# Before combinining the new dataframe (songs post 2015) with the old dataframe, we should make sure everything is clean in both datasets

# Start by cleaning the new dataset since the old one has been probably cleaned by the GitHub users


new_songs <- read.csv('Data/new_music.csv')


# Start by checking all the columns we have and drop the unwanted ones 

names(new_songs)


# Columns that are if no use: X (useless), spotify_id (no longer useful at this point), id (useless is just a byproduct of previous operations)
# url, and analysis url (both are useless)

drops <- c("X.1","spotify_id", "id", "uri" , "analysis_url")
new_songs <- new_songs[ , !(names(new_songs) %in% drops)]


# Next, we need to check the datatype of each column and make sure everything is the in the desired data type 

str(new_songs)

# All columns/variables are of the correct data types for us to use in EDA and model development

# The next step is dealing with missing values,which are present in a couple of entries of the lyrics column.
# All songs with missing lyrics will be dropped as they are a small number (183) out of all the songs gathered.
# The absence of these songs will have a very small (if any) effect on the analysis, which is why they will be
# dropped.

sum(new_songs$lyrics == "") # Number of songs with missing lyrics 

new_songs <- new_songs[!(new_songs$lyrics == ""  ) , ]


# Do th same for the old music dataframe (so we can join them later)


old_songs <- read.csv('Data/music_df.csv')


# Check the columns of this dataframe

names(old_songs)


# Dropping columns that are of no use 



drops <- c("spotify_id", "id", "uri" , "analysis_url" , "artist_with_features", "year_bin", "image", "cluster","Gender" , "num_dupes")
old_songs <- old_songs[ , !(names(old_songs) %in% drops)]

names(old_songs)
names(new_songs)

old_songs <- old_songs[!(old_songs$lyrics == ""  ) , ]

# Next we need to reorder the new songs dataframe to match the old songs dataframe so we could merge
# the two together 

names(old_songs)

new_songs <- new_songs[, c("lyrics", "num_syllables","pos" ,"year" , "fog_index" ,"flesch_index" ,"num_words","num_lines","title","f_k_grade",
"artist" ,"difficult_words",  "neg" , "neu" , "compound","danceability","energy","key","loudness" ,"mode","speechiness",
    "acousticness","instrumentalness" ,"liveness" ,"valence"  , "tempo" , "duration_ms" , "time_signature" )]

              




# The final step is appending the new music dataset to the old music dataset to have our final combined dataset 

finaldf <- rbind(old_songs , new_songs)


# Save this final df to a csv 
write.csv(finaldf , "Data/final_df.csv")
 

finaldf








