ApprovalStatus.create!([
  {code: 'A1', details: 'Approved'},
  {code: 'P', details: 'Pending'},
  {code: 'R1', details: 'Rejection: Missing Generation or Claim Documents'},
  {code: 'R2', details: 'Rejection: Insufficient/Not Official Generation or Claim Documents'},
  {code: 'R5', details: 'Rejection: Duplicate Claim'}
])
Bounty.create!([
  {GUID: 'BGRT-FR-9544-1-4802-2012-09-22', amount: 123, receiver_wallet: '1', grant_id: '3'}
])
Claimant.create!([
  {first_name: 'Lillian', email: 'lromero0@dagondesign.com', country: 'Greece', last_name: 'Romero'},
  {first_name: 'Kelly', email: 'kdean1@theguardian.com', country: 'China', last_name: 'Dean'},
  {first_name: 'Johnny', email: 'jmartin2@utexas.edu', country: 'Portugal', last_name: 'Martin'},
  {first_name: 'Judy', email: 'jmorrison3@cbsnews.com', country: 'China', last_name: 'Morrison'},
  {first_name: 'Daniel', email: 'dcoleman4@xinhuanet.com', country: 'China', last_name: 'Coleman'},
  {first_name: 'Jennifer', email: 'jlawrence5@meetup.com', country: 'China', last_name: 'Lawrence'},
  {first_name: 'Ryan', email: 'rarnold6@fda.gov', country: 'Indonesia', last_name: 'Arnold'},
  {first_name: 'Rose', email: 'rcole7@go.com', country: 'France', last_name: 'Cole'},
  {first_name: 'David', email: 'dwood8@nhs.uk', country: 'Russia', last_name: 'Wood'},
  {first_name: 'Barbara', email: 'bcastillo9@fda.gov', country: 'Russia', last_name: 'Castillo'},
  {first_name: 'Jeremy', email: 'jevansa@utexas.edu', country: 'France', last_name: 'Evans'},
  {first_name: 'Kenneth', email: 'kpalmerb@sun.com', country: 'Ukraine', last_name: 'Palmer'},
  {first_name: 'Lillian', email: 'lgreenc@businesswire.com', country: 'China', last_name: 'Green'},
  {first_name: 'Evelyn', email: 'ebrownd@phoca.cz', country: 'Russia', last_name: 'Brown'},
  {first_name: 'Kathleen', email: 'khansene@economist.com', country: 'Philippines', last_name: 'Hansen'},
  {first_name: 'Janice', email: 'jkelleyf@dmoz.org', country: 'Colombia', last_name: 'Kelley'},
  {first_name: 'Sandra', email: 'swarreng@youtube.com', country: 'Iran', last_name: 'Warren'},
  {first_name: 'Teresa', email: 'tpetersonh@unesco.org', country: 'France', last_name: 'Peterson'},
  {first_name: 'Todd', email: 'twrighti@example.com', country: 'Japan', last_name: 'Wright'},
  {first_name: 'Harry', email: 'hpalmerj@virginia.edu', country: 'Brazil', last_name: 'Palmer'}
])
Grant.create!([
  {amount: 26500, project_id: 1, receiver_wallet: '5', type_tag: 'PGRT', GUID: 'PGRT-FR-9544-1-4802-11-2012-09-22-2015-08-17'},
  {amount: 5000, project_id: 16, receiver_wallet: '1', type_tag: 'PGRT', GUID: 'PGRT-BR-8409-16-1167-17-2013-03-25-2015-08-22'},
  {amount: 3200, project_id: 12, receiver_wallet: '10', type_tag: 'AGRT', GUID: 'AGRT-NG-12308-12-2299-14-2012-12-17-2015-08-22'},
  {amount: 5000, project_id: 4, receiver_wallet: '15', type_tag: 'AGRT', GUID: 'AGRT-BR-18962-4-785-3-2010-08-28-2015-08-22'}
])
Project.create!([
  {name: 'Kathryn', nameplate: 4802, address: '0163 Melrose Pass', post_code: '9544', country: 'FR', install_date: '2012-09-22', claimant_id: 11, status: 'A1'},
  {name: 'Frances', nameplate: 2659, address: '651 Reindahl Drive', post_code: '14831', country: 'ID', install_date: '2014-07-14', claimant_id: 12, status: 'P'},
  {name: 'Kelly', nameplate: 1845, address: '8030 Summit Junction', post_code: '17021', country: 'ID', install_date: '2010-12-21', claimant_id: 17, status: 'R2'},
  {name: 'Denise', nameplate: 785, address: '1064 Lighthouse Bay Circle', post_code: '18962', country: 'BR', install_date: '2010-08-28', claimant_id: 3, status: 'A1'},
  {name: 'Rebecca', nameplate: 1474, address: '062 Warner Trail', post_code: '7078', country: 'PT', install_date: '2012-08-30', claimant_id: 9, status: 'R1'},
  {name: 'Cheryl', nameplate: 860, address: '18 Union Drive', post_code: '8186', country: 'UA', install_date: '2012-10-09', claimant_id: 6, status: 'P'},
  {name: 'Tammy', nameplate: 1665, address: '32 Thackeray Avenue', post_code: '10437', country: 'RU', install_date: '2011-10-07', claimant_id: 13, status: 'A1'},
  {name: 'Denise', nameplate: 4677, address: '861 Union Parkway', post_code: '18300', country: 'PH', install_date: '2012-03-11', claimant_id: 19, status: 'A1'},
  {name: 'Anne', nameplate: 3425, address: '097 Nancy Crossing', post_code: '12098', country: 'CN', install_date: '2013-03-12', claimant_id: 6, status: 'R1'},
  {name: 'Mary', nameplate: 3212, address: '28155 Coolidge Circle', post_code: '6008', country: 'PL', install_date: '2014-06-22', claimant_id: 4, status: 'R1'},
  {name: 'Frances', nameplate: 2789, address: '27 Mandrake Court', post_code: '14118', country: 'PH', install_date: '2015-06-21', claimant_id: 8, status: 'P'},
  {name: 'Irene', nameplate: 2299, address: '82865 Commercial Junction', post_code: '12308', country: 'NG', install_date: '2012-12-17', claimant_id: 14, status: 'P'},
  {name: 'Amanda', nameplate: 1149, address: '61 Eliot Center', post_code: '6462', country: 'CN', install_date: '2011-12-08', claimant_id: 10, status: 'A1'},
  {name: 'Martha', nameplate: 3636, address: '00543 Gerald Park', post_code: '15752', country: 'PH', install_date: '2011-07-23', claimant_id: 4, status: 'R2'},
  {name: 'Kathryn', nameplate: 1074, address: '5898 Prairie Rose Point', post_code: '8213', country: 'GH', install_date: '2015-03-26', claimant_id: 15, status: 'R1'},
  {name: 'Janice', nameplate: 1167, address: '5333 Parkside Hill', post_code: '8409', country: 'BR', install_date: '2013-03-25', claimant_id: 17, status: 'R1'},
  {name: 'Stephanie', nameplate: 2537, address: '92 Eggendart Parkway', post_code: '15976', country: 'CN', install_date: '2013-03-06', claimant_id: 8, status: 'R1'},
  {name: 'Lois', nameplate: 2944, address: '7 Reinke Junction', post_code: '16692', country: 'AM', install_date: '2011-09-26', claimant_id: 19, status: 'A1'},
  {name: 'Robin', nameplate: 4823, address: '38 Lukken Crossing', post_code: '2217', country: 'SE', install_date: '2010-11-20', claimant_id: 11, status: 'A1'},
  {name: 'Martha', nameplate: 805, address: '7 Knutson Lane', post_code: '6972', country: 'RU', install_date: '2013-05-26', claimant_id: 11, status: 'A1'}
])
Wallet.create!([
  {public_address: '1PDzxXxEq5qc4ni1z4AwtXy7SKWyUBj738', tag: 'rcole7@go.com', claimant_id: 8},
  {public_address: '1BaSBcbRwGQvbkCJDiojLdPBeVAeV9eyUE', tag: 'tpetersonh@unesco.org', claimant_id: 18},
  {public_address: '19dJ2MwWTG6hRcudTomCVFJaWCM8JYZ3NE', tag: 'lgreenc@businesswire.com', claimant_id: 13},
  {public_address: '13C6j5VCeUysgAUpvBzdTKWg3EoznCytPS', tag: 'jkelleyf@dmoz.org', claimant_id: 16},
  {public_address: '1PHxiyfnkSq6JTuz2Q7PUQ9v5Hj6iX3zM2', tag: 'kpalmerb@sun.com', claimant_id: 12},
  {public_address: '12K6JSPu1aLn9uRBiQb8zaw6DYvYZBbiqG', tag: 'rcole7@go.com', claimant_id: 8},
  {public_address: '14KbP3dRKXnXdhCL88Y5zWdc3NJLvW26go', tag: 'ebrownd@phoca.cz', claimant_id: 14},
  {public_address: '1Nr7MS7AWDSBwVEa3zuoUDaLavgRLmstcV', tag: 'dcoleman4@xinhuanet.com', claimant_id: 5},
  {public_address: '1D5WxKeg9FoZuQhP3vHs8jjXJskgpQpMEU', tag: 'jlawrence5@meetup.com', claimant_id: 6},
  {public_address: '1F4G6sjWcZmVgHwHrjpRtrHyHMsEsPmUmg', tag: 'dwood8@nhs.uk', claimant_id: 9},
  {public_address: '18egqYTjC3CZvBowCbgaama9JLNJR9xCKu', tag: 'dcoleman4@xinhuanet.com', claimant_id: 5},
  {public_address: '1Hm4xJQWaQSxNft5tckKr5jRKangtrwiWt', tag: 'lgreenc@businesswire.com', claimant_id: 13},
  {public_address: '1MwxjNfdGtyKcMnYKoqDCN3qZDeRdZ3VnC', tag: 'rarnold6@fda.gov', claimant_id: 7},
  {public_address: '18fjbzGzdxwfbbnvnWnBW23PrPyXrbugvQ', tag: 'rcole7@go.com', claimant_id: 8},
  {public_address: '1Ae1fhUvMZWoKEG7Ky9o8ipMNCW56uZ8xQ', tag: 'jmartin2@utexas.edu', claimant_id: 3},
  {public_address: '128z8NhJE9uBprUegyn2te6DFRrLdTMLft', tag: 'jmorrison3@cbsnews.com', claimant_id: 4},
  {public_address: '1Hmh4qbkwnBSwKMC6VXyh2YJG1yeBD5euR', tag: 'jlawrence5@meetup.com', claimant_id: 6},
  {public_address: '19rEcq4bGmkunJAYkcD6ttebPKmu8HJfXJ', tag: 'tpetersonh@unesco.org', claimant_id: 18},
  {public_address: '1LmGob4dSTtCoL5bFtRatHFaQPFx4U2yuH', tag: 'khansene@economist.com', claimant_id: 15},
  {public_address: '16nGLDKnxeBC6JkXwdg76FnHoGaRyuKThd', tag: 'dcoleman4@xinhuanet.com', claimant_id: 5}
])
