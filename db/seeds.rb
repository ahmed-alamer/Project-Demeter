# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ApprovalStatus.create(code: "P", details: "Pending")
ApprovalStatus.create(code: "A1", details: "Approved")
ApprovalStatus.create(code: "R1", details: "Regection: Missing Generation or Claim Documents")
ApprovalStatus.create(code: "R2", details: "Rejection: Insufficient/Not Official Generation or Claim Documents")
ApprovalStatus.create(code: "R5", details: "Rejection: Duplicate Claim")