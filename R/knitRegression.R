#' Knit regression
#' @export
knitRegression <- function(dat, conflevel, filetype){
  dat <- as.data.frame(dat)
  conflevel <- conflevel/100
  if(filetype=="word_document"){
    filetype <- word_document(reference_docx = system.file(package = "ocpusimplereg", "templates", "word-styles-reference.docx"))
  }
  out <- rmarkdown::render(system.file(package = "ocpusimplereg", "templates", "regression.Rmd"),
                           output_dir = getwd(),
                           intermediates_dir = getwd(),
                           runtime = "static",
                           output_format = filetype,
                           params = list(set_title="Regression analysis"))
  return(basename(out))
}
