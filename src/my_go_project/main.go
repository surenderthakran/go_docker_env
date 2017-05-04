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
		name := r.URL.Query()["name"][0]
		fmt.Fprintf(w, "Hello, %q", name)
	})

	err := http.ListenAndServe(":18770", nil) // Note: Not "localhost:18770" but ":18770"
	log.Fatal(err)
}
