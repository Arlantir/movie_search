require 'film'

describe Film do
  let(:film) { Film.new('Холодное сердце 2', 'Крис Бак, Дженнифер Ли', 1959) }

  it 'assigns instance variables' do
    expect(film.title).to eq 'Холодное сердце 2'
    expect(film.director).to eq 'Крис Бак, Дженнифер Ли'
    expect(film.year).to eq 1959
  end

  describe '#to_s' do
    it 'return values' do
      expect(film.to_s).to eq 'Крис Бак, Дженнифер Ли - Холодное сердце 2 1959'
    end
  end
end
