class TwoFer
  CONFIG = {
    prefix: 'One for ',
    postfix: ', one for me.'
  }

  def initialize(name='you')
    @config = CONFIG.merge(name: name)
  end

  def self.two_fer(name='you')
    new(name).to_s
  end

  def to_s
    CONFIG[:prefix] + CONFIG[:name] + CONFIG[:postfix]
  end
end