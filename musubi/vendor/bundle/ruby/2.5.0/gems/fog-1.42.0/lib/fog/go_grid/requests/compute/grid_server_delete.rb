module Fog
  module Compute
    class GoGrid
      class Real
        # Delete a server
        #
        # ==== Parameters
        # * 'server'<~String> - id or name of server to delete
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Array>:
        # TODO: docs
        def grid_server_delete(server)
          request(
            :path     => 'grid/server/delete',
            :query    => {'server' => server}
          )
        end
      end
    end
  end
end
