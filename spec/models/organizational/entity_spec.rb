require 'rails_helper'

module Organizational
  shared_examples 'a valid entity' do
    it 'its Factory is valid' do
      expect(org).to be_valid
    end

    context 'is invalid when @name is' do
      it 'missing' do
          org.name = nil
          expect(org).not_to be_valid
      end

      it 'empty' do
          org.name = ''
          expect(org).not_to be_valid
      end

      it 'too short' do
          org.name = 'e'
          expect(org).not_to be_valid
      end

      it 'too long' do
          org.name = 'e' * 82
          expect(org).not_to be_valid
      end
    end

    context 'is invalid when @url is' do
      it 'missing' do
          org.url = nil
          expect(org).not_to be_valid
      end

      it 'empty' do
          org.url = ''
          expect(org).not_to be_valid
      end
    end
  end

  shared_examples 'an ActiveRecord with proper CRUD' do
    it 'has no records before creation' do
      expect(Entity.count).to eq(0)
    end

    it 'has records after creation' do
      org  # create object
      expect(Entity.count).to eq(org_count)
    end

    it 'has no records after destruction' do
      org.destroy
      expect(Entity.count).to eq(0)
    end
  end

  RSpec.describe Entity, type: :model do
    context 'with Prosper' do
      it_behaves_like 'a valid entity' do
        let(:org) { FactoryGirl.create(:prosper) }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:org) { FactoryGirl.create(:prosper) }
        let(:org_count) { 1 }
      end

      context 'with descriptions' do
        before(:each) do
          @org = FactoryGirl.create(:prosper)
          @en = @org.descriptions.new(definition: 'bla',
                                   full: 'bla bla bla')
          @en.language = Multilingual::Language.create(code: 'en')
        end

        it 'has 1 English description' do
          expect(Multilingual::Language.count).to eq(1)
          expect(@org.descriptions.first).to equal(@en)
        end

#        it_behaves_like 'a valid has_many polymorphic multilingual association' do
#        end
      end
    end

    context 'with Info-Compass' do
      it_behaves_like 'a valid entity' do
        let(:org) { FactoryGirl.create(:ic) }
      end

      it_behaves_like 'an ActiveRecord with proper CRUD' do
        let(:org) { FactoryGirl.create(:ic) }
        let(:org_count) { 1 }
      end
    end
  end
end
