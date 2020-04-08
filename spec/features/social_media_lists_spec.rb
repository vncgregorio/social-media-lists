require 'rails_helper'

RSpec.describe "SocialMediaLists", type: :feature do

  before(:all) do
    first_network = create(:network,
                            :name => "twitter")
    second_network = create(:network,
                            :name => "facebook")

    first_person = create(:person,
                            :name => "First Person")
    second_person = create(:person,
                            :name => "Second Person")

    first_social_media_account = create(:social_media_account,
                            :person => first_person,
                            :network => first_network,
                            :profile_link => "https://www.twitter.com/first"
                          )
    second_social_media_account = create(:social_media_account,
                            :person => first_person,
                            :network => second_network,
                            :profile_link => "https://www.facebook.com/first"
                          )
    third_social_media_account = create(:social_media_account,
                            :person => second_person,
                            :network => first_network,
                            :profile_link => "https://www.twitter.com/second"
                          )
    fourth_social_media_account = create(:social_media_account,
                            :person => second_person,
                            :network => second_network,
                            :profile_link => "https://www.facebook.com/second"
                          )

    first_post = create(:post,
                            :social_media_account => first_social_media_account,
                            :content => 'first'
                          )
    second_post = create(:post,
                            :social_media_account => second_social_media_account,
                            :content => 'second'
                          )
    third_post = create(:post,
                            :social_media_account => third_social_media_account,
                            :content => 'third'
                          )
    fourth_post = create(:post,
                            :social_media_account => fourth_social_media_account,
                            :content => 'fourth'
                          )

    first_list = create(:list,
                            :name => "First list"
                          )
    second_list = create(:list,
                            :name => "Second list"
                          )

    first_list_member = create(:list_member,
                            :person => first_person,
                            :list => first_list
                          )
    second_list_member = create(:list_member,
                            :person => second_person,
                            :list => second_list
                          )
  end

  before(:each) do
    visit "/"
  end

  scenario 'with default filters' do
    expect(page).to have_text('4 records')
  end

  scenario 'with text search filter' do    
    fill_in 'content', :with => 'rst'
    click_button 'filter'
    expect(page).to have_text('1 record')
  end

  scenario 'with network filter' do
  end

  scenario 'with initial post date filter' do
  end

  scenario 'with final post date filter' do
  end

  scenario 'with list filter' do
  end

end
