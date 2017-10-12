class MARCDataFieldSorter

DataField = Struct.new(:tag, :ind1, :ind2, :subfields)

def initialize(record)
	@record = record
end

def datafields
	@record.datafields.sort_by(&:tag)
end

def method_missing(*args)
   	@record.send(*args)
end
end
