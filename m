Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC04A1E00;
	Mon, 21 Sep 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998333; cv=fail; b=trmY1Jh2aQSG1PVMvgONPN0ryVzHTxID4sWL6cBdaxCwWByMkg5PYygg1Hgw53bFcj7dEypB8H5qWsCZRS4JDBwTwvcScsmu86TycK09HrJ110MsGVY+zKtORZjnyocUWX4BQW/uICZ76l+r2f9gICW+RUYPmv7c/rpuoFnmHLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998333; c=relaxed/simple;
	bh=jdKmIpUz1S8n+ihFzoClvVnWaWvq1VdN5hJOt6hyy/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5BpbW8CnQlBYimXsz1iYAhnbtEmeph7tUjdZcAmvutON0EqSXk2ghPQ7TJnY08kmGs+RocZEqwVzcA18O+PXZ+4P1EZ5y7uxxi0Of570lUSzBCS/wDvtMImp+03xsM7fbdtiDJinh8pARuCHwiEKNHXvOD28jNR28/ripyIcFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NUMj9why; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NUMj9why"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E87d+tv62ddHKBc01Uql0s0ODHyzRGp21stXyM6GtDcy5tGWbjvI8EJDzjRgE5lx4UdHz002Pkyuyi1+YvbqGrs6w2mjpuP7hKraX73pFWTI2PeRnPdHhZGsomGXM6qCxSigonZMAA5YZboS/1AYZ8yluMK6Uq9tKxdzv49CkHa89USa+/8AoMGoqeiSAdgeQBIEUXJnGQ+2YaD7pkMlYjRwWUlA8azxcL6hpkn1X7i/cmxXGdvMh+Z2d7jQzYOo0o7Y4LnkB9Bb8pFGtvJxvTM9NIvaxCvouKPDkkOCqPKOzapuy1SebNHdHIA+IXGGpEA7s0yPn7Grc0XU3ueQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL0+36eQQtCrJaeFx3xLV7o2fXQFCF6aMm2xejgHw8s=;
 b=J8Oeviull3NTeOJFZa/GcLc8ZT8uJEs9tFEigNEoo0ssdl/zgZT2B40FCVzEXamJM8+7oQ+5SLPguhFwJxuvD2gSGOfGomEx5FCTekYhZ4wLQ9wtSoE4swnA4Jz9WLW9znoqVGO5ujM75RKDPvkdttUFq81d1cGatuen/jwKdsxbOW+uVFnVT6/lVMqQdDH2PPVzm0arb9RKdkT2SMv2T7iObfQM9EaS2pPQYAIN3il4rsQ1C9jQiINOwd7an5GZVVB3JiU/BsGxlWqdPHMcEETdIF9XJZK3UUQU+VKkLsXCbZHTcF3K9FGWX7dD6PzMUsqTUsLklvWwQ9qjrzOALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL0+36eQQtCrJaeFx3xLV7o2fXQFCF6aMm2xejgHw8s=;
 b=NUMj9why+Pi14ydB0XOdzVPIYwpfXA7wKtAZthviykkABvZVLKOfK03pSaZkLCPiLAjrTuG025hS3BI4+gp+eODzQYqL1MVMbyq0d+v0obGw7AhWA8vG3oXYcwrJn62Y0NWguKOh/xtb2QCvNefhCgWBt05NomGG0x8tiVtSSks=
Received: from TY6P286CA0007.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b8::6)
 by TY6PR01MB17996.jpnprd01.prod.outlook.com (2603:1096:405:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:26 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8:cafe::91) by TY6P286CA0007.outlook.office365.com
 (2603:1096:405:3b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:25 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 1F758300027E;
	Mon, 21 Sep 2026 22:45:21 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/9] clk: renesas: Add support for RZ/G2M v3.0
Date: Mon, 21 Sep 2026 13:44:26 +0000
Message-ID: <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TY6PR01MB17996:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 005e184e-b3d4-43c4-e277-08df17e69756
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|5023799004|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6mLydrCFVG2sCDy5N/odwdJeYoI6V/pxuY+frbAWZEHHf4YUsJz7ycXRqGOpHqma0TZblaRYFW7HEDTRaXcEXDqDyfLAeuuFm/w4hyncqW61eqCdwqHbGSji0RPqkX2mX1p5QRBFMTRNioNe5SS3dLUUWmmQJzvQUkXIH+OW8s4qnNTSBXJnZ6jFa3n5is4/5ysfH+efw/ddpfMvgwir2ERnK3ne2gWAf9iNniKHvuncpiwWH6IyBkgyUDQEnc48QcvVCD0Z4prs1ywrzEqRXEEu7s8QfOhzjIh+84waEJGVLJBV6EM/1c5mkkmnF/b3A31s6gXsjjhqSY5AsDDKyD8fTlZAToLo4W0gNQNeEWZl87jCXmC65bBIoF7dPPPLUUqTZMl/PDrXlLYTQWC88UhHot3XNViRRs4aaHqIpxQbyXLXfomv3HSKyyBduZf5sctrJeZe5gEpRv7vSXp+QJ9t4lUmmfoAs9hwgLQfgayikQOLRQkUfNabh13cdD33v3s8xw7guMXLcLjbdbf3z6ig3+f+GsmEXTsPJXFfyhan9+mn9MuFsMx7AXwQFji3r37DahHVr26LbqAO9isOad23DNNcaTOrGPqT9vdhb2VePLXgaPxruT3tRtjvfYXoORxQRzm2mai0j0n7rQznwf59ca9lI/ouss7gu7GHz+cGpYwnVNGWmZGEc64EazZZ2dinI4c7ZwzzoUH+msMFQw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UmJy104tu7hkK7lPQBTauXGwzT2sW8KCeRhUkpwwCms/rw1NC6mNZJVgbC6godfM91zAKfNjpJmeM0Yuz7PjYmnFiBR2PcIBNem6UUjcVgoi2VsntKRmoLhs3db6FHTsuQFN7As+t8Wf5z8OhwD2zXomBkFi0Lb5sWtAuDTSb+vWuZmmk+YjJBVHmWUSVvTgxabK/XfojmLN7a5Lo419Q8K7SjcT87Cvy1No67TEhRx88j7gyuvq4tNAH2crhKIBuo0Dd9pT5uPiX8x6Vx6aPn2YML5aKiUK4o34dg45mbZWLtYG1HdsKjnnS90JAHmRL81Zts/TEjeDhLOYhVeoAEWkWa71h9KRYZ44+zwR/BzPiUDC66k8L1A9OvPeuniJvLDEeXiA14bxCpzoXfNEniCcz7fc6XCB2blR7Pu7VeuQ3VOIvzIgpOljmYeNr0VN
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:25.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005e184e-b3d4-43c4-e277-08df17e69756
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17996

Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
including basic core clocks, and SCIF2 (serial console) and INTC-AP
(GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
however it lacks some modules such as the FCPCI.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Updated include path to CPG dt-bindings
- Added Reviewed-by tag

 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r8a774a3-cpg-mssr.c | 168 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h  |   1 +
 5 files changed, 181 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a774a3-cpg-mssr.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 46b929e9872b..a02ca6b096c0 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -13,6 +13,7 @@ config CLK_RENESAS
 	select CLK_R8A7745 if ARCH_R8A7745
 	select CLK_R8A77470 if ARCH_R8A77470
 	select CLK_R8A774A1 if ARCH_R8A774A1
+	select CLK_R8A774A3 if ARCH_R8A774A3
 	select CLK_R8A774B1 if ARCH_R8A774B1
 	select CLK_R8A774C0 if ARCH_R8A774C0
 	select CLK_R8A774E1 if ARCH_R8A774E1
@@ -93,6 +94,10 @@ config CLK_R8A774A1
 	bool "RZ/G2M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A774A3
+	bool "RZ/G2M v3.0 clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_R8A774B1
 	bool "RZ/G2N clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 658f8aac5127..5c1b798118db 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_CLK_R8A7743)		+= r8a7743-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7745)		+= r8a7745-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77470)		+= r8a77470-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774A1)		+= r8a774a1-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A774A3)		+= r8a774a3-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774B1)		+= r8a774b1-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774C0)		+= r8a774c0-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A774E1)		+= r8a774e1-cpg-mssr.o
diff --git a/drivers/clk/renesas/r8a774a3-cpg-mssr.c b/drivers/clk/renesas/r8a774a3-cpg-mssr.c
new file mode 100644
index 000000000000..64c5106a9a54
--- /dev/null
+++ b/drivers/clk/renesas/r8a774a3-cpg-mssr.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a774a3 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ * Based on r8a7796-cpg-mssr.c
+ *
+ * Copyright (C) 2016 Glider bvba
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A774A3_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL2,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_PLL1_DIV2,
+	CLK_PLL1_DIV4,
+	CLK_S0,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a774a3_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",      CLK_EXTAL),
+	DEF_INPUT("extalr",     CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",       CLK_PLL0, CLK_TYPE_GEN3_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_GEN3_PLL1, CLK_MAIN),
+	DEF_BASE(".pll2",       CLK_PLL2, CLK_TYPE_GEN3_PLL2, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,     CLK_PLL1,       2, 1),
+	DEF_FIXED(".s0",        CLK_S0,            CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
+
+	/* Core Clock Outputs */
+	DEF_GEN3_Z("z",         R8A774A3_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z2",        R8A774A3_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_FIXED("s0d3",       R8A774A3_CLK_S0D3,  CLK_S0,         3, 1),
+	DEF_FIXED("s3d1",       R8A774A3_CLK_S3D1,  CLK_S3,         1, 1),
+	DEF_FIXED("s3d4",       R8A774A3_CLK_S3D4,  CLK_S3,         4, 1),
+};
+
+static const struct mssr_mod_clk r8a774a3_mod_clks[] __initconst = {
+	DEF_MOD("scif2",		 310,	R8A774A3_CLK_S3D4),
+	DEF_MOD("intc-ap",		 408,	R8A774A3_CLK_S0D3),
+};
+
+static const unsigned int r8a774a3_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *   MD		EXTAL		PLL0	PLL1	PLL2	PLL3	PLL4	OSC
+ * 14 13 19 17	(MHz)
+ *-------------------------------------------------------------------------
+ * 0  0  0  0	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  0  0  1	16.66 x 1	x180	x192	x144	x128	x144	/16
+ * 0  0  1  0	Prohibited setting
+ * 0  0  1  1	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  1  0  0	20    x 1	x150	x160	x120	x160	x120	/19
+ * 0  1  0  1	20    x 1	x150	x160	x120	x106	x120	/19
+ * 0  1  1  0	Prohibited setting
+ * 0  1  1  1	20    x 1	x150	x160	x120	x160	x120	/19
+ * 1  0  0  0	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  0  0  1	25    x 1	x120	x128	x96	x84	x96	/24
+ * 1  0  1  0	Prohibited setting
+ * 1  0  1  1	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  1  0  0	33.33 / 2	x180	x192	x144	x192	x144	/32
+ * 1  1  0  1	33.33 / 2	x180	x192	x144	x128	x144	/32
+ * 1  1  1  0	Prohibited setting
+ * 1  1  1  1	33.33 / 2	x180	x192	x144	x192	x144	/32
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 11) | \
+					 (((md) & BIT(13)) >> 11) | \
+					 (((md) & BIT(19)) >> 18) | \
+					 (((md) & BIT(17)) >> 17))
+
+static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		192,	1,	128,	1,	16,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		160,	1,	106,	1,	19,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 1,		128,	1,	84,	1,	24,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 2,		192,	1,	192,	1,	32,	},
+	{ 2,		192,	1,	128,	1,	32,	},
+	{ 0, /* Prohibited setting */				},
+	{ 2,		192,	1,	192,	1,	32,	},
+};
+
+static int __init r8a774a3_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	if (!cpg_pll_config->extal_div) {
+		dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
+		return -EINVAL;
+	}
+
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a774a3_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a774a3_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a774a3_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a774a3_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a774a3_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a774a3_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a774a3_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a774a3_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index df9c2a8c8e70..ffac4409a161 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -944,6 +944,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a774a1_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A774A3
+	{
+		.compatible = "renesas,r8a774a3-cpg-mssr",
+		.data = &r8a774a3_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A774B1
 	{
 		.compatible = "renesas,r8a774b1-cpg-mssr",
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 5bef6f34dcb2..dc3015b3032d 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -191,6 +191,7 @@ extern const struct cpg_mssr_info r8a7743_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7745_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77470_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774a1_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a774a3_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774b1_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774c0_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a774e1_cpg_mssr_info;
-- 
2.34.1

