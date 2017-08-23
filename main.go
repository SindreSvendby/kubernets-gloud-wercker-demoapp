package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	h := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		name, err := os.Hostname()
		if err != nil {
			panic(err)
		}

		fmt.Fprintf(w, "hello, you've hit %s\n", name)
	})

	err := http.ListenAndServe(":8080", h)
	log.Fatal(err)
}
