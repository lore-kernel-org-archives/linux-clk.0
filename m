Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF558C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:58:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8AF361104
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhDHM7F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:05 -0400
Received: from mail-bn8nam12on2087.outbound.protection.outlook.com ([40.107.237.87]:29341
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229803AbhDHM7E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvBoiDbbVa2Bq/yD0EhTXlVgN3SoIvMbiukQbIhLTY2bY9cmsOll+RL4dbQQWbXLJTihNvOfdCP+zAMoDK+307Oav0HUQwRNQZ/nHUFabt7kDYjBkdVShKsFMJcb/Pa4qR2RXvkgg+GhCVrAIZsoTMwfE57TlwXMJCEfS6uH3J505jrbMkYwCivJfSfikBBjzCbOeR6x74rUUG0vmPkOukf9qyefhADFLasgyKlcTT/av6/kMHmSRJoMutsdpZTM7BF7YHnpG9tlP67kjIMCiEQpVFttzm+JItov3RvONa723Qj1GtjrKQXn7+zKNZ5S2drsq1OmXdgHTL3nn/++Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzzsYeQ11TiIYoB4hwugHTkUjmFUQqlUVDLQYqAwpfQ=;
 b=N+7eu/G2aAdZLpULk+AhqmPT1tCZI88pj/8izEy7V9hSQmclQEaQd9KsvV9lyhDDX+evH01E5zeYE02izpH7+X72wmwLEEyGUwykOAPwkZS9LZBjcwVzrhBi8pGJPiiISlZtrmBflgk5d+90NihtG3/zNCfQIrBH8i/0FdfbavR0hyOrrzwZcNL/3utZ1AenUiJDKU3QMfmF8KnhgbGGJfqwPqm/KYfTXZKeo4ZvCr47ki+dMHkZZCZc1MAcOA8wX7ZBRJ+JkWSs09r0tedQ5Z4v4una6yU0QRWh+/NBngnWpTZyKCpleUbjdcfd502m5+tmanVAkeCXwXczjK8iJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzzsYeQ11TiIYoB4hwugHTkUjmFUQqlUVDLQYqAwpfQ=;
 b=JmhfkkOxaagDp0KDx02emS3OHmvLawtpZRXOnd+29O4jp5psa0vlno8yawVRaGG2f+p2iAqDRM6zk4mWfb6gGqL6LFwZlp+23s6hLJj2Ue0rCXV5TDwVlvKqL4M5ITm/IudQriGvUPpXe5KUWTKEIcudmsdYdH8wQydXRZX/veM=
Received: from CY4PR2201CA0007.namprd22.prod.outlook.com
 (2603:10b6:910:5f::17) by MWHPR02MB2623.namprd02.prod.outlook.com
 (2603:10b6:300:44::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 12:58:51 +0000
Received: from CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:5f:cafe::83) by CY4PR2201CA0007.outlook.office365.com
 (2603:10b6:910:5f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 12:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT055.mail.protection.outlook.com (10.152.74.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:58:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:58:49 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:58:49 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev,
 zhengxunli.mxic@gmail.com
Received: from [10.140.6.59] (port=57650 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lUUFE-0000kJ-7M; Thu, 08 Apr 2021 05:58:48 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11 0/5] clk: clocking-wizard: Driver updates
Date:   Thu, 8 Apr 2021 18:28:38 +0530
Message-ID: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2794e4e7-527c-4321-bb4c-08d8fa8e0ec9
X-MS-TrafficTypeDiagnostic: MWHPR02MB2623:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2623C4940CFC2EAE11A4CE23AA749@MWHPR02MB2623.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C56p5hUTh04SJJxdgEAE623DgD8NfyFeal1v07xF53SfGUaE2kiRTs0P/XHx04H2QtG4EDuBX2KTh+PMJ1G/a48ML4bl3IfOFJzv3dCllhZFiUUW5gSw7H0kXAFlD+02pag3CeUU6+SE7I3KNpn0rWvXvZJttqN3aepZvtNvPmqiPccbSQA7hMTak5tdQhZdXs+UTOkEhaOt+uyjpTuarwh6rjJgEzVtvakfkGGr7EpSLol0u3SEz/VMx4djwL+RoXTwZIp3KxRQuIamzJPU1k0r00gRDsQDL0jPf9hu7efTNchkclDvopAJAKOYjK9ACVfn61EfBv0nqYmsGG548U4z2bEd8bVPkM+85EdQt2O+M7LpH4/cfTwFzvLpl0C4nXXF3uZuESHPKviN9dCOVsSWK8yOhdX+ZtbT7Wfq/Gj+hC8E061MeU+ViLhpgqlq+oz9PQA4C/CruuzF1Num+YgW2OSXP5Lw2B6DPV6yL3ue8GwtwMl3Ujkz5kQS0FJWpx8AhX+Sabzyhrtcp04xZ2o+JyKJrjmAx/n/BO3l4f0vYUPeo7j1N/xRLE0kBdRw7jzwZ0bc32/C+DMIbyoJrBcBmajwXyJFBPdFqB/MyauYcQYQOQHAljb8Le58rmuVWANfjtqpZcchNJYTLK2z3F5cJdAiu04C98KmIA/02p9rXthsBQG04I+kqrnQ9kYu
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(356005)(6916009)(83380400001)(8936002)(2616005)(70206006)(7636003)(2906002)(36756003)(7696005)(47076005)(15650500001)(36860700001)(9786002)(426003)(70586007)(336012)(316002)(107886003)(36906005)(8676002)(4326008)(82310400003)(44832011)(82740400003)(54906003)(6666004)(478600001)(26005)(186003)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:58:51.2598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2794e4e7-527c-4321-bb4c-08d8fa8e0ec9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2623
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch does the following
Update the versions of the clocking wizard ip.
Move from staging to clk directory.
Update the bindings.

Applies on
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
in the staging-next branch.

 
Shubhrajyoti Datta (5):
  dt-bindings: add documentation of xilinx clocking wizard
  clk: clocking-wizard: Add the clockwizard to clk directory
  clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
  clk: clocking-wizard: Fix the reconfig for 5.2
  clk: clocking-wizard: Update the compatible

 .../bindings/clock/xlnx,clocking-wizard.yaml       |  77 +++
 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c                | 643 +++++++++++++++++++++
 drivers/staging/Kconfig                            |   2 -
 drivers/staging/Makefile                           |   1 -
 drivers/staging/clocking-wizard/Kconfig            |  10 -
 drivers/staging/clocking-wizard/Makefile           |   2 -
 drivers/staging/clocking-wizard/TODO               |  13 -
 .../clocking-wizard/clk-xlnx-clock-wizard.c        | 634 --------------------
 drivers/staging/clocking-wizard/dt-binding.txt     |  30 -
 11 files changed, 730 insertions(+), 692 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

-- 
2.1.1

