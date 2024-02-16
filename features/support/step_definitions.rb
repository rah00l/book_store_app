# features/support/step_definitions.rb

ParameterType(
  name: 'Title',
  regexp: /"([^"]*)"/,
  type: String,
  transformer: ->(s) { s }
)
