require "kemal"

require "./EBTest/controllers/*"
require "./EBTest/*"

module EBTest
end

EBTest::Server.run