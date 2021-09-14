Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3B3C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F26A6610E6
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhINM7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:35 -0400
Received: from mail-mw2nam12on2074.outbound.protection.outlook.com ([40.107.244.74]:7648
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232975AbhINM7e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRNPQWsk+JGtivW76OvGizOiBJxgtg0e75f+bmtVfedWBRvqqjWicynGfpOnOWIGRRaXXoDkeq4mT0Zgz0wwGTOuAA4fVBjTs5GZLeqpTVYdBvt/rAN4T0iSZjkPq4sMCNLLz0oEP3IZniPBaxeNiObTlOR86iBd9SEaiDDi63cDNlHxwMAtAnjL95SbTBgLmPYA9NhPiGc8k5lZ7+q4shSDfOVMB+Q2x0WWhiVl9znGOuqIImAVwwhstCpSBvlf3Fi07em4qfMTd+18YlizWeVzy16623xEToONQlxyweYYtRrzP/i4j1J+ZUr5K4oB6/HND3UQEVzi/yZhkkwRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z8vbuCMBm7mg6xn6XKSU3gUmzEd0yxkk/du4NphEwlc=;
 b=U8SG3jjT13n6XzSjXm/CmWSF+7dOfGck+2i6Ty0gitdiGDyNbu+IVSTdXhdFCw/60244lH6y7cPGDMIqlJJ9Wdzli0QNX/HVrKJOTY8uSTyJD9ekgmjtnkgaHdLgrFp7pd3DcWHXLfJDISCGKxV1wyqAphYSP2u/iyGgxLCfXQJ+GN82OYuyFZN8arfuTcqAL4DENgwqsf3xq8ATKKDGkE7kjyAI5+9IKAYEv3MUOLoBkWJPasnIiKjVhxLNboqvaH2aZSKvhh4qL1DbRudzUfil8BLZ27Yw5+n01wB+GP5MiF/Pp5rwpWxJ2/7AjvASA/ewRrfOCa9Y129fo2870w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8vbuCMBm7mg6xn6XKSU3gUmzEd0yxkk/du4NphEwlc=;
 b=S4sAjGSo7yMBcQykRWhPht5S6MF70UEDhoS3W9emnPQNuuLd3jOIT1GrNYzSPnWJU9VgFpbDqclYnY7HeZJ6SSb5+iqM+Y4Irj3lazmgttSWYnOgBK2sbg4uLYm+YbHsMZ4HDu+BxpvlPFfMDV797884dyihwGiE1K8kDXpOt7k=
Received: from SA0PR11CA0037.namprd11.prod.outlook.com (2603:10b6:806:d0::12)
 by BY5PR02MB6962.namprd02.prod.outlook.com (2603:10b6:a03:235::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 12:58:16 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d0:cafe::2) by SA0PR11CA0037.outlook.office365.com
 (2603:10b6:806:d0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 12:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:58:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:58:03 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:58:03 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80f-0002I2-Q0; Tue, 14 Sep 2021 05:58:02 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 1/5] dt-bindings: add documentation of xilinx clocking wizard
Date:   Tue, 14 Sep 2021 18:27:41 +0530
Message-ID: <5abe09974e95f127784b9eb5b8764e099e4a1b2d.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb874f2d-e4a0-435f-d99b-08d9777f51a4
X-MS-TrafficTypeDiagnostic: BY5PR02MB6962:
X-Microsoft-Antispam-PRVS: <BY5PR02MB696243C2E5A9E3040DCE07EFAADA9@BY5PR02MB6962.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tF+H2JfP4dU9tM6pktoBpW4r2yZ/UsgW0zgO+L+jPIlwbyM8I0r4ZiVLI1Fe9I0ftMAOFNsUHi1s63/Nhuj7CqC5tD1tZs/kTc1sXNRHqRvUrDAjKEhCTf4wpFEFUS7M1W376cpM3peULaOyj3RhNwozdngQv+L/7f2X8n6Y05rihSMlRYAvlkHL0doCxM0IggOWd3XFTX0aMkncS2PDv1YD5gDssP/CK/Hw3i0tgsGFvVVEy/oPYHVwxxj1pJM9o7jLmFfksZ/Vfta4d/b9lzKsC1w9WF8YPPQbj6OJzrxiqaVerOr7KZS4lXVo3xiYmHsC24uLvO5AGVAR2d28eK21gd2tWMPo+gkUEjyVaIYsCvpGedlEMpTXqfjTquGDchfGSjGSCSBubIa3LcrNpbJD0okmbrFU3K1WcLykqZ52SYEZkOqRSkwqWtt2fxx0hOeNyj1yytrka36hTUh99Vq/9UopHtZkPOBQtsxGiA5tLzwZODWBtBaFj5QvDY6X8pqXK1rCsXrEHP+n1XfoTPcycIQGnK/R72wo9/CPEly5+6+fEkYXfJ/hQABAxP0WPKIA3aVISE8fx9eOV197K0mwmNSk19WUZqzyu41JJamW4dRmSXUE74ZN3oUeCk/jhvNsNZPZZfbfB87IdOmkvPlHIkVfTXXy4kqNMTe1Mp+oFsbwWMh+FTiTdW10KMxkrDgxL87Gg/ERkgAwFAabiZaKA6LLSdO+DWSYm5jCl56trBElawC5NkPw2y0TO3LFm7zAIzwiQmxOj6gyiZpB9J9+OANGYtWadkaPpF+XjyIY52GdYDebSPI/fOJjEcGPdA97Zf0J7UYfBCRfRHW1aSvwIvxz20YybS01e5JeU24=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(356005)(478600001)(83380400001)(47076005)(36756003)(8936002)(44832011)(82740400003)(82310400003)(2906002)(7636003)(8676002)(36860700001)(6666004)(186003)(6916009)(5660300002)(9786002)(7696005)(426003)(2616005)(4326008)(316002)(70206006)(70586007)(54906003)(107886003)(26005)(36906005)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:58:16.3146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb874f2d-e4a0-435f-d99b-08d9777f51a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6962
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devicetree binding for the xilinx clocking wizard.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 000000000000..634b7b964606
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
+      - xlnx,clocking-wizard-v5.2
+      - xlnx,clocking-wizard-v6.0
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
2.25.1

