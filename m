Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F06AC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59B7464F53
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbhBDNzH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:07 -0500
Received: from mail-dm6nam12on2054.outbound.protection.outlook.com ([40.107.243.54]:29537
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236391AbhBDNzB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:55:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdiR6iATcgGdEyF/m4JEswOzheLdTPR5Nw9O5ey557+4OuoIQxdUqYb3xZRq2RY/GQlj43sHvfQ9RS0kLEhfSmuzt3pLhvn05EQujuv1yB5Ih4HqJgC1CXdcBlaZn8tbilY2fzYmYhXMl+/Wnz+SgI8n6DnUDerMyVUev6OOwS3lytX7SLvYmpZtufZAC41lvcTVMGn2sON1KqINxiB7vgrXk+cD4tYC4VqowMgwQtDBXG6xiLRSeU9XsLjxg9+ZC9GH3z/DtKM8da5VQbCdnBcpOjd36m7XvPQAR6vpWSI0pFSQ/d4qHXqqOnuzyOX//EmQX3259FUDjfyV5LUUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZlTNoaTm1Nx3NVpNgq3IwvIskKegzhWREd36m+jHxE=;
 b=SVD2SK7M7utKSGqd/h0S/HCTkAhOWKeXF6oqpQnny+siZEPt9IEBQwUOGClbHWPfkanXG702tjPJ0jM9KyvPWho+hhS+U9trqYHKa2vzFkPElV0AeARMe1+r120ZylW2xXQQ5LvaRhPKHW453MIgTq0CjA59BvUrTpstyGq1dg/vqjJB3sZ0H+SDknjZnqTpf1rWxh8QAf6S8xmKpjn5fjClzkQhJ9NAKDUJUqOltpz/ARARuiQ7KjC/zKgsMOJKfG7HT3wQz7LUM5bF9yrrNulNC8tIR8z5ZlE1WF/+VzVyGQmLt4QjKV6/EWKMhSl3vw+LtLo+15keD5InSke3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZlTNoaTm1Nx3NVpNgq3IwvIskKegzhWREd36m+jHxE=;
 b=f4aUsUDQRl/cxDjEiVAcN2vJH7Pztih9wV9Iwz/m8UG25mGvP5kHvwfKxZN6ZryWQOeCOW26umbwSZXxxi5ro/en3/pEIkomH4xuJsELUbgFReMC5AMO2+nPm2t5Sz1qQsN/oI2jPuqI6cIERf4TU/kwgpoDOebE+6lCLRc6zaY=
Received: from BL1PR13CA0200.namprd13.prod.outlook.com (2603:10b6:208:2be::25)
 by DM6PR02MB5994.namprd02.prod.outlook.com (2603:10b6:5:150::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.20; Thu, 4 Feb
 2021 13:53:59 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2be:cafe::9d) by BL1PR13CA0200.outlook.office365.com
 (2603:10b6:208:2be::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.10 via Frontend
 Transport; Thu, 4 Feb 2021 13:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:53:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:39 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.59] (port=57876 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1l7f4j-0000Tm-7o; Thu, 04 Feb 2021 05:53:37 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 4 Feb 2021 19:23:24 +0530
Message-ID: <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97dd8ca8-da3b-47bd-0a8f-08d8c91452bc
X-MS-TrafficTypeDiagnostic: DM6PR02MB5994:
X-Microsoft-Antispam-PRVS: <DM6PR02MB59941FC83CBD9BE6F6CAFAA9AAB39@DM6PR02MB5994.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MglDFpBJrZ38vD2UpFVSm7EmiUkXmVZ5CeYmHcVhm2jvG6KcgMFAvUi4cCpd72h/S5Yh0ztGs/lfSdbBahqfwPuXsChNOfxk0z0A9Z4byG5zJKuvU/dT7LzPi31D5Ypa56PcGgkM9W1cTGOIXim8peKY+C19rNaSRInJJ7wby1XRmNyEXyb+IpKCnGP7lYa9d1ATHkNuDHZOESi3ZhYKpQDzwuPB/BaujX4vBKxL/IJYIhOXpHlqEH6SZNau9uNKgqodqy3C2eqwiQEfsiN3EukSBaDa+9N4xrteqwnudkBFJp7wAsZa/PFOhlvTP5m4Avew8nfZov2GQdNJMqUsiL70qi8o/UC2UEi6PER6h12qtiGBjl3050pI/75TC32ucKh+yjwsE0hoGLFtdtmOt8Za1EAKH/dItNq75gJV9r0ZfcQocuDSj/LXODnDMttWw4wiq1A974QqHz4PcvKp58DYvg+cb1PYattTpRgMuWrJRUL7w25uSixoxlNvbJNmBm+AXhJhGrZwcDiY9wtNpVwl+4UKaQQKGpl0V3aCg8lal0NH+6wSckzY/DeopdAsc3ZfZZXIKa7kUffDd6CbILI5FrKmRQsvt15S1xfmrpjiqgoQW9Gj6yHJREQtZurLD2C/0P/wex8VN/HLkQ3si1IYb2nKrM+/LGnSuoDkua/lYTLlaIFj0qQpUxsTokusIjfccGKwfLpBhMQT2UZBfIyS8jIpCoK7tyEv7casHRKbrC6U8PztTYedM1ZMnDzTFVpYDQfj9/+wg0/1NCGPug==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(70586007)(5660300002)(478600001)(36756003)(316002)(7636003)(44832011)(8936002)(186003)(107886003)(8676002)(7696005)(110136005)(26005)(9786002)(36860700001)(6666004)(426003)(82310400003)(336012)(2906002)(82740400003)(6636002)(36906005)(54906003)(966005)(83380400001)(356005)(2616005)(4326008)(47076005)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:53:59.6110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dd8ca8-da3b-47bd-0a8f-08d8c91452bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5994
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

 .../bindings/clock/xlnx,clocking-wizard.yaml       | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 0000000..579bcc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -0,0 +1,62 @@
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
+description:
+  The clocking wizard is a soft ip clocking block of Xilinx versal. It
+  reads required input clock frequencies from the devicetree and acts as clock
+  clock output.
+
+properties:
+  compatible:
+    const: xlnx,clocking-wizard
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
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

