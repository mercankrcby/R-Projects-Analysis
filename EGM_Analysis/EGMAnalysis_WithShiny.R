# This document was prepared by Mercan Karacabey, Mehmet Ak.
# 


library(shiny)
library(readxl)
library(tidyverse)

tmp<-tempfile(fileext=".xlsx")

download.file("https://github.com/MEF-BDA503/pj18-mkaracabey/blob/master/EGM_Analysis/egm_example_data.xlsx?raw=true",mode = 'wb',destfile=tmp)

raw_data<-readxl::read_excel(tmp,skip=7,col_names=FALSE)

file.remove(tmp)

colnames(raw_data) <- c("date","pension_fund_company","n_of_participants",	"fund_size_participants",	"gov_contribution",	"contribution",	"n_of_pensioners",	"n_of_ind_contracts",	"n_of_group_ind_contracts",	"n_of_employer_group_certificates",	"n_total","size_of_ind_contracts",	"size_of_group_ind_contracts",	"size_of_employer_group_certificates"	,"size_total")

egm_data <- raw_data %>% mutate_if(is.numeric,funs(ifelse(is.na(.),0,.))) 

print(egm_data,width=Inf)


saveRDS(egm_data,file="egm_data.rds")

egm_data %>% 
  select(date,n_of_participants,pension_fund_company,n_of_pensioners,n_of_ind_contracts) %>% arrange(n_of_pensioners) %>% 
  filter(n_of_participants>50000 & n_of_participants<100000)


egm_data  %>% group_by(date) %>%summarise(MeanOfParticipants= mean(n_of_participants))


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("EGM Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("egm_data$n_of_participants",
                  "Participants:",
                  min = min(egm_data$n_of_participants),
                  max = max(egm_data$n_of_participants),
                  value = c(1000,10000),sep ="",step=1),
      
      selectInput(inputId ="egm_data$pension_fund_company", label="Companies", choices = c("All",egm_data$pension_fund_company))
      
      #sliderInput("votes","Min Votes",min=min(shiny_movie_set$votes),max=max(shiny_movie_set$votes),value = min(shiny_movie_set$votes))
      # Show a plot of the generated distribution
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
     ggplot(egm_data, aes(x=egm_data$n_of_participants,y=egm_data$fund_size_participants,color = egm_data$pension_fund_company))+geom_point()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

