Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB39C7EE24
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jun 2023 10:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236734AbjFFKzO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jun 2023 06:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236850AbjFFKyK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2023 06:54:10 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2615B2736;
        Tue,  6 Jun 2023 03:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqKOYYy9V0u6028aXSktj/0o+HRt5aZgyiCARnbyI+87PR+CEhH1Seq8UtzmcK74gT0j/diss0Ny+hvzv8BTIaaNrspx8gYD+8XrpnZzUikeyspjaepxPKATdM44xjfkYhO9n9Ir7YTDC3buCP3LmZrs1ErCWMXs0m/7x7bIK1f0ijKNrkDK/I+2uwvpiBRpTB3NI8h7DWd/s1llsX8ULw+zixzgvRPv0TAu0hNQOPKHVofh9kn/2wdCaY1sK0/5pHsnNaaeHKHwhRCIpuH7z3/oArTIAXH8BpBsTxYHTLALzeahqeeXU7DBql0DP64V9RENpz7IENr5Zj6Z/qu2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzuLJLQDc25k9T3yyBLqarfHyblOTSEkU+mHxWGmrgM=;
 b=HwgXPUj3BDV3vCsh2kDgVFsF2/LMRla4QbOgJyD+qWy0ZhV6AhXyH91xyejBLkRCWIwVqX0DaqzjOdkOUjz0IK0lJGWTqrDdiQPjHFs4XFS+VNqj+ZzUxA0R6V49MeIMel0DptDkWNjkPeARTVkwVMtGc+iea54CSWn+ZPs9Pu8EwNX/kZikIlgJRd41kUklADWDk53jJGiYHvH6KDdO4OsYCDpjUeyPEpqXgwGi6ftn2vSPpuCCLSWUNlFA/o5ar6WWydg4r87bGL/s3oDhgfu1IE3YjhGetymN3PUPakcI4RVjKLDQFU4JZ3HiTsdK+UvEqd0a52Gy9/NGK/BTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzuLJLQDc25k9T3yyBLqarfHyblOTSEkU+mHxWGmrgM=;
 b=O2+WnSuHK4efT02NHg2pB4HtkKFcUF183ph4xnV+wnZgR3DiDKXofVpctZtWQrD6EISuHcJbSZQl45dnFu8c5jK1012AubJEZ0JGWYNWwx9jk2GLqm0+pUN25KtJCcTWOwdLUdEgB7TMcQwfKvPWarVYyft8GBRJa6Fqlir81uI=
Received: from CYXPR02CA0051.namprd02.prod.outlook.com (2603:10b6:930:cd::23)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 10:50:36 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::e0) by CYXPR02CA0051.outlook.office365.com
 (2603:10b6:930:cd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36 via Frontend
 Transport; Tue, 6 Jun 2023 10:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 10:50:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 05:50:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 05:50:22 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 05:50:20 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>, <mturquette@baylibre.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: xilinx: add versal compatible
Date:   Tue, 6 Jun 2023 16:20:15 +0530
Message-ID: <20230606105016.31364-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230606105016.31364-1-shubhrajyoti.datta@amd.com>
References: <20230606105016.31364-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c114b3-16e6-4676-e7e1-08db667bdbe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcST2YcTIDAup6b7cyKARiSS903DkFGduuUCoHWfhhWrWs82b/bi506juTbjMF3XnklHHVdQh1X/3TZ5qrhkF5yjCJ841vIh/qKZ7ASkZ6U/bDvIe2paT15rOdJxFP9+wpIAjeeURvZ18wMDdDbY8Q59lQD+QUyXRqnaRomOtQ1KiQkKm2InLWPK8CkbV6xc9ufksKzcNJH1vKloJKEYh3Asu6XJ6WlcSJYOpaa6s7e3iNsCIiv3dx1PSMmpv1g/qp630TdT1xiWVXWnxGFDgOrmB+VUEkkyetX9BWp59T9XVECp9bWhMGrQcSXMk6bP462mhyCeC0wf4CWqx7ZYExNuNPp2+OU3a7s8QpUqP7Hdvay6uBh2wJiq73sbqPU/zSHDF4yYTJV05r2zrU1a419RlkEe0iAdDGqn3ocA65tf4u4/43/wt0p6XSH4NYaZPq49ROSvp1nRBkndXoQaM5OhNzbDyq6GH2aLmcrOTr6bkmQW8vZ0MwLP3XSJahtJAEA8AGm334XCDlnM6gZgdkqvAKN0ClxpP/iAkuIyReuHaLD9YLQupWVhPusDRjdgGlljxxBbHy1SKJHljyOXVox43mMVA8n37gvKWuAgrbpBMzrpkjHJ4PK5GsMS6hSqTZuapIuQGy2eBPbDFa9ovu+exgRG9VXu5aRjDpIkkeQ23hcKgi2F0pjKF9nMpyguhu3NGjW5/m5Bf4hTr5xRWiOhl4Yc4/4IWDpmce/xUmavF3Jt3U4CE0+QI0hQFRs3ivbizxJAVJLNRyGuXQ55sQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(478600001)(4744005)(2906002)(40460700003)(82740400003)(36756003)(356005)(6666004)(36860700001)(82310400005)(2616005)(47076005)(336012)(83380400001)(426003)(86362001)(186003)(26005)(81166007)(1076003)(40480700001)(5660300002)(8936002)(8676002)(41300700001)(4326008)(70586007)(70206006)(316002)(44832011)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 10:50:35.7585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c114b3-16e6-4676-e7e1-08db667bdbe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devicetree compatible for Versal clocking wizard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
Add Ack and update subject

 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index c1f04830a832..896e0bdee6d8 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -20,6 +20,7 @@ properties:
       - xlnx,clocking-wizard
       - xlnx,clocking-wizard-v5.2
       - xlnx,clocking-wizard-v6.0
+      - xlnx,versal-clk-wizard
 
 
   reg:
-- 
2.17.1

