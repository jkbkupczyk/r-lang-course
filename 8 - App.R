# -----------------------------------------
#             ¡ Shiny App ¡
# -----------------------------------------

if ("shiny" %in% rownames(installed.packages()) == FALSE) {
  install.packages("shiny")
}

# Load caret package
library(shiny)

# ui <- fluidPage("Hello world")
# server <- function(inp, out){}
# shinyApp( 
#   ui = ui,
#   server = server
# )

# Create a UI with controls
ui <- fluidPage(
  titlePanel("Input and Output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose Number",
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel(textOutput(outputId = "text"))
  )
)


# Create a server and map input
server <- function(input, output) {
  output$text <- renderText({
    paste("You Selected", input$number)
  })
}


shinyApp(
  ui = ui,
  server = server
)







