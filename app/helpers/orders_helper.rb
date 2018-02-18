module OrdersHelper

	def order_total
    	total = 0
    	sauda = Sauda.find(params[:sauda_id])
    	sauda.sauda_line_items.each do |item|
    		total = total + (item.rate*item.quantity)
    	end
    	return total
    end

end