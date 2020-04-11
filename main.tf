provider "gitlab" {
	token = var.gitlab_token
	version = "~>2.5"
	base_url = "{{ git_api_url }}"
}

resource "gitlab_project" "ops1_project" {
	name = "ops1_project"
	description = "My project created using terraform"

	visibility_level = "private"
}

resource "gitlab_deploy_key" "ssh_deploy_key" {
	project = gitlab_project.ops1_project.id
	title = "ssh_pub"
	key = var.ssh_deploy_key
	can_push = true
	depends_on = [gitlab_project.ops1_project]
}
