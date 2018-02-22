/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WTCWINQTestCase.h"

@interface WTCIndexedColumnTests : WTCWINQTestCase

@end

@implementation WTCIndexedColumnTests

- (void)testIndexedColumn
{
    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName), @"testColumn");

    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName)
                        .withOrder(WCDB::Order::NotSet),
                    @"testColumn");

    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName)
                        .withOrder(WCDB::Order::ASC),
                    @"testColumn ASC");

    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName)
                        .withOrder(WCDB::Order::DESC),
                    @"testColumn DESC");

    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName)
                        .withCollate(self.class.collationName),
                    @"testColumn COLLATE testCollation");

    WCDB::Expression column = WCDB::Expression::ColumnNamed(self.class.columnName);
    WINQAssertEqual(WCDB::IndexedColumn(column), @"testColumn");
    //Default
    WINQAssertEqual(WCDB::IndexedColumn(self.class.columnName)
                        .withOrder(),
                    @"testColumn");
}

@end
