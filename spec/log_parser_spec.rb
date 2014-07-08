require 'spec_helper'

describe LogParser do
  let(:logfile) {
    <<LOG
D, [2014-05-10T14:48:19.094145 #85971] DEBUG -- : drive transparent e-tailers
W, [2014-05-11T14:48:19.101485 #85971]  WARN -- : brand frictionless methodologies
I, [2014-05-11T14:48:19.101596 #85971]  INFO -- : optimize value-added applications
LOG
  }
  let(:tenth) { Date.parse('2014-05-10') }
  let(:eleventh) { Date.parse('2014-05-11') }
  let(:twelfth) { Date.parse('2014-05-12') }
  subject { LogParser.new(logfile) }

  it 'has 3 lines' do
    subject.total_lines.should eq 3
  end

  it 'knows what dates it covers' do
    subject.covered_dates.should eq [tenth, eleventh]
  end

  it 'knows how many lines are contained in each date' do
    subject.line_count_for_date(tenth).should eq 1
    subject.line_count_for_date(eleventh).should eq 2
    subject.line_count_for_date(twelfth).should be_zero
  end

  it 'returns the severity and count of the severity' do
    subject.severity_counts.should eq(
      'DEBUG' => 1,
      'WARN'  => 1,
      'INFO'  => 1
    )
  end

end