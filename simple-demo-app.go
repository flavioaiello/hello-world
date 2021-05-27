package main

import (
	"fmt"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world! 2021")

}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "OK\n")

}

func main() {
	fmt.Println("Simple demo app is starting on port 8080...")
	http.HandleFunc("/", indexHandler)
	http.HandleFunc("/health", healthHandler)
	http.ListenAndServe(":8080", nil)
}
