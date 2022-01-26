package test

import (
	"log"
	"os"
)

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
