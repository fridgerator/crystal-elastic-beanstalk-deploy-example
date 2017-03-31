module EBTest
  module Server
    # 6 workers for t2.small instance:
    # https://support.cloud.engineyard.com/hc/en-us/articles/205407758-Worker-Allocation-on-Engine-Yard-Cloud
    def self.num_workers
      ENV["KEMAL_ENV"] == "production" ? 6 : 1
    end

    def self.run
      serve_static false

      if (EBTest::Cluster.isMaster)
        num_workers.times do |i|
          EBTest::Cluster.fork({"i" => i.to_s})
        end
        sleep
      else
        Kemal.run(3000)
      end
    end
  end
end
