Paperclip::Attachment.default_options.merge!(
{
   :storage => :fog,
   :fog_credentials => {
     :provider       => 'HP',
     :hp_access_key  => 'XXXXXXXXX',
     :hp_secret_key  => 'XXXXXXXXXXXXXX',
     :hp_auth_uri    => "https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/",
     :hp_tenant_id   => "XXXXXXXXX",
     :hp_avl_zone    => "region-a.geo-1"
   },
   :path => ":class/:attachment/:id/:style/:basename.:extension",
   :fog_public => true,
   :fog_attributes => {'Cache-Control' => "public, max-age=31557600"},
   :hp_storage_uri=>"https://region-a.geo-1.objects.hpcloudsvc.com/v1/28566939396928", 
   :fog_directory=>"XXXXXXXXXX", 
 }
)
