require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  let(:json) { {id: 123, first_name: 'xxx', last_name: 'yyy'}}
  let(:first_name) { "xxx #{Digest::MD5.hexdigest('xxx')}"}
  let(:last_name) { "yyy #{Digest::MD5.hexdigest('yyy')}"}
  let(:expected) { {id: 123, first_name: first_name, last_name: last_name, say: RUBY_MSG} }


  it "should allow accessing the home page", focus: true do
    post '/', json.to_json, {format: :json}
    expect(last_response).to be_ok
    expect(last_response.body).to include_json(expected)
  end
end