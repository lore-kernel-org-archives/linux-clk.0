Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F80C7EE2E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 09:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbjFHJ0D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjFHJ0C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 05:26:02 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CEA269F;
        Thu,  8 Jun 2023 02:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/A+WbqPGdzpREImrPimSJ7zICeRjb9l/mCtNcBaPiObh+rFZaY0YN/iRWcBjQ9JaH8vT0DLGwCuRnbbx38r6kXWaalLoU2PuirmzpS/KfRr4Ks0XDn4ySqVgtRxAej+ckI/uWswMLJO+8SzDUVTJpNcBsUqpnhuQ/m7dFaujnkIMA0se/VL84KMLuvqQc0lxsebTvdjBaC3aT235xbFifZwGPPywDmD06WQGjWUGSQ+DR6zn3fFvoVgwgc5O5lVG1/uLQaH2O02AvxmuRwq3IMvCMKrAJWwkJvHQHVmMJ4cYF40nwZMXYyicTpHSvJMSq1PVLeZfxcrqN1XY5QhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHzxAzRCQSFQ0dXOjKW9lvmszdoPKmb0qStwN/NcAWY=;
 b=iXMKjHQRUsLANvjJPHFDSHljAMs3oi0GVs/atgdfdCPbHMx35rsGbu6KGCvwDmt91zETsgkAI3WtoiX4sLmaL1T7b27xg/x3LogQ/MtDEhu2LumbS3LlATvwyKdNY7nGkWzqz5U88/EbgQ3mTthZiq8LqtKvmgM7ffF93WmyIzk1oudpdg2RvNdJSS14lRjXoQW0OxiCUuWU2kHRATK/JM3cmwQAFdoEaB0ewhwzjKh++qU88qr17xUW1tOVXH431Xs7AJ/2Q5ajk0mO3DQX1pPLAJuefD7N41ZLbp9yEYC4avFD7q94NIOTmytTpJdEbiR4xOHR0/FtIPiNFadtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHzxAzRCQSFQ0dXOjKW9lvmszdoPKmb0qStwN/NcAWY=;
 b=Z/HxepdGvZYP8/D21IUD1Yw0comGMqUzARxvcCHS+41MP32E49UVh2yRD/xaSPTdYVZx0lHSdWK11FHT2fM4tXjGb8CEzv72I01ohG3bEezXGPwK5BsNwAcXcMqwL5Yw2cgKCw93u9jjbDWSTd4uh5PdOMgIpVW4G2t20uSqxm0=
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 09:25:57 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::87) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Thu, 8 Jun 2023 09:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Thu, 8 Jun 2023 09:25:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Jun
 2023 04:25:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Jun
 2023 04:25:35 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 8 Jun 2023 04:25:32 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <michal.simek@amd.com>,
        <mturquette@baylibre.com>
Subject: [PATCH v3] dt-bindings: clock: versal: Add versal-net compatible string
Date:   Thu, 8 Jun 2023 14:55:26 +0530
Message-ID: <20230608092526.6462-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT035:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: a24a69ab-11d3-40df-e3dd-08db68025d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeOAhvpoOfc3w6NI//FMM+nx5tfbEeLDFpQeIKIvpgXgoDliqBysnMdruqGiTJVD1klKixTQ6Pxo7+g2mDonQYkeUKKQD7aM/MCGWel03haeZZEHPlyL+6I8xghqviUi1an8K21xTbDd6qGYSORVVyIQ23B0Oxy2BoFjXBSFLWis7Dbz0zkWIl9Qaq1L2PaxX2kiH8xFPVdj/IR8jSVICKIFmvGF88qRzMwv3J+WpnldSx76zvkQXxLr7wQ0LaKPoV75L3R5Gt1FZ//vo2iCq8/w+Cq8p99+WTU1Q5AYixrYOHaJHVWnlqMA/FnU3PpagJ550nsgZz+G3GtjqPvweopDiGy0k38t9e4HdVVN3ZTiPzRYjJndpj5J6fUy+l6ZEXSODFn+aUGKCfOHrtaZvbKNC1eaDzif554Gbzy0lvEpH2g8MzN6XY+3TnlSCtOFmaZsKGf+UnXKzq/7qS4ZNh8QU2G5x78Gsy/8G2xukuDPpf35zJ7ttof5AxMJx1kMNVcejhpF3DhZuGv21Cc2HvADYbjYx7wITAUOd5/B3qWho0C1sbraZflTWhRh8vyTZnCWOjUDs+xoaTMB6ltE+psh/BcpuOYuVtiRR1suI/xRuowmexvZK9qCwZ7ii2DJCSUk7G0F/hhakbSHBqXdzDb4TfhO+ubrVqHrYyVB+K+Fb3qypwy8y/63xzAjw104IRJHc+BrYjX+vhMghSBu7ufgBFRmf63sx1Pm3WoxFLnH776h3Ap8zP9UeLNXluw622O62tjIQu3a0/s+F7WMzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(47076005)(2616005)(1076003)(26005)(41300700001)(83380400001)(36860700001)(6666004)(186003)(426003)(336012)(40460700003)(478600001)(54906003)(70586007)(356005)(4326008)(81166007)(82310400005)(70206006)(316002)(82740400003)(40480700001)(8676002)(44832011)(6916009)(5660300002)(4744005)(86362001)(8936002)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 09:25:57.0892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a24a69ab-11d3-40df-e3dd-08db68025d83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add dt-binding documentation for Versal NET platforms.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
Change in v2:
Add the versal net enum

Changes in v3:
Add the compatible for versal net
the usage will new compatible string followed by old one

 .../devicetree/bindings/clock/xlnx,versal-clk.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 229af98b1d30..b90aa064a6d3 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -20,7 +20,12 @@ select: false
 
 properties:
   compatible:
-    const: xlnx,versal-clk
+    oneOf:
+      - const: xlnx,versal-clk
+      - items:
+          - enum:
+              - xlnx,versal-net-clk
+          - const: xlnx,versal-clk
 
   "#clock-cells":
     const: 1
-- 
2.17.1

