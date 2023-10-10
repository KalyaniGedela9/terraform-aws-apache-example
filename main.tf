data "aws_vpc""main" {
    id = "vpc-bd9bdcc7"
}

data "template_file" "user_data"{
    template = file("${abspath(path.module)}/userdata.yaml")
}

resource "aws_security_group" "sg_my_server"{
    name = "sg_my_server"
    description = "MyServer Security Group"

    vpc_id = data.aws_vpc.main.id
}