# frozen_string_literal: true

RSpec.describe SubdomainConstraints do
  describe SubdomainConstraints::Account do
    subject { described_class.matches?(request) }

    let(:request) { instance_double('ActionDispatch::Request', subdomain: 'foo') }

    describe '#self.matches?' do
      it { is_expected.to be_truthy }
    end
  end

  describe SubdomainConstraints::NotAccount do
    subject { described_class.matches?(request) }

    let(:request) { instance_double('ActionDispatch::Request', subdomain: 'foo') }

    describe '#self.matches?' do
      it { is_expected.to be_falsey }
    end
  end

  describe '#could_be_account?' do
    subject { described_class.could_be_account?(subdomain) }

    context 'when the subdomain is blank' do
      let(:subdomain) { '' }

      it { is_expected.to be_falsey }
    end

    context 'when the subdomain is a non-account subdomain' do
      let(:subdomain) { 'www' }

      it { is_expected.to be_falsey }
    end

    context 'when the subdomain could be an account' do
      let(:subdomain) { 'foo' }

      it { is_expected.to be_truthy }
    end
  end
end
