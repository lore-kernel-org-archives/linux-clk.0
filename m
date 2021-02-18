Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BF3C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA7B064E3E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhBREuz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:50:55 -0500
Received: from mail-bn8nam11on2058.outbound.protection.outlook.com ([40.107.236.58]:48193
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229864AbhBREuy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:50:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq3mSp0qKolhZeLKMoeoIUma1bUcx2cClTsQj5yEuXT1D9vcNEVU/8OsDlhxrGa8A8CglLLuJFRLXqL0oVHPZbAZTNoXgEYuOUsvt1ofkXTHl3iw7HmsAokgOT+40UhTZHf9B0K21z7K1TE7QS08dsq+PSW0aXWHpPoRHkNgvQHpY79kNOTpXfEjWuxv5kEJnk8n7qQOiOnCklgHOR3LKYP+bSI52LxcPCGSVHtXXTsshqo+o1hf+dh8ONI6lxugjPfiZhOj7XLrRGaOsmlHqv4ISyWXMzk3rXimLC7aa5xVK6dCeIcmD9Z2jTrRej4aWR26wi9wGkpYUjgiweth0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZHjvNyh1L9nyp7c4qfkne5sYL5gABUAHv0lMunD680=;
 b=gs7xjrJUcBuxcm4U3gpzhueM5fG8WIvtbS4sTtRz9kMh0xi90vblHdGj2ffREhKr7TQB+Ef1vSvTedYXM/yQXi8OSDZsMAubmowNz+V+oCV1VW4tpxFgiY4aFuH9HQJN7f4geQR/jDY7gHVoKET8MmOmQeQXcKU4IUFQRqAEkAw8Mc3nyHpp3J1SNojBsRpObZKFo4jlxRbsB0O1Hsmev+IP2GBNt+MvXw3i+paNqF+J9kaX1qMKU7cKi7HfL0VflVOJRMDjFxv408ati35rKN+Xkm+OhZ/KQ6qqxXZ9p+3S1FYhBBww9AyBHFV52jjiKXh06YGKU9lokwSBjhBBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZHjvNyh1L9nyp7c4qfkne5sYL5gABUAHv0lMunD680=;
 b=A0gOQOZoiDsFLNRb5vsR+xmg2OPER+TYmx59p3crQrHNCRSJTEg+uQ/FJl/ulrIJx4ndVOs8jL70IBFM5InchtmLnjF6StjaLcbDGE9cD5qFzCvRjlXij9jk0HL6qctXURLqsvg/Smw4QbAZuLIKQQeVMLgHsmuhBCUjfXFKbNk=
Received: from DM5PR10CA0016.namprd10.prod.outlook.com (2603:10b6:4:2::26) by
 MN2PR02MB7024.namprd02.prod.outlook.com (2603:10b6:208:205::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 04:50:01 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::d) by DM5PR10CA0016.outlook.office365.com
 (2603:10b6:4:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:49:59 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:49:59 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGJ-0004qG-4P; Wed, 17 Feb 2021 20:49:59 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 18 Feb 2021 10:19:45 +0530
Message-ID: <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abe0f89-1aeb-41b5-d62a-08d8d3c8a639
X-MS-TrafficTypeDiagnostic: MN2PR02MB7024:
X-Microsoft-Antispam-PRVS: <MN2PR02MB7024DA315E03F33F8C8CD90DAA859@MN2PR02MB7024.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fir4Sv+8fouCsa1MkdthmehgsOavIKOuh7EFR+uFtgWg1uTnmcJV2k8h7omLw1yXADy4Jv3Httjk4e6vNduNCNvbs/szQHKZiYCV4NyF9NLTZPjkWUih/MvulaOFam/PF/ddk/1BlSe5zZPvrFGq5ad4exRh2aWxyfov5ITbLcgbcIeli4Aloz1cNNAjhhvZg1bqPO58hYYwuOGmA41jRrjr4ZO3E1jXN9X8qxusWcie5Ggzi+6d++liJEHrgHyP5W4UFSPZ1E26QFA9Oso+a83d5A7FdFCStjwuasBHqO+QZCKEW4gFqVzfweWQ4xtaVI6pWJvvhG3pNd78UdrsPMsmBwtoQUhx+yJptiDi+DKUfrU2lL+q8Nvdoy37m0XX4heUkgjD8mMwoAr/e8HsTJHnKQnCuCWt96Y5xbkUwN8VvJ3e3xQGpASICR5DtXQWWMOYLxeX2ZxKZOLD61XGT7v05o1TrdsYLwX/2Z/YpdUtqYIn97fJ2xIUPAx3dRqaIwniy7u7NMOb4U6k3p1Q+35omEitTlrKceaT7sR5KCmjPQoyFNs/9hVPLrWcRBd2NgHIfY4tOWHv+seXegTC/EF0zVx9CRBsw8mIEU+tMS6iaASyxuOI3OPfwwowX8AK8CIWUTwPsSWiAnXxWg0PeMnYQ/YQ6vEZERsuVcP85exsnAxmE3gCshRzA/Iw6TVB2R5XlfCL/7rpXlUAtTAQckRFapBmQegPnJVyeohWxp6idiPUUtbSvaxQqUyIkEcyKebvAWCFp7o8NFqhlT27PQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(36840700001)(46966006)(356005)(2616005)(186003)(44832011)(336012)(7636003)(83380400001)(107886003)(82740400003)(4326008)(36756003)(6666004)(26005)(478600001)(5660300002)(82310400003)(426003)(9786002)(8936002)(6916009)(54906003)(316002)(36906005)(70586007)(36860700001)(2906002)(7696005)(8676002)(47076005)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:00.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abe0f89-1aeb-41b5-d62a-08d8d3c8a639
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7024
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
v9:
Fix the warnings

 .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 0000000..d209140
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -0,0 +1,65 @@
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
+  clock-output-names: true
+
+  xlnx,speed-grade:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Speed grade of the device.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - xlnx,speed-grade
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller  {
+        compatible = "xlnx,clocking-wizard";
+        reg = <0xb0000000 0x10000>;
+        #clock-cells = <1>;
+        xlnx,speed-grade = <1>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        clocks = <&clkc 15>, <&clkc 15>;
+    };
+...
-- 
2.1.1

