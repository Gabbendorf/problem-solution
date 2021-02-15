# frozen_string_literal: true

require 'spec_helper'
require 'full_articles_serializer'
require 'full_article'

RSpec.describe FullArticlesSerializer do
  let(:full_articles) {
    [
      FullArticle.new(
        "10.1234/altmetric0",
        "Small Wooden Chair",
        ["Amari Lubowitz", "Lenny Kshlerin"],
        "Shanahan, Green and Ziemann",
        "1337-8688"
      )
    ]
  }

  it "serializes full articles into json" do
    json = FullArticlesSerializer.serialize(full_articles, "json")

    expected_json = "[{\"doi\":\"10.1234/altmetric0\",\"title\":\"Small Wooden Chair\",\"authors\":\"Amari Lubowitz, Lenny Kshlerin\",\"journal\":\"Shanahan, Green and Ziemann\",\"issn\":\"1337-8688\"}]"
    expect(json).to eq(expected_json)
  end

  it "serializes full articles into csv" do
    csv = FullArticlesSerializer.serialize(full_articles, "csv")

    expect(csv).to eq("10.1234/altmetric0,Small Wooden Chair,\"Amari Lubowitz, Lenny Kshlerin\",\"Shanahan, Green and Ziemann\",1337-8688\n")
  end
end
