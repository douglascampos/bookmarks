class SiteController < ApplicationController
  def index
		# retrieve all Bookmarks ordered by descending creation timestamp
		
		# TODO: Validar se vale a pena listar todos os bookmarks de todos os clientes ou apenas os bookmarks do cliente logado
		@bookmarks = Bookmark.order('created_at desc')
  end
end
