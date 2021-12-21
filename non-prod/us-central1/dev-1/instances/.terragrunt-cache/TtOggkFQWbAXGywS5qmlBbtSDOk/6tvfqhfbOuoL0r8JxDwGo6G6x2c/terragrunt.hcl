# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# ----------------------------------------------------------------------------------------------------------------------

 terraform {
#     # source = "${include.env.locals.base_source_url}?ref=v0.4.0"
 }



# ---------------------------------------------------------------------------------------------------------------------
# Include configurations that are common used across multiple environments.
# ---------------------------------------------------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. 

include "root" {
  path = find_in_parent_folders()
}

# Include the env configuration for the component. The env configuration contains settings that are common for the component across all environments.
include "env" {
  path   = "${dirname(find_in_parent_folders())}/main/instances.hcl"
  expose = true
}

# terraform {
#      source = "../../../instances/instances.tf"


# }