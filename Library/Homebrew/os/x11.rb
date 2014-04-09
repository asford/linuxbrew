module OS
  module X11
    extend self

    def installed?
      @installed ||= detect_installed
    end

    def detect_installed
      version ? true : false
    end

    def version
      @version ||= detect_version
    end

    def detect_version
      begin
        ldd_result = `ldconfig -v -N 2>/dev/null | grep libX11.so`
        ldd_result.match /libX11.so.(\d+)/
      rescue Errno::ENOENT
      end
    end
  end
end
