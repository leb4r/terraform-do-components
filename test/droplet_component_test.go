package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"gotest.tools/assert"
)

func TestDropletComponent(t *testing.T) {
	t.Skip("revisit once examples are implemented")
	t.Parallel()

	rand.Seed(time.Now().UnixNano())
	randID := strconv.Itoa(rand.Intn(100000) + 1000)

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/droplet",
		Upgrade:      true,

		VarFiles: []string{
			GetComponentFixtures("droplet"),
		},

		Vars: map[string]interface{}{
			"name": randID,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// verify outputs
	// expected values are defined in fixtures/droplet.tfvars
	expectedRegion := "sfo3"
	expectedName := randID
	expectedImage := "fedora-35-x64"

	resultRegion := terraform.Output(t, terraformOptions, "region")
	assert.Equal(t, expectedRegion, resultRegion)

	resultName := terraform.Output(t, terraformOptions, "name")
	assert.Equal(t, expectedName, resultName)

	resultImage := terraform.Output(t, terraformOptions, "image")
	assert.Equal(t, expectedImage, resultImage)
}
