json.array!(@nolists) do |nolist|
  json.extract! nolist, :name, :uid, :id
  components = []
  nolist.component_lists.each do |cl|
    components << {apid: cl.apid, name: cl.name}
  end
  json.components components
end