package test

import (
	"log"
	"math/rand"
	"os"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

var lowercaseLetterRunes = []rune("abcdefghijklmnopqrstuvwxyz")

func RandStringRunes(n int) string {
	b := make([]rune, n)
	for i := range b {
		b[i] = lowercaseLetterRunes[rand.Intn(len(lowercaseLetterRunes))]
	}
	return string(b)
}

func getWorkingDir() string {
	wd, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	return wd
}

func GetComponentFixtures(component string) string {
	return getWorkingDir() + "/fixtures/" + component + ".tfvars"
}

func GetComponentExampleDir(component string) string {
	return getWorkingDir() + "/examples/" + component
}
