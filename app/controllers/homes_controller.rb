class HomesController < ApplicationController
  def index
    puts "============"
    puts session.inspect
    puts "============"
  end
end
