## Установка и запуск
Скачать, запустить `make run`

Запускается по адресу `http://localhost:5173`

Стучится к серверу по адресу `http://localhost:8082`

## Настройка CORS
Нужно разрешить CORS на стороне сервера. Можно добавить middleware типа такого:
```
type Cors struct {
	handler http.Handler
}
func (c *Cors) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Access-Control-Allow-Credentials", "true")
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type, access-control-allow-origin, access-control-allow-headers")
	w.Header().Set("Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS")

	if r.Method == "OPTIONS" {
		w.WriteHeader(204)
		return
	}
	c.handler.ServeHTTP(w, r)
}
```
или добавить отдельно все эти заголовки в хендлеры и обработать метод OPTIONS
