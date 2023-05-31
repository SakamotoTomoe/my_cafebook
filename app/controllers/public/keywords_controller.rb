class Public::KeywordsController < ApplicationController
    
  def search
    begin
      selected_tag_ids = selected_tags_params # Tag id array checked with form.
      filtered_keyword_ids = Keyword.filter(selected_tag_ids) # Memo id array filtered with checked tag by And condition.
      @keywords = Keyword.where(id: filtered_keyword_ids) # Memos instance selected with filtered memo ids.
    rescue
      redirect_to root_path
    end
  end
  
  private
  
  def selected_tags_params
    params.require(:keyword_ids)
  end
  
end
