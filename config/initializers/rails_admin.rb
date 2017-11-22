RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Quiz' do
    edit do
      field :course
      field :quiz_type
      field :year
      field :instructions
      field :duration

      field :visibility

      field :questions
    end
  end

  config.model 'Question' do
    edit do
      field :quiz
      field :priority
      field :question_type

      field :number

      field :question do
        partial 'question_question'
      end

      field :choices do
        partial 'question_choices'
      end

      field :answer
      field :explanation

      field :title
      field :content do
        partial 'question_content'
      end
    end
  end


  config.model 'GoldPurchase' do
    list do
      field :user do
        formatted_value do # used in form views
          "#{value.email}"
        end

        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          "#{value.email}"
        end
      end

      field :amount do
        formatted_value do # used in form views
          "#{value} PG"
        end

        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          "#{value} PG"
        end
      end

      field :price do
        formatted_value do # used in form views
          "GHS #{value}"
        end

        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          "GHS #{value}"
        end
      end
      field :network
      field :gold_ledger_entry
      field :created_at
      field :updated_at
    end

    edit do
      field :user
      field :amount
      field :price
      field :network
      field :gold_ledger_entry
    end
  end
end
