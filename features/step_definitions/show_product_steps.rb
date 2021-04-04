Given('there are products') do
    @product1 = create(:product)
    @product2 = create(:product)
end

When('I visit the homepage') do
    visit root_path
end

Then('I should see the list of products') do
    expect(page).to have_content(@product1.name)
    expect(page).to have_content(@product2.name)
end

When('I click the first product') do
    click_on @product1.name
end

Then('I should see the name and price of the product') do
    expect(page).to have_content(@product1.name)
    expect(page).to have_content(@product1.price)
    expect(page).not_to have_content(@product2.name)
end