# frozen_string_literal: true

require "dogapi"
require "yabeda/base_adapter"

module Yabeda
  module Datadog

    class Adapter < BaseAdapter

      def registry
        @registry ||= Dogapi::Client.new(ENV['DATADOG_API_KEY'], ENV['DATADOG_APPLICATION_KEY'])
      end

      def register_counter!(metric)
        registry.update_metadata(metric.name.to_s, {"type" => 'count'})
      end

      def perform_counter_increment!(metric, tags, increment)
        registry.emit_point(metric.name.to_s, increment, tags)
      end

      def register_gauge!(metric)
        registry.update_metadata(metric.name.to_s, {"type" => 'gauge'})
      end

      def perform_gauge_set!(metric, tags, value)
        registry.emit_point(metric.name.to_s, value, tags)
      end

      def register_histogram!(_metric)
        # Do nothing. DataDog don't support histogram
      end

      def perform_histogram_measure!(_metric, _tags, _value)
        # Do nothing. DataDog don't support histogram
      end

      private

      Yabeda.register_adapter(:datadog, new)

    end

  end
end