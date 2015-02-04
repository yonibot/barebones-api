  json.id story.id
  json.title story.title
  json.sentences story.sentences do |sentence|
    json.partial! 'api/v1/shared/sentence', sentence: sentence
  end