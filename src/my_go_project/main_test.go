package main

import (
	"testing"
)

// Unit test for generateLuckyNumber() using test tables.
func TestGenerateLuckyNumber(t *testing.T) {
	testCases := []struct {
		name string
		want int
	}{
		{
			name: "surender",
			want: 8,
		},
		{
			name: "thakran",
			want: 7,
		},
	}
	for _, test := range testCases {
		result := generateLuckyNumber(test.name)

		if result != test.want {
			t.Errorf("generateLuckyNumber(%s) -> %d want %d", test.name, result, test.want)
		}
	}
}
