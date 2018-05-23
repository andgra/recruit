RecruitSchema = GraphQL::Schema.define do
  rescue_from(ActiveRecord::RecordNotFound) { 'Not found' }
  query(Types::QueryType)
  mutation(Types::MutationType)
end
