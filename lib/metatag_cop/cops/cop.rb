# frozen_string_literal: true

module MetatagCop
  module Cops
    #
    class Cop
      attr_reader :records, :progress

      def initialize(records)
        @records = records
        @progress = Formatador::ProgressBar.new(
          records.length, color: 'green'
        )
      end

      def run
        results = []
        records.each do |record|
          result = []
          parser = MetatagCop::Parser.new(record.url)

          result.push error_msg(:title, record.title, parser.title) unless parser.title == record.title
          result.push error_msg(:description, record.description, parser.description) unless parser.description == record.description
          result.push error_msg(:keywords, record.keywords, parser.keywords) unless parser.keywords == record.keywords
          result.push error_msg(:h1, record.h1, parser.h1) unless parser.h1 == record.h1

          results.unshift({ url: record.url, res: result }) unless result.empty?

          progress.increment
        end

        kosi = Kosi::Table.new(connector_char: '-', separate_each_row: true)
        results.each do |result|
          Formatador.display_line("[red]#{result[:url]}[/]")
          result[:res].each do |error|
            print kosi.render(error)
          end
        end
      end

      private

      def error_msg(tag, expected, actual)
        [
          [
            "[#{tag}] expected",
            " [#{tag}] actual"
          ],
          [
            "#{expected} ",
            " #{actual}"
          ]
        ]
      end
    end
  end
end
