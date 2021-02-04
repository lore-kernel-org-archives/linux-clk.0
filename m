Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7A0C433E6
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BFF264F10
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbhBDNyh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:54:37 -0500
Received: from mail-mw2nam10on2059.outbound.protection.outlook.com ([40.107.94.59]:65056
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236391AbhBDNyf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:54:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1+nCBgrJXoHbYuhb43jeXCA2TptL4nLiLlyJ0JznaULSCktorOgyI3WzgJ5Ukgv6q8+KYPbemvoc2oFCmP2bi4bSS5avcjTde1vhJ/3IX8qh1Rhk4SooD0fVIuViO1oljbryayXQGghGL6zQhxvQFvdZJpmDXOg3KOJXJ35qNGMyuKC3cEaGTG5xGhu/Vq1+Ct9JCeXusbN4Yn5y6QQ3iZoyaw62rVdmYNPmIQmDM8b5F7D3kyIQvP9Vw7oE7U51k7olig8O+HiW8ZAILLN4rMXsqYyaPNj7DRU/6b501fc4whw3x9SHcwIrLGuABhxbE0BDOM+q9OPLJaaGuBz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsZQw9MKpzyc5UCpdKqK97jk+DARdvIZi6RaifU531s=;
 b=KLJDVont6PhcUoJgfbwO5Q2aab+yYsJlR7rMx+7cRuRow7BqT8BMAr3VTMMEpDstzWftAjGyXQIUrrSXlPfL/grH5tbF4PSbIy8Ug66uroBcqREo0IXN/iS/Mf8kzJGGQp2hxuSPAoR0PAFHKMxsiDczWyppjeFV1OO+Hmyor3vzBMvQk8v2JVByq8i6Fk/UXgduhyze6gmRTmXknDrbc5hhF0/kPPuxiLFCg8x1SE7cZy5fLTa8p2YjzU3MS6EJdYSpwXw27C79Ap9uyDUXAae9vwhjN1MEIO21BZReU7cVZrNDwdQcOcZQnaZd3faRscTTu/YnlAKFMsE3SqMvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsZQw9MKpzyc5UCpdKqK97jk+DARdvIZi6RaifU531s=;
 b=OvHUe2mjTW7n1cS2BnJqsM+daP428i0lBQfASK7iVHoebjNs0R/byaYQf953n47nplt8NJo0WGrqgNvnQd3PfXFTBTiTNEqP+ZsgbOy0ozrDvyHQE9UnP+jnly/HPv04v2WLxy++7/D87BguB3FcNHG8DFJJ5JNgM2qJ8pawcio=
Received: from BL1PR13CA0296.namprd13.prod.outlook.com (2603:10b6:208:2bc::31)
 by PH0PR02MB7192.namprd02.prod.outlook.com (2603:10b6:510:16::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 13:53:37 +0000
Received: from BL2NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bc:cafe::e0) by BL1PR13CA0296.outlook.office365.com
 (2603:10b6:208:2bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.13 via Frontend
 Transport; Thu, 4 Feb 2021 13:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT045.mail.protection.outlook.com (10.152.77.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:53:37 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:35 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:35 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.59] (port=57876 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1l7f4g-0000Tm-B7; Thu, 04 Feb 2021 05:53:34 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 0/7] clk: clk-wizard: clock-wizard: Driver updates
Date:   Thu, 4 Feb 2021 19:23:23 +0530
Message-ID: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b36abef-9c8d-4179-2512-08d8c9144549
X-MS-TrafficTypeDiagnostic: PH0PR02MB7192:
X-Microsoft-Antispam-PRVS: <PH0PR02MB719214B9011422FAA911A1A3AAB39@PH0PR02MB7192.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sePdelRefxsCcvXnvkLsvXf4QRkYNgYoDG1061mCYjACfDFLflwiZd0QUCCQNfRgIN1EVWOeVKYVSOUcdGu4xMH2xb69MGVwVLCCoAV+1xcpoPXcVKKpGEjy7ZbKEEOINWBEu1O0zHwBZ3nL8L3PA/dUnrvb37UiiHdFmQ8mbvRSW+Phq6lnS2nMgPc8uutDggRiYfoBWcG3F7zv1lAyNAAifc4H4o5ULs6DFEo5a/f7kJpm5fdPASFV3r+YYAi0iOYSk7JVJhWNJQnKUbC1KJxL2Y4+O3gVVvGdwbYH821nb/BM25o09G2WCfmSR+sqG8nUYq134Sn4+D3y1+JVns7xQUzT+gF8r+kO3XnDOTyjtfrB8q8DRhJC/OKxrAng6mHE7E55NJIKGeF1JvKDy7c9BmP1wls/sBJulnZBx3euvV7ek/lW2CKt2TfREsDlvMi3NF82WHWBnnQEVv0e7S7TEth88nT5lRO1fDjyhHgJTg1KIUPb5FJeMw21qCVL/7LAaRPv0CBVQGklEH8J4f/T0JOKLQbqjhDOROVqZFhJKJIiXKaTgNvusVTIEIXQUIngEUL95nbIrUxvAgA0MrxlHo3rKY/vrBM+69v6DpLygpEsi0Idnjfa7eA7kIWarwfTj/E4SnXknAPmOWy4N2mn4cqAV8TLcHbfc8Jsm7aUV6C5QboQd1vukMfCeckFhkfUj8ZIfMLsiab9MrqCZ452e7z6rVX8D7Pv09gCoz6aLOraxXgwTqbt4TpnRyj
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(7696005)(36756003)(15650500001)(186003)(7636003)(54906003)(44832011)(4326008)(9786002)(110136005)(26005)(70206006)(316002)(36906005)(8676002)(82740400003)(966005)(2906002)(36860700001)(82310400003)(107886003)(47076005)(70586007)(83380400001)(5660300002)(426003)(336012)(356005)(478600001)(6636002)(6666004)(2616005)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:53:37.0466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b36abef-9c8d-4179-2512-08d8c9144549
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7192
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


In the thread [1] Greg suggested that we move the driver
to the clk from the staging.
Add patches to address the concerns regarding the fractional and
set rate support in the TODO.

The patch set does the following
- Trivial fixes for kernel doc.
- Move the driver to the clk folder
- Add capability to set rate.
- Add fractional support.
- Add support for configurable outputs.
- Make the output names unique so that multiple instances
do not crib.

Changes in the v3:
Added the cover-letter.
Add patches for rate setting and fractional support
Add patches for warning.
Remove the driver from staging as suggested

v4:
Reorder the patches.
Merge the CLK_IS_BASIC patch.
Add the yaml form of binding document

v5:
Fix a mismerge

v6:
Fix the yaml warning
use poll timedout

v7:
Binding doc updates
Use common divisor function.

v8:
Fix Robs comments

[1] https://spinics.net/lists/linux-driver-devel/msg117326.html

Shubhrajyoti Datta (7):
  dt-bindings: add documentation of xilinx clocking wizard
  clk: clock-wizard: Add the clockwizard to clk directory
  clk: clock-wizard: Fix kernel-doc warning
  clk: clock-wizard: Add support for dynamic reconfiguration
  clk: clock-wizard: Add support for fractional support
  clk: clock-wizard: Remove the hardcoding of the clock outputs
  clk: clock-wizard: Update the fixed factor divisors

 .../bindings/clock/xlnx,clocking-wizard.yaml       |  62 ++
 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c                | 689 +++++++++++++++++++++
 drivers/staging/Kconfig                            |   2 -
 drivers/staging/Makefile                           |   1 -
 drivers/staging/clocking-wizard/Kconfig            |  10 -
 drivers/staging/clocking-wizard/Makefile           |   2 -
 drivers/staging/clocking-wizard/TODO               |  12 -
 .../clocking-wizard/clk-xlnx-clock-wizard.c        | 333 ----------
 drivers/staging/clocking-wizard/dt-binding.txt     |  30 -
 11 files changed, 761 insertions(+), 390 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

-- 
2.1.1

