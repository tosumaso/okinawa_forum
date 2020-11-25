class MemosController < ApplicationController
  def new
    @memo = Memo.new
  end

end
