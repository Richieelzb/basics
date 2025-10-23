resource "null_resource" "delete_ecr_images" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr list-images \
        --repository-name lzb-project-repo \
        --query 'imageIds[*]' \
        --output json | \
      jq -c '.' | \
      xargs -I {} aws ecr batch-delete-image \
        --repository-name lzb-project-repo \
        --image-ids {}
    EOT
  }
}
``