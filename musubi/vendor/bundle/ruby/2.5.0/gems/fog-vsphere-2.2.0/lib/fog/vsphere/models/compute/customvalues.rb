module Fog
  module Compute
    class Vsphere
      class Customvalues < Fog::Collection
        autoload :Customvalue, File.expand_path('../customvalue', __FILE__)

        model Fog::Compute::Vsphere::Customvalue

        attr_accessor :vm

        def all(_filters = {})
          requires :vm
          case vm
          when Fog::Compute::Vsphere::Server
            load service.list_vm_customvalues(vm.id)
          else
            raise 'customvalues should have vm'
          end
        end

        def get(key)
          requires :vm
          case vm
          when Fog::Compute::Vsphere::Server
            load service.list_vm_customvalues(vm.id)
          else
            raise 'customvalues should have vm'
          end.find { |cv| cv.key == key }
        end
     end
    end
  end
end
