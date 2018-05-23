Types::QueryType = GraphQL::ObjectType.define do
 name 'Query'
 description 'The query root for RecruitSchema'
 # root-level fields here.
 # Entry points for queries on TimeshareSchema.

 # All companies
 field :all_companies do
   type types[Types::CompanyType] # types declaration for collection
   description 'All Companies'
   argument :size,   types.Int,
            default_value: 15
   resolve ->(obj, args, ctx) {
     Company.all.limit(args[:size]).order(id: :asc)
   }
 end

 # One company
 field :company do
   type Types::CompanyType
   argument :id, !types.ID
   description 'One Company by its ID'
   resolve -> (obj, args, ctx) {
     Company.find(args[:id])
   }
 end

 # All jobs
 field :all_jobs do
   type types[Types::JobType]
   description 'All Jobs everywhere'
   argument :size,
            types.Int,
            default_value: 15
   resolve ->(obj, args, ctx) {
     Job.all.limit(args[:size]).order(id: :asc)
   }
 end

 # One job
 field :job do
   type Types::JobType
   argument :id, !types.ID
   description 'One Job by its ID'
   resolve -> (obj, args, ctx) {
     Job.find(args[:id])
   }
 end


end
