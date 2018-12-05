# frozen_string_literal: true

require "dogapi"
require "yabeda/base_adapter"

module Yabeda
  module Datadog

    class Adapter < BaseAdapter

      def registry
        @registry ||= Dogapi::Client.new(Settings.datagog_api_key, Settings.datadog.application.key)
      end

      def register_counter!(metric, tags, value)
        registry.emit_point(metric, value, tags)
      end

      def perform_counter_increment!(counter, tags, increment)
        # Do nothing. DataDog does not support counters
      end

      def register_gauge!(_metric)
        # Do nothing. NewRelic don't need to register metrics
      end

      def perform_gauge_set!(metric, tags, value)
        registry.emit_point(metric, value, tags)
      end

      def register_histogram!(_metric)
        # Do nothing. DataDog don't need to register metrics
      end

      def perform_histogram_measure!(metric, tags, value)
        registry.emit_point(metric, value, tags)
      end

      private

      Yabeda.register_adapter(:datadog, new)

    end

  end
end