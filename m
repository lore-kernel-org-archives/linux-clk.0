Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D863CC43219
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 14:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiKOOuS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 09:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKOOuQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 09:50:16 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01B82019F;
        Tue, 15 Nov 2022 06:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFdnXSTDSr0gRy31U5WW+Cyxjfqj5dfRZtwDAR4/lIBk1Fi/YyALo5s2oOb7PE4AuXEu3GyNSuM327gzUrWqu8EjwstpLbwj1WhW0bATIFEltMFiR6YH0rQ1bduM2jbGggq0LfWobCvfoJEUemnNHhGXTCbedOUE1GSYJKNxmxB4eAMEatBiKUPG7uFr6ZJEwH1oE75SZca0R7pEpxv+BQx/Gpz4JvHt9QKTJXialOno6UXWjQXl7226QkzAYOdtws5vzGoA1YxquLuvyjYmE1MXr2dJbyfIIYv/k7WlyCxPYDr2yWlwIooPOI9mj44fnFdEetvqixgmvK+DtnI6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+BeMOBlTliBERd5aQ4WgGfpZBip8fTPBVP4UPDb6wI=;
 b=m70WgT8xfKpwFVdhyR/R05cVGtG1rGjV40kYpdfxfiEVoTdnibbyqsKqOWfQSbX7BJH4kEVpKrhRao7MtRlilxZXoH/+8nuuQLqnvTC/6R5peDOMK3xEO/NTL1x/BYKt/KaHBz7YHYEKGOHH89ObA1c6aP39h/AbTlGRaDHXnYHvKB4icOIRdRtfLQCvZRdaqfR2d25ErkJHCMUm3RY8ejnKVIinpWb1eon/cggvEM491MCvicGmIYy62P9huB9dY6o88HRQdPEPZ9AMbfpfW+XNbpnsAPb2n+XB5DqqX91m7D6ocfe2hHMqpsfgEZveRi3k1hfP9aP7qj/Q9+74Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+BeMOBlTliBERd5aQ4WgGfpZBip8fTPBVP4UPDb6wI=;
 b=Z5H8YtTPtRnGNZoGAgnUv/33PR3XGBOGMZYpWKDyGic7+P9ZY5+Tp4bvSh744n6D1OQ/mSPtv3qN+QaXO5U7eka8JVG5rjC+8ahdfAdik7XWXNGyizt9fOR2RuQOZ7xia0eKe4YAGjtJgGIpTB95YiEC60kz8CzgVOJVtIKeifM=
Received: from MW4PR04CA0226.namprd04.prod.outlook.com (2603:10b6:303:87::21)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 14:50:12 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::36) by MW4PR04CA0226.outlook.office365.com
 (2603:10b6:303:87::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 14:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 15 Nov 2022 14:50:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 08:50:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 08:50:11 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 15 Nov 2022 08:50:08 -0600
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@gmail.com>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v2 1/2] dt-bindings: clk: Add binding for versal clocking wizard
Date:   Tue, 15 Nov 2022 20:20:04 +0530
Message-ID: <20221115145005.4747-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
References: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|BL0PR12MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 3210ad07-2f9b-4e61-6ab5-08dac718b334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovxVRJIhKUJyiO7xmd8NK8Ew/0ea+NRSED7C9dK3cTBR+WigBJZFBeLQngjhwuk2IboUWM3UcNEfXxhgD1LHnh+s1nQelf+RfxiXEnzpfnD3anZJDtPT0mVQtFy6acLaY8JUMucb4m8XHpNqYg3wwruFtDBHq9B5XWDHpTRiJAGLQrmfAWb2yRpQeN6gJx2XNBbpjDMTbEn71vWfa5oiKrwKDW5V08jbY6CTaU4KOt/oqSGTaFU6LjHczhn7xSHQC3tIZGXQMBrqj/sgCgzOxdEVCG4Y+7mTDIXB6Im8fAHDnfT49l6NwKJm3LLD4tDGbN0+P9tUKx829W896hW2zrRTt5eq/oyH6b6bwpnRVY9rd9f0Ucy1PNmPqK1GnMX1OQbxTKp5eMexskbYPF0y5VhBbcmET9MrB6IOrTWsF3seNNQkdYhssQvBVc9r3xECxK2aAmcRrvlnqpLitw8TSO7YM77NqWpp9dZaA95cJzdQBMJ6Fnl46ThOPhF3QD2lDWN24XR6XSVh1eCGVpKeXv2+bnWUogE3Yt74gRf7ND/mxetzaFRJBH7H6D70JP8f24MxiRcsGoFzdvJd578ta9BHjYp4YLYzE/ItL85TQtRsIOK+nqJoXWi2eaNJ0evXl4ylh6IOnXvpW2ORtRc8Zkq9Njw05145fYNYAW+SdWKD64xynXpohMjpLIvZz8xv4SttcnhsbfQ4oOtrEkb89wi2hMWLwyJMfaHY89BVNZEnpl58hM/8vhzVTMiBV3wXydZO9oyjzq9RyVeQy9FM4EBx7Th3ExvqILIGh0lydEkn7L1G4c3cKqf83P2NzQMBvpbnZGoKvJYjKXmcj7fXyySlS8hhbSTfeIzzm1FdnJgOOHaVrMIOhpj1a6Z6OMZc
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(44832011)(2906002)(70586007)(70206006)(5660300002)(8936002)(4326008)(8676002)(41300700001)(36756003)(6666004)(54906003)(6916009)(26005)(81166007)(316002)(356005)(47076005)(186003)(426003)(1076003)(2616005)(83380400001)(478600001)(336012)(966005)(36860700001)(86362001)(40480700001)(82740400003)(40460700003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 14:50:12.4483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3210ad07-2f9b-4e61-6ab5-08dac718b334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Clocking Wizard for Versal adaptive compute acceleration platforms
generates multiple configurable number of clock outputs.
Add device tree binding for Versal clocking wizard support.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
Update the compatible to reflect versal

 .../clock/xlnx,versal-clk-wizard.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
new file mode 100644
index 000000000000..aaba91a57713
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,versal-clk-wizard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal clocking wizard
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+
+description:
+  The clocking wizard is a soft ip clocking block of Xilinx Versal. The IP
+  uses the input clock frequencies and generates the requested
+  clock output.
+
+properties:
+  compatible:
+    const: xlnx,versal-clk-wizard
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: External input clocks to the given clock controller.
+    items:
+      - description: functional clock input
+      - description: axi clock or the interface clock
+
+  clock-names:
+    items:
+      - const: in1
+      - const: s_axi
+
+  xlnx,nr-outputs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    description:
+      Number of outputs.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - xlnx,nr-outputs
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-generator@40040000 {
+        compatible = "xlnx,versal-clk-wizard";
+        reg = <0x40040000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&clkc 15>, <&clkc 15>;
+        clock-names = "in1", "s_axi";
+        xlnx,nr-outputs = <6>;
+    };
+...
-- 
2.17.1

