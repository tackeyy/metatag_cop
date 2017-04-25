# frozen_string_literal: true

module MetatagCop
  module Models
    #
    class Csv
      attr_reader :url, :title, :description, :keywords, :h1

      def initialize(url: nil, title: nil,
                     description: nil, keywords: nil, h1: nil)
        @url         = url
        @title       = title
        @description = description
        @keywords    = keywords
        @h1          = h1
      end
    end
  end
end
