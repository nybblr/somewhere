require 'address'

module Somewhere
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def address method=nil, opts = {}
    	options = { :include_prefix => true, :label => false, :country => true }
    	options.merge! opts
    	
    	if method.blank?
    		options[:include_prefix] = false
    		method = :address
    	end
		  
		  mapping = [:label, :street_1, :street_2, :city, :state, :postal_code, :country]
		  
		  mapping.collect! { |f|
		  	options[f] ||= options[:include_prefix] ? method.to_s+'_#{f}' : f.to_s unless options[f] == false
		  	[options[f], f.to_s] unless options[f] == false
		  }.compact!
		  
		  composed_of method.to_sym,
		  	:class_name => "Address",
		  	:allow_nil => true,
		  	:mapping => mapping,
		  	:converter => Proc.new { |value| value.respond_to?(:to_address) ? (value.to_address unless value.blank?) : raise(ArgumentError, "Can't convert #{value.class} to Address") }
    end
  end
end

# Include as a model instance method
class ActiveRecord::Base
  include Somewhere
end