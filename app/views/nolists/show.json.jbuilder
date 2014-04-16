json.extract! @nolist, :id, :name, :uid

components = []
@nolist.component_lists.each do |cl|
  components << cl
end

json.components components