Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EA4C2D0A3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCA9E20759
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="cQugOaOL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgKDPHj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:07:39 -0500
Received: from mail-bn7nam10on2077.outbound.protection.outlook.com ([40.107.92.77]:58849
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726801AbgKDPHj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 10:07:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI/jUN++dY4X5DjLsSiA5RpZUZqYAC7dDAJS9SN9fd8JQeg57AA+9I4QH36oGxIy0fUpojC+G2UjtZVaQJ77Mn7ZlkiUfaWSa6GN297ZW7feT3bv5JXij3zjOVWU6K9S85As9M4xjiTgJtJL0TrJodKw3w9D3V8Zr4Zx3MFfArLQM/VmMXJEHA/NVDcf5nzPO5P0SjZOBiFY61NwIMD5AzhshfzFnHhJQ28W39+42mKGyRLVtZrzsc7hnzRWdB9ur+sFAyn3oZ1FgsIy4ahZRnxcGNHZ7jzmnZXXrSIJ3kryJTYiLweKpyF1k3S4AkRqGvdykPlt4BaFKxfverTyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrHZ1yvWM4LyA0Ed+3k0BvY3MxgKl8kvnUVvKlRTjFw=;
 b=ogdCCZnlMYq3w80dM14UF4YbFr6xSXBREEveXiQfrQU13e53jkFIq0VFD4I56X1+BOQTR76nyt+aIYqowi0iRTsuQCjQkgUNekFNpLc2IS8Zw3tBfqMw294Qtudx7DUgutfiWfz0nYNJPSGb3hPpnHs9Qc0ybBxNC0s+a3Ou8qPJ6bTwBVv3DNwPGlqHPAvpsvgnIQHTVzjIPGab9hS4NzPG6oGoIOEJ/HA2l6Hwt6jAh8xmiDnUZTzIGtpU1syvspLtkuhxjgojRCteyB67wN2CJQuvZYNNqNWBUvor5LbZt2117Wk7HthfgO0rtg4awth1efKGo9HFaVdPeVcSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrHZ1yvWM4LyA0Ed+3k0BvY3MxgKl8kvnUVvKlRTjFw=;
 b=cQugOaOLEY6SJCOjpbl94sWTWOtUdbsIEKGUsLZulBRTzxFm3fUVvGgYgnhU14JtSF9SbbMddz7XjnLwv+Fhl7kTi9BhC2xeXp+RoJo9MAw1pKe18370CCMzmbi0skkHtjVcrIXlIX4exKh8BnyDDVQ+Ua75dD9EjsxFSdEo+tc=
Received: from BL0PR0102CA0020.prod.exchangelabs.com (2603:10b6:207:18::33) by
 DM6PR02MB5082.namprd02.prod.outlook.com (2603:10b6:5:47::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Wed, 4 Nov 2020 15:07:36 +0000
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::2) by BL0PR0102CA0020.outlook.office365.com
 (2603:10b6:207:18::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend
 Transport; Wed, 4 Nov 2020 15:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 15:07:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 4 Nov 2020 07:06:54 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 4 Nov 2020 07:06:54 -0800
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=49678 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1kaKNB-0007UB-Up; Wed, 04 Nov 2020 07:06:54 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@xilinx.com>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v7 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Wed, 4 Nov 2020 20:36:41 +0530
Message-ID: <1604502407-14352-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 160be65b-54af-4237-0b5b-08d880d35cf6
X-MS-TrafficTypeDiagnostic: DM6PR02MB5082:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5082EADD6CC4A93BE1718B97AAEF0@DM6PR02MB5082.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfgWDS6wgFGv9YstDlPUu0tanZb8SpqXi+KsVqeYqu1AinQJMNIHBVqUlZrn06TVoTV/WcDDnv0KSr1B8asqCGmvlFEpzb0jAa94MrElvBko0nBgtUDfSxwAnRP6v8blQ95VYvtZEKPkYqyOLayZco/r/sNE05r6gN+R1336WYFlteTd9ImVF9Yl4EiXidtqtQsbwaeYfgAWwm/cW7ipIF/piXxESjGYdUg1JDi2hpNfVwPfd8gvVTmjqeb+0rO8uAZXelxxezREVw1zP/qTUgflY3V1jcd1ibHnJEl2hRY4UAq1zOCM4hQ1tNVL2G9urAzY7BgUTm3cQIS8oRu6r34En93kne1nAPyO2ARYFq5Tghckhjsn5jF/kOp8T6BJ/qVb3IUOASBDydFOV0xr1qi5EFEhJvkY1Cvque9i4vHv8qKfXiLTBjj4B2/e8X9INTcdMncC2LLG15Ey/zXhqSamCS8wU7Bn/chfQsIb3q/+64ivQz4LjgvY+NS9Fk4n
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(46966005)(83380400001)(70206006)(6916009)(36756003)(70586007)(2906002)(8936002)(4326008)(9786002)(966005)(5660300002)(7636003)(107886003)(82740400003)(47076004)(8676002)(356005)(2616005)(336012)(426003)(44832011)(316002)(478600001)(26005)(6666004)(36906005)(54906003)(82310400003)(7696005)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 15:07:34.9540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 160be65b-54af-4237-0b5b-08d880d35cf6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5082
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

 .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 0000000..a19b9bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx clocking wizard
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+
+description: |
+  The clocking wizard is a soft ip clocking block of Xilinx versal. It
+  reads required input clock frequencies from the devicetree and acts as clock
+  clock output.
+
+select: false
+
+properties:
+  compatible:
+      - enum:
+          - xlnx,clocking-wizard
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
+  xlnx,speed-grade:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 3]
+    description:
+      Speed grade of the device.
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - speed-grade
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-generator@40040000 {
+        #clock-cells = <1>;
+        reg = <0x40040000 0x1000>;
+        compatible = "xlnx,clocking-wizard";
+        xlnx,speed-grade = <1>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        clocks = <&clkc 15>, <&clkc 15>;
+        clock-output-names = "clk_out1", "clk_out2",
+        "clk_out3", "clk_out4", "clk_out5",
+        "clk_out6", "clk_out7";
+    };
+...
-- 
2.1.1

