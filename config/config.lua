Config = {
    AlowCuts = false,--// if this is true this means that all businesses have to take a cut from a employee sale
    PayoutSplit = 0,--// the cut procentage what the business takes and the rest is left for the employee
    Debug = false,--//if true it will enable polyzone debug
    businesses = {
        --//Default preset business
        ['beanmachine'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(121.3106, -1034.4774, 28.305),--//blip location using vec3
                    label = "Bean Machine Cafe", --//blip label you can see on the map
                    color = 56,--// blip color
                    scale = 0.6,--// blip scale
                    id = 106--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(119.6181, -1044.3712, 28.8407),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bean_owner1',--//this is a stash ID 
                        weight = 50000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'beanmachine'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(125.2821, -1034.1315, 28.295),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Counter',--//this is the label of the target for the stash
                        name = 'bean_counter1',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(127.9372, -1032.1768, 26.9915),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bean_raw',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'beanmachine'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(127.4894, -1033.407, 26.9814),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bean_cooked',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'beanmachine'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(117.4975, -1045.6306, 29.3085),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                [1] = {--//this means you can add a second and so on
                    pos = vec3(118.0568, -1043.6431, 28.5116),--//location of the box zone
                    heading = 270,--//box zone heading
                    length = 1,--//box zone length
                    width = 2,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.94--// box zone max height              
                }
            },
            Store = {--//this is where workers can buy ingredients
                [1] = {--//this means you can add a second store and so on
                    pos = vec3(115.3416, -1041.2957, 29.6648),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 2,--// box zone width
                    minZ = 21.36,--// box zone min height
                    maxZ = 23.56,--// box zone max height
                    label = "Cool Beans ingredient store",--//store label
                    slots = 30,--//How many slots can the store have
                    items = {--//store item list
                        {
                            name = "phone",--//item spawn name
                            price = 0,--//item price
                            amount = 10,--//item amount
                            info = {},--//item metadata
                            type = "item",--//item type
                            slot = 1,--//item slot where it will be placed on the inventory
                            authorizedJobGrades = {0, 1, 2, 3}--//job grades that can buy this item
                        },
                        {
                            name = "tosti",--//item spawn name
                            price = 0,--//item price
                            amount = 10,--//item amount
                            info = {},--//item metadata
                            type = "item",--//item type
                            slot = 2,--//item slot where it will be placed on the inventory
                            authorizedJobGrades = {0, 1, 2, 3}--//job grades that can buy this item
                        }                           
                    }                      
                }
            }
        },
        ['doj'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(238.4838, -1100.881, 36.3318),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'doj_owner1',--//this is a stash ID 
                        weight = 50000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'doj'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(247.268, -1096.0372, 36.4177),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Counter',--//this is the label of the target for the stash
                        name = 'doj_owner2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'doj' --// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(242.3277, -1103.0703, 29.6671),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'doj',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'doj'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(242.2298, -1091.6814, 29.4051),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['burgershot'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(-586.906, -616.593, 33.6819),--//blip location using vec3
                    label = "Burgershot", --//blip label you can see on the map
                    color = 56,--// blip color
                    scale = 0.0,--// blip scale
                    id = 106--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-587.7697, -612.5677, 34.8426),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'burgershot_raw',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'burgershot'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(-587.7659, -611.0939, 34.7949),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'burgershot_cooked',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'burgershot' --// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(-585.4603, -616.4708, 34.6779),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'burgershot_counter1',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(-585.5827, -614.8923, 34.7148),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'burgershot_counter2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [5] = {--this means you can add a second storage and so on
                    pos = vec3(-585.3582, -612.2637, 34.7172),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'burgershot_counter3',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-586.811, -617.9196, 34.9301),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['bahamamamas'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(-1387.3558, -590.786, 29.32),--//blip location using vec3
                    label = "Bahama Mamas", --//blip label you can see on the map
                    color = 50,--// blip color
                    scale = 0.9,--// blip scale
                    id = 674--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-1403.7325, -598.8135, 29.9768),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bm_bar',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'bahamamamas'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(-1400.1969, -598.2943, 29.8875),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bm_bar2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'bahamamamas'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(-1399.3391, -602.6743, 30.409),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Counter',--//this is the label of the target for the stash
                        name = 'bm_bar3',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(-1372.4141, -629.2957, 30.4717),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'bmemployee',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'bahamamamas'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-1370.6022, -625.2875, 30.5674),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['royaltyrecords'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(-1015.7916, -266.1855, 38.0634),--//blip location using vec3
                    label = "Royalty Records", --//blip label you can see on the map
                    color = 56,--// blip color
                    scale = 0.6,--// blip scale
                    id = 614--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-993.7202, -257.5742, 39.2466),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'royalty_recordsbar',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'royaltyrecords'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(-997.3546, -259.1043, 39.2825),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Counter',--//this is the label of the target for the stash
                        name = 'royaltyrecords_counter1',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(-996.1173, -259.0981, 38.5902),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Counter',--//this is the label of the target for the stash
                        name = 'royalty_recordsbar2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(-1007.6725, -262.1838, 45.0736),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'royalty_recordsowner',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'royaltyrecords'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-990.5425, -279.8399, 38.5189),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                },
                [2] = {--this means you can add a second duty and so on
                    pos = vec3(-1005.0977, -269.8635, 39.1479),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['flameandfin'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(1527.6431, 3782.1865, 33.5125),--//blip location using vec3
                    label = "Lil Ds Flame & Fin", --//blip label you can see on the map
                    color = 12,--// blip color
                    scale = 0.8,--// blip scale
                    id = 355--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(1539.8093, 3790.7285, 34.6175),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'flameandfin_raw',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'flameandfin'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(1541.6881, 3791.5249, 34.4895),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'flameandfin_cooked',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'flameandfin' --// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(1515.2225, 3776.3472, 34.4291),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'flameandfin_cooked2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'flameandfin' --// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(1517.2134, 3779.5779, 34.6103),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'flameandfin_counter2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [5] = {--this means you can add a second storage and so on
                    pos = vec3(1516.6274, 3776.9775, 34.6103),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'flameandfin_counter3',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(1531.7451, 3784.5286, 34.4347),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['tequi'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(-555.4492, 285.7928, 81.1762),--//blip location using vec3
                    label = "Tequi La La", --//blip label you can see on the map
                    color = 24,--// blip color
                    scale = 0.9,--// blip scale
                    id = 93 --//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-562.4826, 289.4576, 81.7915),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'tequi_raw',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'tequi'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(-562.963, 284.5326, 81.8692),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'tequi_cooked',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'tequi' --// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(-560.906, 287.3419, 81.2951),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 2,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'tequi_counter2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [4] = {--this means you can add a second storage and so on
                    pos = vec3(-565.9391, 287.0504, 85.4761),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 2,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'tequi_storage3',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'tequi'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                 [5] = {--this means you can add a second storage and so on
                    pos = vec3(-563.9632, 285.7477, 85.4759),--//location of the box zone
                    heading = 345.01,--//box zone heading
                    length = 2,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Counter',--//this is the label of the target for the stash
                        name = 'tequi_counter2',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-562.9722, 287.4665, 82.3823),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        },
        ['cypressimports'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                
            },
            Register = {--//register where workers can write bills and players can pay them
                
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-68.4255, 83.096, 75.8792),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open Storage',--//this is the label of the target for the stash
                        name = 'cypressimports_raw',--//this is a stash ID 
                        weight = 50000000000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'cypressimports'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-68.6982, 78.3603, 71.5371),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                
            },
            Store = {--//this is where workers can buy ingredients
                
            }
        }
    }
}
