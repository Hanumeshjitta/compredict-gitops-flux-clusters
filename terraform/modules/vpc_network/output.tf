output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnet_ids" {
  value = aws_subnet.mysubnets[*].id
}

output "cluster_sg_id" {
  value = aws_security_group.cluster_sg.id
}

output "node_sg_id" {
  value = aws_security_group.node_sg.id
}
