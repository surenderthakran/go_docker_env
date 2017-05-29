package main

import (
	"flag"
	"fmt"
	glog "github.com/golang/glog"
	"log"
	"net/http"
)

func main() {
	// Overriding glog's logtostderr flag's value to print logs to stderr.
	flag.Lookup("logtostderr").Value.Set("true")
	// Calling flag.Parse() so that all flag changes are picked.
	flag.Parse()

	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		glog.Info("A new /get request received!")

		name := r.URL.Query()["name"][0]
		fmt.Fprintf(w, "Hello, %q\nYour lucky number is: %d", name, generateLuckyNumber(name))
	})

	err := http.ListenAndServe(":18770", nil) // Note: Not "localhost:18770" but ":18770"
	log.Fatal(err)
}

// Function to return a lucky number for a given name.
func generateLuckyNumber(name string) int {
	return len(name)
}
