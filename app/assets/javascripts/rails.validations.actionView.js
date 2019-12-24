window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
    add: function(element, settings, message) {
      // custom add code here
      element.addClass('is-invalid');
      const attrVal = element.attr('name');
      let fieldName = attrVal.slice(attrVal.indexOf('[')+1, attrVal.indexOf(']'));
    
      //making the first letter uppercase
     fieldName =  fieldName.charAt(0).toUpperCase() + fieldName.slice(1)

      if(element.parent().has('div').length == 0){
          element.parent().append('<div class="invalid-feedback">'+ fieldName +' '+message+'</div>')  
      }
    },
  
    remove: function(element, settings) {
      // custom remove code here
      element.parent().remove('.invalid-feedback');
      element.removeClass('is-invalid');

    }
}