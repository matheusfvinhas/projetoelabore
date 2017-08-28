class ParceirosController < ApplicationController

    def new
        @parceiro = Parceiro.new
    end

    def enviar_pedido_parceria
        @parceiro = Parceiro.new(parceiro_params)
        flash[:notice] = 'Sucesso'
        ParceirosMailer.pedir_parceria(@parceiro.nome, @parceiro.responsavel, @parceiro.email, @parceiro.sobre).deliver_later
        redirect_to root_path
    end

    private
        def parceiro_params()
            params.require(:parceiro).permit(:nome, :responsavel, :email, :sobre)
        end
end
