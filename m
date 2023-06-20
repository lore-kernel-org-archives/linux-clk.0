Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD63AEB64D7
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jun 2023 11:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjFTLBt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjFTLBq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Jun 2023 07:01:46 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD059100;
        Tue, 20 Jun 2023 04:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LW2eqS4WsUlMW6/Vqxhk2nBbtueQ0KrfxHOD/FxhLwrTw6gr/z3zmpBlKNxJlvCfMn4BsboUV2AIL6w36SbApQ1sP8LAPpBBIvmalMP7XVOJXNNRZSmTtVXGv+eQavHUDPkluFxPdCx89rBmvVkJ/AJArXiNT940fcSUFfZlBsxwd8lq3JZfeTjtMqzO1gmbYyb19RdmMLQTzM40Ozcexv98Tk0RHgcBAdFyPhDeUrekkYAJNpfdH2WxECF1QgsYdlzaAmslGZlaNP6GV6P58RKLzgtxQPyYvHYD5jI99XrA8PRKqe0irBBhZYVLIGLQfn59LTw8+qVqqGD/Iwb3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM3DP78bM7vEhECavH4gl5tfkG/m3UlIk6CC7ww6Y0M=;
 b=ersy5OfRZfZUFCSKr9q/0/fVDt1m6Hk8oCLetKVwGWObA0JyVVeksV40fnmk02phdMLe7EkdHR9bL0lKiW6hqXS6s96r6Cznk5nEWOArBV7O9MoAzG2Drza0OhaJ/EhLMUAxUOEOfoj8HoiwxSANRuf+sREX7Yd4nuCCCJZzP45ebtZdSMkcZn+q/9g20bkYyy59GwZE5cOqm+tVM4gUKMGHrkoEZwBKdsiTs3QWSWdqcMMIwPFDkrbqb8NRE3cxQ2GWFxpLJv/8zKvLzcUsglQwpqsKsbjTvsist3IDAuVJHxj02k92hJwXixGMbe7Un35nGHz8AC6kzh6pBnk0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM3DP78bM7vEhECavH4gl5tfkG/m3UlIk6CC7ww6Y0M=;
 b=UPSCetC2jTThjoW1R7eF7oBZWPIq/+22VQfuryMPvFUiknOarEjLve2oVdabCn3YLtbSRu75pMjl+mT6XJBijwkQE0GKGebs55T4MYsiqdWVwMUVOSkc4c75n4/f9Pv0SJTo0LxTZgndh0qHocrhs8rtND6WjC+ZTEpKykJ7ZfI=
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by BL1PR12MB5364.namprd12.prod.outlook.com (2603:10b6:208:314::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 11:01:42 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::7e) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 11:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.19 via Frontend Transport; Tue, 20 Jun 2023 11:01:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 06:01:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 20 Jun
 2023 04:01:40 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 06:01:38 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v4] dt-bindings: clock: versal: Add versal-net compatible string
Date:   Tue, 20 Jun 2023 16:31:37 +0530
Message-ID: <20230620110137.5701-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BL1PR12MB5364:EE_
X-MS-Office365-Filtering-Correlation-Id: 52429f92-bc71-4be4-c0d6-08db717dba93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRqwQUrkIGGo49c5vW8MNXw8/syKfkgsiK2HxSsnTp7j8V6SF9CXOZlcmDsLUSBEcZanUJeZFDylgBkPBsMLUpdVTFrxBNKgzis+Qg0A1PSE/CvZoSky3povEDfSyvPbjWVP6QwIBq4PsAB2o3ta9cqtIzkL63ojb2RirIqpEsQe962M0s/D8odz8UGVn4IwL5qW8vgsk/JsAadfoeVjvKVJx1NKmjG6FnkYH0WruzRJ85Hw8EE75qB7Z8wUvwiRz+WG1oregyGNPJBsvF3RwnFyRCE1GYntIqEUieYJXFQrbHhbKcydGSmIFOe6Ze5/yYKTcPMOCMX0gcp16YCG38qzky8lzDpTu3RRcUm/X3zwbzr410RJebSRgpZeSORzaqf7l0GcJf5n6KR24JIte2NC19FqKU80R9DlKJXrPn3QlJkodUkkiD1h4GY5gUdD/tPPtQXqi3TGTlQFsORxtLIaOmkBwf9Ia+prjCuIv7n3fRnmfN3srW6sSJ/Q9y8i0pgUc/WCzJ2KCwB+6ENLEYihZptq6TTZAZcad2lm2yeNko4O6xZc8JNlhK7zjL2Gwgtphcgig3RcbIZ1BZMZV01/nVh0D1HalWCxJQ055BmoXId6j5kNKTMWGVCR2z80QGYsJaWIqQdKmjJoLkXitrZEg4Mkh/ioMtxUL7Uj1Bm8dml6FQRQ35H43qzxMJwyF21lB415aGgOb+ADK0XN85SzQYd/efIIHCdKreViRTr8tleUX996nKgT45TLoHHnYPHhnfH+beLbljjPYH1G3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(82310400005)(47076005)(966005)(478600001)(54906003)(83380400001)(336012)(1076003)(426003)(26005)(2616005)(186003)(2906002)(5660300002)(44832011)(70206006)(40460700003)(36756003)(356005)(81166007)(4326008)(70586007)(82740400003)(40480700001)(316002)(8936002)(8676002)(41300700001)(86362001)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:01:41.6903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52429f92-bc71-4be4-c0d6-08db717dba93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5364
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add dt-binding documentation for Versal NET platforms.
Versal Net is a new AMD/Xilinx  SoC.

The SoC and its architecture is based on the Versal ACAP device.
The Versal Net  device includes more security features in the
platform management controller (PMC) and increases the number of
CPUs in the application processing unit (APU) and the real-time
processing unit (RPU).

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---
For the list of peripherals  please check 
https://github.com/Xilinx/u-boot-xlnx/blob/master/arch/arm/dts/versal-net.dtsi

Changes in v4:
Add description for for versal net

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

