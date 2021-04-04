class EditInvoices
    include Interactor

    def call
        context.order.edit_invoices(context.products)
    end
end