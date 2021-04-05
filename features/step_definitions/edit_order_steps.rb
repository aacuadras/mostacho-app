When('I fill out the new order information') do
    @name = "test"
    fill_in "order[name]", with: @name
    #fill in each product with a quantity
    Product.all.each do |p|
        page.find('button', id: "addBtn[#{p.id}]").click
    end
end

Then('I should see the new order information') do
    expect(page).to have_content(@name)
    expect(page).to have_content(Product.first.name)
end

When('I update the order information') do
    @new_name = "testing"
    fill_in "order[name]", with: @new_name
end

Then('I should see the updated order information') do
    expect(page).to have_content(@new_name)
end

Then('I should see the updated status for the order') do
    expect(page).to have_content("Ready to Deliver")
end