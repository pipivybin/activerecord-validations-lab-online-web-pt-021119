class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait

    def clickbait
        if !title.nil? && !title.include?("You Won't" || "Secret" || "Top" || "Guess")
            errors[:title] << 'Not enough clickbait!'
    end
end
end


