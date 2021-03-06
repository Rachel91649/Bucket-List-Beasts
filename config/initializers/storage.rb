#CarrierWave configuration#

CarrierWave.configure do |config|
	config.storage = :fog
	config.fog_credentials = {
		provider: 'AWS',
		aws_access_key_id: ENV["aws_access_key_id"],
		aws_secret_access_key: ENV["aws_secret_access_key"],
		region: 'us-east-1'
	}
	config.fog_directory = "bucketlistbeasts"
	config.fog_public = false
end