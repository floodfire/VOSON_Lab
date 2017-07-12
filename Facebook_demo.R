### Facebook

appID <- "1897207070535741"
appSecret <- "d62259df33d4916c2e692376df27391e"

g_bimodal_facebook_csg <- Authenticate("Facebook", 
appID = appID, appSecret = appSecret) %>% 
SaveCredential("FBCredential.RDS") %>%
Collect(pageName="StopCoalSeamGasBlueMountains", rangeFrom="2015-06-23", 
rangeTo="2015-07-23", writeToFile=TRUE) %>% 
Create("Bimodal")

# make sure you change the filename!:
myCSG_data <- read.csv("2015-06-23_to_2015-07-23_StopCoalSeamGasBlueMountains_FacebookData.csv")
View(myCSG_data)

g_bimodal_facebook_csg

V(g_bimodal_facebook_csg)$color <- ifelse(V(g_bimodal_facebook_csg)$type == "Post", "red", "blue")

plot(g_bimodal_facebook_csg)

x11()
plot(g_bimodal_facebook_csg)

png("g_bimodal_facebook_csg.png", width=800, height=700)
plot(g_bimodal_facebook_csg,vertex.shape="none",edge.width=1.5,edge.curved = .5,edge.arrow.size=0.5,vertex.label.color=V(g_bimodal_facebook_csg)$color,asp=9/16,margin=-0.15)
dev.off()

write.graph(g_bimodal_facebook_csg,
            "g_bimodal_facebook_csg.graphml",format="graphml")

g <- read.graph("g_bimodal_facebook_csg.graphml", format="graphml")
