require 'pry'

def consolidate_cart(cart)
  new_cart = {}
  cart.each do |x|
    if new_cart[x.keys[0]]
      new_cart[x.keys[0]][:count] += 1
    else
      new_cart[x.keys[0]] = {
        count: 1,
        price: x.values[0][:price],
        clearance: x.values[0][:clearance]
      }
    end
  end
  new_cart
  #binding.pry
end

def apply_coupons(cart, coupons)
  coupons.each do |x|
    if cart.keys.include? x[:item]
      if cart[x[:item]][:count] >= x[:num]
        is_coupon = "#{x[:item]} W/COUPON"
        if cart[is_coupon]
          cart[is_coupon][:count] += x[:num]
        else
          cart[is_coupon] = {
            count: x[:num],
            price: x[:cost]/x[:num],
            clearance: cart[x[:item]][:clearance]
          }
        end
        cart[x[:item]][:count] -= x[:num]
      end
    end
  end
  cart
  #binding.pry
end

def apply_clearance(cart)
#binding.pry
end

def checkout(cart, coupons)
#binding.pry
end
