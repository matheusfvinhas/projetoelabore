class PartnersController < ApplicationController

    def new
        @partner = Partner.new
    end

    def index
        @partner = Partner.all.order(created_at: :desc)
    end

    def confirm_partner_apply
        @partner = Partner.find(params[:id])
        @user = create_user(@partner)        
    
        if @user.save
            flash[:notice] = 'Parceria confirmada com sucesso.'
            confirm_partner            
            UserMailer.welcome(@user).deliver_later            
        else
            flash[:alert] = "Erro ao confirmar parceria."          
        end

        redirect_to partners_path
        
    end

    def send_partner_apply
        @partner = Partner.new(partner_params)
        @partner.confirmed = 'N'        
        
        if @partner.save
            flash[:notice] = 'Sua solicitação foi enviada com sucesso.'
            PartnersMailer.new_partner(@partner).deliver_later
            redirect_to root_path
        else
            flash[:alert] = "Erro ao enviar solicitação."  
            render :new        
        end

    end

    private
        def partner_params()
            params.require(:partner).permit(:name, :responsible, :email, :about)
        end

        def confirm_partner
            @partner.confirmed = 'S'
            @partner.save!
        end

        def create_user(partner)
            user = User.new
            user.name = partner.name
            user.responsible = partner.responsible
            user.email = partner.email
            user.password = Devise.friendly_token.first(8)
            user.new_user = 'S'
            user
        end
end
