class AmazonSignature

  attr_accessor :url, :secret

  def initialize(url:, secret:)
    self.url = url
    self.secret = secret
  end

  

end
