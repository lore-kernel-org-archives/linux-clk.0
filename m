Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C364C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B53C61078
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhHJH0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:17 -0400
Received: from mail-mw2nam12on2078.outbound.protection.outlook.com ([40.107.244.78]:31264
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232616AbhHJH0R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl1zZSiO6w9SLlNkDTx80oBo2lEN8I9FuiEQPfgUcYqjlsirp2+yBmEyD27JwCHQeyhJkSr+lY7iIH4QoykYo6B/ZenxcltkyASk9Sc9iV20LjbLxoJa73qnCJAAU9rxeerS7xkWW0TGTlEn50VLtGYRyC8NpDOc9qjXVAE313vrblCTO8glFq0VWzsHRKMIUaMNwhJ0OyQ5iLVhTDNkXD/1D+0E4eeLMnyjDIVjSWSNM/0eVdwbt0z7Y48flS08TzWB0KOtpPoO22h+Yx8dpN7sGk3nnnjLrc2EsluVDszBV0XHRyI0j18eVAI9Vs9M7ybZHJihvZ4aO5V/SyfAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKvLrOTqOVV7gU7DxeCpmlc1s0Uqpw7YRhDKc49KMMg=;
 b=aqB4JL9dxZujtovaeK0Y7GpQ/ZyOsT5jQ3mh8Pem7DUvmUmY9dz5khO+xmdwxd0jCwXCSkfUCUKIbNxgei4XH81B8AocvHOdZmRTfrY9jeaxJX7jgvSlGd0UNV3zWBsAiTVoNDhWd/3Ah+tE+OB+Glwhs/yLMs7SWPibjjfDvsF9XT3pG1Ow6WDH9OdtrRHreGZ66p4i/+N9deFRQBCjNvwnJaMrQWyhEZH13NAXanbRELtcyUQPEOOLkkAYHJIqTNsXoSXUoXZEdjiNWYxS9K7QOrwBBe5ZuEq7o1DDd1+rksLyPaEpDIBMOyXgl+/CdNtR9CUmJ5fVwO/lApaCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKvLrOTqOVV7gU7DxeCpmlc1s0Uqpw7YRhDKc49KMMg=;
 b=bXUGqAxDbgDxjFYcP0ZcdwlHrlRfcgALbYLKu5CAym/UTqO9NBPdqTB3Pj7gkIejddciD7pvEvaw99XpHpiACak3FEyS9ITva/wkwTonez0j6w1j/aA4VSJDAjUfYHZ/v9ZgJC52x3vJNdJYW/uvuGpegBGjcyJ5gSZu6abtojM=
Received: from BN6PR16CA0016.namprd16.prod.outlook.com (2603:10b6:404:f5::26)
 by DM6PR02MB6558.namprd02.prod.outlook.com (2603:10b6:5:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 07:25:51 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::55) by BN6PR16CA0016.outlook.office365.com
 (2603:10b6:404:f5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 10 Aug 2021 07:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:25:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:37 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8m-0005zG-5m; Tue, 10 Aug 2021 00:25:36 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 0/5] clk: clocking-wizard: Driver updates
Date:   Tue, 10 Aug 2021 12:55:28 +0530
Message-ID: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79515521-ece7-4f18-f3b1-08d95bd01511
X-MS-TrafficTypeDiagnostic: DM6PR02MB6558:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6558EEC7566981BC91CE4DEAAAF79@DM6PR02MB6558.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+9Bk0+9JkoPdrJdXtt+YTnYLEbSKCoODxhv3NW+O0RVehuMCzb5TUtPPcQ9e4dZT3qfGfDq623PDdPerfHHsLO4RPbw7QHWiz90t4hOY3v9So3mkbJbWcHmuiOzrYDA8tZ3ML8QYrva5NUFxFknObF2zkM9Yg8hGvNKFGNOjst9YI43oE2FQXltplai/+C8Q3KektelUcFrA+5KQnEfjD1c0R2WmukaQ7KInAMZ6RpG1fYo9vs5QzJZPsqI4mnUcX8X2DfZ3hp+PXHYsaO9YJhKF5h5830IXxaoaEFcxVrZlMpcrfGuk0s5g4uUyK2c9aHiRzsd76PRDukzkDoY1pw+0y4MSHi0oEqrb6mjHFFPAlp060FxYGcJ9y6KTWp/5iQxMehWcdVz4ZfM3f38pLqjMnubkF4xIAr+riqLO+C/UQm8S9QpHY7vDjfucK7udl+rJ+KLTpAYZVjInVMh8WyNiHMjsNIfIqaEVuLRO8avjjq9a6JahcVXnJbAoYr3mpM45hC2pytzr5bNaygttdSgdnrtN7Cs/zJpdhwoCASvBpx5dbfGCyKcDZA4Idx70cuMA64Z5Pjk5hUmMkIrAHtiJfg+lHc3abPivp1Js0ysWf5M5JKDNV3FcYO8uNZBxD/ACkUAJLIviRCtm6gL2W+7e+yXo98wsxQ697hFB8fOTKmcsPsiOyQaJ1xF4KoHgdjFOVvlunuiJTkhlME/DR9uZEeQdPe7bl+GmzdQqo0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(356005)(15650500001)(107886003)(83380400001)(36860700001)(5660300002)(1076003)(6636002)(4744005)(82740400003)(47076005)(7696005)(82310400003)(70586007)(70206006)(8676002)(8936002)(36756003)(2616005)(478600001)(6666004)(44832011)(26005)(186003)(7636003)(336012)(2906002)(316002)(9786002)(36906005)(426003)(54906003)(110136005)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:25:51.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79515521-ece7-4f18-f3b1-08d95bd01511
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6558
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

Shubhrajyoti Datta (5):
  dt-bindings: add documentation of xilinx clocking wizard
  clk: clocking-wizard: Add the clockwizard to clk directory
  clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
  clk: clocking-wizard: Fix the reconfig for 5.2
  clk: clocking-wizard: Update the compatible

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  77 +++
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c           | 643 ++++++++++++++++++
 4 files changed, 730 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c

-- 
2.17.1

