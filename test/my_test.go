package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformDevEnvironment(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../environments/dev",
	}

	// Cleanup (even if test fails)
	defer terraform.Destroy(t, terraformOptions)

	// Init & Apply
	terraform.InitAndApply(t, terraformOptions)
}
