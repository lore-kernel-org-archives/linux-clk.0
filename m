Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797C5C761AF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 09:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjC3JNz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 05:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjC3JNh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 05:13:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::617])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFE61984;
        Thu, 30 Mar 2023 02:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbezMHXkqncrdn7c4u4jcvrpcrc8NrhwQshUhaciay7Pmz2T+8iPg6Q6pO+4FEdy94V6I6fQDWGa2Qk9hN/pnowaQ02NXOJXRdPyTm0XyNO5HcFyr6inoKOzJdWaJgXQ5BifVOAVFbn9u96sTV0ISFOiXGx0h/7bsje+IO2W2oyfVNZLfaZJ5YQFeEYPb05SLTIo9j8ghXze/JYKblgnFJ462CGqmR9uQsOLk14nzXOK8Q6K+KQggGpddi8bC/2FitfmM/48dZK9s2bowKk4G2C06o+9RJ8Ajku5ltZZ2Jk2pzRJSh9RHqNbvkhdPRmOe59C0yxiz8cjRtXw1TKlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgFahVhiZvGBrMh72bPWIoPUYbOnOxst/TWaFxr+Lec=;
 b=OSbvSDXu28pJqNPrlELtOyXUkuZU+ouYqKXzTsjCD+tA3mdrFbmgrrZzgCeJH5eqUqhL4EXkokJqaiCE6FfFURHVgYFMBwwIjyQN8xGDeKyBep+iwIKmdPaTQELfgXR7w4ZjEF/DlWebOAEnxHM0BjENQIoPnxJfGpCig5iBWcmqRr8cTc21lwCZw3Qb1sx74EaVsV4r6Rti6PRJiMWmZz94b5tVydYoZ8o5zWY+gusWddXCnUiDd3gVC73ul+pLqhQTFL9ophcgBtm8qWC5xkZwlkpNUefaSGnJ/oZN0qz36T5UHiSTd/+IZqW9kXxh+OxHiIahyBtT5mzcL0w0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgFahVhiZvGBrMh72bPWIoPUYbOnOxst/TWaFxr+Lec=;
 b=zN8VGiwUQ9sf43SlYMb5VOWIDnA8vcp6l0nP8yMRTd6NlM0KUWtQX0o38pDNyHM9p07ypboocn/QhQE0rfJIafElb25i4NyeSTccmZdc0AbxdPSPpv1MBR0snpD85jjoBM4wlL86CRWHw4590aOVsGdsnRjUQQuZDWItFMN2JbM=
Received: from MW3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:303:2b::34)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Thu, 30 Mar
 2023 09:13:26 +0000
Received: from CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::95) by MW3PR05CA0029.outlook.office365.com
 (2603:10b6:303:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13 via Frontend
 Transport; Thu, 30 Mar 2023 09:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT111.mail.protection.outlook.com (10.13.174.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6254.20 via Frontend Transport; Thu, 30 Mar 2023 09:13:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 04:13:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 04:13:17 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Mar 2023 04:13:15 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>
Subject: [PATCH v1 2/2] drivers: clk: zynqmp: Add versal-net compatible string
Date:   Thu, 30 Mar 2023 14:43:09 +0530
Message-ID: <20230330091309.16215-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
References: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT111:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: c3016298-d980-45c4-46df-08db30ff04fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3nyGyzBrfTb/SNnJIAAuoCpBahZzzFQcYYMBWK2FIE1U2tOg5RvYEQOD+JU3HEGrxfqGakbQxDzn2K17b7rQbvgaIBOq2JPR37UUKo6AI6SNAIJSfDl6PwNA/1QYUjlPqC1kWzVl8vpGaaquOGvcTQdZiEDxFPOjVWBcdRUI6ap6v469x1gaoKvyIb7j1z+eHR6gMnbG49BO74zgYBZLm/05CrOlxbyjp+LFOC4Sc1cc/NLP2BlH54ARdcV8ccugfymbnzqrSDkR7CbN+CRfz/oJaKqRHzCIHe7lMNTUC5XvkA4VWl0AofcvmQ9b8xU39gxTL5BohTjF8zm1yDbQEXEkZlTFnbxjWc05I7V7XLpniyKIYFDZIhDFB1f0yT/MsUCrOcLq8FlwIh1mq0ehRANHTv02MuR2H74qLhH4QnApxz8UXUx8INDf73S0ORKfa813lCdsfRRu7DdMtZJeVR8LQD/DmjF2iJea1ITGPt11ZpgerrcxsEw12/t/L/rmfZFpfiQKe+ig0aRXVfJcJjxFJY1DLSoM3aFIOcViAYPPgaKFVK0MUk5uCcdG8XR/csYm+wPalqMMWh/kABp97SzSJWwLYEmKFt6lJ0G45UaAj2m1UHL1POiacWGDDC2XSOzLGp+WYPyztXJDspXjbU/jKlEZfY/H5REH5shpIPOW2sWX4NPhDynAxnL/S42anzjDFUbTRSYcnTo9CNkGTJ2OsT6EiKxqcgPpF1YYGU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(356005)(47076005)(2616005)(40480700001)(2906002)(40460700003)(426003)(6666004)(6916009)(336012)(70586007)(8676002)(41300700001)(82310400005)(4326008)(478600001)(70206006)(186003)(26005)(54906003)(86362001)(36756003)(36860700001)(316002)(83380400001)(82740400003)(8936002)(81166007)(44832011)(5660300002)(4744005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:13:26.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3016298-d980-45c4-46df-08db30ff04fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>

Add compatible string for versal-net.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/zynqmp/clkc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 5636ff1ce552..1ea5fba20d91 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -789,6 +789,7 @@ static int zynqmp_clock_probe(struct platform_device *pdev)
 static const struct of_device_id zynqmp_clock_of_match[] = {
 	{.compatible = "xlnx,zynqmp-clk"},
 	{.compatible = "xlnx,versal-clk"},
+	{.compatible = "xlnx,versal-net-clk"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_clock_of_match);
-- 
2.17.1

