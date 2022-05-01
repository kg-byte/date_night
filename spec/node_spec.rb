require './lib/node'
require 'spec_helper'

RSpec.describe Node do 
  let(:node) { Node.new(61, "Bill & Ted's Excellent Adventure")}
 
  it 'exists' do 
  	expect(node).to be_a Node 
  end

  it 'has data' do 
  	expect(node.data).to eq({"Bill & Ted's Excellent Adventure"=>61})
  end 


  it 'starts with no left or right link' do 
  	expect(node.left).to be nil 
  	expect(node.right).to be nil 
  end
end
