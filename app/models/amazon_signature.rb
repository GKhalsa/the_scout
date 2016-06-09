class AmazonSignature

   attr_accessor :url, :secret

  def initialize(url:, secret:)
     self.url = url
     self.secret = secret
  end

  def sign
   host_and_path, params = *self.url.split("?")
   params = params.gsub(",","%2C").gsub(":","%3A")
   canonical = params.split("&").sort.join("&")
   data = ['GET', 'webservices.amazon.com', '/onca/xml', canonical].join("\n")
   sha256 = OpenSSL::Digest::SHA256.new
   sig = OpenSSL::HMAC.digest(sha256, self.secret, data)
   signature = Base64.encode64(sig).strip
   signature = signature.gsub("+", "%2B").gsub("=", "%3D")
   "#{host_and_path}?#{canonical}&Signature=#{signature}"
  end

end
