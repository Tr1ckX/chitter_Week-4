require 'spec_helper'

describe Message do

  context 'Demonstration of how datamapper works' do
    it 'should be created and then retrieved from the db' do
      expect(Message.count).to eq(0)
      Message.create(text: '1st test message')
      expect(Message.count).to eq(1)
      test_message = Message.first
      expect(test_message.text).to eq('1st test message')
      test_message.destroy
      expect(Message.count).to eq(0)
    end
  end
end
