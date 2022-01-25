provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAXTU7WBMCSCM5UXGX"
    secret_key = "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"
}

resource "aws_iam_user" "create_new_user" {
	count = length(var.users)
	name = var.users[count.index]
}
