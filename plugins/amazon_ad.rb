# Title: Amazon Ad for Jekyll
# Authors: namacode http://namacode.asia
# Description: Put Amazon ad easily.
#
# Syntax {% ASIN %}
#
# Examples:
# {% amazon 4861521092 %}
#
# Output:
# <a href="http://www.amazon.com/gp/product/4861521092/ref=as_li_tf_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=4861521092&linkCode=as2&tag=nc0619-20"><img border="0" src="http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=4861521092&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=nc0619-20" ></a><img src="http://www.assoc-amazon.com/e/ir?t=nc0619-20&l=as2&o=1&a=4861521092" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
#

module Jekyll
  class AmazonTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @asin = markup[/([0-9]+)/i, 1]
      @code = "nc0619-20"
      super
    end

    def render(context)
      if @asin && @code
        %{<a href="http://www.amazon.com/gp/product/#{@asin}/ref=as_li_tf_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=#{@asin}&linkCode=as2&tag=#{@code}" target="_blank"><img border="0" src="http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=#{@asin}&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=#{@code}" ></a><img src="http://www.assoc-amazon.com/e/ir?t=#{@code}&l=as2&o=1&a=#{@asin}" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />}
      else
        "Error processing input, expected syntax: {% amazon ASIN %}"
      end
    end
  end
end

Liquid::Template.register_tag('amazon', Jekyll::AmazonTag)
