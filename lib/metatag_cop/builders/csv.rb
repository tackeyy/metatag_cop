# frozen_string_literal: true

module MetatagCop
  module Builders
    #
    class Csv
      def self.build(file_path)
        records = []
        CSV.table(file_path).each do |row|
          records.push MetatagCop::Models::Csv.new(
            url: row[:url],
            title: row[:title],
            description: row[:description],
            keywords: row[:keywords],
            h1: row[:h1]
          )
        end
        records
      end
    end
  end
end
