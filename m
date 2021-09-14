Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA5CC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F696113B
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhINM7O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:14 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:50465
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232702AbhINM7O (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ27KbS0Gl5P//H1TF1aaLeXm8meQgLO2LfGm6oweO+IXc3l9rrJtQR/EITrajEr5CmRUD7nOMB2pJizYGkciH6PJNGt/hYgDSBZPYLM8INP36HHGXt8MVyN7Ia5i2zMNz61L1vIXJtCkb6/TNjl9maTCzRBfKaM4802t+GcaKk2gNmh8ngsuEOjk+885kEok3EXXJOOnJsur6hqlOOjN1V4FKde/wAdb4+Fw/mTIWdU8BLUnSVpfp/4YOfi7IdE8jihw8ZbqrcWdNMAa/Bz0h3c+F2t2IGGJQG7UuEcGgdKgoqZbg7c7EfUXXxc+5FweR64EKQ7hBgCOt4tfZCwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OZVKfsqVUyPvmF0SFI+xH6e5ofVSGgI6AmdJAJ5Kypo=;
 b=jtYyiFv0yISoCe4f8A7tSQs4swv9o2ffRO3u7Hdg6oUFBBCcRJ3UB0zH+atT8IEWGGtFP7jK2CLks/Pe+ZuEuaoUDvFc2KS8PUFpa7JezJAzyDgPdfiLSirIoOLp2P72RLPQa+U+jL8F8DLYAvidHd81ulHe4J/80WbC5AXtRtHoecNDpIKFD6utVzJyYoj9BkIq1qZ44M94G6bX3xxX4YHil3EP/M/wVMHEQ+aYKTrmYWwgZP5ZlsyQgyD9GwcG9DbqecIzizur9HtlcQDm+2oIMEj7/NKXtboOSBicwQwjIS4ByuwRnZ7L8ofDfIbWtcAhN2Co371gXux/V37Uog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZVKfsqVUyPvmF0SFI+xH6e5ofVSGgI6AmdJAJ5Kypo=;
 b=HDMDQoEoR/GQ9X5cUN/xeEmek/UIW3AbSBvTThWOWjsZntW4SzquEZLolSCx9NSiXzxv96DqBy/6JZZIGsibbho0MYznspn2HWgCHBuKSvPHsWDsZyWXav8RDmnZbKifrStjbleQa4V5MJlEn64TPCx88TWEgpRf+ZjT/S9U24U=
Received: from SA9PR10CA0027.namprd10.prod.outlook.com (2603:10b6:806:a7::32)
 by DM8PR02MB8278.namprd02.prod.outlook.com (2603:10b6:8:9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Tue, 14 Sep 2021 12:57:55 +0000
Received: from SN1NAM02FT0061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::f9) by SA9PR10CA0027.outlook.office365.com
 (2603:10b6:806:a7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 14 Sep 2021 12:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0061.mail.protection.outlook.com (10.97.4.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:57:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:57:53 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:57:53 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80W-0002I2-Al; Tue, 14 Sep 2021 05:57:52 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 0/5] clk: clocking-wizard: Driver updates
Date:   Tue, 14 Sep 2021 18:27:40 +0530
Message-ID: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6080b177-3b9d-4ece-6b5f-08d9777f44d1
X-MS-TrafficTypeDiagnostic: DM8PR02MB8278:
X-Microsoft-Antispam-PRVS: <DM8PR02MB82783AA4602BE4A5FB69085AAADA9@DM8PR02MB8278.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNgMX1noGz0Xkz6Jpc9EmFBZIY5qQ3hd7+MQC6vk7fwssTyb7FNZHzDZn63pO6N6UHjEmKvVs695rO8zcoqTQzPkokZtLu9ydiRDfzIRr54kO+Raoc0auyfkD4bFfiNvzMyxutigVFVJMFAhRU9lUF5EeB2AAw7dpEIYggHLEl5Sx6GggVlyya3v2MDGO6jg+Vvv4VWB+vaGytrgUPkIsbPq3YIgsbPwOEwRL/o8oDKxTI1JNXmf88NtKxXDGzoLxGWIENRA1NYCCweZFi9fbOXEpyV254QNh+ydOBKmZemFozO3fZ5Bvf9Yj592FCgXu2Ms4j0R+WGz2zXfcUIxvQT04j5p3gLl3KZ4VwGNEv30qa5rmkrGPWG8Z/YfIDfO5zjekVxvgp+imcxOkuJiITGTJNft+2rKrkbC/9vmgynRsIkYL90CHX0rZXH3XM5M8thuAmLK0RTIT8rWm8FJaUtLh05zoNxIk/bQ1Soh+V1x42LPFYgt/Rj9InoQ02S1dI6PjkYofBbh+UnQrv1a9fTTjiMXj7unCpC/3DKlSanS2ok1QKGPl/uExtONFfjcrXhPpLbzAmxNWu4EQ8dQ3UDsmqIRzRswYF9ZQ4JK+lPTUvAHrBWHZIoBEZN0QAc+re70rV7byNcvbj/kOqaSZZ4ZClhSgTuyplKZInKHWbB33qbnmHU9PI602IqOM/PhAZ9N0sDwW581OrF9m60M2lBjnLZnhXkogeoSLCQl6As=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(186003)(47076005)(356005)(44832011)(5660300002)(6916009)(83380400001)(36906005)(107886003)(9786002)(36756003)(316002)(8936002)(7636003)(336012)(426003)(15650500001)(70586007)(8676002)(2616005)(54906003)(82740400003)(4326008)(2906002)(6666004)(82310400003)(36860700001)(26005)(478600001)(7696005)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:57:54.7943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6080b177-3b9d-4ece-6b5f-08d9777f44d1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8278
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch does the following
Update the versions of the clocking wizard ip.
Move from staging to clk directory.
Update the bindings.

v12: 
No change. 
Rebased
v13:
Update the clocking compatible
Add the change removing the driver from staging


Shubhrajyoti Datta (5):
  dt-bindings: add documentation of xilinx clocking wizard
  clk: clocking-wizard: Add the clockwizard to clk directory
  clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
  clk: clocking-wizard: Fix the reconfig for 5.2
  clk: clocking-wizard: Update the compatible

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
 drivers/clk/Kconfig                           |  9 +++
 drivers/clk/Makefile                          |  1 +
 .../clk-xlnx-clock-wizard.c                   | 19 +++--
 drivers/staging/Kconfig                       |  2 -
 drivers/staging/Makefile                      |  1 -
 drivers/staging/clocking-wizard/Kconfig       | 10 ---
 drivers/staging/clocking-wizard/Makefile      |  2 -
 drivers/staging/clocking-wizard/TODO          | 13 ----
 .../staging/clocking-wizard/dt-binding.txt    | 30 --------
 10 files changed, 101 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
 rename drivers/{staging/clocking-wizard => clk}/clk-xlnx-clock-wizard.c (96%)
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

-- 
2.25.1

