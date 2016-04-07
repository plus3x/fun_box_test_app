### Given-s ###

Given "I'm on $page_name page" do |page_name|
  start = Time.zone.now
  until on(page_class(page_name)).active?
    visit send(page_name.downcase.sub(' ', '_') + '_path')
    raise "Can't go to the page #{page_name}" if Time.zone.now > start + 5
  end
end

### When-s ###

### Then-s ###

Then 'I see $page_name page' do |page_name|
  on(page_class(page_name)).verify_active
end

def page_class(page_name)
  "#{page_name.split(' ').map(&:capitalize).join}Page".constantize
end
