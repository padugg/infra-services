terraform {
    backend "http" {
      address        = "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${CI_COMMIT_REF_NAME}"
      lock_address   = "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${CI_COMMIT_REF_NAME}/lock"
      unlock_address = "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${CI_COMMIT_REF_NAME}/lock"
      username       = "${CI_USERNAME}"
      password       = "${CI_JOB_TOKEN}"
      lock_method    = "POST"
      unlock_method  = "DELETE"
      retry_wait_min = 5
    }
}
