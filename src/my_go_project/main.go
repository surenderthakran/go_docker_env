package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("inside /get")
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	err := http.ListenAndServe(":18770", nil) // Note: Not "localhost:8080" but ":8080"
	log.Fatal(err)
}
