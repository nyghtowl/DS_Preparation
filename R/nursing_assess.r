# R Beds Assessment

# Challenge to assess nursing home bed data and answer 5 questions

# The count of how many censuses were reported
# The earliest census date
# The latest census date
# The ten census dates with the highest number of available beds for that nursing home
# The ten census dates with the lowest number of available beds for that nursing home

# Assuming - Available Residential Beds encapsulates the Pediatric bed number

# Using TSV file run analysis on bed census

# To run the file 
# R CMD BATCH <filename> OR source(<filename>)

facility = "St. Peter\'s Nursing And Rehabilitation Center"

data = read.table("beds.tsv",sep="\t", header=TRUE)
sub = data[data$Facility.Name == facility,]

earliest_census = sub$Bed.Census.Date[nrow(sub)]
recent_census = sub$Bed.Census.Date[sub$Most.Recently.Submitted.Facility.Census.Data == 'TRUE']

bed_sort = sub[order(sub$Available.Residential.Beds), ]

cat(sprintf("%s reported %s many censuses.\n", facility, nrow(sub)))

print(paste("Earliest census was taken in:", earliest_census))

print(paste("Most recent census was taken in:",recent_census))

cat("The ten census dates with the lowest number of available beds for that nursing home in order are: \n")

for(num in 1:10)
    print(paste(bed_sort$Bed.Census.Date[num], bed_sort$Available.Residential.Beds[num]))

cat("The ten census dates with the highest number of available beds for that nursing home in order are: \n")

for(num in 10:1)
    print(paste(bed_sort$Bed.Census.Date[num], bed_sort$Available.Residential.Beds[num]))
# write.csv(data, file = 'results.csv', row.names = F)