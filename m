Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C2BC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D6264ED6
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbhBXOfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:35:55 -0500
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com ([40.107.223.77]:11616
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236085AbhBXNNm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Feb 2021 08:13:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Di/y4bKCgTuxph4uPPKofIu9fH0Lue2Ex1aLiIsZePrfdxBhgfR4GWlm7NdAzMToRsp1UiCslJydcCaiCkpzaYR+iOG1USjjXaqLRw+66rqo3AH4x4ctDL5935uuWM0JV/CwqusR8CWCkuivODNvwemxBgwPFxuY3u87zmQBTNOi/lyoRl6xMiaYaEnse/bnmDdGmbPfRKCE3Anc4ZPBfFrGm7ZC5/oC+e8p4oQVHE8pJSci8ivqnXFaPR0njjQCqyNWH3FRLAx8PHaB1KPHv+e6oK5jyOlWpUaRoVLTnjv52GyozYVhbGTL7jz6bq8cMaAqKz+HolhBwp5gYvqNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ORHjSRXDTfKEqt5raefyEEdwV2Iuwsfl8AwP9g/3EI=;
 b=oJFIbDFMbTOUFAwoS/R8XO6WpN5w5ushyNI8oVRvJp1qrLruOX2EQSVbfCOxVrq1YOsNzBswtgetLap8MED71h6PqH+jk3xMRAkqok3OtnrI4l8ynHcIf44bPXMjNzqC7+p4e51O+BK3DdDjuUA2M3/MLvC91M8ZIeWos2b6rDEX7LlYJwH8v4GPEEr+DLhlMJG8h5tJXcvvu7jvC5RP/vy0VCTj7vh9s9Ij5JK94CJ9rl2Y2CR9ON29J9o76NjNjuirp0WaMfDOs6l2FIFpkgOdgLXy3Fe+F5cdhn0Hwzc3oGNR+3BaQl4YpZLesxzsX9F/52puDJGOqcrSSQ1ifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ORHjSRXDTfKEqt5raefyEEdwV2Iuwsfl8AwP9g/3EI=;
 b=DLMAVvbUier4cXTvP3voQ92f+AcIBYLjTDbMnXRxSSUYov2MdZi0hIQGk61RyiHoW8w4Ibva5ksbGvxZPSPaRjV1TgHD7pUSgp2yj+GoDueiWKHBuAWXl+a5C1rMkcsIN9YI9giFjNTPp5qcYNEoAE2fnwkd3icB0R4Z8ofIIVc=
Received: from CY4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:903:33::33)
 by CH2PR02MB6597.namprd02.prod.outlook.com (2603:10b6:610:7c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 13:11:54 +0000
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::e7) by CY4PR03CA0023.outlook.office365.com
 (2603:10b6:903:33::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 13:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT031.mail.protection.outlook.com (10.152.75.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Wed, 24 Feb 2021 13:11:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 24 Feb 2021 05:11:20 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 24 Feb 2021 05:11:20 -0800
Envelope-to: git@xilinx.com,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=34848 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lEtwk-0001ry-TF; Wed, 24 Feb 2021 05:11:19 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>, <miquel.raynal@bootlin.com>,
        <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v10 8/9] dt-bindings: add documentation of xilinx clocking wizard
Date:   Wed, 24 Feb 2021 18:40:40 +0530
Message-ID: <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 644693ef-0000-4d7c-0d9e-08d8d8c5c1a1
X-MS-TrafficTypeDiagnostic: CH2PR02MB6597:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6597A73BF9D81D2BAA26A0EFAA9F9@CH2PR02MB6597.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLs2RuwjkXwG+sCWgZwpDEEdaPzNvmL0e/7m7f7GsZMlhmCwyxn5LfmiUvCtjFhdPMXxnNejf3WyLT1RfH2xXVXJ5uv/5JxC2Y6F5SnmKkxACcnoK9UUaHBZbQNkGJc/PWK1ULuBQgLgUiAJAnyEYYJjy/9/ZAyo6FzWYqkSCrAsTP9Nhe5+65Ij1s+6pY/ndC7fgIKkBsuOyui/BvVVu8u5oBhfBDEQ0c32qDXxq/rPeI4fKENuA7LTRMTIG61OGY9xNSU+tBTWHH3UmqMlOYKz9Y4gTGDMgJhNSK+QILCBx5pEWKPBzS7gqbukM+BkQkiAzhUdFCOXYh0F8PP0ZqsF681HaU89PK0lX2NC6H1d5GvfE4jIvJYop68eD4KRm0n0YUNpH0lP3JN/KyUK+9nKVcIkXVipRRRDVDo61+SZ++xXEuKV6/qUmnoupKICOseks0aX2OxHlLa0dXZiPBy3TMrLn6GW5BJdXxwAv4VpThEaLt9NYsWpz88kgJX1yIqNMF03FViNsVCIJSihQ4j782PkqocRijFl7oBEwcG3xd4kvA0iqN4mwZr9nVQgRug+5/J23jx+R05UBFUXdLUDYMBCv2Ku570JERBPXQmehj/AXiDOaOvJNcsFfAqNyWxcfmipbxcJ3z6DMrq2fB0ZFnR1C3NoZwgS/cB4JVcyFpgATbHUW7aFDb/HdNubw7NmvaSnba7zwuJJIt4WZO7jL2y4cFRjMGx6B6ipfpxLEK4hMH7wZMTiNSilTz3DrB43gatcS9dmorUou62DKg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(9786002)(8676002)(36860700001)(5660300002)(6916009)(2906002)(107886003)(478600001)(82310400003)(4326008)(8936002)(83380400001)(426003)(7636003)(70586007)(356005)(26005)(36756003)(70206006)(82740400003)(47076005)(6666004)(44832011)(2616005)(7696005)(186003)(336012)(54906003)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:11:54.0959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 644693ef-0000-4d7c-0d9e-08d8d8c5c1a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6597
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devicetree binding for the xilinx clocking wizard.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 v6:
 Fix a yaml warning
 v7:
 Add vendor prefix speed-grade
 v8:
 Fix the warnings
 v10:
 Add nr-outputs

 .../bindings/clock/xlnx,clocking-wizard.yaml       | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 0000000..280eb09
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xilinx clocking wizard
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+
+description:
+  The clocking wizard is a soft ip clocking block of Xilinx versal. It
+  reads required input clock frequencies from the devicetree and acts as clock
+  clock output.
+
+properties:
+  compatible:
+    const: xlnx,clocking-wizard
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: clock input
+      - description: axi clock
+
+  clock-names:
+    items:
+      - const: clk_in1
+      - const: s_axi_aclk
+
+
+  xlnx,speed-grade:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Speed grade of the device. Higher the speed grade faster is the FPGA device.
+
+  nr-outputs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4, 5, 6, 7, 8]
+    description:
+      Number of outputs.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - xlnx,speed-grade
+  - nr-outputs
+
+additionalProperties: false
+
+examples:
+  - |
+    wizard@b0000000  {
+        compatible = "xlnx,clocking-wizard";
+        reg = <0xb0000000 0x10000>;
+        #clock-cells = <1>;
+        xlnx,speed-grade = <1>;
+        nr-outputs = <6>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        clocks = <&clkc 15>, <&clkc 15>;
+    };
+...
-- 
2.1.1

