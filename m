Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7194DEB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 06:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjGRGKr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 02:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjGRGKo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 02:10:44 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CF4EA;
        Mon, 17 Jul 2023 23:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo2fNmLzvPlIZwh0qfkHaq0xFkxy33MTdGpjSjJ/Py4TZIjTLy8XhRF8MQ/KEuTLzrSOLnWWlEdOyKESmc4XM/WQnZ41mI4OVPNK4SqnF30j0BKC3lPg6YYObHcb4za0eDLzz670Wd2SIgcPNR6zyks42WWdR0mofQB2o9Vww8kIjHTrWnjz3yOU9BOKxL0kAkanl7FufOUPqdjGIHrsIp9aSwGty/0QH8OM3FogWgGL8aptii85lgKaYIee1HQqcOFVta+QSGoj3Og9wu6kQBqyadn7Y7JFaKEELGSXf0iTjmvYap5JHyyPILbOYRHnueYOzOEbNpxmX7h3F474PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NbOMvJoRQkN64bYgTLds98v2xKKdcpH7m32548PbZE=;
 b=jvX6kX1EGBSmbb5L9jkiO/X8TZ08t3hQUoFIK3ejVGaFeOi/xPJoOsK9S4CNoj1Z83CjA0mcJ/gU5/CfluVn88/xUm5gRNiS1MQmfPa9vdOFjWNuHVDOEf5U+wdllt3XcE45Xti0LsJ/PgT4yAGyxYzNGGml+HdWgexKk30NeQw+8xN2n2EHZwcU7Yjn7k/SN9WkUES5qvFGA1zxDAlyjcEq4ZvsVTDPgmirqNQ9ZYxL7In2c84AqTQJ+p58953gEDlvMAhe97NMru6BD0lM8f/V8hlvMgJB2H6wHiErB9EZYoIMHpK8p+dLZD1p+mtYslzS1lq+emiMBMnEDf5RlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NbOMvJoRQkN64bYgTLds98v2xKKdcpH7m32548PbZE=;
 b=g9GdjN1And273VLXNvKVrl7qOYFN4/eIMaP9Sw/TZQ6vrX63kIzzOhO8w/kWIVXMAvRV3o1L3p0xXe+m256FyUz7o86TCJkMJ709Wa1rTYVKfPVVZqv1ca2vpcx/Iw6ddd2/NAwKjB6sapWTlyQElequsrI/0aRnA8OKRT58qsg=
Received: from DM5PR08CA0045.namprd08.prod.outlook.com (2603:10b6:4:60::34) by
 DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 06:10:40 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::ca) by DM5PR08CA0045.outlook.office365.com
 (2603:10b6:4:60::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 06:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 06:10:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 18 Jul
 2023 01:10:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 18 Jul
 2023 01:10:39 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 18 Jul 2023 01:10:36 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <michal.simek@amd.com>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH] dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml
Date:   Tue, 18 Jul 2023 11:40:35 +0530
Message-ID: <20230718061035.9341-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e5081a-bf2c-479e-c410-08db8755b63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBwZTqCCzYMqxBen12MrTi5QCOst7YeLabGnoSi418f97lNRh2QqPFUl/kDrxjzg2DzCeJ5WF0C5oIvOKZ24fNC1vJ5XLq2s5FE5MILUiRzLT9KOqfc4IM1j4OobV7OluWOmWjQM4zoy9e4ua/f4La0s67tdkZi7g8WH7D5em5+P3olMkrkL1W957DOmqYPo5KaQrRH/DvySqfE16DcjCNQzl1YEjNwLHM5MUxTs7igDgVCLmfzC1K3aDr+RTHFSOFFkf9RCgJLzw79P5jmP4HupM1UDty98Nsc8+L9jJM8t0Ozmn1Ftz6UhfSRw3RpHLZ4YsmWw6UeVjQsvYg+FBWziK7bPUSpBlgRikHk487E+1tyas+tx86/MiiCd4T98tzHT9fxgDMXIbTOfCXN3lCpmel6cxxvwCxTssbX3xwzpJkB3XXfQ8K3lTk020rPpkTvwOHP3km3oTst+oSKZzSzq2EtancwuKxJJ5nnu1Tzmc4xcCPni7Bh5vkNcGK2aMjBaAKPB2vgV6fRvd3yl5RzrMc98Z4O7CHLz4Gjpsqy/LVm9rr84oCKeJO67W52aNfFAIkFlikocu5UaxTN0TdAb/i9c3jjPcefrjkuyUbW6B2RummyqUoAXLfkIyJ+r+g4AkfuTveELB64p7mLUCVPBqfLwha1Y2BjdhKoEWoy6+ywXZGCFBlXTE44HdPh5CUHCElBfzrZK7Vhlye+xE4LANL/KsUCDOpGMO81IvuRVlY/cGXfpUzvOnWWfc4Oe7qNUkWSwHuSNoakixIa5tQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(478600001)(54906003)(426003)(47076005)(83380400001)(86362001)(40460700003)(40480700001)(70586007)(2906002)(1076003)(186003)(36756003)(336012)(966005)(2616005)(82740400003)(316002)(81166007)(26005)(356005)(6916009)(41300700001)(70206006)(44832011)(4326008)(8676002)(8936002)(5660300002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 06:10:40.1550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e5081a-bf2c-479e-c410-08db8755b63a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the xlnx,zynqmp-clk.txt to yaml.
versal-clk.yaml already exists that's why zynqmp is converted and
merged.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
Please let me know if the mergeing of the versal and zynqmp is fine 
or if a seperate yaml is preferred.

Rebased on [1] to avoid merge conflict.

[1] https://lore.kernel.org/all/20230620110137.5701-1-shubhrajyoti.datta@amd.com/

 .../bindings/clock/xlnx,versal-clk.yaml       | 73 +++++++++++++++++--
 .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ----------------
 2 files changed, 65 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..1b69e2590478 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     oneOf:
       - const: xlnx,versal-clk
+      - const: xlnx,zynqmp-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
@@ -31,16 +32,9 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    items:
-      - description: reference clock
-      - description: alternate reference clock
-      - description: alternate reference clock for programmable logic
 
   clock-names:
-    items:
-      - const: ref
-      - const: alt_ref
-      - const: pl_alt_ref
+    minItems: 3
 
 required:
   - compatible
@@ -50,6 +44,60 @@ required:
 
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
+
+        clock-names:
+          minItems: 5
+          items:
+            - const: pss_ref_clk
+            - const: video_clk
+            - const: pss_alt_ref_clk
+            - const: aux_ref_clk
+            - const: gt_crx_ref_clk
+            - const: mio_clk_50_or_51
+            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "gem[0-3]+_emio_clk.*$"
+            - pattern: "swdt[0-1]+_ext_clk.*$"
+
 examples:
   - |
     firmware {
@@ -64,4 +112,13 @@ examples:
         };
       };
     };
+
+    clock-controller1{
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

