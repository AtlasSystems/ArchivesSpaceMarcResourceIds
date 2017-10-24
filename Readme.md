ArchivesSpace MARC Resource ID Serializer
==========================================
This plugin serializes ArchivesSpace Resource IDs as System Control Number fields (035a) and resource URIs as Electronic Location and Access fields (856u) for MARC exports. 

**To enable and configure the plugin, add the following after your list of plugins has been initialized*
```ruby
AppConfig[:plugins] << 'marc_resource_ids'
AppConfig[:marc_control_number_prefix] = '(SampleSystemIDPrefix)'
```

For further guidance and examples regarding System Control Number prefixes, visit https://www.loc.gov/marc/bibliographic/concise/bd035.html