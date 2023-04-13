Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A3BC77B6F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 10:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDMKM5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 06:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjDMKMd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 06:12:33 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCB49EFB;
        Thu, 13 Apr 2023 03:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBc1Y3MF2vAxLdYBWz7UkgU+KffQHDamYZkk1kBawdDQV8nLHD6aRuKwfedkUj25apDJjoekAHpDI0IKBZPPUAX+aYzZzHrRafeQtIJVK0Om6XwQPmlkzTt1rpAZsosvOoIerBUvPLtCBm8amUwoDGwRWT3jtEhI0GbcytckZCDT8pSzR91zVZgAQ8sHP3NxMRRRkkdohoTqjVe68/YJdoC+dWpJsZFKWy6dTfDOwT9sM1A+PfgZYFECBmnwEWlUgfTI1e6IyGPlQiassMRVU7yBMPkhKN6/YvfgfiuI17mmILGq2Fx4ARqTVIQX5+CUW6qM9yZvQv1k0knSgGN95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIVRViL9kBbu7DJND7STArU4U5l9L/l8Mwtwr/tVrKg=;
 b=dAmwx9YDZLsjgKA0YegSP8A/DKKVWf88g/hQsDK+IoWT75MlTHlmXNwRmNoPBTjddRSFqADhcsbJmmjlyoUG86x99XpXVSbJAPwBbeHaivQrbAazR6YaghtELPE1Kmqxi0isGAiJ/41iFzPpIdRxQrNDMUPebQ92bbyjQoY8ycqScksVIDuv4Dv9o/b+gE0h+pUDhs8+H42xl2IQ299WY9no/+L2uxrxu1WycJQUU27ghVged1SzkUjp0Ss9ISvta9XtEVgeqxNn8+WvEQYDzhzZLpZLDofInnnkIny8oPM7rl4F2ITX1wN6fLvLX4IHw6133wrkTO44yI2KAqK8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIVRViL9kBbu7DJND7STArU4U5l9L/l8Mwtwr/tVrKg=;
 b=BdQaIef8ALTl+MvPyHZfX1rfsP2pim0JEbAI0S9cotCQ9S8QFpKU19dO6LS7AoMbgBbGjG76k2nNgmLNyUQcbRY4Q9kLAnOXb6c+LCGuhGW7tWoKuDVXeIarRREnacICosrGyoG+JQCtPZ0izf8Ir0aeZR1MeByFjJ1IQlrzYzY=
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:11:53 +0000
Received: from CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::84) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Thu, 13 Apr 2023 10:11:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT081.mail.protection.outlook.com (10.13.174.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 10:11:53 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 05:11:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 03:11:37 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 05:11:35 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v2] dt-bindings: clock: versal: Add versal-net compatible string
Date:   Thu, 13 Apr 2023 15:41:34 +0530
Message-ID: <20230413101134.10627-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT081:EE_|BL1PR12MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7d9363-27f7-4ff9-4a96-08db3c078145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHg8T0HmsLpRomqVibclL/dKqC0hKwv6PF+g+qYv+g+gO5yTAmnb2FKYhz7B4vsbF7n/uL64qf/G0c6xtQER+Mna0+fi573t2ZecV6EQJ0ZSIWJYoFIdhGXQ7IXsNvk6UHo+ithOCObNy0CyeL1ZtKIqncDASYQaXioApDLo9Jv2KQl1HZAtndpnRcnHQZYopCriSGMmrA5SF+8Z7MzRn1o7FE5+1zsDJ4hkBeBCFb28BcSf1iJ7R7HlgRUf5rnY2YdwpYulbNwxQ9kvWVKOxWV+4GsrNaxMuEx5A+nqCMrxsLuBkeNwHMgMVQApSo+rgnJxRRh/n9Y8bWxnK7BSL9iuvrS4LJ/ULgiFfmfIMII07f2XhfD/5cI++SsUOVfTIsFp5LnGiboVjv5RLr+3M4Eo5IQ07CkoIHrDtxXznfbJ2qbkhkv9sR2Y0CYsU8ww7xIICLymfd2GIaYfwBzXukGzdYIquD8RXzWXFLL/iYSXYTrIsMkBQ2/cNZqgTQ7QfD4yOgVo48ZVh1L2U4VEKMPYijJ/f6J1kUSqUoo6u2OAfiVVvBJ+bfqL1eOeZKKEUe3qtkIRLFh0mhVmiW2fMfLpw+nDdcf2aCzou91knBeYeeBTzEv5OqXqL1RcUHz2Vc/2B+81H0DXEipuFAiY1ournvFAByqXc5Ex+wIXsNgyaRgItSxl3oMU74az81CO1Qp4/PgWmJ0+h+rQKbcg316DqfSi8+mOwhiwB/L1Bp0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(6916009)(70206006)(70586007)(4326008)(36756003)(4744005)(2906002)(44832011)(86362001)(81166007)(82740400003)(356005)(41300700001)(5660300002)(82310400005)(8676002)(8936002)(316002)(478600001)(40480700001)(54906003)(1076003)(26005)(336012)(426003)(36860700001)(2616005)(186003)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:11:53.2734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7d9363-27f7-4ff9-4a96-08db3c078145
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>

Add dt-binding documentation for Versal NET platforms.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Move to enum
Drop driver patch

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 4bbf96484b56..0029d94c4e1e 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -20,7 +20,9 @@ select: false
 
 properties:
   compatible:
-    const: xlnx,versal-clk
+    enum:
+      - xlnx,versal-clk
+      - xlnx,versal-net-clk
 
   "#clock-cells":
     const: 1
-- 
2.17.1

