#' Knit regression
#' @export
knitRegression <- function(dat, conflevel, filetype){
  dat <- as.data.frame(dat)
  conflevel <- conflevel/100
  out <- rmarkdown::render(system.file(package = "ocpusimplereg", "templates", "regression.Rmd"),
                           output_dir = getwd(),
                           intermediates_dir = if(filetype=="pdf_document") NULL else getwd(),
                           runtime = "static",
                           output_format = filetype,
                           params = list(set_title="Regression analysis"))
  return(basename(out))
}
