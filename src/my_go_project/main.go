package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("inside /get")
		fmt.Println(r)
		fmt.Fprintf(w, "Hello, %q", r.URL.Query()["name"][0])
	})

	err := http.ListenAndServe(":18770", nil) // Note: Not "localhost:8080" but ":8080"
	log.Fatal(err)
}
