class GenerateInvoices
    include Interactor

    def call
        context.order.create_invoices(context.products)
    end
end