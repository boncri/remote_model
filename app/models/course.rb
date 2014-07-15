class Course
	cattr_accessor :site

	self.site = 'http://192.168.1.131/JsonService/ReadEntity.aspx'

	def teacher
		@teacher ||= from_site(:person, 1).first
	end

	def from_site(type, *ids)		
		json = Net::HTTP.get (URI("#{self.site}?type=#{type.to_s}&id=#{ids.join(',')}"))
		objs = ActiveSupport::JSON.decode(json)

		klass = type.to_s.capitalize.constantize

		objs.map { |o| klass.new.from_json(o.to_json) }
	end
end