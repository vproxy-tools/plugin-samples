adminhost := "127.0.0.1"
adminport := "16309"
adminpass := "123456"

run-redis-cli := redis-cli -h $(adminhost) -p $(adminport) -a $(adminpass)
