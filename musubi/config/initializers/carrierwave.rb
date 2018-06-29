if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => ENV['ap-northeaset-1'],     # 例: 'ap-northeast-1'
        :aws_access_key_id     => ENV['AKIAIOQMZ2WLJEAH7GNQ'],
        :aws_secret_access_key => ENV['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']
      }
      config.fog_directory     =  ENV['musubi-thanks']
    end
end