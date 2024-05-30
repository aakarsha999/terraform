resource "local_file" "pet" {
filename = var.filename3
content = var.content3
}
resource "random_pet" "mypet" {
prefix = "ak"
separator = "-"
length = "2"
}