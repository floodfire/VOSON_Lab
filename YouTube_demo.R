
apiKey <- "xxxx"

videoIDs <- c("Xfo0hpVrtrs")

g_youtube_actor <- Authenticate("youtube", apiKey= apiKey) %>%
Collect(videoIDs = videoIDs, writeToFile=TRUE) %>%
Create("Actor")

g_youtube_actor

png("youtube_fracking.png", width=800, height=700)
plot(g_youtube_actor,edge.width=1.5,edge.curved=.5,edge.arrow.size=0.5)
dev.off()

write.graph(g_youtube_actor,
"g_youtube_actor.graphml",format="graphml")

# make sure you change the filename:
myYouTubeData <- read.csv("Jun_26_03_12_16_2017_AEST_YoutubeData.csv")
View(myYouTubeData)
