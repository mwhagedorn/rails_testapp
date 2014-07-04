Paperclip::Attachment.default_options.merge!(
{
   :storage => :fog,
   :fog_credentials => {
     :provider                => 'HP',
     :hp_auth_uri             => ENV['OS_AUTH_URL']+"/tokens",
     :hp_access_key           => ENV['OS_USERNAME'],
     :hp_secret_key           => ENV['OS_PASSWORD'],
     :hp_tenant_id            => ENV['OS_TENANT_ID'],
     :hp_avl_zone             => ENV['OS_REGION_NAME'],
     :hp_use_upass_auth_style => true,
     :connection_options => {
       :instrumentor => ActiveSupport::Notifications,
       :middlewares => [
         Excon::Middleware::ResponseParser,
         Excon::Middleware::Expects,
         Excon::Middleware::Idempotent,
         Excon::Middleware::MyInstrumentor,
         Excon::Middleware::Mock
       ]

     }



   },
   :path => ":class/:attachment/:id/:style/:basename.:extension",
   :fog_public => true,
   :fog_attributes => {'Cache-Control' => "public, max-age=31557600"},
   :hp_storage_uri=>"https://region-a.geo-1.objects.hpcloudsvc.com/v1/57457043554366",
   :fog_directory=>"rails_test_container",
   :fog_host => "https://a248.e.akamai.net/cdn.hpcloudsvc.com/h690a6ea038a560afd7d2e4cd75a0a340/prodaw2/"
 }
)
