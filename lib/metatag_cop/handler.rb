# frozen_string_literal: true

require 'csv'
require 'nokogiri'

require_relative 'parser'
require_relative 'cops/cop'
require_relative 'models/csv'
require_relative 'builders/csv'

module MetatagCop
  #
  class Handler
    def self.execute
      file_path = ARGV[0]

      return print 'Require file path as a first argument.' if file_path.nil?

      records = MetatagCop::Builders::Csv.build(file_path)
      MetatagCop::Cops::Cop.new(records).run
    end
  end
end

if __FILE__ == $0
  MetatagCop::Handler.execute
end
