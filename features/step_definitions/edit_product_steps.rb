When('I update the name of the product') do
    @new_name = "product_test"
    fill_in "product[name]", with: @new_name
end

When('I click {string}') do |string|
    click_on string
end

Then('I should see the new name of the product') do
    expect(page).to have_content(@new_name)
end

When('I fill in the product information') do
    @name = "test"
    @price = 50
    fill_in "product[name]", with: @name
    fill_in "product[price]", with: @price
end

Then('I should see the product information') do
    expect(page).to have_content(@name)
    expect(page).to have_content(@price)
end

When('I click edit for the first product') do
    page.first('a', text: 'Edit').click
end
