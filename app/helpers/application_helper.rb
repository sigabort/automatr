module ApplicationHelper
  
  # Create a named link for an object
  # If we use the default paths
  # provided by Rails, that will generate 'show' paths using IDs. If we need
  # to use 'name' in the URL to access objects this method will
  # generate links based on the name attribute
  def named_link_to(object)
    link_to object.name, controller.controller_name + "/" + object.name
  end
  
  
end
