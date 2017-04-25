# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

module MetatagCop
  #
  class Parser
    attr_accessor :document

    def initialize(url)
      @document = parse(url)
    end

    def title
      document.css('head title').inner_text
    end

    def description
      document.at('meta[name=description]')['content']
    end

    def keywords
      document.at('meta[name=keywords]')['content']
    end

    def h1
      h1 = document.at('h1')
      return h1['content'] unless h1['content'].nil?

      # it regards alt as h1 content if h1 content is blank.
      a = find_tag_by(h1, 'a')
      img = find_tag_by(a, 'img')
      img.attributes['alt'].value
    end

    private

    def find_tag_by(parent, tag)
      parent.children.find { |child| child.name == tag }
    end

    def parse(url)
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      Nokogiri::HTML.parse(html, nil, charset)
    end
  end
end
