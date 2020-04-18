RSpec.shared_context 'show exceptions', show_exceptions: true do
  around do |example|
    env_config = Rails.application.env_config
    exceptions = env_config['action_dispatch.show_exceptions']
    env_config['action_dispatch.show_exceptions'] = true

    example.run

    env_config['action_dispatch.show_exceptions'] = exceptions
  end
end
