library(shiny)
library(dplyr)
library(ggplot2)


ui <- fluidPage(
  titlePanel("My First Shiny App"),
  h1("Star Wars Characters"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("taille",
        "Height of characters",
        min = 0,
        max = 250,
        value = 30
      )
    ),
    mainPanel(
      plotOutput("StarWarsPlot")
    )
  )
)


server <- function(input, output) {
  output$StarWarsPlot <- renderPlot({
    starwars |>
      filter(height > input$taille) |>
      ggplot(aes(x = height)) +
      geom_histogram(
        binwidth = 10,
        fill = "darkgray",
        collor = "with"
      )
  })
}

shinyApp(ui = ui, server = server)
