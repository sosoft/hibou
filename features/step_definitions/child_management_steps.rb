include FamiliesHelper
Given /^these children are registered$/ do |children|
  children.hashes.each do |child|
    child['birth date'] ||= Date.today.to_s(:db)
    Given %{a child registered with:}, table([child]).transpose
  end
end

Given /^a child registered with:$/ do |child|
  Family.create!(:fathers_first_name => Faker::Name.first_name,
                 :fathers_last_name  => Faker::Name.last_name,
                 :mothers_first_name => Faker::Name.first_name,
                 :mothers_last_name  => Faker::Name.last_name,
                 :mothers_age_group  => humanize_mothers_age_groups.rand[0],
                 :email              => Faker::Internet.email,
                 :family_type        => humanize_family_types.rand[0],
                 :martial_status     => humanize_martial_statuses.rand[0],
                 :address            => Address.create!(
                       :civic_number => (1..100).to_a.rand,
                       :street       => Faker::Address.street_name,
                       :apartment    => (1..100).to_a.rand,
                       :city         => Faker::Address.city,
                       :province     => Faker::Address.state,
                       :postal_code  => Faker::Address.postcode
                   ),
                   :household_income   => humanize_income_brackets.rand[0])

  administer_children
  open_child_registration
  register_child(child.rows_hash)
end

When /^I consult "([^"]*)" "([^"]*)"'s file$/ do |first_name, last_name|
  administer_children
  open_child_file(first_name, last_name)
end

Then /^(?:|I) see the following notes:$/ do |notes|
  notes.hashes.each do |note|
    shows_child_public_note(note['public'])
    shows_child_private_note(note['private'])
  end
end

Then /^(?:|I) see that his name is "([^\"]*)" "([^\"]*)"$/ do |first_name, last_name|
  shows_child_first_name_is(first_name)
  shows_child_last_name_is(last_name)
end

Then /^(?:|I) see that his birth date is "([^\"]*)"$/ do |birth_date|
  shows_child_was_born_on(birth_date)
end

Then /^(?:|I) see that he is allergic to "([^\"]*)"$/ do |allergies|
  shows_child_is_allergic_to(allergies)
end

Then /^(?:|I) see that he expects a bottle$/ do
  shows_child_takes_a_bottle
end

Then /^(?:|I) see that he does not expect a snack$/ do
  shows_child_takes_a_snack(:no)
end

Then /^(?:|I) see that he needs a nap$/ do
  shows_child_needs_a_nap
end