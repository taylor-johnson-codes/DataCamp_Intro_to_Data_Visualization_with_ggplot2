# Two key items about the grammar of graphics:
# 1 Graphics = distinct layers of grammatical elements
# 2 Meaningful plots through aesthetic mappings

# Three essential grammatical elements:
# 1 Data - the data set being plotted
# 2 Aesthetics - the scales onto which we map our data
# 3 Geometries - the visual elements used for our data; the shape the data will take on the plot

# Optional grammatical elements:
# Themes - all non-data ink
# Statistics - representations of our data to aid understanding
# Coordinates - the space on which the data will be plotted
# Facets - plotting small multiples

# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(cyl, mpg)) +  # x axis is 4 5 6 7 8
  geom_point()

# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(factor(cyl), mpg)) +  # x axis is 4 6 8
  geom_point()

# Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, color = disp)) +
  geom_point()

# Change the color aesthetic to a size aesthetic
ggplot(mtcars, aes(wt, mpg, size = disp)) +
  geom_point()

# Explore the diamonds data frame with str()
str(diamonds)

# Add geom_point() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point()

# Add geom_smooth() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth()  # adds a smooth trend curve

# geom_point() has an alpha argument that controls the opacity of the points. A value of 1 (the default) means that the points are totally opaque; 
# a value of 0 means the points are totally transparent (and therefore invisible). Values in between specify transparency.

# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point() +
  geom_smooth()

# Make the points 40% opaque
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point(alpha = 0.4) +
  geom_smooth()

# Plots can be saved as variables, which can be added to later on using the + operator. This is really useful if you want to make multiple related plots from a common base.

# Draw a ggplot
plt_price_vs_carat <- ggplot(
  # Use the diamonds dataset
  diamonds,
  # For the aesthetics, map x to carat and y to price
  aes(carat, price)
)
# Add a point layer to plt_price_vs_carat
plt_price_vs_carat + geom_point()

# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to make points 20% opaque: plt_price_vs_carat_transparent
plt_price_vs_carat_transparent <- plt_price_vs_carat + geom_point(alpha = 0.2)

# See the plot
plt_price_vs_carat_transparent

# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to map color to clarity
# Assign the updated plot to a new object
plt_price_vs_carat_by_clarity <- plt_price_vs_carat + geom_point(aes(color = clarity))

# See the plot
plt_price_vs_carat_by_clarity