Given('there are orders with products') do
    @order1 = create(:order_with_products)
end

Then('I should see the list of orders') do
    expect(page).to have_content(@order1.name)
end

When('I click the first order') do
    click_on @order1.name
end

Then('I should see the order information') do
    expect(page).to have_content(@order1.name)
    expect(page).to have_content(@order1.delivery_date)
    expect(page).to have_content(@order1.get_status)
end