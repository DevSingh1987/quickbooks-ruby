module Quickbooks
  module Service
    class Klass < BaseService

      def update(entity, options = {})
        raise Quickbooks::InvalidModelException.new('Class sparse update is not supported by Intuit at this time') if options[:sparse] && options[:sparse] == true
        super(entity, options)
      end

      def delete(klass)
        klass.active = false
        update(klass, :sparse => false)
      end

      private

      def model
        Quickbooks::Model::Klass
      end

    end
  end
end
