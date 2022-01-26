package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"gotest.tools/assert"
)

func TestLoadBalancerComponent(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())
	randID := strconv.Itoa(rand.Intn(100000) + 1000)

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/load-balancer",
		Upgrade:      true,

		VarFiles: []string{
			GetComponentFixtures("load-balancer"),
		},

		Vars: map[string]interface{}{
			"name": randID,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// verify outputs
	// expected values are defined in fixtures/load-balancer.tfvars
	expectedRegion := "sfo1"
	expectedName := randID

	resultRegion := terraform.Output(t, terraformOptions, "region")
	assert.Equal(t, expectedRegion, resultRegion)

	resultName := terraform.Output(t, terraformOptions, "name")
	assert.Equal(t, expectedName, resultName)
}
