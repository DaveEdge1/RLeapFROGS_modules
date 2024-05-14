library(lipdR)

a2 <- readLipd("https://wiki.linked.earth/wiki/index.php/Special:WTLiPD?op=export&lipdid=DSDP607.Lisiecki.2005")


lr04 <- data.frame("Year"=a2$paleoData[[1]]$measurementTable[[1]]$`lr04 age`$values,
                     "d18O"=a2$paleoData[[1]]$measurementTable[[1]]$`benthic d18o`$values)

saveRDS(lr04,file = "C:/Users/dce25/Documents/R Projects/RLeapFROGS/data/lr04.rds")
