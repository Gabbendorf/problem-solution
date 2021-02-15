# frozen_string_literal: true

require 'spec_helper'
require 'full_article'

RSpec.describe FullArticle do
  let(:full_article) {
    FullArticle.new(
      "10.1234/altmetric0",
      "Small Wooden Chair",
      ["Amari Lubowitz", "Lenny Kshlerin"],
      "Shanahan, Green and Ziemann",
      "1337-8688"
    )
  }

  it "converts its values into a hash" do
    expected = {
      doi: "10.1234/altmetric0",
      title: "Small Wooden Chair",
      authors: "Amari Lubowitz, Lenny Kshlerin",
      journal: "Shanahan, Green and Ziemann",
      issn: "1337-8688"
    }

    expect(full_article.to_hash).to eq(expected)
  end

  it "converts its values into an array" do
    expected = ["10.1234/altmetric0", "Small Wooden Chair", "Amari Lubowitz, Lenny Kshlerin", "Shanahan, Green and Ziemann", "1337-8688"]

    expect(full_article.to_array).to eq(expected)
  end
end
