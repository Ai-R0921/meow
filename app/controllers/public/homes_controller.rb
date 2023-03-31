class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.order('id DESC').limit(4).published
    @post_lost_cats = PostLostCat.order('id DESC').limit(4).published
    # あいうえお順に並び替え-'その他'を選択肢から消す+'その他'を選択肢に加える→'その他'が選択肢の最後にくる
    @type = Type.select("name", "id").order("name asc") - [Type.find_by(name: 'その他')] + [Type.find_by(name: 'その他')]

    type_search = params[:type_search]
    if type_search != nil
      # Typeモデルから、選択されたtypeのidを持つ公開済みのpost_imagesのデータを取得し、searched_post_imagesに格納
      searched_post_images = Type.find_by(id: type_search).post_images.published
    end

    if type_search != nil
      searched_post_lost_cats = Type.find_by(id: type_search).post_lost_cats.published
    end
    # type検索
    if params[:type_search].present?
      # @resultsと@results_lostという空の箱を用意する
      @results = {}
      @results_lost = {}
      #上の検索結果としてのsearched_post_imagesをひとつずつ取り出す
      searched_post_images.each do |searched_post_image|
        # @resultsにsearched_post_imageを追加する
        @results[searched_post_image.created_at] = searched_post_image
      end

      searched_post_lost_cats.each do |searched_post_lost_cat|
        @results_lost[searched_post_lost_cat.created_at] = searched_post_lost_cat
      end

      # 日付順で並び替えを行い、htmlでeachできる形に変換する
      @results = @results.sort.to_h.values
      @results_lost = @results_lost.sort.to_h.values
    end
  end
end
