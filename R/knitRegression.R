#' Knit regression
#' @export
knitRegression <- function(dat, conflevel=95, filetype="word_document"){
  dat <- as.data.frame(dat)
  conflevel <- conflevel/100
  out <- rmarkdown::render(system.file(package = "opencpuHello", "templates", "regression.Rmd"),
                           output_dir = getwd(),
                           output_format = filetype,
                           params = list(set_title="Regression analysis"))
  return(basename(out))
}
