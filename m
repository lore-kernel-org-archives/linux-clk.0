Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B5EC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5773661104
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhDHM7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:36 -0400
Received: from mail-mw2nam10on2087.outbound.protection.outlook.com ([40.107.94.87]:22497
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231371AbhDHM7e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knKlAj+OYVTkFtmA6FaGZdzzM93kIc/C5+9z6x2SWbrI4oGtx9FabEZSDWfBYtELgJby9d910WCTnM26PyT3N2I1J//CsZ4/J1xlBsX3nevrSqvFxUJPaJlbQ4V1pYaioaQyQ5LwzjPX5f9x551s+yI3QcpKVfbDS3GjZFFJurkVJIIrhUrjJGqAspjtgIbTx2/xTWFB182rW3j4PrEuPNlgkCeLkjpvxi1HwnTPoyBCsme7LzrMKLBZ57Al1hAG1dHGA/UwPV4PdeGerVRCunJikpZQTYLqyo1/TCq1Ce/TegFsn0BJ1VAKljyMWfHdtTnO2GaT9JPlx2JitIeBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WgVO3pMLC4BXlioHtZSfvsOFOcMqUlqU7Wp5YPSpoY=;
 b=YVyKIUn9ZaBv+5utSuoFZ/j5hD31+HAk8CQLRkDMnKEPI/N+3Gnmnrwwt+VoW/uAr3hCM5abezL6ssqsyppjDVDjo1vCA4fMdeoEFjRBCiP9rMTudbfSBJSC5F8uEyrzNrocS8DCNVcDPz4peYcyUr5p0+Eb2BebRj/Tu8eQv1rnpeujrE64YCqz6rTKhBmykNMqNRMnEFR7cd56v7/kUkikQyj35Zg9HbbjLUb3HIJkAqpcj/13jPEqUmL+sRNfnNgGwgEgVNcGkEAkzaeEwT+hFSORllrIbdd1ojMI+vOxqD0GNTwFyMEx2O3cPRq68A7C1ljvZ6YWXOq4nntpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WgVO3pMLC4BXlioHtZSfvsOFOcMqUlqU7Wp5YPSpoY=;
 b=ghkI6Jlf8VeHbyqxCK2gF2HDZfMT4o5wmb/FjQ9e/HudOlEuy3mtr0uazE/jaUHNOe4Fvi+X16bcjYmytvC+1nDNdA7xgI1S470cSSfwFRbKoMbJQYvlYN90VYRvU7rW3ItlFlTOwPT8Vp80PPvNqXcW7Bu9DtnDagS8s77yQd0=
Received: from CY1PR07CA0019.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::29) by DM6PR02MB6666.namprd02.prod.outlook.com
 (2603:10b6:5:215::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 12:59:20 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:e400:c60a:cafe::4) by CY1PR07CA0019.outlook.office365.com
 (2a01:111:e400:c60a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 12:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:59:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:58:53 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:58:53 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev,
 zhengxunli.mxic@gmail.com
Received: from [10.140.6.59] (port=57650 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lUUFH-0000kJ-Ql; Thu, 08 Apr 2021 05:58:52 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11 1/5] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 8 Apr 2021 18:28:39 +0530
Message-ID: <1617886723-27117-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa696942-e842-44cc-f308-08d8fa8e2001
X-MS-TrafficTypeDiagnostic: DM6PR02MB6666:
X-Microsoft-Antispam-PRVS: <DM6PR02MB66669D48392E41A6FC9D4E8BAA749@DM6PR02MB6666.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lvY4BNzUVDHS1mRvnxcqbe0XUnlUf26852KRbrv+1sCHMw5AidJWSv0CTBnkRxUrko8zzJhoEToL1/Er4yBjyqPn+UbLN84bm1o1JQ0uVmUs4rRtAL6o++QUdTAQPHaI6WUNvMcQUBYXUaJZle7wgwbafze3u3ScuhnR9eqDB5LpZNfKLjhH1Rh0cXeEg+FV2KOwsxFkHw9ZbQOsOvpAS8q8M7lEy24ClR8KFffCSXrAe6Doq89Utr4W4+fz7yU9WV5uxYdK7q+JhO717Jb+RiwHmnE2QDzQ5T9GI1veVJAgPs919Z29bT/Lxaf2dGNi9O1YeT4mE1Ba89yAvthMWH5pRtHVqoyZM7EmXIh0hZozSGRw5clkl+1LvU2fabtvpNIZRbF7zscUTkhOigTGo02Su2didf5dq/sBI2qphvsmPRqt6ibWy4C50je+u1cISHdt/oTsFg3Q68oxvqRzj+8IhURbzIugQo7VqeOKyS5h4QGSn+UDjNDvkqhDxTiefklxZjA5okj/AAsOp4iquy1FCiRCvJLRySsM+QGYWpJ9Y+ihDbhpiCNnXwVdwp69yZ56EcguIhEO5F32TqkCQ+P10oU/5ugdLeuS2kU5BwAAsEECIH9lB4CuJ2XIZj2s7dzMIFM7knH7ohlC53GISRjIQ5eOGhWuxV7OAaqC0GDKtWFxU88MoqUJ2Uj8GeaYcXqhIQu9WBlCPQwjx+EeTWllFcnJNG/xEETdBJo+8GArfPEWlBEnFaPPqhYb3RmuG7ejOE7Li0hsdkfGOSO+w==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36840700001)(46966006)(54906003)(36906005)(4326008)(316002)(8936002)(6666004)(107886003)(186003)(8676002)(36860700001)(26005)(6916009)(83380400001)(82310400003)(2616005)(44832011)(356005)(7636003)(7696005)(2906002)(478600001)(47076005)(9786002)(82740400003)(5660300002)(426003)(336012)(70206006)(36756003)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:59:20.1594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa696942-e842-44cc-f308-08d8fa8e2001
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6666
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
v11:
 add the compatibles for various versions
rename nr-outputs to xlnx,nr-outputs


 .../bindings/clock/xlnx,clocking-wizard.yaml       | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 0000000..74a1219
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -0,0 +1,77 @@
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
+    enum:
+      - xlnx,clocking-wizard
+      - xlnx,clocking-wizard-v5-2 # version 5.2
+      - xlnx,clocking-wizard-v6-0 # version 6.0
+
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
+  - xlnx,speed-grade
+  - xlnx,nr-outputs
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@b0000000  {
+        compatible = "xlnx,clocking-wizard";
+        reg = <0xb0000000 0x10000>;
+        #clock-cells = <1>;
+        xlnx,speed-grade = <1>;
+        xlnx,nr-outputs = <6>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        clocks = <&clkc 15>, <&clkc 15>;
+    };
+...
-- 
2.1.1

