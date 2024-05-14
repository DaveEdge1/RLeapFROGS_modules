library(lipdR)
queryTable <- lipdR:::newQueryTable()
a1 <- queryLipdverse(pub.info = "grip")
a1$paleoData_TSid
L <- readLipd("Arc-NGRIP1.Vinther.2006")
a1 <- queryLipdverse(archive.type = "ice", paleo.proxy = "18o", pub.info = "greenland")
a2 <- readLipd("pdu5OrYMR5kiboyV2Ozd")


NGRIP1 <- data.frame("Year"=a2$paleoData[[1]]$measurementTable[[1]]$d18O$values,
                     "d18O"=a2$paleoData[[1]]$measurementTable[[1]]$year$values)

saveRDS(NGRIP1,file = "C:/Users/dce25/Documents/R Projects/RLeapFROGS/data/NGRIP1.rds")
