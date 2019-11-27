# *NEWS*

# postpack 0.1.13 (2019-11-28)

## Include NEWS.md

* A news tracker file has now been added. I have gone through the git history to include the progression of changes that have been made. 

* In theory, a user should be able to access this via `utils::news(package = "postpack")`, however in RStudio version 1.2.1335 (my current version), this returns an error in the RStudio help pane:

  ```
  Error in UseMethod("toHTML") : no applicable method for 'toHTML' applied to an object of class "NULL"
  ```

  When run from the standard R command line (not in RStudio, it works just fine). This issue is documented [here](<https://stackoverflow.com/questions/56270933/package-specific-utilsnews-not-working-in-rstudio>) and [here](<https://community.rstudio.com/t/utils-news-does-not-work-in-rstudio/42878>). For now, users can just look at the source code, which renders the markdown for them when viewed on GitHub.

* It is my intent that every major, minor, and patch update will be documented here, which prevents users from needing to dig into the git history to see what has changed with each version.

* I haven't really used the semantic versioning correctly, (all updates have been categorized as patch updates, when really some of them were major updates that would have broken previous versions, or minor updates that added substantial features). I will make an attempt to fix this in the future.


# postpack 0.1.12 (2019-11-26)

## Include numerical diagnostic summaries in `diag_plots`

* Users now have the option to set a `diags_plots(..., show_diags)` argument to one of:
  * `"always"` to always show Rhat and effective MCMC samples on the density plot panel
  * `"never"` to never show these diagnostics
  * `"if_poor_Rhat"` to only show this for nodes that have Rhat > 1.1

# postpack 0.1.11 (2019-11-24)

## Improved error messages

* `match_p` now uses `StatonMisc::list_out` to print the unique node names, which makes its printing much cleaner. The message was simplified as well, allowing it to print each line on one line without spilling over
* if a node had the same value each iteration, passing it to `density_plot` would sometimes return a warning dealing with how it dealt with ties. The user doesn't care about this, so I have wrapped every usage of `density` with `suppressWarnings`

# postpack 0.1.10 (2019-11-24)

## Removal of the `warn` argument

* All functions that used the `match_p` function previously included a `warn = T/F` argument, which would warn users if more than one node was matched by the `p` argument. I have found during workshops that even interpretting the basic error message returned if no matches were returned confused users, so this message would be even more confusing. Futher, it is just not necessary. It has been removed entirely
* The `prettify` argument to post_summ was removed. Users can do this "after-the-fact" if desired. Nearly always numeric output is desired, and this forced coersion to character

# postpack 0.1.9 (2019-11-24)

## Many improvements to function consistency, and inclusion of example `mcmc.list` objects  and a vignette

* the updated usage of `post_dim(..., kind)` was included in other functions including:
  * `post_bind`
  * `post_thin`
  * `vcov_decomp`
* `vcov_decomp` has improved error messages and relies on `StatonMisc::progress_updater` to print the progress of the calculation
* error message in `post_dim` improved to rely on `StatonMisc::list_out`
* included an `id_mat` function
* readme updated to instruct users to set `build_vignettes = T` when installing from github and several other simplifications to the readme since there is now a vignette
* 

# postpack 0.1.8 (2019-10-03)

## Improvements to `post_dim`

* `post_dim` now accepts a `kind` argument, which represents certain element(s) from the returned vector. I most frequently use `post_dim(post)["n_saved"]`, this simply removes the necessity to do the subset outside of the function call

# postpack 0.1.7 (2019-09-19)

## Added the `vcov_decomp` function

* `vcov_decomp` will decompose the posterior of a variance-covariance node into its correlation matrix and standard deviation vector, and return an `mcmc.list` object with these nodes
* it first checks if the node is a valid variance-covariance matrix (if it is square, symmetric, and positive definite) before performing the calculation. These checks require that the `{matrixcalc}` package is a dependency.
* it includes an option to invert each matrix sample prior to decomposition - this feature is for if the user monitored a precision matrix rather than a variance-covariance matrix

# postpack 0.1.6 (2019-09-13)

## Added more layouts to `diag_plots`

* Options for `diag_plots(..., layout = "2x1")` and `diag_plots(..., layout = "4x2")` added, and the `"auto"` option will now consider these when selecting the best option.

# postpack 0.1.5 (2019-09-03)

## Updates to documentation and inclusion of `write_model`

* I essentially duplicated `R2OpenBUGS::write.model` because it was the only function I ever used from that package now all my BUGS models are fitted with JAGS. I got sick of having to load it and telling others to install it just for this one function
* Bug fix: `post_dim` was counting the chain and iters columns as nodes

# postpack 0.1.4 (2019-06-30)

## Package renaming and improvements to documentation

* The name of the package was changed from `{codaTools}` to `{postpack}`. This is a better name, because it is not just used for convergence diagnostics.
* Package helpfile created

# codaTools 0.1.3 (2019-06-30)

## Huge number of changes and improvements

_Note: hopefully no future edits are this substantial before updating the version number_

* Improvements to `get_nodes` and `filter_post`:  better error messages
* Switched `format = "matrix"` to `matrix = T/F` argument
* Included `match_p` function - now **all** subsetting is handled by this one function
* `filter_post` became `post_subset`
* inclusion of `ins_regex_lock`, `rm_regex_lock`, and `base_p` - all intended to improve the behavior of `diag_plots`
* better usage of  `{StatonMisc}`, they are now imported rather than requiring the whole package at the start of a function that needs them
* `summ_post` became `post_summ`
* `native_format` became `array_format`
* `get_nodes` became `get_p`
* `bind_post` became `post_bind`
* `thin_post` became `post_thin`
* addition of `post_dim`
* better titles in `diag_plots`

# codaTools 0.1.2 (2019-04-06)

## Bug fixes and inclusion of readme

* Bug fixes: `thin_post`, `native_format`
* Creation of readme: basic installation instructions and example functionality

# codaTools 0.1.1 (2018-11-16)

## Inclusion of `bind_post` and `thin_post`

* Package now contains:
  * `bind_post`: combines two `mcmc.list` objects
  * `thin_post`: thins an `mcmc.list` object at regularly-spaced intervals from each chain

# codaTools 0.1.0 (2018-11-14)

## First subtantially functional version

* Package now contains functional capabilities to do everything I was doing before (extracting, diagnostic, summarizing particular nodes), now with cleaner functions that do specific tasks, and with the ability to extract particular nodes using regular expressions

# codaTools 0.0.9000 (2018-11-05)

## Initial Repository Creation

* First attempt at wrapping my commonly used MCMC post-processing functions into an R package, allowing them to be easily accessed during my work