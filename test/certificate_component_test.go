package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestCertificateComponent(t *testing.T) {
	t.Skip("revisit once examples are implemted")
	t.Parallel()

	rand.Seed(time.Now().UnixNano())
	randID := strconv.Itoa(rand.Intn(100000) + 1000)

	fixtures := map[string]interface{}{
		"name": randID,
		"domains": []string{
			randID + "." + randID + ".example.com",
		},
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/certificate",
		Upgrade:      true,
		Vars:         fixtures,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// verify outputs
}
