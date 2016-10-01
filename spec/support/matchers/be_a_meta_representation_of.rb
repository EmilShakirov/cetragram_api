RSpec::Matchers.define :be_a_meta_representation_of do |collection, params|
  match do |json|
    params = params.stringify_keys
    meta = json["meta"]

    expect(json).to be
    expect(meta).to include("pagination")

    expect(meta["pagination"]["page"]).to eq params["page"]
    expect(meta["pagination"]["per_page"]).to eq params["per_page"]
    expect(meta["pagination"]["total"]).to eq collection.size
  end
end
