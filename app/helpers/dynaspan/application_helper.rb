module Dynaspan
  module ApplicationHelper

    def dynaspan_text_field(master_ds_object,*parameters)
      dynaspan_text('field', master_ds_object, parameters)
    end

    def dynaspan_text_area(master_ds_object,*parameters)
      dynaspan_text('area', master_ds_object, parameters)
    end

    private

    def dynaspan_counter
      @count_for_viewspace = @count_for_viewspace.to_i + 1
    end

    def dynaspan_text(kind, master_ds_object,*parameters)
      parameters.flatten!
      if parameters.first.is_a? Symbol
        attr_object = nil
        attrib = parameters.first
        edit_text = parameters.try(:[],1)
      elsif parameters[1].is_a? Symbol
        attr_object, attrib = parameters
        edit_text = parameters.try(:[],2)
      else
        raise 'You did not provide a symbol for the form field.'
      end
      render(
          partial: "dynaspan/dynaspan_text_#{kind}",
          locals: {
              master_ds_object: master_ds_object,
              attr_object: attr_object,
              attrib: attrib,
              unique_ref_id: dynaspan_counter,
              dyna_span_edit_text: edit_text
          }
      )
    end
  end
end