Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1B1C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 08:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiI3IE2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiI3IE1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 04:04:27 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6373214354C;
        Fri, 30 Sep 2022 01:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbnPMlQmrTAbpVnK0RFRKm8QVjcpThhYWB/4pmN8xkfRAaOvBz2+G82irjysrwVrYWOS7WDuTnfMUOUChNm+N5cb5S4chlV9LzU4RVzubaWuECyAVJ/YSKAGQSGcxq7ZPWz8knT6deKCiH+JpM6/GbqXsa2c9RFLQtXsJPEMNxbLUdjzpVHLxbsh6fNwR0K1LjHhn4VQkiSh+Thibg4vy2OZjEF7m2o42L/2VAOKIstOaIlhd5KnSThf8z7SDgQVYUo13ZcBdvqnbUrN0golqVe+mQRea/x4lsAq66euiRB/6DvYnf6QU8hLFFxRGdT5EKrOs74sRck6kpGf1/pupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0/A3hdt+uVoG/wiviaklgh/eVDap8DornlKpbvuy64=;
 b=ZFlhsJ2N2mJSbj//LpgnIb1p7hEbEyXkgoAJdHb80FtlGh9HM9a3rtZh4WeAzu06cC2UNc3+AofDreU5aCZvc+IzUiJfW685qipEnAVbLP0sQbU1Hsvhmmxq118Fsa45wq5/wrltB94Jth6mPO/MBSmu+Q8q20tZCYcKNAMrdRjb8Iy6vajBG/UeQIQWr0NxbCwie+JPEQtcbGGQx5snjy0zMeObiFRZ++8XiCuqKwVkCftzg5XwnBxR5F/I+sjgM/2rLhBjSwBMZ/zmh6mrWiG6BgwUvO6gbrkikWPHvozAKtovPFVB24+OqaZzS2K32/1yi9GYZ+Br2/zKLAh1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0/A3hdt+uVoG/wiviaklgh/eVDap8DornlKpbvuy64=;
 b=HAoxtnn37bNaPqnkuMDFxNEgJB/6Zl87M2MqKQhccLXFeZehNoO7SCPBytNdRmkEPjOEXCOeGFoYqLaLCCJGHV0nawZ0dIEJulPUiNo7rdX0LZWopUkAfrGqlN+2ZXRu1SF0lJ8W4fOLWJOocOtTY6hY+2vbgU8mcPyMdxnOQLM=
Received: from MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::6)
 by CH0PR12MB5298.namprd12.prod.outlook.com (2603:10b6:610:d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 08:04:24 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::8a) by MW4P222CA0001.outlook.office365.com
 (2603:10b6:303:114::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 30 Sep 2022 08:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 08:04:23 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 03:04:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 01:04:06 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 03:04:04 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking wizard
Date:   Fri, 30 Sep 2022 13:33:59 +0530
Message-ID: <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|CH0PR12MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcf481e-9346-45f4-cedd-08daa2ba6352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTcycvr/1qLNsL4QjaWr2DOswQlcz/TNg/iMKvxA55fAHwX8utgLJC5gok1AAUNAjgxg+5miQixInUSJzT8GPVQl/GZ4jsWRg5wwLEmCjSqAQtOgvnqE265Yotw4IkKaRPz1PIWiG6DmrqHbyPxW7LPVnWUGZaIEvIVRoMAbYKnsTvQh8n/u2h6b5MmBYQkXM+ucxNPiRo9zQOlbUusfdQUhcP8hVQepnoKWA2Z3iO0KKn+EuvADIpzj/bWIM/Q/RQ/8MNtKpBGWHi4cFacWZnHZNAJ10q7qSiLEDw/ljZtyxhkbpIx2d53yvLrPRPmeJOqmhpJ/XuqQClDeESVzAuCHN8gUb73BhAp4nlNwedYdN8IcFYYd4IvRqb4Nt64yPXrDDLABHPAol9OVo2c/+BgH16VE0efmnR812qeKVZhNWD0x6NDD8Vt00vsnQ4DcuMFk4JqH5MN6qFL+cj3v9zcrRR8LNvdKqWKAYaS7L9n/wv7qNMxicR8h0rMq+zuZGXTXdfGNWI7F0uyp69bNHLtw9ejoqzd3749bJU4B+Utg4WZY1XRtBBC1s5H0raRMwzwCLZnv6pjYRTAE1L0gEHBYSE8fS2W60BiKDTXNVhmAE65Z8n3eCmINceqPIj3C195QDGTqsBzv3cU+7plr6Gbx1fWvOfimhJPkyG2IwPBcDsxcH/JOOZncUyvobP9jQ3c260wRpKM8tSFoVHOTYvNInPYkk3V6hfFAUSnXe7DmK42M2is5Eo5MwYV4gixoV+jEsjuPllcDTno3mlO3JF8R9Bp9i5ZPImIE4Y59LaBrXYY4ynGXJf0lO/iwAYRXrGhu7eGOk9+n4Sop0grJgChpR/zu9FDWKV2NlsgtVSJOEarBDvTNq9Y6MyuXTpVi
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(2616005)(54906003)(478600001)(82310400005)(356005)(966005)(2906002)(6916009)(316002)(86362001)(40480700001)(5660300002)(336012)(8936002)(26005)(40460700003)(426003)(47076005)(83380400001)(44832011)(1076003)(6666004)(41300700001)(186003)(82740400003)(36756003)(36860700001)(70206006)(70586007)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 08:04:23.8459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcf481e-9346-45f4-cedd-08daa2ba6352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5298
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Clocking Wizard for Versal adaptive compute acceleration platforms
generates multiple configurable number of clock outputs.
Add device tree binding for Versal clocking wizard support.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../bindings/clock/xlnx,clk-wizard.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
new file mode 100644
index 000000000000..41a6f4bcaccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,clk-wizard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal clocking wizard
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+
+description:
+  The clocking wizard is a soft ip clocking block of Xilinx versal. The IP
+  uses the input clock frequencies and generates the requested
+  clock output.
+
+properties:
+  compatible:
+    const: xlnx,clk-wizard-1.0
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: List of clock specifiers which are external input
+      clocks to the given clock controller.
+    items:
+      - description: functional clock input
+      - description: axi clock or the interface clock
+
+  clock-names:
+    items:
+      - const: clk_in1
+      - const: s_axi_aclk
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
+        compatible = "xlnx,clk-wizard-1.0";
+        reg = <0x40040000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&clkc 15>, <&clkc 15>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        xlnx,nr-outputs = <6>;
+    };
+...
-- 
2.17.1

