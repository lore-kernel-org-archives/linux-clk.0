Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B76C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA62B61077
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhHJH0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:24 -0400
Received: from mail-mw2nam12on2058.outbound.protection.outlook.com ([40.107.244.58]:45472
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232896AbhHJH0T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ4LipIsPlaoflwo9h+ecK45AnyhfVTjQYGfwz58Yl2UHTt1OXF6+zE7qtdC/A3giRQZp3vgt0HAgxrVOg7pESqKrNOQPwEnTCdT+ASkDVugTcpRq9DDNj4QdCwDpQCnmdJXJR4y0bLqK2rTUcL8br6bYVRQx9voyC9Wi4Kg2nP7ZsD7umGKGUgsFYkYk+nKiaLLDXOuqhcIuwRRq0qLN+bOR03X+DPWxuKeHaet6wBifXOLW+Vq2wLDH3W+Bft4FV6445Ni3Giai0xmL9cjAqeW3Tbmx43vnBYxKwL2tjYf/6BsyRhroAlJ3405XsPP5NnQFIcpi50IK6wwsubNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8Zym1IB9XTo3PTny4sp2AG57GKWwdeWbhj55Mr2kGg=;
 b=N8ma1/75qgWFaWontWZk/A5j37BGfVlKtTJU+Vpw1X+xmx3IqnTDlULswZf9JLsKgqQ72njhxGtNWggxUQMJCLDtV+FOV6XzPK7vSi4Ye6cc1WygiCGW0cSZCLA9e8IXqDN2dBVzFWMwYdDhno3iEJ627x72tKfeaz19QoepwvsU0GxZiZNv8KYZLF2RCseenE+M6N0p+H0N0jUhLb2UtNn2guHY/fdrG1EOgodGoqEwVqigPijBbfqALSFOkP61SAzwK0YJ5UzeBVYNv6hf13fAsqV8cuWwLif2yXRG7UvL1hULPyBzjO0I6qKy2Udwia5YtA2Hi25A4oY345WGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8Zym1IB9XTo3PTny4sp2AG57GKWwdeWbhj55Mr2kGg=;
 b=rF67ZlS/M0tYTKriPlaZyiZgu6Ofc7zpalUoEiEbrPJWbeLT9sqSq3KqteP4iQ0IBsrad+kA3jWKMJOwBlx1fITXyHIOmI4swFjj9p5NcWynQNCa6FfPDxsSaBheJydqp6L9lr3VVbm2bvYZ2wdOjvYLK3tmqgpgcbJE9CyLLuA=
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by SN1PR02MB3694.namprd02.prod.outlook.com (2603:10b6:802:2c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 07:25:54 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::ed) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 07:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:25:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:40 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:40 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8o-0005zG-Hr; Tue, 10 Aug 2021 00:25:38 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 1/5] dt-bindings: add documentation of xilinx clocking wizard
Date:   Tue, 10 Aug 2021 12:55:29 +0530
Message-ID: <20210810072533.27620-2-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e78925b5-f0cd-40f4-8c09-08d95bd016e0
X-MS-TrafficTypeDiagnostic: SN1PR02MB3694:
X-Microsoft-Antispam-PRVS: <SN1PR02MB36949E6DBF239B5C6050C6CAAAF79@SN1PR02MB3694.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BSzxp0CIO78mDA6ya1nVspcA0yE+DigVxfQs1DQt8gYirBLjdVPtQgrOq0Kt6+6SJOpz3LQcIYEjMyNwo2455pJxnXa1K33OAoDxtRaUSbbNQEhQ6Mxuk5X7b0ivXgeWixyvQfoVS72+PaOROM4fKED0nCGQwBYw5mVyRI7wZOrrE1ab9DtAf0Am1GFRptR/zzSH5TPda4SHdW8nNQPTAQsJprMt9CuCPwXs9U3YAwA0jGVI1pD6zgBH6Wy2ncS9A8Vzr1/Zux6zFqP9sNqwvPrIDfli4ZDsZG8oLbvfKbz3UqtPO55wAGFF8uPFhGJaHyUxlcxQFPEwe1xBXRg2mS+57TSAVVLzn+k22INbhXMPB2lpj+MR6NtFE8P36bCUDeI+ttgMLaEzp5+nMDudF2M76OvbUCVfBx43ZoadyipOuDLb1ESB9g34cNaQkEBiTpf0wyjhUnDHAGzI6dspjhkuK4egSWEB7w0bpZkYDWCO8N+kYOVjLy3gGaQrTbTR3dnQ7BVlE/HCwWt489fuu/V62rtCaLrxA+B5J7YWaFJNlFm1B3+O5GU7S1uMHirkjQub4tr+kCnL3hHMngsux4kI5x9FWpHDCFJ5x9arK/KY6tFmBvExOSe1y0TwfJqoivbYKEB9say9fNSn/VqcLhYi0HLJHeUdFYboX5oalWXW+QyI82wILx/ikaXc9b20eNalEAG7RJJlq43X6wrrJ0ax30+zfwN/ga6mgzZEORkX+3SB8ONgIvvvNyYVteQ24Pk9iMLfDJZAkVRhzAuC9BHW/YTGy6IJGDsXV7K6TnVWSks0k2UAvXgToasJZmjdcgPCFT/rFuNcvCBBvwz1/Kcm95+XGhF/4eXhRHjWELk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(83380400001)(478600001)(336012)(9786002)(186003)(6666004)(54906003)(6636002)(316002)(36906005)(356005)(4326008)(110136005)(36756003)(107886003)(82310400003)(426003)(47076005)(2616005)(1076003)(8936002)(70206006)(36860700001)(70586007)(82740400003)(8676002)(2906002)(5660300002)(7696005)(26005)(44832011)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:25:54.3446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78925b5-f0cd-40f4-8c09-08d95bd016e0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3694
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
 v12:
 No change

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
new file mode 100644
index 000000000000..74a121988e92
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
2.17.1

