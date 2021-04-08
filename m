Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30EDC4360C
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A92E61104
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDHM7j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:39 -0400
Received: from mail-dm6nam11on2062.outbound.protection.outlook.com ([40.107.223.62]:9335
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231420AbhDHM7i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0OyiAxtakecZsT9iBgIJLirGfwTMs5CuNzV4zeWl/AK48kyOXepmZSCtzVA0z0uxdr1d208so6HJ5C7p5c8uAxEbytqPME1ACo021nZryLIJcABs7mJIXn1lkAiFtqhgN3dZ5K9qG5U+Z25o7quQucIoTIS0l1CVisIPc4ukqp3Zhmp85vifGSfaRmKsqfSlNV8h2ibkOUhTYA1RV56G8Kpl6u7DA/zmn3xAWh2/ePqxahD2OVVFrF3UmpvOVOmaDRw6RtO5dVlA/Lydry/VHemYq3GE5OoKabPdzlFLuYxkQb2dsSeKb50xXEUiFqpipUGv3/dcxQlhJBjV+HFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01jSFfbA1TrkLsDc7L97gVX1AnYkpkKLEtnk3pM9OeE=;
 b=TpHA3eE011vROCecsGxkLAXXXem+rxuWYJM/m9ZvFPJvCEudA5kxrlFL8/cKr6FhUSvPChGRZBuXK7CrqjOkTpQRorcOG1Q9AaM62eIoPDt0X/qggoqmx4o13AovtBsd560jZGNKSK0WiwWrDbBUzpVkLj0HTKFdTVbZJoNvCpC6eUk7XIQbVtJSfN9Dh79pQKNWZs8PWi5JXtuwzT30Uz2ZTkIOJlEJOIIatwn+BuNmD171nstGH1MRwsBdsSbGUihSH4xuM93um2Lw5urTUk9gsAz9npFcsb0j6ZpTRq5MNJDj/JVM2d0GkGyJzFsTJ/CM9BPasFBrIk4ghpYDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01jSFfbA1TrkLsDc7L97gVX1AnYkpkKLEtnk3pM9OeE=;
 b=jPEsRBaky1TnUoPnGJdr8LG+ALwPt9qLnH/5o+85iQsPUvowO4ZVABnwixZEtavxGRgJmIBKGksPBtyLjAbcMy4yo7YxdVQaLjtkjo3w77XD984tc9nf8E+H/NZRrdd47wWyEBDYacSUBMhh8F46wnm5pbGq47sub3JVLHktf9A=
Received: from CY4PR1701CA0012.namprd17.prod.outlook.com
 (2603:10b6:910:5e::22) by SA2PR02MB7562.namprd02.prod.outlook.com
 (2603:10b6:806:147::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 12:59:25 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:5e:cafe::f6) by CY4PR1701CA0012.outlook.office365.com
 (2603:10b6:910:5e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 12:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:59:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:59:04 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:59:04 -0700
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
        id 1lUUFT-0000kJ-HF; Thu, 08 Apr 2021 05:59:03 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11 5/5] clk: clocking-wizard: Update the compatible
Date:   Thu, 8 Apr 2021 18:28:43 +0530
Message-ID: <1617886723-27117-6-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0164fb7b-2a9e-4eee-3f99-08d8fa8e2323
X-MS-TrafficTypeDiagnostic: SA2PR02MB7562:
X-Microsoft-Antispam-PRVS: <SA2PR02MB756282A7E8E51D56933F8E90AA749@SA2PR02MB7562.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCV9pea/mdhoRFXLomJNdJ6LOYUbUxTusXjr1lglylF2hsnXtXCk5eMMGvl59yZEiDsf9+aQJamnT3QXAkRWsO/1s6lN3WiUYPG6Cly237skPVWvDIVO5/SEAtJBQFTMp5lz8hJKTSWoNNhAPbywvMpWLz24R8RRp9RFmm9yxPTOKKwoYBKXr4/fA3YX/1RYBwDpLZSL25F9sNAyqb23/d4GUl0mCvSi2/eu1CXZ9CcJcG+qE+eAE6dYv7wC+1owZCeS5c9gPPVNsH3fXKjxHa69fPTkfaR5K1JxwJ/KAOusLL+RaXJG2W2OoEfUK0Rq1l+48OWRWxOEqMHmHSNPRewKNQ1xcpXJhV22E3QyWMIAclDX+mey9Jx59Xzhinqz7IF+ovFXVA432jYqz40C4zUocP3UMim3D4p6xyvxt9AEtto258/IGtX8/qsJS4DGmJUWfFdXoAHHB2IvpI3UGRJGULcbJS/DzDFigjMqy6S3tbi+uPUVXqTnjJqaPeSL0boztVGGUEFNl5nAZNseZ3YyrrTTFlw8Rjf0uhZljbRDZdqJKsy/JbjfxzSrNRoZpaHGA2Y4kpMkp+AJ/1duFHA1htv1ZSeAo/cXFegT/XwEfGB4EAW6GMVODpGNYK/AMHYgzDPpnmBUai1Q/sYdHQh+KobulDv9B5PkZcbKffUmLilaLhFD9axSxFp2ehyq
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(478600001)(36906005)(47076005)(6666004)(7696005)(82740400003)(15650500001)(316002)(2616005)(107886003)(186003)(44832011)(8676002)(426003)(26005)(336012)(4744005)(82310400003)(70206006)(83380400001)(7636003)(9786002)(36860700001)(356005)(36756003)(6916009)(2906002)(5660300002)(4326008)(70586007)(8936002)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:59:25.4118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0164fb7b-2a9e-4eee-3f99-08d8fa8e2323
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7562
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the compatible to indicate support for both 5.2 and 6.0

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
new patch

 drivers/clk/clk-xlnx-clock-wizard.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 61c40e0..716fea83 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -621,6 +621,8 @@ static int clk_wzrd_remove(struct platform_device *pdev)
 
 static const struct of_device_id clk_wzrd_ids[] = {
 	{ .compatible = "xlnx,clocking-wizard" },
+	{ .compatible = "xlnx,clocking-wizard-v5-2" },
+	{ .compatible = "xlnx,clocking-wizard-v6-0" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
-- 
2.1.1

