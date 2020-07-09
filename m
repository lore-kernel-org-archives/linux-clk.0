Return-Path: <SRS0=8I5m=AU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C571C433DF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54BF5207DD
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="sjUd5fxw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgGIQYw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jul 2020 12:24:52 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:6104
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726357AbgGIQYv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Jul 2020 12:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeLPyQZ5i1Q8m2y1SHm59hdGbuQfpf14w8/16HEiqGWkslNTPU80lCB8Miyb0hDJo9WAlIkZno9pBY0zLOeQEeErja1me9SoDeC7xuyPCsPBfHmjucVcwPLAg4kn2AB/6grXJNGvZil4CY61KOMVjbi5SxM25y0VnKuwKqRsP0T4adxHdGShzMi1MRS1QRNuex57thhjy8Tv7KNYytzt4+tsxWzYs3zMYZRTfma6FS1YL/pOtp17d01fiMkIY1N4tlNEPbWSzCZG+IgF3iUB9F0Zp1JRrgphHp5Sg0PmKpjGIw/kaEvnfwAp0j9Dgp3AbRJBgN1AWRiCngPJdKbvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYpBBbDo6UF76JNzCp8MwFolyW9bFYjODW/7lMrh8uM=;
 b=SBfhDq7C+9dw4o0t5NWlZ6DikihANV/AeT76n1A2GivShTD3cYG0PqGNeyJctcr12UtVJvxi/rceh2SyPqIrQnMtQvAdrrkuArkTQy5+1qxqgICHTMOc1IF4lA7hUw55VRKZlLI+HKZDzcIT8esY6ZqRB5y4dJPewSAC2c36BoP2FjzA2c6rwOIhTM/VpvVfVfqT/enc9wZ5VpLYUiloZ1O0oJawNoSg8kcyF0OWQ4QpIplye6GIianTKveHjHbYm95JBwivSe831AyZVmKqvzFEMPWo5KqEquO/9gsi1RURdfw5QixjUa4+gbExBwG/DJfuEXLPeyhMLoLNNQ46bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYpBBbDo6UF76JNzCp8MwFolyW9bFYjODW/7lMrh8uM=;
 b=sjUd5fxw0dDzjNUn5Qy1gW+CEkVrl3JquFFA6QDhDu+o2rWHOl5TpSd6JJtsnTSJHfMjkOHDe8csbv8rxPj0lP1nryXmtmuELSBxXokop31pMP3O8yM+fHvU8Xl7NDrih5OPHrJP/Cq/nsThilZc+kTCMULiJri4YIIyqE6aUIU=
Received: from CY4PR15CA0004.namprd15.prod.outlook.com (2603:10b6:910:14::14)
 by BYAPR02MB5736.namprd02.prod.outlook.com (2603:10b6:a03:119::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 16:24:49 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::4e) by CY4PR15CA0004.outlook.office365.com
 (2603:10b6:910:14::14) with Microsoft SMTP Server (version=TLS1_2,
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
 CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with Microsoft SMTP
 Server id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:24:48
 +0000
Received: from [149.199.38.66] (port=51356 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZKL-0005qN-Le; Thu, 09 Jul 2020 09:23:13 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZLs-0001kY-Au; Thu, 09 Jul 2020 09:24:48 -0700
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1jtZLk-0001iJ-46; Thu, 09 Jul 2020 09:24:40 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     linux-clk@vger.kernel.org, git-dev@xilinx.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/2] clk: zynqmp: Fix a memory leak
Date:   Thu,  9 Jul 2020 21:54:33 +0530
Message-Id: <1594311873-8683-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(136003)(39860400002)(346002)(396003)(46966005)(36756003)(6666004)(478600001)(83380400001)(4744005)(5660300002)(70586007)(70206006)(81166007)(8936002)(82310400002)(44832011)(356005)(6636002)(2906002)(316002)(2616005)(336012)(82740400003)(26005)(9786002)(107886003)(186003)(4326008)(7696005)(47076004)(426003)(8676002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 469667fc-418c-42e1-e977-08d824249982
X-MS-TrafficTypeDiagnostic: BYAPR02MB5736:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5736FBEF0AC50CB03E1917FCAA640@BYAPR02MB5736.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwPMF/qMBGnokHoVI/Gz7PY9akSP8Wnb4okCJgs4f5DrZaoBKtmpPe4d6oQg9ia9NXQIV5Z9m2h+M2UQL5z6SQBPa5NuC8cYW8Sm4OtO/kudbjM3bsjM8cgJan/+udp7/rzzSpUXZG3zp8F1FpI4sW5p9rw2vxeYLNIuAZ33KHcYcxb36sqjfuZojzYRW5itdsO0+IxAZkhuIS1enlkfjA5n319YRlt35m/4qUDqELiXw6G9eziciUbK8x6VSUIdKWCucTyP/68LGGO+8j0OOkP35J5MbVQctIa3M6V6lQq4ED3FHiHtggV+DPIVl6QSO5k45ehKjQrzQ0T295N2J6U8HwaGszVH4TA9Kt96lFAcPlRUbdhQ2kBFMc8bJkWUfmy1GwyZmj1O6RHxfYf9MQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:24:48.5791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 469667fc-418c-42e1-e977-08d824249982
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5736
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix a memory leak of mux.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clk-mux-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 0619414..d3b8838 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -130,7 +130,7 @@ struct clk_hw *zynqmp_clk_register_mux(const char *name, u32 clk_id,
 	hw = &mux->hw;
 	ret = clk_hw_register(NULL, hw);
 	if (ret) {
-		kfree(hw);
+		kfree(mux);
 		hw = ERR_PTR(ret);
 	}
 
-- 
2.1.1

