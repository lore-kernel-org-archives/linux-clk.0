Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38D4C6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 09:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjC3JNs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 05:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjC3JN0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 05:13:26 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700997EC0;
        Thu, 30 Mar 2023 02:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7aFZ0OBLV+wR7P2VN67fDMmPCmrwCI9HC0bgfY0dA35/7IUKyn4m/9YflddfBRe37V8SdqvGWHjaG6rIFTbUoWQy0pyQ6z74yvJPEBmevo8AlwqfC55Bm+nzJOkEv+4b08AIbuFR38KfzQ9p2wzZwvhzq5cMzxQ23RJUYGt7B4kwDleXcJxJkpEbdvL4Nj2ze25qT1OH2qWp8DGZ8MH+4haGWJ8x7QHt4Blk9nSAH7fY0nHXogcE5Zq7A+8+daAuj4u9kWqyEpua5QSSDT6/wRgBQC7VlfF558+5LDYEMIRZaZ2qC0etj6ujXpB6dGN4mfu5pOAw2/4QM5BfuiRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQETS7oZ0CJguzmnDKgXdEkFQS2cLfcMDc/cni3Yp7c=;
 b=M8hwmbyuEEFF7FA8OSpX12tDi9caeYNcz9YTMSLtG/KvSeLBpbP1Cgi4vbUSSensfIOKJ0hXQe3uQLWPoVhQZ6eCYpIWQjV3eUk2C/eDtlKtt0OO2SxNJquD4j8Gw0YSOZuBDK850ifyTwC69vSTr58yXUt+iNJY3UR1AxX+jWE+TKqczT9ElUXtwiLHerwORF6/Sprpp6MpFlc6dvLA0UcJGCYvbI1yCJyZ6te6yhNnw9f74UPoeHnpWgCfjRGBY79lWgdXPMAbywcYJZabJfVrtaX0B27D9oqxF7SP2vFUsJkTGO75iz8PgdIAdN8HaO/y6suqi52fBh/1DLb8/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQETS7oZ0CJguzmnDKgXdEkFQS2cLfcMDc/cni3Yp7c=;
 b=F03CvtGVNVyKO+dUxMrixiSQzvzaIiK1ghS/ZC/8xs4FwGkQsxD3xY1Ef8Oy5BC9wbAI+69MOIcsuP9rS88WonkbiV/okxORv/yhGwbLo1/4q9hWQQkSSZ8ULGJsmCq5LX6KDuz4Ygvry01Ne/BYikKkupZ9F1hdZJKU3HTQnAk=
Received: from MW3PR06CA0023.namprd06.prod.outlook.com (2603:10b6:303:2a::28)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 09:13:16 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::53) by MW3PR06CA0023.outlook.office365.com
 (2603:10b6:303:2a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Thu, 30 Mar 2023 09:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6254.22 via Frontend Transport; Thu, 30 Mar 2023 09:13:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 04:13:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 02:13:14 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Mar 2023 04:13:12 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>
Subject: [PATCH v1 1/2] dt-bindings: clock: versal: Add versal-net compatible string
Date:   Thu, 30 Mar 2023 14:43:08 +0530
Message-ID: <20230330091309.16215-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
References: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b00a827-3722-486f-77c7-08db30feff2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRbBtheFuGVdUMtWsUl5hDLb4y6nZdU5efTzSyVEV+umnxEMaP80yx6kl3u+Jhn5YDOzHy97JKEFmbxtdoJtMTn0kWPjbqoIXe9IfRhHGpXBSv0pLVsTZot59rrHIh8iwNmjKbpwdznFGE1+Y/xcimToq8zPj8RI3fDcHxNvJCjn/9y57nd0HBjYu0egF7cry4OGngwGhS+ITZxkBSPsCdW2gKTnDIXsXRqX6IHGJ8QlVR8Wp59NmneB/CGQG46x6iiHcWyrGCXohw88mpVA4txIl2hnf6nJXSGvL7JJdcPY5Q1gQo0v9tio1ExaR/amJ7dXssbbY5AdMgMhRbHmU3dh1Eq2hDjGhQw2R4cRNE4S1z2ovzdCRgGK3gPsR1zrlBvuJpQ/CdVe3iBS5qgn9M1DCliKbtRDNml91htdOjmSRACr4g/wanNnQIp9enkMqYLtzbRwNfMWO526I/7LOd2gwdrjHh3DiaiiNRpYlsU7C2/64q8+bJuAMATOJjuVt0IM6YC3NMeMaasx5uDn4NPmYKwmFFLxE40k8uMyyPSdDx8NSvzWZ0ICVuUx+lOOoZaXZ9OLkBzHJZhTlo9LYhOAoUliPTv8GgVDmzZTcvPNyfEBdCr9coRMRczFUM+1j7x1PNyiMZQ3/Mlm4C+U6K/9FMhgu8kN/C7Ae7lkQNfW2vythXmvS8c4AEpbCQKdGyvakVQO2nwtkJogpRMto0dtatxDeG8KDoSIL1JTKAc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(4744005)(2906002)(2616005)(83380400001)(426003)(44832011)(5660300002)(6916009)(6666004)(41300700001)(8936002)(336012)(478600001)(36756003)(316002)(40460700003)(36860700001)(8676002)(4326008)(54906003)(70586007)(70206006)(186003)(356005)(86362001)(81166007)(26005)(47076005)(1076003)(40480700001)(82310400005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:13:16.2647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b00a827-3722-486f-77c7-08db30feff2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>

Add dt-binding documentation for Versal NET platforms.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../devicetree/bindings/clock/xlnx,versal-clk.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 4bbf96484b56..ee1924acebaf 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -20,7 +20,12 @@ select: false
 
 properties:
   compatible:
-    const: xlnx,versal-clk
+    oneOf:
+      - description: For implementations complying for Versal.
+        const: xlnx,versal-clk
+
+      - description: For implementations complying for Versal NET.
+        const: xlnx,versal-net-clk
 
   "#clock-cells":
     const: 1
-- 
2.17.1
 
