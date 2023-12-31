# WARNING - Generated by {fusen} from dev/flat_minimal.Rmd: do not edit by hand

#' get_lookup_tables 
#'
#' @param mp_service_account_name The Mixpanel Service Account Name
#' @param mp_service_account_secret The Mixpanel Service Account Token
#' @param mp_project_id str The Mixpanel Project ID
#' 
#' @importFrom rlang .data
#' 
#' @return 
#' Tibble with information about Lookup tables
#' @export
#'
get_lookup_tables <- function(mp_service_account_name = Sys.getenv("MP_SERVICE_ACCOUNT_NAME"),
                              mp_service_account_secret = Sys.getenv("MP_SERVICE_ACCOUNT_TOKEN"),
                              mp_project_id = Sys.getenv("MP_PROJECT_ID")) {
    
  checkmate::assert_character(c(mp_service_account_name, mp_service_account_secret,
                                  mp_project_id))
  
  resp <- httr2::request("https://api.mixpanel.com/lookup-tables") |> 
      httr2::req_auth_basic(username = mp_service_account_name,
                     password = mp_service_account_secret) |> 
      httr2::req_headers(accept = "application/json") |> 
      httr2::req_url_query(project_id = mp_project_id) |> 
      httr2::req_perform()
  
  tables <- resp |> httr2::resp_body_json() |> 
      (\(x) x$results )() |> 
      tibble::enframe(name = "n") |> 
      tidyr::unnest_wider(col = .data[["value"]])
  
  return(tables)
}


