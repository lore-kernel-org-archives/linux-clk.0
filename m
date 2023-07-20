Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5290EEB64DA
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 11:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjGTLbU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 07:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjGTLbU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 07:31:20 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9D4B7;
        Thu, 20 Jul 2023 04:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5XRrLNFDqe+5jt/OPEHQD+THT7Jwg/rlBbMX1ym0F1nV40lrmv6CLzrZPvkC2B2s5aSQ3+zuBo4FDOgz6qn1pUQVW5e5h3BLlCi2vni9vvLdmjFAXXHHGl7Te7DyTl76j+WGmM2SysuLtRNgxy5tFXpkojYT/CpKW0ejzY1q20jApaxi4MHfOA6o5ZqqxF2kbkVL4y7fIrywZY6NvuSztQs4wsAVVSb1lV5F7S2A/ByOIJ9ZUAmnBvoeRs0HyM5v/xACdp4WQiTC0DfQ7Y1fUNqleD0D01Kgfl91xBlAicY6wc9I4R65OMizyw/vCD1W3mubTBIoJmCFDnvOWQGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOUNLeBktl+u+B7ftx6wuJOHcous8eI9++x+sTAaj9I=;
 b=JnFgFunx70yvsPvTmvkAnU0YCkVGyEh3ALL0Y5F1ncd3xpMUSfy4w85Q4761NmqaqbVJ6qCv/IK4z9CePldJxpfPh/cDpvzQOVpX9PWAyzyy3EAAWLYbj/qii4M3fwxdj9U0cGErex1FSnVTpiLjw4iZvmLR/ofn9BdEd1m32+tM9TONa4Mj6SZNd3JH3QTUh/iGTQyIuSCmRScqAebpOqHn4i/2p4T5gcqWXYDwE3+TsfbbAH805IsK7hFEgG8bXpCg2+xs0No0bD/6mY189KFUGfteB0WeiipXJHR4EmeKrY9lZ7NKUj5u+sud81iU9WcMpIJbkIkFogot3jxvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOUNLeBktl+u+B7ftx6wuJOHcous8eI9++x+sTAaj9I=;
 b=T0Frd42kDr3+WsYgvwDfxfxrHiDHN4dLSgXp27bDyPAqGuV1iF56cLGxx2ILsXuARWX/6aaxslF+7ymfIIk/sKRXAi1rrubYJytDuZFeid+hkwW60MOmTLACJ2LpPFoNA15k/IWtXVkYlJ8EO0nXfyE0eXEX+lb1dwgZwrIdXYo=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 11:31:15 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::56) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Thu, 20 Jul 2023 11:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Thu, 20 Jul 2023 11:31:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 06:31:13 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 20 Jul 2023 06:31:10 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <michal.simek@amd.com>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v2] dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml
Date:   Thu, 20 Jul 2023 17:01:10 +0530
Message-ID: <20230720113110.25047-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b0aab4-33c0-495f-ef57-08db8914d3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jc/5daQIPSEIXkaZJfKCBuU6eUG4PgikjxGpL7NOKTAGpXreaoxVmQZq7fYnfj+zQO3/NF5xmRhzyHABEatrlBBeiLw19Dc5SKHHyTdXHqfkjIxS8VK+F7lB1zEn3yprlS8Ordr69KC7TXwduQwzjawmK+9pRySkQeYYS86sstJLDl/7+17sXUPsLkerlBrEL5Llle5gAckyXtdo2tZCfxQ0HRNlMtzJaytDGXEb9yXwPvZ4v+K3Zi8jF6Vkaof14RmqtY1MR4RdL/0JGusvSUXoZ4GJSSrST4eVPZs9LjfC/Od58VR1c0SEq4Y59ThsXLabuSNfIjuEvcGJw3yCsPk6KgL546ZUK7e/rpNyuUblNceJHjuaSQWh4fXbtsroYlrw04FBwhwjFK40QuRAtl1TYyS6snoskEJNTDRUmzHXYr/odSC8fQBsRpVrB53Hj0c0wQij3Hxx0nzolxQCPiA1H56NpwqUzkeZ0TOBZWNeY6RBVkm7CB2IWh83NrDW0fAo6yh54FC+l/9hdVlTFSBdkqdA1TfyuMfjfz4mJ/tuHi1nVokxbNrswaetoZ9YMAigbATpXYKmEPH+hSZluRNcY2OqNe8J6fM84dLiPv7DcqAPY12aje8fy5+MecGFOn6ZhbyCR6vExftrW2smWcARTVwA1AVmRh+7zIxhAikmI9KdaaEVOnE3fgi7n4GG8UaWpbbglKi1lucTXmGJwQZAC2tborD+vZlNzE8+/sJehPWsJd4M8f+Ni2rkFZ3vlZI06maY8FBt5yycaZjS7g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(2906002)(478600001)(8676002)(44832011)(36756003)(54906003)(70206006)(41300700001)(70586007)(6916009)(4326008)(8936002)(316002)(356005)(426003)(47076005)(336012)(81166007)(83380400001)(82740400003)(86362001)(186003)(40460700003)(5660300002)(36860700001)(1076003)(26005)(40480700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 11:31:15.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b0aab4-33c0-495f-ef57-08db8914d3fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the xlnx,zynqmp-clk.txt to yaml.
versal-clk.yaml already exists that's why ZynqMP is converted and
merged.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v2:
add enum in compatible
fix the description
add constraints for clocks
name the clock-controller1 to clock-controller

 .../bindings/clock/xlnx,versal-clk.yaml       | 80 ++++++++++++++++---
 .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
 2 files changed, 70 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..cfe3aa676504 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -19,7 +19,9 @@ select: false
 properties:
   compatible:
     oneOf:
-      - const: xlnx,versal-clk
+      - enum:
+          - xlnx,versal-clk
+          - xlnx,zynqmp-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
@@ -31,16 +33,8 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    items:
-      - description: reference clock
-      - description: alternate reference clock
-      - description: alternate reference clock for programmable logic
 
-  clock-names:
-    items:
-      - const: ref
-      - const: alt_ref
-      - const: pl_alt_ref
+  clock-names: true
 
 required:
   - compatible
@@ -50,6 +44,63 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,versal-clk
+
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          items:
+            - description: reference clock
+            - description: alternate reference clock
+            - description: alternate reference clock for programmable logic
+
+        clock-names:
+          minItems: 3
+          items:
+            - const: ref
+            - const: alt_ref
+            - const: pl_alt_ref
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,zynqmp-clk
+
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          items:
+            - description: PS reference clock
+            - description: reference clock for video system
+            - description: alternative PS reference clock
+            - description: auxiliary reference clock
+            - description: transceiver reference clock
+            - description: (E)MIO clock source  (Optional clock)
+            - description: GEM emio clock  (Optional clock)
+            - description: Watchdog external clock (Optional clock)
+
+        clock-names:
+          minItems: 5
+          items:
+            - const: pss_ref_clk
+            - const: video_clk
+            - const: pss_alt_ref_clk
+            - const: aux_ref_clk
+            - const: gt_crx_ref_clk
+            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "gem[0-3]+_emio_clk.*$"
+            - pattern: "swdt[0-1]+_ext_clk.*$"
+
 examples:
   - |
     firmware {
@@ -64,4 +115,13 @@ examples:
         };
       };
     };
+
+    clock-controller {
+        #clock-cells = <1>;
+        compatible = "xlnx,zynqmp-clk";
+        clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
+        clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                      "aux_ref_clk", "gt_crx_ref_clk";
+    };
 ...
diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
deleted file mode 100644
index 391ee1a60bed..000000000000
--- a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
+++ /dev/null
@@ -1,63 +0,0 @@
---------------------------------------------------------------------------
-Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled using
-Zynq MPSoC firmware interface
---------------------------------------------------------------------------
-The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
-tree. It reads required input clock frequencies from the devicetree and acts
-as clock provider for all clock consumers of PS clocks.
-
-See clock_bindings.txt for more information on the generic clock bindings.
-
-Required properties:
- - #clock-cells:	Must be 1
- - compatible:		Must contain:	"xlnx,zynqmp-clk"
- - clocks:		List of clock specifiers which are external input
-			clocks to the given clock controller. Please refer
-			the next section to find the input clocks for a
-			given controller.
- - clock-names:		List of clock names which are exteral input clocks
-			to the given clock controller. Please refer to the
-			clock bindings for more details.
-
-Input clocks for zynqmp Ultrascale+ clock controller:
-
-The Zynq UltraScale+ MPSoC has one primary and four alternative reference clock
-inputs. These required clock inputs are:
- - pss_ref_clk (PS reference clock)
- - video_clk (reference clock for video system )
- - pss_alt_ref_clk (alternative PS reference clock)
- - aux_ref_clk
- - gt_crx_ref_clk (transceiver reference clock)
-
-The following strings are optional parameters to the 'clock-names' property in
-order to provide an optional (E)MIO clock source:
- - swdt0_ext_clk
- - swdt1_ext_clk
- - gem0_emio_clk
- - gem1_emio_clk
- - gem2_emio_clk
- - gem3_emio_clk
- - mio_clk_XX		# with XX = 00..77
- - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
-
-
-Output clocks are registered based on clock information received
-from firmware. Output clocks indexes are mentioned in
-include/dt-bindings/clock/xlnx-zynqmp-clk.h.
-
--------
-Example
--------
-
-firmware {
-	zynqmp_firmware: zynqmp-firmware {
-		compatible = "xlnx,zynqmp-firmware";
-		method = "smc";
-		zynqmp_clk: clock-controller {
-			#clock-cells = <1>;
-			compatible = "xlnx,zynqmp-clk";
-			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
-			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
-		};
-	};
-};
-- 
2.17.1

