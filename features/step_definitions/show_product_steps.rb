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