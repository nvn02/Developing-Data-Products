library(shiny)
data(cars)


# Writing code for the plot
shinyServer(function(input, output) {
    data1<-cars
    minSpeed<-reactive({input$speed1[1]})
    maxSpeed<-reactive({input$speed1[2]})
    xlab<-reactive({ifelse(input$show_xlab,"Speed","")})
    ylab<-reactive({ifelse(input$show_ylab,"Stopping Distance","")})
    newdata<-reactive({
        a<-subset(data1,data1$speed>=minSpeed() & data1$speed<=maxSpeed())
        return(a)
    })
        
        
    output$plot <- renderPlot({

        plot(newdata()$speed,newdata()$dist,xlab=xlab(),ylab=ylab(),main="The Scatter Plot",xlim=c(0,30),ylim=c(0,125),col="red")
    })

})
