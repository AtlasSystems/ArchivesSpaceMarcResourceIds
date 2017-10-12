require_relative 'lib/marc_data_field_sorter'

MARCModel.class_eval do
	Log.info("Patching MARCModel to add uri mapping.")
	#alias_method :from_resource_orig, :from_resource
	singleton_class.send(:alias_method, :from_resource_orig, :from_resource)

	def self.from_resource(obj)
		#puts obj.inspect		
		if !@resource_map[:uri]
			Log.info("Adding URI to MARC resource map")
			@resource_map[:uri] = :handle_uri
		end

		Log.info("Calling original from_resource function.")
		self.from_resource_orig(obj)
	end

	def handle_uri(uri)
		Log.info("Handling uri" + uri.to_s)

		if !uri
			Log.info("Skipping nil URI")
			return
		end

		idFromUri = uri.split('/')[-1]
		df('035', ' ', ' ').with_sfs(['a', AppConfig[:marc_control_number_prefix] + idFromUri])
	end

end

MARCSerializer.add_decorator(MARCDataFieldSorter)