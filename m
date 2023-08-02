Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B2EC001DF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 04:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjHBEgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 00:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjHBEgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 00:36:10 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C341704;
        Tue,  1 Aug 2023 21:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJm/UMBj/I9U5rzSUTBtcdhzVdC5yeFnbxir7IoTgqTtFOaaBqVi1icJy14k1KxTJwEt5si/psdJxwqkdpg+hFgqNj82XJkkDHeuggCo/w6KTDtdK5VaJHaaoUFoKtJiLYAaICRj55Ut4zJsNwaxVmKr+9iQMuUOJQ0QIXfkFfmOZJ3aZWwt5dZVmbZFXkGdTlWo5iBCyHH1spaYIvkCL1K1u5iJv2qy5dPO0nB6AG2XNulDB6Sb5CX0JVfRekoDhY76qMwi5lCJz7tBDU2eipQjuaG9t1XAIvJ0i8pZyumEtBIW6w4sPXA3SBtvTKz4ZyUNiLDwdTy6l56X2plsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38JwVGCkv1jawJHTxFpJO1HIF+13MuqmwasWvQlsdsU=;
 b=JqP/xzpKoSm2HXFMwrrYtqxPOE48LU5GxzzTg9O8AAWOd7s8q6GmUkyXRHz+tT488DXBS6DwGROcf7OQlADoLzliy9Oo6z0RUHBe1mBtXMvic/CnRD0aDWBgTPNLmuODirpDruhg2sp0JSAi0ry78qJ7P8XmIA1xbRGXspm8Wn/Ith80kzGwHPZxhkBpjvDfnPes1hMe3VG3rWje1qII0DktgpikVvCp+XnrfouwfS6axhJ1X6jw13BflNXE/HZoL8YeBFZLPxyyj98zdSf1u0HU4+4IAp34OAWOYLQ9a3QQkRGAUW6SSrWDxRi5wOOlZFYQKWERP+jy3+/7zLGSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38JwVGCkv1jawJHTxFpJO1HIF+13MuqmwasWvQlsdsU=;
 b=Px+W05YPqpMuOJudOBDODuxEASVp6t2NPsQzxmGB3afgXUh91/3CMJHANjy3E7ywcgROtvL+mggt39+IKX7DO34S/SPbjSSfATjoxL4+7DuN5gyf4fUryNmdOhr3G8n3xPwqAFOe1Gj+fGwc+opV+gg1Om3ZPlWS2OLhg/h1APg=
Received: from CYXPR03CA0041.namprd03.prod.outlook.com (2603:10b6:930:d2::12)
 by BL1PR12MB5304.namprd12.prod.outlook.com (2603:10b6:208:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 04:36:02 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::23) by CYXPR03CA0041.outlook.office365.com
 (2603:10b6:930:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Wed, 2 Aug 2023 04:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 2 Aug 2023 04:36:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 23:36:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 23:36:00 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 1 Aug 2023 23:35:58 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v4] dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml
Date:   Wed, 2 Aug 2023 10:05:57 +0530
Message-ID: <20230802043557.26478-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|BL1PR12MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: a45a7e1c-b0bb-4124-25ee-08db9311fa3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+RhobqbObO9xIrHQrxa5j0h1f+dCejsZs3Neq0C742dobpx/3IXcL7aniqGKzvecKPU6opJ6TW9KqBsunzEQKYNfsfEcPMLHH8g6opHQWjTi0zsNpMGljh/ZTwJp0BgbhUhh5EipsHZtwsoayMSCzymW7cguskdufWg5qv3zVtzNQBhnwq81MRHxBz/d3gOtyHW29U7/mRQroBVPHsa9UuVHqWeVznpkFC4jrk1idPgNOrhLGBZT3IOqyl5Rfa+O1yv5QiNqXKUYlCpTw07rT2X4TT2FfTo/PHxv5RYYEIuUC/1wUNf/TFH23qXIFaF/2CNXWjyheEyP43k7MO7dsOWfqy5ulp3vw3UoD5hTGbWbRPi3hDqYc4m+aAt3iQUYlvyPQec1BfccdS0v82L+NH7U5z6ASZ+/B/x+Ti7J5j/wy7VPeceoAVAv1ufsXejxbC/JimCecZ90g2gopXKRt5mw4LTcQPK0WwD8J2s6o5rTZCscqpP64JtKjYdOr5ZaRApjX2Nn2zIbdVPi1VlQ94dm355e5WeqrC69PiplzTYsBKfaB2khGsNpWJrzf6jxSM35fwmSDd0wEGw5nUoo7lLInetMsK0e/OrjV+aC8r7577DafBXE3xdFR79aZC0tmTbqPp+NoSJmpDzi6+FV3vSE/4U3EywHhN+oMUYNjmCaUgYcc4ZDFyvbDRJOm3ghsP2bjrwdO8mzM6T7nKNacEV3QUGM7C71A0x8BoWQGj0dX5vbXFMmIKdQ5cGl9FhUmQr7NSFR879vBKAgaofHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(70586007)(6916009)(70206006)(4326008)(86362001)(83380400001)(478600001)(36756003)(426003)(336012)(186003)(82740400003)(81166007)(356005)(26005)(1076003)(2616005)(36860700001)(40480700001)(54906003)(47076005)(41300700001)(8936002)(8676002)(5660300002)(44832011)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 04:36:02.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45a7e1c-b0bb-4124-25ee-08db9311fa3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5304
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the xlnx,zynqmp-clk.txt to yaml.
versal-clk.yaml already exists that's why ZynqMP is converted and
merged.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
Do not relax the constraints
Update the constraints to max as 8

Changes in v3:
Update the common constraints

Changes in v2:
add enum in compatible
fix the description
add constraints for clocks
name the clock-controller1 to clock-controller

 .../bindings/clock/xlnx,versal-clk.yaml       | 80 ++++++++++++++++---
 .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
 2 files changed, 71 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..1ed17dfca241 100644
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
@@ -31,16 +33,12 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    items:
-      - description: reference clock
-      - description: alternate reference clock
-      - description: alternate reference clock for programmable logic
+    minItems: 3
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: ref
-      - const: alt_ref
-      - const: pl_alt_ref
+    minItems: 3
+    maxItems: 8
 
 required:
   - compatible
@@ -50,6 +48,61 @@ required:
 
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
+          items:
+            - description: reference clock
+            - description: alternate reference clock
+            - description: alternate reference clock for programmable logic
+
+        clock-names:
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
@@ -64,4 +117,13 @@ examples:
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

