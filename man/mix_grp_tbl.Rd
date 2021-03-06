% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/granular.R
\name{mix_grp_tbl}
\alias{mix_grp_tbl}
\title{Title}
\usage{
mix_grp_tbl(.data, proportion, size, mu_vec, pi_vec = NULL,
  sigma_vec = NULL, peak_names = NULL, emnum = 10, log_trans = TRUE,
  parallel = FALSE)
}
\arguments{
\item{.data}{A tbl grouped by each distribution}

\item{proportion}{An unquoted variable name}

\item{size}{An unquoted variable name}

\item{mu_vec}{A vector defining distribution means (required)}

\item{pi_vec}{A vector defining distribution proportions (optional)}

\item{sigma_vec}{A vector defining distribution dispersion (optional)}

\item{peak_names}{A vector defining peak names (optional)}

\item{emnum}{passed to mix() - A non-negative integer specifying the number of EM steps to be performed}

\item{log_trans}{Logical. Should values be log-transformed?}

\item{parallel}{Logical. Should multidplyr be used to run in parallel? (EXPERIMENTAL)}
}
\value{
A mutated tbl with list column output
}
\description{
Title
}
