
library(shiny)

#Define a UI for an app that creates a plot between speed of cars and stopping distance in the 'cars' dataset.
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot Stopping Distance Against Speed"),

    # Sidebar with a slider input for range of speed for which stopping distance is to be plotted
    sidebarLayout(
        sidebarPanel(
            h2('Use the slider to input the range of speed for which plot is to be calculated.'),
            sliderInput("speed1","Slide Me",
                        min = 4,
                        max = 25,
                        value = c(10,20)),
            checkboxInput('show_xlab','Show/Hide X Axis Label',value=TRUE),
            checkboxInput('show_ylab','Show/Hide Y Axis Label',value=TRUE),
            h3('Press Done once the parameters are inputted to show results'),
            submitButton('Done')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3('Plot of Speed vs Stopping Distance'),
            plotOutput("plot")
        )
    )
))
