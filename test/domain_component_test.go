package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"gotest.tools/assert"
)

type RecordAttributes struct {
	ID    string `json:"id"`
	FQDN  string `json:"fqdn"`
	Value string `json:"value"`
	Type  string `json:"type"`
}

// TODO: test `project_id`
func TestDomainComponent(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())
	randID := strconv.Itoa(rand.Intn(100000) + 1000)

	expectedDomainName := randID + ".io"
	expectedRecordList := []map[string]interface{}{
		{
			"name":  randID,
			"type":  "A",
			"value": "192.168.1.1",
		},
	}

	fixtures := map[string]interface{}{
		"domain_name": expectedDomainName,
		"records":     expectedRecordList,
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/domain",
		Upgrade:      true,
		Vars:         fixtures,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// verify outputs
	resultDomainName := terraform.Output(t, terraformOptions, "domain_name")
	assert.Equal(t, fixtures["domain_name"], resultDomainName)

	resultRecords := []RecordAttributes{}
	terraform.OutputStruct(t, terraformOptions, "records", resultRecords)
	for i, record := range resultRecords {
		assert.Equal(t, expectedRecordList[i]["domain_name"], record.FQDN)
		assert.Equal(t, expectedRecordList[i]["type"], record.Type)
		assert.Equal(t, expectedRecordList[i]["value"], record.Value)
	}
}
