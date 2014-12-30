class ContactsController < ApplicationController
  
  def index
    render json: User.find_by_id(params[:id]).contacts.all
  end
  
  def create
    contact = Contact.new(contact_params)
      if contact.save
        render json: contact
      else
        render(
          json: contact.errors.full_messages, status: :unprocessable_entity
        )
      end
  end
  
  def show
    contact = Contact.find_by_id(params[:id])
    if contact
      render json: contact
    else
      render "No contact with that id"
    end
  end
  
  def update
    contact = Contact.find_by_id(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end      
  end
  
  def destroy
    contact = Contact.find_by_id(params[:id])
    contact.try(:destroy)
    render json: contact
  end
  
  def favorite
    contact = Contact.find_by_id(params[:id])
    contact[:favorites] = !contact[:favorites]
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end      
  end
  
  
  private
  
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end
end
