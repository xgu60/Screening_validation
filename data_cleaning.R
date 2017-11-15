
#read in vitro docking data
data_vs = read.csv(file="Vitual screening.csv", 
                   header=TRUE, 
                   sep=",", 
                   col.names=c("ID", "model.ID", "A1", "A2", "A3","A4", "A5", "A6"))
#print (data_vs)

#read in vitro screen IC50 values
data_assay = read.csv(file="prep.csv",
                      header=TRUE,
                      sep=",",
                      col.names=c( "ID", "p.lys", "d.lys", "p.wc"))
#convert to pIC50 value
data_assay$p.lys = -log10(data_assay$p.lys / 1E9)
data_assay$d.lys = -log10(data_assay$d.lys / 1E9)
data_assay$p.wc = -log10(data_assay$p.wc / 1E9)
#print (data_assay)

#merge two dataset by ID
data_merge = merge(data_vs, data_assay, by="ID")
#print (data_merge)
write.csv(data_merge, file="merged_data.csv")
