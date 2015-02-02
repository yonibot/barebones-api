json.stories @stories do |story|
  json.partial! 'story', story: story
  json.sentences story.sentences do |sentence|
    json.partial! 'api/v1/shared/sentence', sentence: sentence
  end
end