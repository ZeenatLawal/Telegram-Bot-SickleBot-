require 'nokogiri'
require 'httparty'
require 'byebug'

module Scrapper
  class Health
  
    def tips_heading
      titles_arr = []
      url = "https://www.webmd.com/a-to-z-guides/living-with-sickle-cell"
      unparsed_page = HTTParty.get(url)
      parsed_page = Nokogiri::HTML(unparsed_page)
      parsed_page.xpath("//section//h2").each do |title|
        titles_arr << title.text
      end
      titles_arr 
    end
  
    def tips_content
      tips_arr = []
      url = "https://www.webmd.com/a-to-z-guides/living-with-sickle-cell"
      unparsed_page = HTTParty.get(url)
      parsed_page = Nokogiri::HTML(unparsed_page) 
      parsed_page.xpath("//section//ul//li").each do |tip_list|
        tips_arr << tip_list.text
      end
      tips_arr
    end
  end
end
