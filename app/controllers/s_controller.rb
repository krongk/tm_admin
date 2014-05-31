class SController < ApplicationController
  layout 'site'
  include SHelper

  def index
    #need site id params
    not_found if params.delete_if {|k, v| ['controller', 'action'].include?(k)}.empty?
    
    #@site = Site.find_by(short_title: params[:site_id])
    @site_page = SitePage.find_by(short_title: params[:short_title])
    @site = @site_page.site
    
  end

  def search
  end

  def tag

  def book
  end

  def comment
  end

  def forward
  end

  def digg
  end
end
