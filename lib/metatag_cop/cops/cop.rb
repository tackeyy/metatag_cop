# frozen_string_literal: true

module MetatagCop
  module Cops
    #
    class Cop
      attr_reader :records

      def initialize(records)
        @records = records
      end

      def run
        error_msgs = []
        records.each do |record|
          error_msg = []
          parser = MetatagCop::Parser.new(record.url)
          error_msg.push error_msg(:title, record.title, parser.title)  unless parser.title == record.title
          error_msg.push error_msg(:description, record.description, parser.description) unless parser.description == record.description
          error_msg.push error_msg(:keywords, record.keywords, parser.keywords) unless parser.keywords == record.keywords
          error_msg.push error_msg(:h1, record.h1, parser.h1) unless parser.h1 == record.h1
          error_msg.unshift "url: #{record.url}" unless error_msg.empty?
          error_msgs.push error_msg unless error_msg.empty?
        end
        error_msgs
      end

      private

      def error_msg(tag, expected, actual)
        "[#{tag}] expected: #{expected}, actual: #{actual}"
      end
    end
  end
end
