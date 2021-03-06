% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/density_plot.R
\name{density_plot}
\alias{density_plot}
\title{Create a density plot for a single desired node}
\usage{
density_plot(post, param, show_diags = "if_poor_Rhat")
}
\arguments{
\item{post}{A \code{\link[coda:mcmc.list]{mcmc.list}} object.}

\item{param}{A regular expression that matches a single element in the model.
E.g., \code{"b0[1]"}, not \code{"b0"}. See \code{\link[=match_params]{match_params()}}.}

\item{show_diags}{Control when to display numerical diagnostic summaries on plots. Must be one of
\code{"always"}, \code{"never"}, or \code{"if_poor_Rhat"}. \code{"if_poor_Rhat"} (the default)
will display the Rhat and effective MCMC samples if the Rhat statistic
is greater than 1.1.}
}
\value{
A figure showing the posterior density, separated by chain.
}
\description{
Used by \code{\link[=diag_plots]{diag_plots()}}, not intended to be called separately
}
\note{
This is \strong{not} a function users will generally use directly. Call \code{\link[=diag_plots]{diag_plots()}} instead.
}
