class OrderPdf < Prawn::Document
    def initialize(order)
      super(top_margin: 70)
      text "INVOICE"     
    end
  end
