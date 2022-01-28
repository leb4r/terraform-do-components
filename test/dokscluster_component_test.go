package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"gotest.tools/assert"
)

func TestDoksClusterComponent(t *testing.T) {
	t.Parallel()

	randID := RandStringRunes(6)

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/doks-cluster",
		Upgrade:      true,

		VarFiles: []string{
			GetComponentFixtures("doks-cluster"),
		},

		Vars: map[string]interface{}{
			"name": randID,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// verify outputs
	// expected values are defined in fixtures/load-balancer.tfvars
	expectedRegion := "nyc3"
	expectedName := randID

	resultRegion := terraform.Output(t, terraformOptions, "region")
	assert.Equal(t, expectedRegion, resultRegion)

	resultName := terraform.Output(t, terraformOptions, "name")
	assert.Equal(t, expectedName, resultName)
}
