##'Examine the variables in the data set
##'
##'For the following exercises we are using the nasa_fireball data, a data set 
##'of reported fireball events. Explore the variables in this data set. The 
##'nasa_fireball data frame is already loaded.

# Print the nasa_fireball data frame
nasa_fireball

# Examine the types of variables present
sapply(nasa_fireball, class)

# Observe the number of observations in this data frame
nrow(nasa_fireball)

# Check for missing data
sapply(nasa_fireball, anyNA)
