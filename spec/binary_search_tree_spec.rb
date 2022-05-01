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
end