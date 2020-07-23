class Post < ApplicationRecord
    def self.search(search)
        search ? where('title LIKE ? or id LIKE ?', "%#{search}%" , "%#{search}%") : all
      end
end
