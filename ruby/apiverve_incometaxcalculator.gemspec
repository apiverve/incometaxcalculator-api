# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_incometaxcalculator"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Income Tax Calculator API - Ruby Client"
  spec.description   = "Income Tax Calculator computes US federal income tax and take-home pay from gross income and filing status. It outputs total tax owed, effective and marginal rates, standard deductions, and net monthly income."
  spec.homepage      = "https://apiverve.com/marketplace/incometaxcalculator?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/incometaxcalculator-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/incometaxcalculator"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
