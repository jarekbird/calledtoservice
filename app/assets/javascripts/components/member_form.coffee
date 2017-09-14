class MemberForm
  constructor: (node, members, model_name, member_type) ->
    @form = $(node)
    @members = members
    @model_name = model_name
    @member_type = member_type
    @member_search = @form.find(".member-search-input")
    @create_button = @form.find(".member-create")
    @creation_member_form = @form.find(".creation-member-form")
    @member_id_hidden_form_input = @form.find(".member-id")
    @search_results = @form.find(".search-results")
    @create_button.on 'click', @switch_to_input_member
    @member_search.on 'keyup', @search_for_member

  select_result: (e) =>
    target = e.target
    choice_id = target.data-result-id
    @member_search.val(e.val())
    @member_id_hidden_form_input = choice_id

  result_template: (result) =>
    "<div class='search-result' data-result-id=#{result.id}>
      #{result.first_name} #{result.last_name}
    </div>"

  input_search_results: (results) =>
    search_results_html = ""
    for result in results
      @search_results.append(@result_template(result))
    @search_results.html(search_results_html)
    @search_results.find(".search-result").on 'click', @select_result


  search_for_member: (e) =>
    @create_button.css("display", "inline")
    search_credentials = @member_search.val()
    results = item for item in @members when item.first_name.includes(search_credentials)
    @input_search_results(results)

  switch_to_input_member: () =>
    member_form_html = "<div class='field first-name-input'>
      <label for='#{@model_name}_#{@member_type}_attributes_first_name'>First name</label>
      <input type='text' name='#{@model_name}[#{@member_type}_attributes][first_name]' id='#{@model_name}_#{@member_type}_attributes_first_name' />
    </div>
    <div class='field last-name-input'>
      <label for='#{@model_name}_#{@member_type}_attributes_last_name'>Last name</label>
      <input type='text' name='#{@model_name}[#{@member_type}_attributes][last_name]' id='#{@model_name}_#{@member_type}_attributes_last_name' />
    </div>
    <div class='field phone-number-input'>
      <label for='#{@model_name}_#{@member_type}_attributes_phone_number'>Phone number</label>
      <input type='text' name='#{@model_name}[#{@member_type}_attributes][phone_number]' id='#{@model_name}_#{@member_type}_attributes_phone_number' />
    </div>
    <div class='field address-input'>
      <label for='#{@model_name}_#{@member_type}_attributes_address'>Address</label>
      <input type='text' name='#{@model_name}[#{@member_type}_attributes][address]' id='#{@model_name}_#{@member_type}_attributes_address' />
    </div>
    <div class='field email-input'>
      <label for='#{@model_name}_#{@member_type}_attributes_email'>Email</label>
      <input type='text' name='#{@model_name}[#{@member_type}_attributes][email]' id='#{@model_name}_#{@member_type}_attributes_email' />
    </div>"
    $(@creation_member_form).html(member_form_html)

Twine.register('MemberForm', MemberForm);
