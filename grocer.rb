def consolidate_cart(cart)
  hash={}
  cart.each do |element|
    element_stats=element.keys[0]
    if hash[element_stats]
      hash[element_stats][:count]+=1
    else
      hash[element_stats]=element[element_stats]
      hash[element_stats][:count] = 1
    end
  end
  hash
end

def apply_coupons(cart, coupons) 
  coupons.each do |coupon| 
      name = coupon[:item]
      if cart[name]
      if cart[name][:count] >= coupon[:num] && !cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[name][:clearance], :count => coupon[:num]}
      elsif cart[name][:count] >= coupon[:num] && cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += coupon[:num] 
end
 cart[name][:count] -= coupon[:num]
end
end
cart
end

def apply_clearance(cart)
  cart.each do |item| 
    if !!item[:clearance]
      cart[:price]= (cart[:price] * 0.2).round(2)
    end 
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
