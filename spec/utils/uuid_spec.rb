require "spec_helper"

describe Uuid do
  it "matches a correct UUID v4" do
    expect("7cddd700-e049-42d5-a495-6c54d7959226").must_match Uuid.regular_expression
  end

  it "matches a correct UUID v4" do
    expect("7CDDD700-E049-42D5-A495-6c54d7959226").must_match Uuid.regular_expression
  end

  it "doesn't match a misformed UUID v4: the 15th byte should be a 4" do
    expect("7cddd700-e049-62d5-a495-6c54d7959226").wont_match Uuid.regular_expression
  end

  it "doesn't match a misformed UUID v4: the 20th byte should be 8, 9, A, or B" do
    expect("7cddd700-e049-42d5-7495-6c54d7959226").wont_match Uuid.regular_expression
  end

  it "doesn't match a misformed UUID v4: it contains 4 hyphens" do
    expect("7cddd700-e049_42d5-a495-6c54d7959226").wont_match Uuid.regular_expression
  end

  it "doesn't match a misformed UUID v4: it is lenght of 36 bytes" do
    expect("7cddd700-e049-42d5-a495-6c54d795922").wont_match Uuid.regular_expression
  end
end
