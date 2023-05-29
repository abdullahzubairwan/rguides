
# Step 1: Install needed packages
library(ggplot2)
library(ggtext)
library(showtext)
library(sysfonts)
library(extrafont)

# Step 2: Install fonts from fontsawesome. Make sure to get the right version ; Desktop
# https://fontawesome.com/download

# Step 3: Open the otf file and install manually

# Step 4: Check on windows control Panel > Fonts whether it has been succesfully installed

# Step 5: Ensure R/RStudio loads the newly installed fonts
# Need to do this everytime a new true font type file is installed on pc

# Then, R console will prompt: Importing fonts may take a few minutes, depending on the number of fonts and the speed of the system.
# Continue? [y/n] - type y and enter

# font_import(paths = "C:/Users/XXX/AppData/Local/Microsoft/Windows/Fonts")
# https://medium.com/analytics-vidhya/5-easy-steps-to-import-new-fonts-into-r-6651bf263a07

# you can use extrafont::loadfonts() to check if the new fonts are already imported into R.

# Register fonts for Windows bitmap output
# loadfonts(device='win')

# Step 6:
# font_add_google("Roboto Slab", family = "Roboto Slab")
# font_add_google("Roboto", family = "Roboto")
# fa_path <- systemfonts::font_info(family = "Font Awesome 6 Brands Regular")[["path"]]
# font_import(paths = "C:/Users/Zubair/AppData/Local/Microsoft/Windows/Fonts")
# font_add('fa-reg', 'fonts/Font Awesome 6 Free-Regular-400.otf')
font_add('fa-brands', 'fonts/Font Awesome 6 Brands-Regular-400.otf')
# font_add(family = 'fa-brand', regular = fa_path)
# font_add('fa-solid', 'fonts/Font Awesome 6 Free-Solid-900.otf')
# fonttable()

# Step 7: Create Caption
cap = "This font is awesome:
       <span style='font-family: \"fa-brands\"'>&#xf099; &#xf09b; &#xf08c;</span>"


# Step 8: Add element_markdown() at theme to ensure the icon pops up
ggplot(mtcars) +
  aes(mpg, disp) +
  geom_point() +
  labs(title = cap,
       caption = cap) +
  theme(plot.title = element_markdown(),
        plot.caption = element_markdown())



# Reference: 
# https://stackoverflow.com/questions/71712836/how-to-add-icons-to-ggplot-captions-and-titles
# https://github.com/tashapiro/tanya-data-viz/tree/main/soth-election/scripts
# https://albert-rapp.de/posts/ggplot2-tips/08_fonts_and_icons/08_fonts_and_icons.html

# Put icon at label: https://stackoverflow.com/questions/75032403/how-to-use-fontawesome-free-font-in-ggplot

# Step x: Using Glyphs from fontawesome ; 
cap = "This font is awesome:
       <span style='font-family: \"fa-brands\"'>;</span>"

ggplot(mtcars) +
  aes(mpg, disp) +
  geom_point() +
  labs(title = cap,
       caption = cap)+
  theme(plot.title = element_markdown(),
        plot.caption = element_markdown())

# Step X: Using custom fonts
# https://r-coder.com/custom-fonts-r/

# Check fonts
fonts()

ggplot(trees, aes(1:length(Volume), Volume)) +
  ggtitle("Custom fonts in ggplot2") +
  geom_point(col = 4) + 
  xlab("") +
  theme(text = element_text(family = "Font Awesome 6 Free Solid"))
