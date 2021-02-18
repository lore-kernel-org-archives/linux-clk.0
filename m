Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02058C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B346264E79
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhBREuu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:50:50 -0500
Received: from mail-eopbgr690054.outbound.protection.outlook.com ([40.107.69.54]:14400
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229864AbhBREut (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:50:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTqaAt55eqcyMvIzW2M/q26m3DNYQ2tpeWBwEF5+pq+G7N/VbigwwcePiBP+NThPwPc5jIQUCREwUcQxZe4cplTU7TSRqMddam+Iq+O/PhursgwXpUW4I5uJ8AExpZUfAp43/sdgrTnts4o18xfeNpirqqLolToQvTVQclypolEmGH//RLFQF/wSeZPxCZYOtBRDR5HB658fhMCE9ymRwDbR4kdsRmK4v7355KPDA8xhfCcWjhXWzCxo7IGiyyTJ0Qw3l+z+vAL+6oYrwwXzDuKx3AMf5Vk2XTjh7ZZ7Wq+b6PfRkix5pBcxYoqREY+RzCJdA7ojXtSiSLq6R/LPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QyDrPTFAE6mAXj3d5hAqqVsvcBYAAXynMwlvJnjQVk=;
 b=nUZHhLI7gGIBZeBBrDIJA0lcUVMuZmUSRhdXYGBPdJzXUdeZ4r8i0KRxg37PusqTCUuvme7FtyjQvNn5QGtEzTKezS744TcYEJs2z+BoBwQw/2YS4k4hGfSIHsmUexpta1RwMVSFiFkK6wTmBl/zmIHQSO+glx7bodayz0mtd/N0fG7EPpASUZrBMAdF+wFE5MOHRPq3Yz2grxI7nu4o8uqy4XtKCDZ+Pkzpze9zp1v4JsTYHDsI8QgRw5hp8b18YSt2M6e6GraLcvQW7rbs6JlIz1Tu3nZTovaBVuQ0kp3P/6FJTDtNY5mi177rca+uS7McndKPZOdJgcEZY05gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QyDrPTFAE6mAXj3d5hAqqVsvcBYAAXynMwlvJnjQVk=;
 b=csaQq7wZ13FU6KF3Jv8u42VkYr8Hu5/g1LPkGP3AAlvdySAQbpV7yzOo6f1N+kOpRe1mgezTwCPk3rpRcgywXf1lE0XsH18qOxzI3jnpE4FoKy2QHJTrzmuNJ/Aj1VwIW+cCgGOc1DKGzsgdffJo0BQZ0ou0PU032ksX3KOpQVE=
Received: from DM5PR10CA0017.namprd10.prod.outlook.com (2603:10b6:4:2::27) by
 BYAPR02MB5861.namprd02.prod.outlook.com (2603:10b6:a03:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 04:49:57 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::f) by DM5PR10CA0017.outlook.office365.com
 (2603:10b6:4:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:49:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:49:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:49:56 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:49:56 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGF-0004qG-PZ; Wed, 17 Feb 2021 20:49:56 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 0/7] clk: clk-wizard: clock-wizard: Driver updates
Date:   Thu, 18 Feb 2021 10:19:44 +0530
Message-ID: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c380d3b0-cfee-42c3-0669-08d8d3c8a3d3
X-MS-TrafficTypeDiagnostic: BYAPR02MB5861:
X-Microsoft-Antispam-PRVS: <BYAPR02MB586102CC9AA9ACD37A1A30AAAA859@BYAPR02MB5861.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzXsqLViksgd2whjdOWyCqRNB4vUIb++Kyw+ktTuYqcggjIpv0StD9yfMZxMjmjkjp5XV/yA/eynGNXDwiIS9ruTFmnlLgJdoBaJMFYn1Tkd14lvr50nTHDF5zX6WTBtABJ0V7tGdPDCSIIWxhMDRRK3rHeTKQRNtTbhJjPE0VSPPphEAWCcPeU8x/WiN8FCEW6cwFylIHoD0rVlFMBnjZSVDADQgCfsPiGn7dJJySzHocuek5csj48mYkg6fnWa2VxV6Y5D/ZwS1mg5MiseUParkxoLSkHXu8Ks0/mWDLf3jje2m/QGB2PRFO9CF10fGwmkyq0w3+lW7I4FI6E+bEXTA4MGAROgSUdSdD7Hp71UMHQVVp6eIbj/9xvwsTtNwmon9r8FHcJ4lcpB105zR4csRZ/+TBiwHgDlQ5XAipbRHt6i5At4DFKzBBiezGuix/JSfYjTlJCT+552aLhvm3uZYXWh6S/ymnACbjD26c8YBLZPWWm3zznnDV/v9BfyNx+j9xT2RoDCfItlB2lpVPbHwh8tHJFGcdxE74fYatiJ3ckUyrlUaGhScd825eLPc58v+pxyvP5ddJZQ6PGiJjV0oMHIjJcO7G9zxZoxDp3vq1lSE+NxVdQWZ4IP+BFxUsZcNds0yv1Fdb429vimsHT7r2hlCO6TICK1WINPfVy4d82BjUky5B8BFW6xq7S4lZjkmlm+8S9gjt8tO7HcFE/dxE6ehNC/XHt9l7N0p+9Zq1i2Xg3j/rszD8P1xXPF
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(26005)(186003)(7696005)(2616005)(44832011)(336012)(426003)(356005)(82740400003)(7636003)(83380400001)(36860700001)(5660300002)(8676002)(478600001)(966005)(107886003)(6916009)(8936002)(6666004)(9786002)(4326008)(2906002)(70586007)(15650500001)(70206006)(36756003)(316002)(54906003)(82310400003)(47076005)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:49:56.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c380d3b0-cfee-42c3-0669-08d8d3c8a3d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5861
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

v9:
Fix device tree warnings

[1] https://spinics.net/lists/linux-driver-devel/msg117326.html

Shubhrajyoti Datta (7):
  dt-bindings: add documentation of xilinx clocking wizard
  clk: clock-wizard: Add the clockwizard to clk directory
  clk: clock-wizard: Fix kernel-doc warning
  clk: clock-wizard: Add support for dynamic reconfiguration
  clk: clock-wizard: Add support for fractional support
  clk: clock-wizard: Remove the hardcoding of the clock outputs
  clk: clock-wizard: Update the fixed factor divisors

 .../bindings/clock/xlnx,clocking-wizard.yaml       |  65 ++
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
 11 files changed, 764 insertions(+), 390 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

-- 
2.1.1

