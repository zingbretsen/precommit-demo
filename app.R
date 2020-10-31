    #
 # This is a Shiny web application with terrible indentation. 
    # You can run the application by clicking the 'Run App' button above.
 #
    # Find out more about building applications with Shiny here:
 #
    #    http://shiny.rstudio.com/
 #
    
 library(shiny)
    
    ui <- fluidPage(
    
    titlePanel("Pre-commit Setup/Use"),
                                                 uiOutput("precommit"
                                                          
                                                          )
    )
 
 server <- function(input, output) {
       
 output$precommit <- renderUI({
   tagList(
tags$h2("This repo"), 
           tags$p("This repo is to demonstrate some of the functionality of pre-commit for working with R and Python code. Check out the ", 
                      tags$a("dirty", href="https://github.com/zingbretsen/precommit-demo/tree/dirty"),
                    " branch and compare it to the ", 
                  tags$a("clean", href="https://github.com/zingbretsen/precommit-demo/tree/clean"),
                  " branch to see the difference pre-commit can make on your repositories."), 
           tags$h2("Pre-commit"), 
              tags$p(tags$a("Pre-commit", href="https://pre-commit.com/"), 
                  " is an awesome project that lets you automate styling, syntax checking, checking for debug statements accidentally left in code, and more--all before you commit that code to your repo!"),
           tags$p("For some languages (like Python, JavaScript, and others), pre-commit can automatically install the tools it needs to run its hooks. R requires a little setup."),
     
         tags$h2("Setup"), 
     tags$h3("Installing Pre-commit"), 
     tags$p("You first need to install the pre-commit software on your system. There are many ways to do this. See the pre-commit website for instructions:", 
                tags$a("https://pre-commit.com/#installation", href="https://pre-commit.com/#installation")),
      tags$p("Some common installation examples:"), 
tags$pre("#Ubuntu
apt-get install pre-commit

#OS X with Homebrew
brew install pre-commit

#System-wide Python
python -m pip install pre-commit"), 
tags$h3("R Package")
                   ,tags$p("R is not an officially supported language, so it requires a little more setup than other languages."),
           tags$p("You then need to install the R {precommit} package and some supplemental packages:"), 
     tags$pre("install.packages(c('precommit', 'styler', 'lintr', 'spelling'))")
              ,                 tags$p("You can then create a default .pre-commit-config.yaml file by running:")
           ,          tags$pre("precommit::use_precommit()"), 
tags$p("This should have created a 
                                                            .pre-commit-config.yaml file in your project 
                                                            root. Check out this file to see the options. You can add new hooks to this file.
                                                            It will also have configured your repository to run your pre-commit hooks any time you try to add a new commit to this repo.")
           
                 ,tags$h2("Use"), 
           tags$p("In your terminal (in RStudio or on your system), you can run the following to manually run pre-commit on all of the files in your repo:"),
   tags$pre("pre-commit run --all-files"), tags$p("You can also run individual hooks instead of all hooks, and you can do that to individual files instead of all files:"),
                       tags$pre("pre-commit run styler --files app.R")
           , tags$p("If you installed pre-commit in your repo, it will also run all your hooks automatically on any file you try to commit.
                                 This will prevent you from committing any changes that don't meet the style/correctness guidelines as specified in your config file.")
     ,              tags$h3("Hooks"),
tags$p("You can find LOTS more hooks on the Pre-commit site(",
       tags$a("https://pre-commit.com/hooks.html", href="https://pre-commit.com/hooks.html"), ") and in the R package (", 
                            tags$a("https://github.com/lorenzwalthert/precommit/", href="https://github.com/lorenzwalthert/precommit/"), ")!")
           )
 })
           }
    
# Run the application 
           shinyApp(ui = ui, server = server)