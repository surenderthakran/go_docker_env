package main

import (
  "fmt"

  "my_go_project/gmath"
  "my_go_project/gstring"
)

func main() {
    fmt.Printf("hello, world\n")

    fmt.Println(gmath.AddIntegers(2, 3))
    fmt.Println(gmath.SubtractIntegers(8, 5))

    fmt.Println(gstring.AddStrings("apple", "orange"))
}
