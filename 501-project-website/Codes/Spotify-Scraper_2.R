# Spotify API credentials
library(httr)
library(dplyr)
clientID = '31dfaf2d46db414faf2451eacac35b2a'
secret = '00a237da214049198df1840583f640b7'

response = POST(
  'https://accounts.spotify.com/api/token',
  accept_json(),
  authenticate(clientID, secret),
  body = list(grant_type = 'client_credentials'),
  encode = 'form',
  verbose()
)

mytoken = content(response)$access_token
HeaderValue = paste0('Bearer ', mytoken)

#header = {"Authorization":HeaderValue}

# Importing the dataset with the songs we want to extract Spotify features using the API
march26_df <- read.csv("/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/march26_df.csv")
jul16_df <- read.csv("/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/jul16_df.csv")
jun6_df <- read.csv("/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/jun5_df.csv")

#name of Spotify Features
features_name=c("id","danceability","energy","key","loudness","mode","speechiness",
                "acousticness","instrumentalness","liveness","valence","tempo",
                "duration_ms","time_signature","uri","analysis_url")

#Initiatilizing the features in the data
march26_df[,c("id","danceability","energy","key","loudness","mode","speechiness",
              "acousticness","instrumentalness","liveness","valence","tempo",
              "duration_ms","time_signature","uri","analysis_url")]=0



# Looping over every song and extracting the required data 
for(i in 1:nrow(march26_df)){
  Sys.sleep(0.10)
  track_URI2 = paste0('https://api.spotify.com/v1/audio-features/',   
                      march26_df$spotify_id[i])
  track_response2 = GET(url = track_URI2, 
                        add_headers(Authorization = HeaderValue))
  tracks2 = content(track_response2)
  
  march26_df$key[i] <- tracks2$key
  march26_df$mode[i] <- tracks2$mode
  march26_df$time_signature[i] <- tracks2$time_signature
  march26_df$acousticness[i] <- tracks2$acousticness
  march26_df$danceability[i] <- tracks2$danceability
  march26_df$energy[i] <- tracks2$energy
  march26_df$instrumentalness[i] <- tracks2$instrumentalness
  march26_df$liveness[i] <- tracks2$liveness
  march26_df$loudness[i] <- tracks2$loudness
  march26_df$speechiness[i] <- tracks2$speechiness
  march26_df$valence[i] <- tracks2$valence
  march26_df$tempo[i] <- tracks2$tempo
  march26_df$duration_ms[i] <- tracks2$duration_ms
}


# Now that we have the audio features, the new local csv file should be updated 

write.csv(march26_df, "/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/march26_df_updated.csv", row.names=FALSE)




#Initiatilizing the features in the data
jul16_df[,c("id","danceability","energy","key","loudness","mode","speechiness",
            "acousticness","instrumentalness","liveness","valence","tempo",
            "duration_ms","time_signature","uri","analysis_url")]=0



# Looping over every song and extracting the required data 
for(i in 1:nrow(jul16_df)){
  Sys.sleep(0.10)
  track_URI2 = paste0('https://api.spotify.com/v1/audio-features/',   
                      jul16_df$spotify_id[i])
  track_response2 = GET(url = track_URI2, 
                        add_headers(Authorization = HeaderValue))
  tracks2 = content(track_response2)
  
  jul16_df$key[i] <- tracks2$key
  jul16_df$mode[i] <- tracks2$mode
  jul16_df$time_signature[i] <- tracks2$time_signature
  jul16_df$acousticness[i] <- tracks2$acousticness
  jul16_df$danceability[i] <- tracks2$danceability
  jul16_df$energy[i] <- tracks2$energy
  jul16_df$instrumentalness[i] <- tracks2$instrumentalness
  jul16_df$liveness[i] <- tracks2$liveness
  jul16_df$loudness[i] <- tracks2$loudness
  jul16_df$speechiness[i] <- tracks2$speechiness
  jul16_df$valence[i] <- tracks2$valence
  jul16_df$tempo[i] <- tracks2$tempo
  jul16_df$duration_ms[i] <- tracks2$duration_ms
}


# Now that we have the audio features, the new local csv file should be updated 

write.csv(jul16_df, "/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/jul16_df_updated.csv", row.names=FALSE)



#Initiatilizing the features in the data
jun6_df[,c("id","danceability","energy","key","loudness","mode","speechiness",
           "acousticness","instrumentalness","liveness","valence","tempo",
           "duration_ms","time_signature","uri","analysis_url")]=0



# Looping over every song and extracting the required data 
for(i in 1:nrow(jun6_df)){
  Sys.sleep(0.10)
  track_URI2 = paste0('https://api.spotify.com/v1/audio-features/',   
                      jun6_df$spotify_id[i])
  track_response2 = GET(url = track_URI2, 
                        add_headers(Authorization = HeaderValue))
  tracks2 = content(track_response2)
  
  jun6_df$key[i] <- tracks2$key
  jun6_df$mode[i] <- tracks2$mode
  jun6_df$time_signature[i] <- tracks2$time_signature
  jun6_df$acousticness[i] <- tracks2$acousticness
  jun6_df$danceability[i] <- tracks2$danceability
  jun6_df$energy[i] <- tracks2$energy
  jun6_df$instrumentalness[i] <- tracks2$instrumentalness
  jun6_df$liveness[i] <- tracks2$liveness
  jun6_df$loudness[i] <- tracks2$loudness
  jun6_df$speechiness[i] <- tracks2$speechiness
  jun6_df$valence[i] <- tracks2$valence
  jun6_df$tempo[i] <- tracks2$tempo
  jun6_df$duration_ms[i] <- tracks2$duration_ms
}


# Now that we have the audio features, the new local csv file should be updated 

write.csv(jun6_df, "/Users/anthonymoubarak/Desktop/anly-501-project-anthonymoub/501-project-website/Data/jun6_df_updated.csv", row.names=FALSE)








