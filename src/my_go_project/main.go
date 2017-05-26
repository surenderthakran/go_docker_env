package main

import (
	"fmt"
	"log"
	"net/http"

	logrus "github.com/Sirupsen/logrus"
)

func main() {
	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		name := r.URL.Query()["name"][0]

		logrus.WithFields(logrus.Fields{
			"request": "/get",
			"name":    name,
		}).Info("A new /get request received!")

		fmt.Fprintf(w, "Hello, %q\nYour lucky number is: %d", name, generateLuckyNumber(name))
	})

	err := http.ListenAndServe(":18770", nil) // Note: Not "localhost:18770" but ":18770"
	log.Fatal(err)
}

// Function to return a lucky number for a given name.
func generateLuckyNumber(name string) int {
	return len(name)
}
