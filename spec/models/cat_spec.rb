require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should be valid that cat cannot be created without a name" do
    # We removed the name, since we're testing for the name to be in the model
    cat = Cat.create(
      age: 9,
      enjoys: 'looking out the window',
      image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
    )
    expect(cat.errors[:name]).to_not be_empty
  end
  
  it "should be valid that cat cannot be created without an age" do
    # We removed the name, since we're testing for the name to be in the model
    cat = Cat.create(
      name: 'Kevin',
      enjoys: 'looking out the window',
      image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
    )
    expect(cat.errors[:age]).to_not be_empty
  end 

  it "should be valid that cat cannot be created without an enjoys" do
    # We removed the name, since we're testing for the name to be in the model
    cat = Cat.create(
      name: 'Kevin',
      age: 9,
      image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end 

  it "should be validate that an enjoy entry has a minimum of 10 characters" do
    # We removed the name, since we're testing for the name to be in the model
    cat = Cat.create(
      name: 'Kevin',
      age: 9,
      enjoys: 'looking',
      image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end 
end
