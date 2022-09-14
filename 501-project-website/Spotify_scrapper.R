# Spotify API credentials

clientID = '692079d1737048de99769798cb46dc20'
secret = '5b3f80e96a4f4a338c8733951d399d69'

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

header = {"Authorization":HeaderValue}

# Importing the dataset with the songs we want to extract Spotify features using the API
tracks_list <- read.csv("/Users/anthonymoubarak/Desktop/Project/Project Data/missingyears_updated.csv")

#name of Spotify Features
features_name=c("id","danceability","energy","key","loudness","mode","speechiness",
                "acousticness","instrumentalness","liveness","valence","tempo",
                "duration_ms","time_signature","uri","analysis_url")

#Initiatilizing the features in the data
tracks_list[,c("id","danceability","energy","key","loudness","mode","speechiness",
            "acousticness","instrumentalness","liveness","valence","tempo",
            "duration_ms","time_signature","uri","analysis_url")]=0



# Looping over every song and extracting the required data 
for(i in 1:nrow(tracks_list)){
  Sys.sleep(0.10)
  track_URI2 = paste0('https://api.spotify.com/v1/audio-features/',   
                      tracks_list$spotify_id[i])
  track_response2 = GET(url = track_URI2, 
                        add_headers(Authorization = HeaderValue))
  tracks2 = content(track_response2)
  
  tracks_list$key[i] <- tracks2$key
  tracks_list$mode[i] <- tracks2$mode
  tracks_list$time_signature[i] <- tracks2$time_signature
  tracks_list$acousticness[i] <- tracks2$acousticness
  tracks_list$danceability[i] <- tracks2$danceability
  tracks_list$energy[i] <- tracks2$energy
  tracks_list$instrumentalness[i] <- tracks2$instrumentalness
  tracks_list$liveness[i] <- tracks2$liveness
  tracks_list$loudness[i] <- tracks2$loudness
  tracks_list$speechiness[i] <- tracks2$speechiness
  tracks_list$valence[i] <- tracks2$valence
  tracks_list$tempo[i] <- tracks2$tempo
  tracks_list$duration_ms[i] <- tracks2$duration_ms
}


# Now that we have the audio features, the new local csv file should be updated 

write.csv(tracks_list, "/Users/anthonymoubarak/Desktop/Project/Project Data/missingyears_updated.csv", row.names=FALSE)









