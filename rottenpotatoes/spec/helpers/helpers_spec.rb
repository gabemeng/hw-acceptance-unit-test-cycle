require 'rails_helper'

describe MoviesHelper do
  describe 'oddness method' do
    it 'returns even for even #' do
      expect(oddness(2)).to eq 'even'
    end

    it 'returns odd for odd #' do
      expect(oddness(3)).to eq 'odd'
    end
  end
end