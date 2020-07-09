Return-Path: <SRS0=8I5m=AU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE44AC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C293207DD
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="lvsrkI1N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgGIQYw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jul 2020 12:24:52 -0400
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com ([40.107.94.64]:53601
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726890AbgGIQYv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Jul 2020 12:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggVm89Bi4+KfqMyxySk/4dvjOaXbpjeIZM1qeZV63FLgDFCCwCN6nkf4meUbgu3JDu9aHH3XO/HEtCfDK4upTeWmY0GXPyS7KDrLwuacPcdW3uPfAYup0WF/ryrMZjfQKlp+vwXVF4+f5DtgZDmPtLRuqN1EdMVXdJDP/ZEPJ51asfHVcbSbVMD8tcsGC2cADkktuNeRPgF6XqRVNyVy6syCy2FIppsVs4B5ZC+hfaVVvJYIi4Rd0dtdGMDp6UwwBiZKYyRnOlzFTjyV/wouQW/adAT0J9lmjd415t9Hf+lwLcicBUCsuCafZl7cK9yHWiaj0weNiwFmmyWAduxM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03gSwVqZidXKIHY0bMimCfcr55hHt+Lr4VkdgjpL4FU=;
 b=FTf5cgmc8T+JokiwlDYFUcuHSAQwbwvHhxhTDzOF39qs9dIcBJkogFfrCmKProNhZ7arhpAUxehUuXLWqQdbr5/AzfKveUlOVb8F/qmVygkL4kXfxpY+SQGKOvZ6vaWBWWZ7o3bMmSJYFZeEdLxwe0d7fwtWqVIEukJodbvxnyPpC7WCsS/pWkR6fbZC5C8mfTAEts2wmcSFws8fdvAy+K6lN5n1StHlGfJPlHuJdBRB+4t/ILBuA9VDLVtGitMoI2ypk5JaLzJUEfi6tvehpX20s3CCXtpVFJc8CfLG9hHKTXDqQO1HMUO85gpmDtr1sOg+gXWDGgrhSx/Qvhep5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03gSwVqZidXKIHY0bMimCfcr55hHt+Lr4VkdgjpL4FU=;
 b=lvsrkI1Nb/xEBo7hHCbHmnbccWEs03QKFwZZexZ4IX/oQRmCZGjoogtnjw1sC1uURPs6/J/N+lOk2w9AEXnCUFDZTbfcKqgctwSsOlTYPEi4xxagtmTSzNpY4zCQTh/Ee1/l6ZDHiUUHApMbLOxsjLW1zc/fQwmQtU8vkTp7Ngg=
Received: from SN4PR0401CA0012.namprd04.prod.outlook.com
 (2603:10b6:803:21::22) by BN7PR02MB5121.namprd02.prod.outlook.com
 (2603:10b6:408:31::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 16:24:49 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::2c) by SN4PR0401CA0012.outlook.office365.com
 (2603:10b6:803:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend
 Transport; Thu, 9 Jul 2020 16:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:24:48
 +0000
Received: from [149.199.38.66] (port=51353 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZKL-0005qK-KG; Thu, 09 Jul 2020 09:23:13 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZLs-0001kY-9O; Thu, 09 Jul 2020 09:24:48 -0700
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZLh-0001iJ-Al; Thu, 09 Jul 2020 09:24:37 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     linux-clk@vger.kernel.org, git-dev@xilinx.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/2] clk: zynqmp: Check the return type
Date:   Thu,  9 Jul 2020 21:54:32 +0530
Message-Id: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(396003)(136003)(346002)(39860400002)(376002)(46966005)(70206006)(70586007)(83380400001)(426003)(8676002)(107886003)(82740400003)(81166007)(36756003)(316002)(9786002)(47076004)(356005)(82310400002)(44832011)(186003)(26005)(2906002)(6636002)(7696005)(336012)(6666004)(4326008)(8936002)(4744005)(2616005)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2bab7806-4ccc-4f58-ffbd-08d824249982
X-MS-TrafficTypeDiagnostic: BN7PR02MB5121:
X-Microsoft-Antispam-PRVS: <BN7PR02MB51219466AE13879E8BE268CBAA640@BN7PR02MB5121.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3wJ10yXhbDPhm5rtRLptQg3k2k9HMVL/aMiJRDKuufniuAjCM4h8lrJAkBKjWRxPuEPkuo9wJlZ4hvlshSoBMlfWR1S4y4VUdDUWpX27I+LwEArEEOnUnPQ1TQi5R0YQEpxV/JkPpVt77zkHBc1mN/Iba8yOCk5Fzui9uSw0z1x41kVb/drotqLS1B2qbzOvNohK1lPF9/J5OIcXA5WMLV+JKIP73aFcVrZC9Hay0iRtEo22wthdl3E8EJrrAfam4RhVNht20JixFBDzj+gjjYtdvDpwNQOMaDJxUjw4+bIP9G2bG0tzfQonITaif1e2bExYC2/2HDm5NwYji6ZVbPDw8yyo0IvDEjh4RrVi12zYQqjKeBvkXLOvfr6RrWKNn5XU0pf43X0m+RLmGufyA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:24:48.5796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bab7806-4ccc-4f58-ffbd-08d824249982
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5121
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the return value of of_clk_add_hw_provider is ignored.
lets check and return value.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index db8d0d7..5f674c5 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -739,9 +739,7 @@ static int zynqmp_clk_setup(struct device_node *np)
 	zynqmp_register_clocks(np);
 
 	zynqmp_data->num = clock_max_idx;
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
-
-	return 0;
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
 }
 
 static int zynqmp_clock_probe(struct platform_device *pdev)
-- 
2.1.1

