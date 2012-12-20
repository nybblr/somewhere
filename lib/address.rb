class Address
	attr_accessor :label
	attr_accessor :street_1
	attr_accessor :street_2
	attr_accessor :city
	attr_accessor :state
	attr_accessor :postal_code
	attr_accessor :country
	
	alias_attribute :zip, :postal_code
	
	def initialize(*args)
		case args.first
			when Hash
				fields = args.first
				self.label = fields[:label]
				self.street_1 = fields[:street_1]
				self.street_2 = fields[:street_2]
				self.city = fields[:city]
				self.state = fields[:state]
				self.postal_code = fields[:postal_code] || fields[:zip]
				self.country = fields[:country]
			else
				# Constructor for Rails mapper
				self.label = args[0]
				self.street_1 = args[1]
				self.street_2 = args[2]
				self.city = args[3]
				self.state = args[4]
				self.postal_code = args[5]
				self.country = args[6]
		end
	end
	
	def to_s(format=nil)
		options = {:label => true, :country => true, :delimiter => ", "}
		
		case format
			when Hash
				options.merge! format
			when Symbol
				case format
					when :one_line; options[:delimiter] = ", "
					when :multi_line; options[:delimiter] = "\n"
				end
		end
		
		fields = []
		fields << :label if options[:label]
		fields += [:street_1, :street_2, :city_state_post]
		fields << :country if options[:country]
		
		city_state_post = nil
		unless city.blank? and state.blank? and postal_code.blank?
			city_state_post = "#{city}, #{state} #{postal_code}"
		end
		
		fields.map {|a| eval a.to_s }.reject(&:blank?).join options[:delimiter]
	end
	
	def to_hash(opts={})
		fields = [:label, :street_1, :street_2, :city, :state, :postal_code, :country]
		options = { :exclude => [] } if opts.blank?
		
		if options[:include].present?
			fields = options[:include]
		elsif options[:exclude].present?
			fields -= options[:exclude]
		end
		
		hash = {}
		for f in fields do
			hash[f] = send f
		end
		
		hash
	end
end