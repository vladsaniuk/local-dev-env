resource "jenkins_credential_username" "dh" {
  name        = "docker-hub"
  description = "DH creds"
  username    = "dummy_secret"
  password    = "dummy_secret"

  lifecycle {
    ignore_changes = [
      username,
      password
    ]
  }
}

resource "jenkins_credential_username" "gh" {
  name        = "github"
  description = "GH creds"
  username    = "dummy_secret"
  password    = "dummy_secret"

  lifecycle {
    ignore_changes = [
      username,
      password
    ]
  }
}

resource "jenkins_credential_secret_text" "aws_access_key_id" {
  name        = "aws_access_key_id"
  description = "AWS"
  secret      = "dummy_secret"

  lifecycle {
    ignore_changes = [secret]
  }
}

resource "jenkins_credential_secret_text" "aws_secret_access_key" {
  name        = "aws_secret_access_key"
  description = "AWS"
  secret      = "dummy_secret"

  lifecycle {
    ignore_changes = [secret]
  }
}

resource "sonarqube_user_token" "jenkins" {
  login_name = var.sonarqube_username
  name       = "jenkins-token"
}

resource "jenkins_credential_secret_text" "sonarqube_token" {
  name        = "sonarqube_token"
  description = "SonarQube user token"
  secret      = sonarqube_user_token.jenkins.token
}
