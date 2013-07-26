module ActionView
  module Helpers
    module FormHelper
      def form_for_with_foundation(record, options = {}, &block)
        options[:builder] ||= FoundationRailsHelper::FormBuilder
        options[:html] ||= {}
        options[:html][:class] ||= 'nice'
        content_tag :div, class: 'row columns large-4' do
          form_for_without_foundation(record, options, &block)
        end
      end
      
      def fields_for_with_foundation(record_name, record_object = nil, options = {}, &block)
        options[:builder] ||= FoundationRailsHelper::FormBuilder
        options[:html] ||= {}
        options[:html][:class] ||= 'nice'
        content_tag :div, class: 'row columns large-4' do
          fields_for_without_foundation(record_name, record_object, options, &block)
        end
      end
      
      alias_method_chain :form_for, :foundation
      alias_method_chain :fields_for, :foundation
    end
  end
end
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  html_tag
end