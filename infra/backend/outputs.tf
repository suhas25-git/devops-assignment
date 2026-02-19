output "alb_dns" {
  value = aws_lb.app.dns_name
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].address
}

