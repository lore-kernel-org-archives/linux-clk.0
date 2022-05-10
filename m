Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6535C43217
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 07:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237780AbiEJHgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 03:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbiEJHGC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 03:06:02 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ED0590B9
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 00:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLCHvHuckQlwXW4ZWwwHw3Nk9dOLOAKMc0icziv6nOpL3d0QKRpXP1PC/8bX3M9nqWI95b1oSGVGMsC2H9Fav5wKv939z6AicKa1Nr37p62baFK1HW/eRqcFVZDA7TvCT6zQX+8yDL6SnvcE/bdWZufA40eQFyXMrnCgJs8m71pkQpCHX3zzqmBWF5yHa3c4/oHv+a0Yf4JNibxqr9QSAiYFuOB3bBH/5eTUXdGp7qfnte/fvOdboxCrVSknVq7cXEau7MuFGKyIzm7xGVDgWO9zaiNFNajG34TVmraCjapPFfPSGaOVbtbUZMMu3cvRI1Y9dAA+DCtuhs9pzyd8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1wlojjTEWxaYmjhqyEM0KfupfMHMwQsnjCTnAV8WgY=;
 b=a7srzVl1oLfC97TYMmcwg1r6RX7a86G2YN74wHqvSQGpMwP6fMv8cEEfblkjIH6o/yIiL2qwsax9SNnpvbwM2s8797KosYxJo+KQ1KE/aaE0d+cjQMB9gK8maYA8npu1j9YCJVkW0lM53RzC4BPJHk47wS5VM+rc3L5u1RIiUM7VmCGXSANG6EjvCK5kb10ZMXT/rv0vgwSIQkbrieBWXUiV2n5VxorYDAMrcd6qFczsR4HedQc5eiS51wIdmntyDZAdBzU9j5H9KjYRCDG3/RQIs5L6G+aAA7AE31b4fKSprjqEfCmZdrqUGKpRUlZAvW+nCE9XEkZuvNsdHfBPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1wlojjTEWxaYmjhqyEM0KfupfMHMwQsnjCTnAV8WgY=;
 b=NNPTS9SAtmTjMbkqulroNvIQOxK0woJYJSWWOtekY/4Msu5i55X3WspT9LkZb7Go6TXp6bHcLsWjcwAEj+9SyuYDkJYrU33AiQfkLKcgUE4OL80HItYm0GdvwR+XlDRzBhD+X/lL6zvPVTtuNxqaRs4wPlJQKqhdNFmIFl0LCLg=
Received: from DM6PR07CA0080.namprd07.prod.outlook.com (2603:10b6:5:337::13)
 by SN6PR02MB4446.namprd02.prod.outlook.com (2603:10b6:805:ab::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 07:02:02 +0000
Received: from DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::d3) by DM6PR07CA0080.outlook.office365.com
 (2603:10b6:5:337::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Tue, 10 May 2022 07:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT054.mail.protection.outlook.com (10.13.5.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 07:02:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 10 May 2022 00:01:58 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 10 May 2022 00:01:58 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=57472 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1noJsc-00083z-6e; Tue, 10 May 2022 00:01:58 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 0/2] clk: zynqmp: clock fixes
Date:   Tue, 10 May 2022 12:31:52 +0530
Message-ID: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd83564c-0bbc-4bbc-2c22-08da3252fc01
X-MS-TrafficTypeDiagnostic: SN6PR02MB4446:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB4446BBACA154410624385D38AAC99@SN6PR02MB4446.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZdmIfsvcgLtt5sSoMM/+L/bwxnUPE1dbVsEBMJPrZhOg8lnM4NGlFVLaLjdKfj0YeuptA5idAD9YBYC18v/JZbrQLkN8Av6CCvYBQXfyrxALn0jxMs/2z1mrF0Fehuhu8C7Cer6N/OPW7BktWM2rmf2PlqFndGBKQcB/iLP7Ts6cc8LRvTiksimRs/SGSDcmwLABOH+RBODotKPjHypR3L6F6KPfSaNr63nWjFq6rVmf+xQS2Q8jjxxdLVYodDg/YmgVxA8Pv1rQ3r6IB8phQa+jRbi+ztaU2H1ZwvXvCYnQ3wKlMbyZdzgGEyVeo7Wv1JpjcmgJZKQyRj3VxX82qu5e5NV7q+viM19uGyj/Ootq0hjo/9sA4qBynBrh8RDXiyoS6ka0aT/F259Yzo6ICa+K5YiAdlCOqkc6MIfTjE7ThBpg8g6df1KMH4iUFVggcAvNgMgSMoPe2tjj82GTk19Q6i3N6R+QV2Y61tT8PsANNAUuCgn2YENGRyazDheXJsALdDDLNz+0j8yXMTnVgzClAtop4LDyuMFbXnsPM4BjBNUY8YD+hArUXISCQlnHfn3Dd8jjD5lq6i2DWRu1WGiLlwTEU/S19wrkGQdRF19fujTeu59LAJJsREfVqdn+heOYmM6GPZC0rznl7MJ9Urujk0X7/EElB6pi8BHjDlPoDOIKCNM0KeI0kbDL5gGs/NUyEl0Qw6UMM7pDLPQLQpEnmraAcy6D9ntP2dFfHjwqt5aztf7tmGlvFvYKROQzzoJ4ZzUSaQ5arCdIboVgiH5CbVYpN5splktWHMOSu342ty+5oYe2DQTyQeJQ3mD73EXwqzlb5Czsm1VAtdGmQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(54906003)(966005)(6916009)(7636003)(36756003)(4326008)(45080400002)(6666004)(7696005)(316002)(508600001)(9786002)(2906002)(40460700003)(82310400005)(186003)(8936002)(44832011)(4744005)(26005)(1076003)(70586007)(70206006)(5660300002)(107886003)(2616005)(36860700001)(8676002)(336012)(83380400001)(426003)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:02:02.2051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd83564c-0bbc-4bbc-2c22-08da3252fc01
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4446
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Below are the 
As part of discurssions on [1] there was a suggestion to use
strscpy. Which is implemented in [2] and [1] null terminates
the string.

[1] https://www.spinics.net/lists/linux-clk/msg60795.html
[2] https://lore.kernel.org/all/DM6PR02MB6635E9F94E9A5FFC06188EF2AAAF9@DM6PR02MB6635.namprd02.prod.outlook.com/T/

Ian Nam (1):
  clk: zynqmp: Fix stack-out-of-bounds in strncpy`

Shubhrajyoti Datta (1):
  clk: zynqmp: Replaced strncpy() with strscpy()

 drivers/clk/zynqmp/clkc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.17.1

