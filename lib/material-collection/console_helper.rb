# frozen_string_literal: true

# Helper methods for rails console
#
# You need to add the following code to +config/environments/<env>.rb+ if you want to use this helper:
#
# @example
#   Rails.application.configure do
#     console do
#       MaterialCollection::ConsoleHelper.use_settings_reloader
#       MaterialCollection::ConsoleHelper.use_factory_bot
#     end
#   end
module MaterialCollection::ConsoleHelper
  # @see https://docs.ruby-lang.org/ja/latest/method/Object/c/TOPLEVEL_BINDING.html
  # @see https://docs.ruby-lang.org/ja/latest/class/Binding.html#I_RECEIVER
  MAIN_OBJECT = TOPLEVEL_BINDING.receiver

  class << self
    # Supply the following functions:
    # * +reload!+ is changed to execute with +Settings.reload!+
    def use_settings_reloader
      class << MAIN_OBJECT
        prepend(
          Module.new do
            def reload!
              result = super
              puts 'Settings reloading...'
              Settings.reload!
              result
            end
          end
        )
      end
    end

    # Supply the following functions:
    # * Can use FactoryBot factories
    # * +reload!+ is changed to execute with +FactoryBot.reload+
    def use_factory_bot
      require 'factory_bot_rails'

      class << MAIN_OBJECT
        include FactoryBot::Syntax::Methods
        prepend(
          Module.new do
            def reload!
              result = super
              puts 'FactoryBot reloading...'
              FactoryBot.reload
              result
            end
          end
        )
      end
    end
  end
end
