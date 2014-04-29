class SiteController < ApplicationController
	before_action :authenticate_user!
  def index
		# retrieve all Bookmarks ordered by descending creation timestamp
		
		# TODO: Validar se vale a pena listar todos os bookmarks de todos os clientes ou apenas os bookmarks do cliente logado

		@bookmarks = current_user.bookmarks.order('created_at desc')

		@expenses = current_user.expenses
  end
end
