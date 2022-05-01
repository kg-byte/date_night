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

end