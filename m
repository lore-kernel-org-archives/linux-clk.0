Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DEBC761AF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 08:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjC3Is4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjC3Isx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 04:48:53 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5E04224;
        Thu, 30 Mar 2023 01:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRBrZnvfhg1TCFfX2tZnoW3HEUx7yXo+NtOtIIDJquqNuJ9iiem1ObMV+qKm6XAPAJomKhorNdVpAEBZok9EbCKFYxoaQqeSEmnEEDM9v8FNr9eV+UP7n6vK//OtfK9YXcP/YFZ/KxOec20AbsKRfcAcuns98UrTQko0VOY+k4ZnaFCc6BA/ttghqWhHpOm+IxC2ssySAOYt1dPC2TuH5fphZVMYOKoxHl3t3byDEwekUcdWxb8vYSlWBSZfqVQ5kGjcP5mR2FzAEW/IoQL5AEC0GQoNBzUDEbp8kwkauOBgg74G18dwC2c7P2wcN+UOWHduB6D1Y++2e9YOGGFVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzY7Wnam7l7FEx9d8cEIMfy88seld3IkIkNvh6CPbaA=;
 b=NHdY780YTBQfEFcNOHi5sZs7tcFzoETaCpXc2B/nTvAUH7nuGfed8j1NZ+KzRduJKJNSLbAomZlasUK/oRn9z5//ZYFX7McI4NjKRLgf8yGoh+KvUXSnc2IRaB8YYGowQcBwWzBhINMi76W4tebdk1oezA1eBsE9Jj3Hk4J0CkhsfJPUnNTK/ZrCfQE213YOLXmP4l4OhW2jj65LiixWT4D12sQJTXCf8/FuzbCKke04osArtgtvwPxn+70rZKoUB9pAnhtUbjSN4SAS6UElTEkSj3nY3XBV+GP9dYLFYFlQZXC+Qa4HEEfkmdrgMODFlOjJQdrngcMSb8+k/YR7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzY7Wnam7l7FEx9d8cEIMfy88seld3IkIkNvh6CPbaA=;
 b=4i0xs/HSYomWjDdA5QoND/hYGJ4mJNCAJiNTEesY8ueo3kDhsiQeHNpPq8f9PQOQrHsWOsn9tSiL2jJFa2wQVY+F3sO0gOLOflc3v/gvKlsX4PwQxYRIL+8X/YiRY4FtYw+4T32HX7K9IxEaPPIRdn3356E83Z/Ve1M0jAalhpw=
Received: from BN1PR10CA0007.namprd10.prod.outlook.com (2603:10b6:408:e0::12)
 by CY5PR12MB6477.namprd12.prod.outlook.com (2603:10b6:930:36::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Thu, 30 Mar
 2023 08:48:50 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::57) by BN1PR10CA0007.outlook.office365.com
 (2603:10b6:408:e0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Thu, 30 Mar 2023 08:48:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6254.22 via Frontend Transport; Thu, 30 Mar 2023 08:48:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 03:48:49 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Mar 2023 03:48:47 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>
Subject: [PATCH] dt-bindings: clock: versal: Correct example dts
Date:   Thu, 30 Mar 2023 14:18:46 +0530
Message-ID: <20230330084846.14516-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|CY5PR12MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f81be99-e9d8-4403-97d5-08db30fb9538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/TxOd9mmmTEoVHD95s0D8TOQ2RMEdeDJfDwewfl3oDniSRe0fx0xJ8eZx2c+iGYUCkMOcDOjgWUt4aIKaFeDR59bJWQ83dVV+3ij1df2xpsqNzazMMNS36HdvtRqUD/GOwvp9JbAU9qFDa6EA97Lo0ornVgIKh2WGD9QnaOIlOiezM5M6thETZ9KFCbCknvZ1Q2fsYxqsFfEb/fX9x99KvAFXzLkksrXJUMKPMMiQIkXvvLcf7dk8lfO4dQx9RsLq6jAj4U1BHSHB+anIk7FB8rg6//98z8HQHp5lG1d8C1XfKqrtNoheP2u7ANk6pZBK3Nv2AnRkBGy4j7b2NSD8LbL2BLGN7DX8rjLfonmlIA3q63V+CGg8bIjZ8pSNmvmG4i4xZRKndIpGURDVwiakzBVanV1Bu+QxUcK6XviU0XebCTYCzyMv0fYB6g9Icie+Hc3EZ++eZ/K4fzJvaCBQkhtk3DL6zr3OGLyxIcGn8CVL9BNs7BEBqvCQYhALD7P4PA+j6S82v/StXLEV0xDAj8mPWV/1ePfIiSfMZOXW3igi0jEwCAWbH9bg4u29LhAGf1MgsgTHzcyT/H+Y5XwW9XOm1lofQM8zGt5C7xy3wZrn/LmQHM4pVFtijSlZjl1KVDAgFbPROk7rp0ojaABCtGndPG+J0aKTDrumpAu9PlEZdqsimBlW4vKBE4V161Ui+Ie+MXad4Wdtsvhz6oMQJPEuoetSDomn4UQ5CcdHk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(70586007)(44832011)(478600001)(83380400001)(86362001)(82740400003)(40480700001)(4326008)(8936002)(186003)(1076003)(40460700003)(81166007)(70206006)(54906003)(336012)(2906002)(8676002)(316002)(82310400005)(6916009)(47076005)(426003)(36756003)(356005)(41300700001)(26005)(2616005)(36860700001)(4744005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 08:48:50.1027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f81be99-e9d8-4403-97d5-08db30fb9538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6477
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>

Correct firmware node name and compatible string in versal clock
dt-bindings.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 229af98b1d30..4bbf96484b56 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -50,8 +50,8 @@ additionalProperties: false
 examples:
   - |
     firmware {
-      zynqmp_firmware: zynqmp-firmware {
-        compatible = "xlnx,zynqmp-firmware";
+      versal_firmware: versal-firmware {
+        compatible = "xlnx,versal-firmware";
         method = "smc";
         versal_clk: clock-controller {
           #clock-cells = <1>;
-- 
2.17.1

