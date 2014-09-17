//
//  SwikDefinitions.h
//  Swik Prototype
//
//  Created by Robert Miller on 7/28/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#include "SwikColors.h"

#ifndef Swik_Prototype_SwikDefinitions_h
#define Swik_Prototype_SwikDefinitions_h

#define STARTBAR_HEIGHT         30

#define MESSAGE_CELL_WIDTH              102
#define ATTACMENT_CELL_WIDTH            320
#define PROXIMITY_CELL_WIDTH            213
#define FRIEND_SUGGESTION_CELL_WIDTH    213
#define GALLERY_CELL_WIDTH              320

#define MESSAGE_CELL_HEIGHT             252
#define ATTACHMENT_CELL_HEIGHT          252
#define PROXIMITY_CELL_HEIGHT           252
#define FRIEND_SUGGESTION_CELL_HEIGHT   123
#define GALLERY_CELL_HEIGHT             123

#define USER_IMAGE_HEIGHT_WIDTH         102

#define STRING_FROM_DATE(x)          ({  \
                                        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];                    \
                                        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];                            \
                                        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];                                \
                                        [dateFormatter setDateFormat:@"MMM d"];                                          \
                                        [dateFormatter stringFromDate:x];                                                   \
                                        })

#define TIME_FROM_DATE(x)           ({  \
                                        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];    \
                                        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];             \
                                        [dateFormatter setDateFormat:@"h:mm a"];                            \
                                        [dateFormatter stringFromDate:x];                                   \
                                    })

#endif
