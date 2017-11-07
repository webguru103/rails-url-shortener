class Url < ActiveRecord::Base
	class << self
		def find_or_create_by_handle(handle)
			begin
				Url.find_or_create_by_handle(handle: handle)
			rescue ActiveRecord::RecordNotUnique
				Rails.logger.warn { "Encountered a non-fatal RecordNotUnique error for: #{handle}" }
				retry
			rescue Exception => e
				Rails.logger.error { "Encountered an error when trying to find or create Person for: #{handle}, #{e.backtrace.join("\n")}" }
				nil
			end
		end
	end
end