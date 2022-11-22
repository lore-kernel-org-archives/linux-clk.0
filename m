Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379D5C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 12:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbiKVMOL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 07:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbiKVMOK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 07:14:10 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C6C2FFF6;
        Tue, 22 Nov 2022 04:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg8J+25yeCKw3cq56nybylsrTe3vGdmtmXcLNfTVcnO3bwXN3OG6iWdq4zMDuLnhbKucler/sAUmziKBTk5C59z29pwxsIWy0EQlt8G7tH2MKRukT6EINNKz7rnZcj4FUHY5aEfIcJrbMAzeQckhjFMTtVDBdM9lwxmD61iaf+iIohBsBG1S9JXP6Ct35ZdfFHiDNZNE1JO66zbbwrsR7NHlw2UzmVv/Z1k3DdaOkuLAbOaGiY3cKJRgs9BvNXiY7PCn4ahKhFYuh8Cb0ZZogBsYHRO+UwJbUxCQW8C5gKhdBcDXLM+qgifSHWy5W48XDfKNDAOdQ7EGb9gxqCo6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoqlgMU0Wldz7vfp/iBAWnPaIhfsx+U1bqzIQWq3+IY=;
 b=XbBnYhnUaW18aqIUkpZ4RFFVDNyDi6DXJOnjdWtZ4+2wZh3iegr8sQxwkQeq44L9Mx2oOKQFSpvi/0yKnfeogBBHJeo8wL9iS7EtAkGmOCzFU9PgjZ+RT08M2w9GMI7UobufsUAm5ta4LoKUawqNq8wj1MR2Y9SYbEF5iudfDRjIbjTznjalt2xznA2DoI5AsybBmIfZV49A34Zsi0wES+2E4jzYzUNE0u2GNWcisijDqRXdBk/VfZeqdmrfBhAtvX1G+UxTLu/KDPK2WDtzegNaA/Rz5eRpOpNKqHoU6dRvGHrfVkqFz9K4s4ja6a31vHynGuLLjFSNGJieJc3GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoqlgMU0Wldz7vfp/iBAWnPaIhfsx+U1bqzIQWq3+IY=;
 b=PHQBSJ8Yx12OQ4FcwxRZEF6zRaz9ZMcm6FatT+OpA4KgWGHlCb5OWd/rgM+cWPNUr6mBBGgd3SuVYZqe7g16b2ol4oiNMcdcZYnFVsJjI2IgcTQTj2GKZEdhU3xC2RZb6XoHMU2JCXPCGVvKVL0Mm2gIflLZTVo7YUTsnN/Go9M=
Received: from BN9PR03CA0397.namprd03.prod.outlook.com (2603:10b6:408:111::12)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 12:14:05 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::fe) by BN9PR03CA0397.outlook.office365.com
 (2603:10b6:408:111::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 12:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 12:14:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 22 Nov
 2022 06:13:26 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 22 Nov 2022 06:13:24 -0600
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <michal.simek@xilinx.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v3 1/2] dt-bindings: clk: Add binding for versal clocking wizard
Date:   Tue, 22 Nov 2022 17:42:54 +0530
Message-ID: <20221122121255.6823-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221122121255.6823-1-shubhrajyoti.datta@amd.com>
References: <20221122121255.6823-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT046:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: f7807abb-8d2f-4a24-12c0-08dacc830cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsGff80mtSVy+w3Xz90Eh9sGbDB5J5deBA7qwSBshyjkISuYLceU4kFlwjx1Yd1MpuH/7KeSyFzLJ5AzNPAOCI11t7i8gpqRehQUJsluCcUySWfvKcdhKILbWE3WRFdUtz9sfgHPcsRCdMqzgGEIh+4NoSlZtB/zS5027V1Q5f3rwT2F6lfWuXpgbaoaC7u3wj4om3fFf0A5I02RDdkMhRJ1vcVa1WGwqDE/hUp9uxY+FNCK/IdPr5qWahiYvDsUEPxktREzFHMXl/+0H5WbjqHWrODb6GRm0Ja+x4JeDLfWxTtBvQrmKtmHDH14olVM7blKhI8GG2oPMjq6HzXmn7zJLYJtgh9HR8OaWmfvk4D3qm1s0BzFEw6gadIwZM32iShLU9H4H0EC0r4e5g0GYgSo2YTUUhVzwOy/ab4vM4tT3DX4R8Ov49D/DN4Qhb00UE62ln4mZyctf2qeN/Rz7xfzo66YBKpbOl/U5e60pRgZKh2CEsHUUYaPeIBKaFZGcqNdolEsy+Xz3mY+E5VcBqMDK+P09bUGAGMdAK+3AKjKsJUirmvrZ6FPrsJNwK391qwfj3wbNBujVKXnHFP9HDpXOqueUM3zSf8bsWB+3LZui803HTZybH4erd/eAnVw1FjZm9XtB7JY68YJ4Ey/6dwr/jlz6IBU+kKegXYjupsVGe1pFcWgVJVgdCl0rrt5cifpA9NK1m7VnYBzBGMetm60u7puglujApoYNMlDvdKiuHbehJLyWeZ8ApxJqoYfBdiU2u65QRiRORaOwq1L9vN7WM7bIt82rGPjLQo0NWg3byHtsgzfUJOcU8JnbICa
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(26005)(2906002)(356005)(81166007)(82740400003)(6666004)(86362001)(36756003)(83380400001)(478600001)(40460700003)(36860700001)(2616005)(1076003)(336012)(47076005)(82310400005)(426003)(186003)(8936002)(44832011)(41300700001)(966005)(40480700001)(4326008)(8676002)(6916009)(70586007)(5660300002)(70206006)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 12:14:05.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7807abb-8d2f-4a24-12c0-08dacc830cc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Clocking Wizard for Versal adaptive compute acceleration platforms
generates multiple configurable number of clock outputs.
Add device tree binding for Versal clocking wizard support.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v3:
rename the clocks to clk_in1 and s_axi_clk dt

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt

 .../clock/xlnx,versal-clk-wizard.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
new file mode 100644
index 000000000000..cd3c329ddd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,versal-clk-wizard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal clocking wizard
+
+maintainers:
+  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+
+description:
+  The clocking wizard is a soft ip clocking block of Xilinx Versal. The IP
+  uses the input clock frequencies and generates the requested
+  clock output.
+
+properties:
+  compatible:
+    const: xlnx,versal-clk-wizard
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: External input clocks to the given clock controller.
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
+        compatible = "xlnx,versal-clk-wizard";
+        reg = <0x40040000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&clkc 15>, <&clkc 15>;
+        clock-names = "clk_in1", "s_axi_aclk";
+        xlnx,nr-outputs = <6>;
+    };
+...
-- 
2.17.1

