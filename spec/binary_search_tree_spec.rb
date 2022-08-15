require 'spec_helper'
require './lib/binary_search_tree'


RSpec.describe BinarySearchTree do 

  let(:tree) {BinarySearchTree.new}

  it 'exists' do 
    expect(tree).to be_a BinarySearchTree
  end

  it 'inserts nodes and returns the depth of current node' do 
    expect(tree.insert(61, "Bill & Ted's Excellent Adventure")).to eq 0
    expect(tree.insert(16, "Johnny English")).to eq 1
    expect(tree.insert(92, "Sharknado 3")).to eq 1
    expect(tree.insert(50, "Hannibal Buress: Animal Furnace")).to eq 2
  end

  it 'checks whether a score exists in the BST' do 
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.include?(61)).to be true
    expect(tree.include?(16)).to be true
    expect(tree.include?(15)).to be false 
  end

  it 'returns a depth of a score if exists' do 
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.depth_of(61)).to eq 0
    expect(tree.depth_of(16)).to eq 1
    expect(tree.depth_of(50)).to eq 2
    expect(tree.depth_of(28)).to eq nil 
  end

  it 'returns the data of movie with max score' do 
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.max).to eq({"Sharknado 3" => 92})
  end

  it 'returns the data of movie with min score' do 
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(92, "Sharknado 3")

    expect(tree.min).to eq({"Johnny English" => 16})
  end

  it 'returns the data of movie with min score' do 
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")

    expect(tree.sort).to eq([{"Johnny English"=>16},
  {"Hannibal Buress: Animal Furnace"=>50},
  {"Bill & Ted's Excellent Adventure"=>61},
 {"Sharknado 3"=>92}])
  end

  it 'load txt data and creates binary_search_tree' do 
    expect(tree.load('./db/data/movies_sample.txt')).to eq(6)
  end

  it 'reports the health of tree' do 
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    expect(tree.health(0)).to eq([[98, 7, 100]])
    expect(tree.health(1)).to eq([[58, 6, 85]])
    expect(tree.health(2)).to eq([[36, 2, 28], [93, 3, 42]])
  end
end