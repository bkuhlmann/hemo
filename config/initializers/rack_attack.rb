# frozen_string_literal: true

require "ipaddr"
require "rack/attack"

private_subnets = [
  IPAddr.new("10.0.0.0/8"),
  IPAddr.new("172.16.0.0/12"),
  IPAddr.new("192.168.0.0/16"),
  IPAddr.new("127.0.0.1"),
  IPAddr.new("::1")
]

Rack::Attack.safelist "allow private network" do |request|
  private_subnets.any? { |subnet| subnet.include? request.ip }
end

Rack::Attack.throttle("requests by IP", limit: 100, period: 60, &:ip)
