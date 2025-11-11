resource "aws_s3_bucket" "name" {
  bucket = "uyteiuiugogutuiyfuou76758"
}


#terraform workspace it is used to create same resource with in diffrent regions or with some changes it will create another one
#terraform workspace list ->its shows the list of workspaces
#terraform workspace new {name of the workspace} -> its used for create new workspace
#terraform workspace show -> its shows present workspace
#terraform workspace select {name of the workspace} to switch another workspace
#terraform workspace delete {name of the workspace} to delete workspace