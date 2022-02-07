# Use geom_*()
# * there are about 50 different types to insert here
# add optional aesthetics inside ()

# SCATTER PLOT
# We must always consider overplotting, particularly in the following four situations:
# - Large datasets
# - Aligned values on a single axis
# - Low-precision data
# - Integer data

# Load the ggplot2 package
library(ggplot2)

# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(diamonds, aes(carat, price, color = clarity))

# Add a point layer with tiny points
plt_price_vs_carat_by_clarity + geom_point(alpha = 0.5, shape = ".", size = 1)

# Set transparency to 0.5 and shape to 16
plt_price_vs_carat_by_clarity + geom_point(alpha = 0.5, shape = 16)

# Let's take a look at another case where we should be aware of overplotting: Aligning values on a single axis.
# This occurs when one axis is continuous and the other is categorical, which can be overcome with some form of jittering.

fcyl <- factor(mtcars$cyl)  # number of cylinders

# Plot base
plt_mpg_vs_fcyl_by_fam <- ggplot(mtcars, aes(fcyl, mpg, color = fam))

# Default points are shown for comparison
plt_mpg_vs_fcyl_by_fam + geom_point()

# Alter the point positions by jittering, width 0.3
plt_mpg_vs_fcyl_by_fam + geom_point(position = position_jitter(width = 0.3))

# Now jitter and dodge the point positions
geom_point(position = position_jitterdodge(jitter.width = 0.3, dodge.width = 0.3))


ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  # Swap for jitter layer with width 0.1
  geom_jitter(alpha = 0.5, width = 0.1)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  # Set the position to jitter
  geom_point(alpha = 0.5, position = "jitter")

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  # Use a jitter position function with width 0.1
  geom_point(alpha = 0.5, position = position_jitter(width = 0.1))


# Vocab data set NOT LOADED HERE SO CODE WON'T WORK
# Examine the structure of Vocab
str(Vocab)

# Plot vocabulary vs. education
ggplot(Vocab, aes(education, vocabulary)) +
  # Add a point layer
  geom_point()

ggplot(Vocab, aes(education, vocabulary)) +
  # Change to a jitter layer
  geom_jitter()

ggplot(Vocab, aes(education, vocabulary)) +
  # Set the transparency to 0.2
  geom_jitter(alpha = 0.2)

ggplot(Vocab, aes(education, vocabulary)) +
  # Set the shape to 1
  geom_jitter(alpha = 0.2, shape = 1)


# HISTOGRAM

# Plot mpg
ggplot(mtcars, aes(mpg)) +
  # Add a histogram layer
  geom_histogram()

ggplot(mtcars, aes(mpg)) +
  # Set the binwidth to 1
  geom_histogram(binwidth = 1)

# Map y to ..density..
ggplot(mtcars, aes(mpg, ..density..)) +
  geom_histogram(binwidth = 1)

datacamp_light_blue <- "#51A8C9"

ggplot(mtcars, aes(mpg, ..density..)) +
  # Set the fill color to datacamp_light_blue
  geom_histogram(binwidth = 1, fill = datacamp_light_blue)


# Here, we'll examine the various ways of applying positions to histograms. geom_histogram(), a special case of geom_bar(), has a position argument that can take on the following values:
# - stack (the default): Bars for different groups are stacked on top of each other.
# - dodge: Bars for different groups are placed side by side.
# - fill: Bars for different groups are shown as proportions.
# - identity: Plot the values as they appear in the dataset.

fam <- factor(mtcars$am)  # automatic or manual transmission

# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = fam)) +
  geom_histogram(binwidth = 1)

ggplot(mtcars, aes(mpg, fill = fam)) +
  # Change the position to dodge
  geom_histogram(binwidth = 1, position = "dodge")

ggplot(mtcars, aes(mpg, fill = fam)) +
  # Change the position to fill
  geom_histogram(binwidth = 1, position = "fill")

ggplot(mtcars, aes(mpg, fill = fam)) +
  # Change the position to identity, with transparency 0.4
  geom_histogram(binwidth = 1, position = "identity", alpha = 0.4)


# BAR PLOT
# geom_bar() has three position options:
# - stack: The default
# - dodge: Preferred
# - fill: To show proportions

# While we will be using geom_bar() here, note that the function geom_col() is just geom_bar() where both the position and stat arguments are set to "identity". 
# It is used when we want the heights of the bars to represent the exact values in the data.

# Plot fcyl, filled by fam
ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Add a bar layer
  geom_bar()

ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Set the position to "fill"
  geom_bar(position = "fill")

ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Change the position to "dodge"
  geom_bar(position = "dodge")

# The reason you want to use position_dodge() (and position_jitter()) is to specify how much dodging (or jittering) you want.

ggplot(mtcars, aes(cyl, fill = fam)) +
  # Change position to use the functional form, with width 0.2
  geom_bar(position = position_dodge(width = 0.2))

ggplot(mtcars, aes(cyl, fill = fam)) +
  # Set the transparency to 0.6
  geom_bar(position = position_dodge(width = 0.2), alpha = 0.6)


# Vocab data set NOT LOADED HERE SO CODE WON'T WORK

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary))

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary)) +
  # Add a bar layer with position "fill"
  geom_bar(position = "fill")

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  # Add a brewer fill scale with default palette
  scale_fill_brewer()


# LINE PLOT

# Print the head of economics
head(economics)

# Using economics, plot unemploy vs. date
ggplot(economics, aes(date, unemploy)) +
  # Make it a line plot
  geom_line()

# Change the y-axis to the proportion of the population that is unemployed
ggplot(economics, aes(date, unemploy/pop)) +
  geom_line()


# fish data set NOT LOADED HERE SO CODE WON'T WORK
# Plot the Rainbow Salmon time series
ggplot(fish.species, aes(x = Year, y = Rainbow)) +
  geom_line()

# Plot the Pink Salmon time series
ggplot(fish.species, aes(x = Year, y = Pink)) +
  geom_line()

# Plot multiple time-series by grouping by species
ggplot(fish.tidy, aes(Year, Capture)) +
  geom_line(aes(group = Species))

# Plot multiple time-series by coloring by species
ggplot(fish.tidy, aes(Year, Capture, color = Species)) +
  geom_line()