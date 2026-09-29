Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0704F85D8;
	Tue, 29 Sep 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674812; cv=fail; b=ULf0XP1WFm2Koow1pZRcNRnnTosrahqT4x3SsqWc+6FgllSfOUnMrKWQp0WKX3iP5l/fGMNhYrp0+rUuYgwX6jjIPekTGX1nAdTexgNEXvmaOJ167RAFEksbDqhncjORTpPS4QB7sF3t0AX2/jJOWoVCND/80xJT3b3rLv6Pnxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674812; c=relaxed/simple;
	bh=kScbAILGLqrPznzUTnPUTq6FPSHizxFalxY3lqWiqIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n5u1yBFx5U2f/3o62LsnFHTCOXlCJK+BRA24BzwfiPDw6oS/GSm+yavCZk6ELf59h4lOje0hiZFm5OHZSSjxkCGKg4VdYbLR9kspVrNohZXHcHyz0WqSwzjtMdIlVfmWqYqz1Zj6zJdyNLyYt6KutrL8bM9S5fqImtDAZtEhHTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hXLXri3v; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hXLXri3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcZ5tKwG9/6klaUhSb1ZqqhGiC/83lnGb2f5NXxgmVa9Fphq1BEQblF30p76rkfAA0iq/2DrWLDRDs9YSB3GEIgIY5vBdmN5kRZGaSD04rfQ92OhBxr3hSjLxTOo9gHL+suWEQnb9YrtEDWSxg/tApU0CkooRPECvdXFx0bhj7yqGun4sg+nmg+uZs8mI/7k7zNWJ9LQ7ZXgC1HFkKkbTSIuJR1O69neNq1GOwDTzjjW8HG9MAeiXItWAhtR3ttZrUBUtG9NaM3yKVGTtdhft/AU/rESoxUQwxqF1qAl+tRhSlzpmtt320Fz8cljkhwWQFlRoRFdFMiwfkvY0zKtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdqLqvFp9ArU0iXdgGvoW0NjDAggY0TcabRShYwcDx4=;
 b=npIk03twBFIyiyLvrR45pzAUYnxOHEs46PE/xT1wXjn7JHODiSAzDlQ/nH9TnEct0n/nipErGdbytn2ApxGBD2sBhCbSm0welrRfX6/mvYUvZwrEcRDVuR6Lpm9MWHVrY3JUufiHu36Xzn2ZeYxLArI40dG6YcdfKZxAgFnFuMKlK/Zy1WtDvH05spn8MN3tQB5/Yik2d2Y9700lSEIDEtaeCUFGJ4FVhHgqZi1asU+pho2My/T9dM5KlnMoMRV4hxndrjy7rdXfSvCP1dhAHGmu2LiZ21j4mol+0JsFsM+RJn3s3tUAfAwmIH8r57x1RW+l6YQFW+LHoYEUgEciWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdqLqvFp9ArU0iXdgGvoW0NjDAggY0TcabRShYwcDx4=;
 b=hXLXri3vh5MUynIQZIN1j6TveRCD50QjKvndE6658z397KEPphjLD64p/Fel3czW6C2GzTgskzaKknnzp+cSANY5/wJPkPsjIFGGuk4Etvx9X+imXbxYqNsYPbhStWT07nbTLUi95SF09CgiIOMr78bvulJIhaX+59TozvZSAPbVj4BcphyGcfki23+TA124J+lcD8DV8USyIjVw+Ng/1ocyNZ7lw/zvIfiYaRzUQTQb+L0pYQBf898DoJDmEI5qraftHvR7N6eIXWmrgFtYTstSjXVIwBDT5X/xmgdc/gk+7WGzwmie5PPa3nYZT24z5CNzzuptoNmWQ+qqqNErxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA5PR03MB989108.namprd03.prod.outlook.com (2603:10b6:806:4d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 09:40:07 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 09:40:07 +0000
From: evon.chiam@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: socfpga: agilex72: add clock manager driver for Agilex72
Date: Tue, 29 Sep 2026 17:38:13 +0800
Message-ID: <ce24db387fd4499b900169e9d05ed2df45579e37.1790651166.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790651166.git.evon.chiam@altera.com>
References: <cover.1790651166.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA5PR03MB989108:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd9ff67-09b3-4fa4-2493-08df1e0da427
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|11063799006|6133799003|3023799007|55112099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LulfE9UzN3h0LFMCDNLecAjMDRyrIYb1XTpEFW+XnpHj7oARmUaII0LExb3o0/64q7G4x+u3Ny3+r4F0iSnq7P022wGO2HKEDHTZciG58gPUg4D59/6nVsNWPiWA+CmXNFawzW8PsVmnsF3jjMS+KxI2bLsha41BPqDCUA8s+Xk1rfPCP/mB9lW5HsjbmXIZ0nYmDuTBWb3Slkjxoh7Ofc5IQ4h2opruLqBB8eFqTDaf5fujnBg0H2KRi9d3tivI51XjHPxDNw9PsKZG16qgr5cDDvBtwX8QP5JCmz6Ai4F2lIJ1T3Sngjpqf4dMFnYjeqP8/ohk0uxH/bLtVrspaNRIr+G06jklMlEchK1rpuzmgA2CZA1RI/0YF8MDW2ayuhxweGHt9mj44TZGDwGJ496FccV+zW0S6i9BHYWXh5Mb+Zave41rhn+z2ojgGFupogQ2Vd5UMD5fmw+39EZZOlML0pyHqg50KHtdUsAa0uoLTz8YuVhVPBzyrRhZ7Z/v4cUqe2Ucl+UEl36E93I7Hlk1pSQZlHJv1FzhV//9nyEPWgm1zsDURD+9iEYvlHTS7/GmmFennhGH7ne8WhprZwNiIIf0gFfTUABRJCL42pJsdgqvyG6raH0lxUBrykpGMghoXA/a4Aa2KJhDFB8ly37xIkl526lP90CazdNmPmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(11063799006)(6133799003)(3023799007)(55112099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cd1PBdj2a9DJCJz6HnDxDwUeac+YAwOkYvlyC2W6tlT0qU7P8l9azcOtSQlo?=
 =?us-ascii?Q?P07V2V0z77c0y+CK0kftJvnky6jSHo6aXouJnaSr6pm0kZB3emd6Pny+OmwV?=
 =?us-ascii?Q?04orJ/Yhr8wE0AWk9+s/ZayKH4Zl0DxvoEEUWIVk3qwYgTDME6StLa4jVa7e?=
 =?us-ascii?Q?DeuhPZLWRTsuiuNViPOOsWezbPVi93nHopTHDDC/TynNP1QOds40FVht7Z+6?=
 =?us-ascii?Q?zQeokhBxZZZKy6kUsCLyIpBvKPnbxIpCDhds+CAuf1VD6ATNlghR1DzK1kWb?=
 =?us-ascii?Q?vvX2Z0j1w0K4WtDCtfdJ+Ot4PpP4q14IVgjVvChLY5dAimxMeLLDAnrz9il6?=
 =?us-ascii?Q?2g81RTJM2p1SNXRZfvzidMthOPEsmbr7teNMaetbJ1eF7dCBBcckt76Nw9CF?=
 =?us-ascii?Q?I9aQS2OQQVAnG/ECHP1DTmCQNpP3nP6bas6mV1GAByenz6nvNSK1w9seNi/I?=
 =?us-ascii?Q?NwKaL1woTyImCsC8u2w4Ata6Tt8eyD7a/e9kyASEkC2KSc6P2pRiUnqgOJg6?=
 =?us-ascii?Q?AGWwSGSlNPOJBizEr+OjS4/Tf9NTr/5OEnlkQ7CH8Qd5KRyTVM8yEmlFZQNj?=
 =?us-ascii?Q?DZV5/RL0zG/6xfA1mN54EyZpBRXIlLRxaXGjUXCLxIENlo1OSGULXA9pf1wi?=
 =?us-ascii?Q?aaSVaBtXF2yJBX9YHoVGfheB+T3ANR/g6YSMXCuu2ZKwNjiEG9A3NJDOPlNG?=
 =?us-ascii?Q?2r1CjVzjcb2btNl+lmTlCmDRFkgwsVjudMr5NPtx8h0mtYW2wmzmMP8A9AAp?=
 =?us-ascii?Q?6n2cIMX5qfVz2pJGaaIxZOizHMrO/0GVdIttdzLVh8T39X2kaVLjyl5a58R1?=
 =?us-ascii?Q?S81sTbrbEK2+fay+FocAIwdPRP5PV+CTweSsZ2roZJcmBWj1NLyl8ouk8RHG?=
 =?us-ascii?Q?i6VT/8Eq9nBPeux76PFEj+VxjqUAf1XHy+OcA4ORJnjBHXQ+lbgEcA4XhIi2?=
 =?us-ascii?Q?CbIPq4Sb0hnhhRGfdvyPXibjekYIY322XvFUElGZEW5Dm0zP8NKHZaGoUs7/?=
 =?us-ascii?Q?j8ClkS6StMsAHsxoPrxHOpova8p5SF0GM/l7iy7DwruN+MX1seSCi0a/DON2?=
 =?us-ascii?Q?oFngQS7oy2A4gOxwd+T0wBvRRLu26uE3Wzmfv4DbiDNEaEnFowAkhxvSKKWK?=
 =?us-ascii?Q?WWdq76FPDwBbeEgP1pP9nAMcslP90pnJICYf0q7VB77fUTP8tYxFraZ8OZDi?=
 =?us-ascii?Q?MLlTcR1uNY4dq42Dzo4Bcs/IzK0tESvwpZ/MHDzKix0I1I3Z98Zu3xpmUrl7?=
 =?us-ascii?Q?wiFSToZQOhdev0jWt/ZDieju8pbVtAcXzGYg7ry/jugsQ1TXEfemoE1/bDC5?=
 =?us-ascii?Q?fuxDTWAlWfbWyxUYKi97+s01GECtT/z8msb2mQMBaIkVrKVls6T/D2kTmfOt?=
 =?us-ascii?Q?ZXgbfIY71xtGMFUa5iARgO/PfY3ToUTLJ9EKIPLvxb2xZjNtqlGpFZkag/At?=
 =?us-ascii?Q?ZXL5ojzDRt4ecALztHkjcbWQPyoeCu38yt33tdN3bCv1hC5fnFUpdGyIIvnN?=
 =?us-ascii?Q?4FdNpH4jEKAKqm5dUl0bonoHmubrVwDUT4hzShNowUBPCw5bOj73mWYPAOJS?=
 =?us-ascii?Q?esBd62/mrflOZnyqRFhwo767lU+REWEcP247tIU5aEGptk4S0iPpkkcvcb0H?=
 =?us-ascii?Q?KebGcHxhYQIswWDnuiyQSpmgKH4aWr4JxhZcLF260kcmaY5/fk0liBSUqBsB?=
 =?us-ascii?Q?4wlP5yVzUjpzFGl+n+o2I8w/+r0c9pqKmILqEzZuGJqZC4ze6zK4iMl4G9Pr?=
 =?us-ascii?Q?1eaSwdreCA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd9ff67-09b3-4fa4-2493-08df1e0da427
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:40:06.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRnnRIIPv7hON+bXVA9Zce9PAfHSg7aEbwPQJvQ4xVEZrkgfwSOzPpYaH5xapWV01L2kvaN3IrJs4UVXusPz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989108

From: "Chiam, Evon" <evon.chiam@altera.com>

The Agilex72 clock manager supplies the hard processor system clocks.
It derives them from four external reference clocks provided by the
board, and exposes PLL, peripheral and gate clocks to consumers.

Its register layout and clock tree differ from the earlier SoCFPGA
platforms, so add a separate driver rather than extending an existing
one.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v2:
- Dropped the ARM/SOCFPGA AGILEX72 CLOCK DRIVER MAINTAINERS entry; the
  driver is already covered by ARM/SOCFPGA CLOCK FRAMEWORK SUPPORT.
- Merged clk-agilex72.h into clk-agilex72.c and deleted the header.
- Removed the forward declarations and ordered the functions so that
  each one is defined before it is used.
- Zero-initialised struct clk_init_data in all four register helpers.
- Switched from the deprecated parent_names to parent_data.
- Used devm_ variants for every allocation and clock registration, which
  also removes the clocks left registered on the probe error path.
- Implemented .enable and .disable for the software gates, reusing
  clk_gate_ops through a const clk_ops.
- Corrected usb2otg_hclk to 0xe0 bit 6; lsp_main_free_clk has no gate.
- Corrected uart_0_pclk, uart_1_pclk and uart_2_pclk to 0xd0 bits 24, 25
  and 26; bit 23 belongs to i3c_1_core_clk.
- Marked the hsp and lsp main, mp and sp clocks CLK_IS_CRITICAL.
- Dropped the unused div_lo_width and div_hi_width fields.
- Defined AGILEX72_NUM_CLKS here now that it is out of the binding
  header.

Note: .is_enabled is not implemented for the software gates. Adding it
would arm clk_disable_unused(), which would then switch off any gate
the bootloader left enabled that has no Linux consumer yet. The
existing SoCFPGA gate drivers behave the same way.

Note: Several clocks share a hardware gate bit (cs_*, usb31_*,
dma_* core/hs, xspi_*, sdmmc* groups, and the hsp/lsp main/mp/sp
pairs).

 drivers/clk/socfpga/Kconfig        |    3 +-
 drivers/clk/socfpga/Makefile       |    2 +-
 drivers/clk/socfpga/clk-agilex72.c | 1299 ++++++++++++++++++++++++++++
 3 files changed, 1302 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/socfpga/clk-agilex72.c

diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
index d88277e2a898..40cac9428fbe 100644
--- a/drivers/clk/socfpga/Kconfig
+++ b/drivers/clk/socfpga/Kconfig
@@ -13,7 +13,8 @@ config CLK_INTEL_SOCFPGA32
 	default ARM && ARCH_INTEL_SOCFPGA
 
 config CLK_INTEL_SOCFPGA64
-	bool "Intel Stratix / Agilex / N5X / Agilex5 clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
+	bool "Intel Stratix / Agilex / N5X / Agilex5 / Agilex72 clock controller support" \
+		if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
 	default ARM64 && ARCH_INTEL_SOCFPGA
 
 endif # CLK_INTEL_SOCFPGA
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index a1ea2b988eaf..97af3dfdbbad 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -3,4 +3,4 @@ obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o clk-pll.o clk-periph.o \
 				     clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
 obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
 				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
-				     clk-agilex.o clk-agilex5.o
+				     clk-agilex.o clk-agilex5.o clk-agilex72.o
diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk-agilex72.c
new file mode 100644
index 000000000000..b233a24b0761
--- /dev/null
+++ b/drivers/clk/socfpga/clk-agilex72.c
@@ -0,0 +1,1299 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
+
+struct agilex72_clock_data {
+	/*
+	 * MMIO bases ioremapped from DT resources with "reg-names" property
+	 * in probe:
+	 *   [0] - "clkmgr"  : main clock manager register block
+	 *   [1] - "gppll0"  : GP PLL 0 register block
+	 *   [2] - "gppll1"  : GP PLL 1 register block
+	 *   [3] - "gppll2"  : GP PLL 2 register block
+	 */
+	void __iomem *base[4];
+
+	/* Must be last */
+	struct clk_hw_onecell_data	clk_data;
+};
+
+struct agilex72_pll {
+	struct clk_gate     hw;
+	void __iomem       *pll_base;
+};
+
+struct agilex72_periph_clk {
+	struct clk_gate  hw;
+	void __iomem    *div_reg;
+	u8               div_lo_shift;
+	u8               div_hi_shift;
+};
+
+struct agilex72_gate_clk {
+	struct clk_gate hw;
+	bool div_linear;
+	void __iomem *div_reg;
+	void __iomem *bypass_reg;
+	u8  div_width;		/* only valid if div_reg != 0 */
+	u8  div_shift;		/* only valid if div_reg != 0 */
+	u8  bypass_shift;	/* only valid if bypass_reg != 0 */
+};
+
+struct agilex72_pll_clock {
+	unsigned int	id;
+	const char	*name;
+	const struct clk_parent_data	*parent_data;
+	u8	num_parents;
+	unsigned long   offset;
+};
+
+struct agilex72_perip_c_clock {
+	unsigned int		id;
+	const char		*name;
+	const struct clk_parent_data	*parent_data;
+	u8			num_parents;
+	unsigned long		div_offset;
+	u8			div_lo_shift;
+	u8			div_hi_shift;
+};
+
+struct agilex72_perip_cnt_clock {
+	unsigned int		id;
+	const char		*name;
+	const struct clk_parent_data	*parent_data;
+	u8			num_parents;
+	unsigned long		offset;
+};
+
+struct agilex72_gate_clock {
+	unsigned int		id;
+	const char		*name;
+	const struct clk_parent_data	*parent_data;
+	u8			num_parents;
+	unsigned long		flags;
+	unsigned long		gate_reg;
+	u8			gate_idx;
+	unsigned long		div_reg;
+	u8			div_offset;
+	u8			div_width;
+	unsigned long		bypass_reg;
+	u8			bypass_shift;
+	bool			div_linear;
+};
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define AGILEX72_NUM_CLKS           (AGILEX72_USB31_REF_CLK + 1)
+
+#define EMAC_BYPASS_OFFSET          0x10
+#define CLK_MGR_FREE_SHIFT          16
+#define CLK_MGR_FREE_MASK           0x7
+#define PERI_CLK_CNT_DIV_WIDTH      11
+#define BOOTCLKSRC_MASK             0x2000000
+#define BOOTCLKSRC_SHIFT            25
+#define SOCFPGA_PLL_POWER           0
+#define BOOT_CLK                    "boot_clk"
+#define CLK_MGR_PLL_CLK_SRC_SHIFT   27
+#define CLK_MGR_PLL_CLK_SRC_MASK    0x3
+#define PLL_RATE_REG_OFFSET         0x4
+#define PLL_CR_N_HI_MASK            0xFF
+#define PLL_CR_N_LO_MASK            0x1FE00
+#define PLL_CR_N_LO_SHIFT           9
+#define PLL_CRHI_M_MASK             0x1FF00000
+#define PLL_CRHI_M_SHIFT            20
+#define PLL_CR_C_MASK               0xFF
+#define PLL_CR_BYPASS_DIV_MASK      0x100
+#define PLL_FRACT_DIV_REG_OFFSET    0x5c
+#define PLL_CR_FRACT_DIV_MASK       0xFFFFFF
+
+static const struct clk_parent_data boot_pll_parents[] = {
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+};
+
+static const struct clk_parent_data gppll0_clk_parents[] = {
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div10-clk", .name = "cb-intosc-div10-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data gppll1_clk_parents[] = {
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div10-clk", .name = "cb-intosc-div10-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data gppll2_clk_parents[] = {
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div10-clk", .name = "cb-intosc-div10-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+/* Primary muxes selecting each free running clock source */
+static const struct clk_parent_data comp0_free_mux[] = {
+	{ .fw_name = "gppll1-c0", .name = "gppll1-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data core2_free_mux[] = {
+	{ .fw_name = "gppll2-c0", .name = "gppll2-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data core3_free_mux[] = {
+	{ .fw_name = "gppll2-c1", .name = "gppll2-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data dsu_free_mux[] = {
+	{ .fw_name = "gppll1-c1", .name = "gppll1-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data ccu_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data hsp_noc_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data lsp_noc_free_mux[] = {
+	{ .fw_name = "gppll0-c1", .name = "gppll0-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data trace_free_mux[] = {
+	{ .fw_name = "gppll0-c2", .name = "gppll0-c2" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data emaca_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data emacb_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data emac_ptp_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data gpio_db_free_mux[] = {
+	{ .fw_name = "gppll0-c1", .name = "gppll0-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data usb31_free_mux[] = {
+	{ .fw_name = "gppll0-c0", .name = "gppll0-c0" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data s2f_user0_free_mux[] = {
+	{ .fw_name = "gppll0-c1", .name = "gppll0-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data s2f_user1_free_mux[] = {
+	{ .fw_name = "gppll0-c1", .name = "gppll0-c1" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data xspi_phy_clk_mux[] = {
+	{ .fw_name = "gppll0-c3", .name = "gppll0-c3" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+static const struct clk_parent_data memdevice_phy_clk_mux[] = {
+	{ .fw_name = "gppll0-c3", .name = "gppll0-c3" },
+	{ .fw_name = "osc1", .name = "osc1" },
+	{ .fw_name = "cb-intosc-div2-clk", .name = "cb-intosc-div2-clk" },
+	{ .fw_name = "f2s-free-clk", .name = "f2s-free-clk" },
+};
+
+/* Secondary muxes between free_clk and boot_clk */
+static const struct clk_parent_data comp0_mux[] = {
+	{ .fw_name = "comp0_free_clk", .name = "comp0_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data core2_mux[] = {
+	{ .fw_name = "core2_free_clk", .name = "core2_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data core3_mux[] = {
+	{ .fw_name = "core3_free_clk", .name = "core3_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data mpu_mux[] = {
+	{ .fw_name = "dsu_free_clk", .name = "dsu_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data ccu_mux[] = {
+	{ .fw_name = "ccu_free_clk", .name = "ccu_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data hsp_noc_mux[] = {
+	{ .fw_name = "hsp_noc_free_clk", .name = "hsp_noc_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data lsp_noc_mux[] = {
+	{ .fw_name = "lsp_noc_free_clk", .name = "lsp_noc_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data cs_at_mux[] = {
+	{ .fw_name = "lsp_noc_free_clk", .name = "lsp_noc_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data cs_pdbg_mux[] = {
+	{ .fw_name = "lsp_noc_free_clk", .name = "lsp_noc_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data cs_trace_mux[] = {
+	{ .fw_name = "trace_free_clk", .name = "trace_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data emac_mux[] = {
+	{ .fw_name = "emaca_div_clk", .name = "emaca_div_clk" },
+	{ .fw_name = "emacb_div_clk", .name = "emacb_div_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data emac_ptp_mux[] = {
+	{ .fw_name = "emac_ptp_free_clk", .name = "emac_ptp_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data gpio_db_mux[] = {
+	{ .fw_name = "gpio_db_free_clk", .name = "gpio_db_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data usb31_mux[] = {
+	{ .fw_name = "usb31_free_clk", .name = "usb31_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data s2f_user0_mux[] = {
+	{ .fw_name = "s2f_user0_free_clk", .name = "s2f_user0_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data s2f_user1_mux[] = {
+	{ .fw_name = "s2f_user1_free_clk", .name = "s2f_user1_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data xspi_mux[] = {
+	{ .fw_name = "xspi_phy_free_clk", .name = "xspi_phy_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct clk_parent_data memdevice_phy_mux[] = {
+	{ .fw_name = "memdevice_phy_free_clk", .name = "memdevice_phy_free_clk" },
+	{ .fw_name = BOOT_CLK, .name = BOOT_CLK },
+};
+
+static const struct agilex72_pll_clock pll_clks[] = {
+	{
+		.id = AGILEX72_BOOT_CLK,
+		.name = BOOT_CLK,
+		.parent_data = boot_pll_parents,
+		.num_parents = ARRAY_SIZE(boot_pll_parents),
+		.offset = 0x4,
+	},
+	{
+		.id = AGILEX72_GPPLL0_CLK,
+		.name = "gppll0",
+		.parent_data = gppll0_clk_parents,
+		.num_parents = ARRAY_SIZE(gppll0_clk_parents),
+		.offset = 0x160,
+	},
+	{
+		.id = AGILEX72_GPPLL1_CLK,
+		.name = "gppll1",
+		.parent_data = gppll1_clk_parents,
+		.num_parents = ARRAY_SIZE(gppll1_clk_parents),
+		.offset = 0x80,
+	},
+	{
+		.id = AGILEX72_GPPLL2_CLK,
+		.name = "gppll2",
+		.parent_data = gppll2_clk_parents,
+		.num_parents = ARRAY_SIZE(gppll2_clk_parents),
+		.offset = 0x60,
+	},
+};
+
+static const struct clk_parent_data gppll0_parents[] = {
+	{ .fw_name = "gppll0", .name = "gppll0" },
+};
+
+static const struct clk_parent_data gppll1_parents[] = {
+	{ .fw_name = "gppll1", .name = "gppll1" },
+};
+
+static const struct clk_parent_data gppll2_parents[] = {
+	{ .fw_name = "gppll2", .name = "gppll2" },
+};
+
+static const struct agilex72_perip_c_clock main_perip_c_clks[] = {
+	{ AGILEX72_GPPLL0_C0_CLK,
+	  "gppll0-c0", gppll0_parents, 1, 0x24, 23,  0 },
+	{ AGILEX72_GPPLL0_C1_CLK,
+	  "gppll0-c1", gppll0_parents, 1, 0x28, 14, 23 },
+	{ AGILEX72_GPPLL0_C2_CLK,
+	  "gppll0-c2", gppll0_parents, 1, 0x2c,  0,  9 },
+	{ AGILEX72_GPPLL0_C3_CLK,
+	  "gppll0-c3", gppll0_parents, 1, 0x30,  0,  9 },
+	{ AGILEX72_GPPLL0_C4_CLK,
+	  "gppll0-c4", gppll0_parents, 1, 0x38,  0,  9 },
+	{ AGILEX72_GPPLL0_C5_CLK,
+	  "gppll0-c5", gppll0_parents, 1, 0x3c,  0,  9 },
+	{ AGILEX72_GPPLL0_C6_CLK,
+	  "gppll0-c6", gppll0_parents, 1, 0x40,  0,  9 },
+	{ AGILEX72_GPPLL1_C0_CLK,
+	  "gppll1-c0", gppll1_parents, 1, 0x24, 23,  0 },
+	{ AGILEX72_GPPLL1_C1_CLK,
+	  "gppll1-c1", gppll1_parents, 1, 0x28, 14, 23 },
+	{ AGILEX72_GPPLL2_C0_CLK,
+	  "gppll2-c0", gppll2_parents, 1, 0x24, 23,  0 },
+	{ AGILEX72_GPPLL2_C1_CLK,
+	  "gppll2-c1", gppll2_parents, 1, 0x28, 14, 23 },
+};
+
+/* Non-SW clock-gated enabled clocks */
+static const struct agilex72_perip_cnt_clock main_perip_cnt_clks[] = {
+	{ AGILEX72_COMP0_FREE_CLK, "comp0_free_clk",
+	  comp0_free_mux, ARRAY_SIZE(comp0_free_mux), 0xbc },
+	{ AGILEX72_CORE2_FREE_CLK, "core2_free_clk",
+	  core2_free_mux, ARRAY_SIZE(core2_free_mux), 0xb8 },
+	{ AGILEX72_CORE3_FREE_CLK, "core3_free_clk",
+	  core3_free_mux, ARRAY_SIZE(core3_free_mux), 0xb4 },
+	{ AGILEX72_DSU_FREE_CLK, "dsu_free_clk",
+	  dsu_free_mux, ARRAY_SIZE(dsu_free_mux), 0xc0 },
+	{ AGILEX72_CCU_FREE_CLK, "ccu_free_clk",
+	  ccu_free_mux, ARRAY_SIZE(ccu_free_mux), 0xc4 },
+	{ AGILEX72_HSP_NOC_FREE_CLK, "hsp_noc_free_clk",
+	  hsp_noc_free_mux, ARRAY_SIZE(hsp_noc_free_mux), 0x104 },
+	{ AGILEX72_LSP_NOC_FREE_CLK, "lsp_noc_free_clk",
+	  lsp_noc_free_mux, ARRAY_SIZE(lsp_noc_free_mux), 0x108 },
+	{ AGILEX72_TRACE_FREE_CLK, "trace_free_clk",
+	  trace_free_mux, ARRAY_SIZE(trace_free_mux), 0x144 },
+	{ AGILEX72_EMAC_A_FREE_CLK, "emaca_free_clk",
+	  emaca_free_mux, ARRAY_SIZE(emaca_free_mux), 0x128 },
+	{ AGILEX72_EMAC_B_FREE_CLK, "emacb_free_clk",
+	  emacb_free_mux, ARRAY_SIZE(emacb_free_mux), 0x12c },
+	{ AGILEX72_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk",
+	  emac_ptp_free_mux, ARRAY_SIZE(emac_ptp_free_mux), 0x130 },
+	{ AGILEX72_GPIO_DB_FREE_CLK, "gpio_db_free_clk",
+	  gpio_db_free_mux, ARRAY_SIZE(gpio_db_free_mux), 0x134 },
+	{ AGILEX72_USB31_FREE_CLK, "usb31_free_clk",
+	  usb31_free_mux, ARRAY_SIZE(usb31_free_mux), 0x140 },
+	{ AGILEX72_S2F_USER0_FREE_CLK, "s2f_user0_free_clk",
+	  s2f_user0_free_mux, ARRAY_SIZE(s2f_user0_free_mux), 0x138 },
+	{ AGILEX72_S2F_USER1_FREE_CLK, "s2f_user1_free_clk",
+	  s2f_user1_free_mux, ARRAY_SIZE(s2f_user1_free_mux), 0x13c },
+	{ AGILEX72_XSPI_PHY_FREE_CLK, "xspi_phy_free_clk",
+	  xspi_phy_clk_mux, ARRAY_SIZE(xspi_phy_clk_mux), 0x154 },
+	{ AGILEX72_MEMDEVICE_PHY_FREE_CLK, "memdevice_phy_free_clk",
+	  memdevice_phy_clk_mux, ARRAY_SIZE(memdevice_phy_clk_mux), 0x148 },
+};
+
+static const struct clk_parent_data hsp_mp_clk_parent[] = {
+	{ .fw_name = "hsp_mp_clk", .name = "hsp_mp_clk" },
+};
+
+static const struct clk_parent_data lsp_main_parent[] = {
+	{ .fw_name = "lsp_main_clk", .name = "lsp_main_clk" },
+};
+
+static const struct clk_parent_data lsp_mp_parent[] = {
+	{ .fw_name = "lsp_mp_clk", .name = "lsp_mp_clk" },
+};
+
+static const struct clk_parent_data lsp_sp_parent[] = {
+	{ .fw_name = "lsp_sp_clk", .name = "lsp_sp_clk" },
+};
+
+static const struct clk_parent_data usb31_bus_clk_early_parents[] = {
+	{ .fw_name = "hsp_main_clk", .name = "hsp_main_clk" },
+};
+
+static const struct clk_parent_data emaca_div_parents[] = {
+	{ .fw_name = "emaca_free_clk", .name = "emaca_free_clk" },
+};
+
+static const struct clk_parent_data emacb_div_parents[] = {
+	{ .fw_name = "emacb_free_clk", .name = "emacb_free_clk" },
+};
+
+/* SW Clock gate enabled clocks */
+static const struct agilex72_gate_clock gate_clks[] = {
+	{ AGILEX72_COMP0_CLK, "comp0_clk", comp0_mux,
+	  ARRAY_SIZE(comp0_mux), 0, 0x30, 8, 0, 0, 0, 0x3c, 5, 0 },
+	{ AGILEX72_CORE2_CLK, "core2_clk", core2_mux,
+	  ARRAY_SIZE(core2_mux), 0, 0x30, 10, 0, 0, 0, 0x3c, 10, 0 },
+	{ AGILEX72_CORE3_CLK, "core3_clk", core3_mux,
+	  ARRAY_SIZE(core3_mux), 0, 0x30, 11, 0, 0, 0, 0x3c, 11, 0 },
+	{ AGILEX72_MPU_CLK, "mpu_clk", mpu_mux,
+	  ARRAY_SIZE(mpu_mux), 0, 0x30, 7, 0, 0, 0, 0x3c, 4, 0 },
+	{ AGILEX72_CCU_CLK, "ccu_clk", ccu_mux,
+	  ARRAY_SIZE(ccu_mux), 0, 0x30, 6, 0, 0, 0, 0x3c, 3, 0 },
+	{ AGILEX72_APU_SYS_FREE_CLK, "apu_sys_free_clk", ccu_mux,
+	  ARRAY_SIZE(ccu_mux), 0, 0, 0, 0x50, 22, 2, 0x3c, 3, 0 },
+	{ AGILEX72_HSP_SYS_FREE_CLK, "hsp_sys_free_clk", hsp_noc_mux,
+	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0, 0x10c, 8, 2, 0xf0, 9, 0 },
+	{ AGILEX72_HSP_MAIN_FREE_CLK, "hsp_main_free_clk", hsp_noc_mux,
+	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0, 0, 0, 0, 0xf0, 9, 0 },
+	{ AGILEX72_HSP_MAIN_CLK, "hsp_main_clk", hsp_noc_mux,
+	  ARRAY_SIZE(hsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
+	{ AGILEX72_HSP_MP_CLK, "hsp_mp_clk", hsp_noc_mux,
+	  ARRAY_SIZE(hsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 2, 0x10c, 10, 2, 0xf0, 9, 0 },
+	{ AGILEX72_HSP_SP_CLK, "hsp_sp_clk", hsp_noc_mux,
+	  ARRAY_SIZE(hsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 3, 0x10c, 12, 2, 0xf0, 9, 0 },
+	{ AGILEX72_USB2OTG_HCLK, "usb2otg_hclk", hsp_mp_clk_parent,
+	  1, 0, 0xe0, 6, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_LSP_SYS_FREE_CLK, "lsp_sys_free_clk", lsp_noc_mux,
+	  ARRAY_SIZE(lsp_noc_mux), 0, 0, 0, 0x10c, 2, 2, 0xf0, 9, 0 },
+	{ AGILEX72_LSP_MAIN_FREE_CLK, "lsp_main_free_clk", lsp_noc_mux,
+	  ARRAY_SIZE(lsp_noc_mux), 0, 0, 0, 0, 0, 0, 0xf0, 9, 0 },
+	{ AGILEX72_LSP_MAIN_CLK, "lsp_main_clk", lsp_noc_mux,
+	  ARRAY_SIZE(lsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
+	{ AGILEX72_LSP_MP_CLK, "lsp_mp_clk", lsp_noc_mux,
+	  ARRAY_SIZE(lsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 2, 0x10c, 4, 2, 0xf0, 9, 0 },
+	{ AGILEX72_LSP_SP_CLK, "lsp_sp_clk", lsp_noc_mux,
+	  ARRAY_SIZE(lsp_noc_mux), CLK_IS_CRITICAL, 0xe0, 3, 0x10c, 6, 2, 0xf0, 9, 0 },
+	{ AGILEX72_SPIM_0_CLK, "spim_0_clk", lsp_main_parent,
+	  1, 0, 0xd0, 11, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SPIM_1_CLK, "spim_1_clk", lsp_main_parent,
+	  1, 0, 0xd0, 12, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SPIS_0_CLK, "spis_0_clk", lsp_main_parent,
+	  1, 0, 0xd0, 13, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SPIS_1_CLK, "spis_1_clk", lsp_main_parent,
+	  1, 0, 0xd0, 14, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_DMA_0_CORE_CLK, "dma_0_core_clk", lsp_main_parent,
+	  1, 0, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_DMA_0_HS_CLK, "dma_0_hs_clk", lsp_mp_parent,
+	  1, 0, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_DMA_1_CORE_CLK, "dma_1_core_clk", lsp_main_parent,
+	  1, 0, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_DMA_1_HS_CLK, "dma_1_hs_clk", lsp_mp_parent,
+	  1, 0, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I3C_0_CORE_CLK, "i3c_0_core_clk", lsp_mp_parent,
+	  1, 0, 0xd0, 22, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I3C_1_CORE_CLK, "i3c_1_core_clk", lsp_mp_parent,
+	  1, 0, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I2C_0_PCLK, "i2c_0_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 17, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I2C_1_PCLK, "i2c_1_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 18, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I2C_EMAC0_PCLK, "i2c_emac0_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 19, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I2C_EMAC1_PCLK, "i2c_emac1_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 20, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_I2C_EMAC2_PCLK, "i2c_emac2_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 21, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_UART_0_PCLK, "uart_0_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 24, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_UART_1_PCLK, "uart_1_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 25, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_UART_2_PCLK, "uart_2_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 26, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SPTIMER_0_PCLK, "sptimer_0_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 29, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SPTIMER_1_PCLK, "sptimer_1_pclk", lsp_sp_parent,
+	  1, 0, 0xd0, 30, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_CS_AT_CLK, "cs_at_clk", cs_at_mux,
+	  ARRAY_SIZE(cs_at_mux), 0, 0xe0, 4, 0x10c, 24, 2, 0xf0, 9, 0 },
+	{ AGILEX72_CS_PDBG_CLK, "cs_pdbg_clk", cs_pdbg_mux,
+	  ARRAY_SIZE(cs_pdbg_mux), 0, 0xe0, 4, 0x10c, 28, 2, 0xf0, 9, 0 },
+	{ AGILEX72_CS_TRACE_CLK, "cs_trace_clk", cs_trace_mux,
+	  ARRAY_SIZE(cs_trace_mux), 0, 0xe0, 4, 0x10c, 26, 2, 0xf0, 10, 0 },
+	{ AGILEX72_EMACA_DIV_CLK, "emaca_div_clk", emaca_div_parents,
+	  1, 0, 0, 0, 0x118, 8, 2, 0, 0, 0 },
+	{ AGILEX72_EMACB_DIV_CLK, "emacb_div_clk", emacb_div_parents,
+	  1, 0, 0, 0, 0x118, 10, 2, 0, 0, 0 },
+	{ AGILEX72_EMAC0_CLK, "emac0_clk", emac_mux,
+	  ARRAY_SIZE(emac_mux), 0, 0xd0, 0, 0, 0, 0, 0x100, 26, 0 },
+	{ AGILEX72_EMAC1_CLK, "emac1_clk", emac_mux,
+	  ARRAY_SIZE(emac_mux), 0, 0xd0, 1, 0, 0, 0, 0x100, 27, 0 },
+	{ AGILEX72_EMAC2_CLK, "emac2_clk", emac_mux,
+	  ARRAY_SIZE(emac_mux), 0, 0xd0, 2, 0, 0, 0, 0x100, 28, 0 },
+	{ AGILEX72_EMAC_PTP_CLK, "emac_ptp_clk", emac_ptp_mux,
+	  ARRAY_SIZE(emac_ptp_mux), 0, 0xd0, 3, 0, 0, 0, 0xf0, 2, 0 },
+	{ AGILEX72_GPIO_DB_CLK, "gpio_db_clk", gpio_db_mux,
+	  ARRAY_SIZE(gpio_db_mux), 0, 0xd0, 4, 0x114, 0, 16, 0xf0, 3, 1 },
+	{ AGILEX72_USB31_SUSPEND_CLK, "usb31_suspend_clk", usb31_mux,
+	  ARRAY_SIZE(usb31_mux), 0, 0xe0, 7, 0x118, 12, 6, 0xf0, 7, 1 },
+	{ AGILEX72_USB31_BUS_CLK_EARLY, "usb31_bus_clk_early",
+	  usb31_bus_clk_early_parents, 1, 0, 0xe0, 7, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_S2F_USER0_CLK, "s2f_user0_clk", s2f_user0_mux,
+	  ARRAY_SIZE(s2f_user0_mux), 0, 0xd0, 27, 0, 0, 0, 0xf0, 4, 0 },
+	{ AGILEX72_S2F_USER1_CLK, "s2f_user1_clk", s2f_user1_mux,
+	  ARRAY_SIZE(s2f_user1_mux), 0, 0xd0, 28, 0, 0, 0, 0xf0, 5, 0 },
+	{ AGILEX72_XSPI_PCLK, "xspi_pclk", lsp_mp_parent,
+	  1, 0, 0xd0, 9, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_XSPI_CLK, "xspi_clk", xspi_mux,
+	  ARRAY_SIZE(xspi_mux), 0, 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
+	{ AGILEX72_XSPI_PHY_CLK, "xspi_phy_clk", xspi_mux,
+	  ARRAY_SIZE(xspi_mux), 0, 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
+	{ AGILEX72_SDMMC0_SDPHY_REG_CLK, "sdmmc0_sdphy_reg_clk",
+	  lsp_mp_parent, 1, 0, 0xd0, 5, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SDMMC1_SDPHY_REG_CLK, "sdmmc1_sdphy_reg_clk",
+	  lsp_mp_parent, 1, 0, 0xd0, 7, 0, 0, 0, 0, 0, 0 },
+	{ AGILEX72_SDMMC0_SDMCLK, "sdmmc0_sdmclk", memdevice_phy_mux,
+	  ARRAY_SIZE(memdevice_phy_mux), 0, 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
+	{ AGILEX72_SDMMC1_SDMCLK, "sdmmc1_sdmclk", memdevice_phy_mux,
+	  ARRAY_SIZE(memdevice_phy_mux), 0, 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
+	{ AGILEX72_SDMMC0_PHY_CLK, "sdmmc0_phy_clk", memdevice_phy_mux,
+	  ARRAY_SIZE(memdevice_phy_mux), 0, 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
+	{ AGILEX72_SDMMC1_PHY_CLK, "sdmmc1_phy_clk", memdevice_phy_mux,
+	  ARRAY_SIZE(memdevice_phy_mux), 0, 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
+};
+
+static bool agilex72_gate_is_emac(const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gate_clks); i++) {
+		switch (gate_clks[i].id) {
+		case AGILEX72_EMAC0_CLK:
+		case AGILEX72_EMAC1_CLK:
+		case AGILEX72_EMAC2_CLK:
+			if (strcmp(name, gate_clks[i].name) == 0)
+				return true;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return false;
+}
+
+static u8 agilex72_parent_index(const struct clk_parent_data *parents,
+				size_t num_parents, const char *parent_name)
+{
+	for (size_t i = 0; i < num_parents; i++) {
+		const char *n = parents[i].name ? parents[i].name
+						: parents[i].fw_name;
+
+		if (n && strcmp(n, parent_name) == 0)
+			return (u8)i;
+	}
+
+	return 0;
+}
+
+static unsigned long agilex72_boot_clk_recalc_rate(struct clk_hw *hwclk,
+						   unsigned long parent_rate)
+{
+	/* boot_clk is a pass-through mux with no divider */
+	return parent_rate;
+}
+
+static unsigned long agilex72_clk_pll_recalc_rate(struct clk_hw *hwclk,
+						  unsigned long parent_rate)
+{
+	struct agilex72_pll *socfpgaclk =
+		container_of(hwclk, struct agilex72_pll, hw.hw);
+	unsigned long long vco_freq;
+	u32 reg, cr_n_hi, cr_n_lo, crhi_m, n_div, cr_fract_div_ratio;
+	bool bypass;
+
+	reg = readl(socfpgaclk->pll_base + PLL_RATE_REG_OFFSET);
+	bypass = (reg & PLL_CR_BYPASS_DIV_MASK);
+
+	cr_n_hi = reg & PLL_CR_N_HI_MASK;
+	cr_n_lo = (reg & PLL_CR_N_LO_MASK) >> PLL_CR_N_LO_SHIFT;
+	crhi_m  = (reg & PLL_CRHI_M_MASK)  >> PLL_CRHI_M_SHIFT;
+
+	reg = readl(socfpgaclk->pll_base + PLL_FRACT_DIV_REG_OFFSET);
+	cr_fract_div_ratio = reg & PLL_CR_FRACT_DIV_MASK;
+
+	/* 0 represents the value 256. */
+	if (!cr_n_hi)
+		cr_n_hi = 256;
+	if (!cr_n_lo)
+		cr_n_lo = 256;
+
+	n_div = bypass ? 1 : cr_n_lo + cr_n_hi;
+
+	/* bypass: vco = parent_rate * (crhi_m + cr_fract_div_ratio / 2^24) / 1
+	 * normal: vco = parent_rate * (crhi_m + cr_fract_div_ratio / 2^24) / n_div
+	 * Rearranged to avoid floating point:
+	 *   num = parent_rate * (crhi_m * 2^24 + cr_fract_div_ratio)
+	 *   vco = num / (n_div * 2^24)
+	 */
+	vco_freq  = (unsigned long long)parent_rate *
+		    (((unsigned long long)crhi_m << 24) + cr_fract_div_ratio);
+	vco_freq /= (unsigned long long)n_div << 24;
+	return (unsigned long)vco_freq;
+}
+
+static unsigned long agilex72_peri_c_clk_recalc_rate(struct clk_hw *hwclk,
+						     unsigned long parent_rate)
+{
+	struct agilex72_periph_clk *socfpgaclk =
+		container_of(hwclk, struct agilex72_periph_clk, hw.hw);
+	u32 reg, crhi_c, crlo_c, c_div;
+	bool bypass;
+
+	reg    = readl(socfpgaclk->div_reg);
+
+	/* The hi field is 9 bits: bits 7:0 are the counter, bit 8 is bypass */
+	bypass = (reg >> socfpgaclk->div_hi_shift) & PLL_CR_BYPASS_DIV_MASK;
+
+	crlo_c = (reg >> socfpgaclk->div_lo_shift) & PLL_CR_C_MASK;
+	crhi_c = (reg >> socfpgaclk->div_hi_shift) & PLL_CR_C_MASK;
+
+	/* 0 represents the value 256. */
+	if (!crhi_c)
+		crhi_c = 256;
+	if (!crlo_c)
+		crlo_c = 256;
+
+	c_div = bypass ? 1 : crhi_c + crlo_c;
+
+	return parent_rate / c_div;
+}
+
+static unsigned long
+agilex72_clk_peri_cnt_clk_recalc_rate(struct clk_hw *hwclk,
+				      unsigned long parent_rate)
+{
+	struct agilex72_periph_clk *socfpgaclk;
+	unsigned long div;
+
+	socfpgaclk = container_of(hwclk, struct agilex72_periph_clk, hw.hw);
+	div = readl(socfpgaclk->hw.reg);
+	div &= GENMASK(PERI_CLK_CNT_DIV_WIDTH - 1, 0);
+	div += 1;  /* actual divisor is field_value + 1 */
+
+	return parent_rate / div;
+}
+
+static unsigned long agilex72_gate_clk_recalc_rate(struct clk_hw *hwclk,
+						   unsigned long parent_rate)
+{
+	struct agilex72_gate_clk *socfpgaclk = container_of(hwclk,
+		struct agilex72_gate_clk, hw.hw);
+	u32 div = 1, val;
+
+	if (socfpgaclk->div_reg) {
+		val = readl(socfpgaclk->div_reg) >> socfpgaclk->div_shift;
+		val &= GENMASK(socfpgaclk->div_width - 1, 0);
+		if (socfpgaclk->div_linear)
+			div = val + 1;      /* linear encoding: field_value + 1 */
+		else
+			div = (1 << val);   /* log2 encoding: 2^field_value */
+	}
+	return parent_rate / div;
+}
+
+static u8 agilex72_boot_get_parent(struct clk_hw *hwclk)
+{
+	struct agilex72_pll *socfpgaclk = container_of(hwclk,
+		struct agilex72_pll, hw.hw);
+	u32 pll_src;
+	u8 parent;
+
+	pll_src = readl(socfpgaclk->hw.reg);
+	parent = (pll_src & BOOTCLKSRC_MASK) >> BOOTCLKSRC_SHIFT;
+	return parent;
+}
+
+static u8 agilex72_clk_pll_get_parent(struct clk_hw *hwclk)
+{
+	struct agilex72_pll *socfpgaclk =
+		container_of(hwclk, struct agilex72_pll, hw.hw);
+	u32 pll_src;
+	u8 parent;
+
+	pll_src = readl(socfpgaclk->hw.reg);
+	parent = (pll_src >> CLK_MGR_PLL_CLK_SRC_SHIFT) &
+		 CLK_MGR_PLL_CLK_SRC_MASK;
+	return parent;
+}
+
+static u8 agilex72_peri_c_clk_get_parent(struct clk_hw *hwclk)
+{
+	/* Peripheral C clocks (GPPLL output clocks) have a single fixed parent
+	 * (the GPPLL itself), so the parent index is always 0.
+	 */
+	return 0;
+}
+
+static u8 agilex72_clk_periclk_get_parent(struct clk_hw *hwclk)
+{
+	struct agilex72_periph_clk *socfpgaclk;
+	u32 clk_src;
+	u8 parent = 0;
+
+	socfpgaclk = container_of(hwclk, struct agilex72_periph_clk, hw.hw);
+
+	if (socfpgaclk->hw.reg) {
+		clk_src = readl(socfpgaclk->hw.reg);
+		parent = (clk_src >> CLK_MGR_FREE_SHIFT) & CLK_MGR_FREE_MASK;
+	}
+	return parent;
+}
+
+static u8 agilex72_gate_get_parent(struct clk_hw *hwclk)
+{
+	struct agilex72_gate_clk *socfpgaclk =
+		container_of(hwclk, struct agilex72_gate_clk, hw.hw);
+	void __iomem *bypass_reg = socfpgaclk->bypass_reg;
+	u32 mask, bypass_val, second_bypass;
+	u8 parent = 0;
+	const char *name = clk_hw_get_name(hwclk);
+
+	if (!bypass_reg)
+		return parent;
+
+	mask = (0x1 << socfpgaclk->bypass_shift);
+	bypass_val = readl(bypass_reg);
+	parent = ((bypass_val & mask) >> socfpgaclk->bypass_shift);
+
+	if (agilex72_gate_is_emac(name)) {
+		/*
+		 * EMAC clocks have a second bypass layer in a register
+		 * EMAC_BYPASS_OFFSET bytes below the main bypass register:
+		 *   bit 0: emaca path is bypassed to boot_clk (only when primary
+		 *          parent selects emaca, i.e. parent == 0)
+		 *   bit 1: emacb path is bypassed to boot_clk (only when primary
+		 *          parent selects emacb, i.e. parent == 1)
+		 */
+		u8 bootclk_bypass =
+			agilex72_parent_index(emac_mux, ARRAY_SIZE(emac_mux),
+					      "boot_clk");
+		/*
+		 * The second EMAC bypass register is always EMAC_BYPASS_OFFSET (0x10)
+		 * below the primary bypass register. For all EMAC clocks the primary
+		 * bypass_reg is regbase+0x100, so this gives regbase+0xf0 which is
+		 * within the mapped clkmgr window.
+		 */
+		second_bypass = readl(bypass_reg - EMAC_BYPASS_OFFSET);
+		if (second_bypass & 0x1)
+			if (parent == 0) /* only applicable if parent is emaca */
+				parent = bootclk_bypass;
+
+		if (second_bypass & 0x2)
+			if (parent == 1) /* only applicable if parent is emacb */
+				parent = bootclk_bypass;
+	}
+
+	return parent;
+}
+
+static const struct clk_ops clk_boot_ops = {
+	.recalc_rate = agilex72_boot_clk_recalc_rate,
+	.get_parent = agilex72_boot_get_parent,
+};
+
+static const struct clk_ops clk_gppll_ops = {
+	.recalc_rate = agilex72_clk_pll_recalc_rate,
+	.get_parent = agilex72_clk_pll_get_parent,
+};
+
+static const struct clk_ops peri_c_clk_ops = {
+	.recalc_rate = agilex72_peri_c_clk_recalc_rate,
+	.get_parent = agilex72_peri_c_clk_get_parent,
+};
+
+static const struct clk_ops peri_cnt_clk_ops = {
+	.recalc_rate = agilex72_clk_peri_cnt_clk_recalc_rate,
+	.get_parent = agilex72_clk_periclk_get_parent,
+};
+
+static const struct clk_ops gateclk_ops = {
+	.recalc_rate = agilex72_gate_clk_recalc_rate,
+	.get_parent  = agilex72_gate_get_parent,
+};
+
+static int agilex72_gate_clk_enable(struct clk_hw *hwclk)
+{
+	return clk_gate_ops.enable(hwclk);
+}
+
+static void agilex72_gate_clk_disable(struct clk_hw *hwclk)
+{
+	clk_gate_ops.disable(hwclk);
+}
+
+static const struct clk_ops gateclk_gate_ops = {
+	.enable      = agilex72_gate_clk_enable,
+	.disable     = agilex72_gate_clk_disable,
+	.recalc_rate = agilex72_gate_clk_recalc_rate,
+	.get_parent  = agilex72_gate_get_parent,
+};
+
+static struct clk_hw *
+agilex72_register_pll(struct device *dev,
+		      const struct agilex72_pll_clock *clks,
+		      void __iomem *base, void __iomem *pll_base)
+{
+	struct clk_hw *hw_clk;
+	struct agilex72_pll *pll_clk;
+	struct clk_init_data init = {};
+	const char *name = clks->name;
+	int ret;
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
+
+	if (strcmp(name, BOOT_CLK) == 0) {
+		init.ops = &clk_boot_ops;
+	} else {
+		pll_clk->pll_base = pll_base;
+		init.ops = &clk_gppll_ops;
+	}
+
+	pll_clk->hw.reg = base + clks->offset;
+
+	init.name = name;
+	init.flags = 0;
+	init.num_parents = clks->num_parents;
+	init.parent_data = clks->parent_data;
+	pll_clk->hw.hw.init = &init;
+	pll_clk->hw.bit_idx = SOCFPGA_PLL_POWER;
+	hw_clk = &pll_clk->hw.hw;
+
+	ret = devm_clk_hw_register(dev, hw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw_clk;
+}
+
+static struct clk_hw *
+agilex72_register_periph(struct device *dev,
+			 const struct agilex72_perip_c_clock *clks,
+			 void __iomem *pll_base)
+{
+	struct agilex72_periph_clk *periph_clk;
+	struct clk_init_data init = {};
+	const char *name = clks->name;
+	struct clk_hw *hw_clk;
+	int ret;
+
+	periph_clk = devm_kzalloc(dev, sizeof(*periph_clk), GFP_KERNEL);
+	if (!periph_clk)
+		return ERR_PTR(-ENOMEM);
+
+	periph_clk->hw.reg  = pll_base;
+	periph_clk->div_reg = periph_clk->hw.reg + clks->div_offset;
+	periph_clk->div_lo_shift = clks->div_lo_shift;
+	periph_clk->div_hi_shift = clks->div_hi_shift;
+
+	init.name = name;
+	init.ops = &peri_c_clk_ops;
+	init.flags = 0;
+
+	init.num_parents = clks->num_parents;
+	init.parent_data = clks->parent_data;
+
+	periph_clk->hw.hw.init = &init;
+	hw_clk = &periph_clk->hw.hw;
+
+	ret = devm_clk_hw_register(dev, hw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw_clk;
+}
+
+static struct clk_hw *
+agilex72_register_cnt_periph(struct device *dev,
+			     const struct agilex72_perip_cnt_clock *clks,
+			     void __iomem *regbase)
+{
+	struct clk_hw *hw_clk;
+	struct agilex72_periph_clk *periph_clk;
+	struct clk_init_data init = {};
+	const char *name = clks->name;
+	int ret;
+
+	periph_clk = devm_kzalloc(dev, sizeof(*periph_clk), GFP_KERNEL);
+	if (!periph_clk)
+		return ERR_PTR(-ENOMEM);
+
+	periph_clk->hw.reg = regbase + clks->offset;
+
+	init.name = name;
+	init.ops = &peri_cnt_clk_ops;
+	init.flags = 0;
+	init.num_parents = clks->num_parents;
+	init.parent_data = clks->parent_data;
+	periph_clk->hw.hw.init = &init;
+	hw_clk = &periph_clk->hw.hw;
+
+	ret = devm_clk_hw_register(dev, hw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw_clk;
+}
+
+static struct clk_hw *
+agilex72_register_gate(struct device *dev,
+		       const struct agilex72_gate_clock *clks,
+		       void __iomem *regbase)
+{
+	struct clk_hw *hw_clk;
+	struct agilex72_gate_clk *socfpga_clk;
+	struct clk_init_data init = {};
+	int ret;
+
+	socfpga_clk = devm_kzalloc(dev, sizeof(*socfpga_clk), GFP_KERNEL);
+	if (!socfpga_clk)
+		return ERR_PTR(-ENOMEM);
+
+	socfpga_clk->hw.reg = regbase + clks->gate_reg;
+	socfpga_clk->hw.bit_idx = clks->gate_idx;
+
+	socfpga_clk->div_linear = clks->div_linear;
+
+	if (clks->div_reg)
+		socfpga_clk->div_reg = regbase + clks->div_reg;
+	else
+		socfpga_clk->div_reg = NULL;
+
+	socfpga_clk->div_width = clks->div_width;
+	socfpga_clk->div_shift = clks->div_offset;
+
+	if (clks->bypass_reg)
+		socfpga_clk->bypass_reg = regbase + clks->bypass_reg;
+	else
+		socfpga_clk->bypass_reg = NULL;
+	socfpga_clk->bypass_shift = clks->bypass_shift;
+
+	if (clks->gate_reg)
+		init.ops = &gateclk_gate_ops;
+	else
+		/* Always-on clock, listed here only for its divider/bypass fields */
+		init.ops = &gateclk_ops;
+
+	init.name        = clks->name;
+	init.flags       = clks->flags;
+	init.num_parents = clks->num_parents;
+	init.parent_data = clks->parent_data;
+	socfpga_clk->hw.hw.init = &init;
+
+	hw_clk = &socfpga_clk->hw.hw;
+
+	ret = devm_clk_hw_register(dev, hw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+	return hw_clk;
+}
+
+static int
+agilex72_clk_register_cnt_perip(struct device *dev,
+				const struct agilex72_perip_cnt_clock *clks,
+				int nums, struct agilex72_clock_data *data)
+{
+	struct clk_hw *hw_clk;
+	void __iomem *base = data->base[0];
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
+			pr_err("%s: clock %s id %u out of range (max %u)\n",
+			       __func__, clks[i].name, clks[i].id,
+			       data->clk_data.num);
+			continue;
+		}
+		hw_clk = agilex72_register_cnt_periph(dev, &clks[i], base);
+		if (IS_ERR(hw_clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+			       clks[i].name);
+			continue;
+		}
+		data->clk_data.hws[clks[i].id] = hw_clk;
+	}
+
+	return 0;
+}
+
+static int agilex72_clk_register_gate(struct device *dev,
+				      const struct agilex72_gate_clock *clks,
+				      int nums, struct agilex72_clock_data *data)
+{
+	struct clk_hw *hw_clk;
+	void __iomem *base = data->base[0];
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
+			pr_err("%s: clock %s id %u out of range (max %u)\n",
+			       __func__, clks[i].name, clks[i].id,
+			       data->clk_data.num);
+			continue;
+		}
+		hw_clk = agilex72_register_gate(dev, &clks[i], base);
+		if (IS_ERR(hw_clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+			       clks[i].name);
+			continue;
+		}
+		data->clk_data.hws[clks[i].id] = hw_clk;
+	}
+
+	return 0;
+}
+
+/*
+ * Return the MMIO base address of the GPPLL whose DT resource name matches
+ * @name. The names "gppll0", "gppll1", "gppll2" are the resource names used
+ * in the device tree and map directly to base[1..3] as ioremapped in probe.
+ * Returns NULL for any clock that has no dedicated PLL register block
+ * (e.g. BOOT_CLK, which reuses the main clkmgr window via base[0]).
+ */
+static void __iomem *agilex72_pll_get_regbase(const char *name,
+					      void __iomem * const *base)
+{
+	if (!strcmp(name, "gppll0"))
+		return base[1]; /* gppll0 DT resource */
+	if (!strcmp(name, "gppll1"))
+		return base[2]; /* gppll1 DT resource */
+	if (!strcmp(name, "gppll2"))
+		return base[3]; /* gppll2 DT resource */
+	return NULL;
+}
+
+static int
+agilex72_clk_register_c_perip(struct device *dev,
+			      const struct agilex72_perip_c_clock *clks,
+			      int nums, struct agilex72_clock_data *data)
+{
+	struct clk_hw *hw_clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
+			pr_err("%s: clock %s id %u out of range (max %u)\n",
+			       __func__, clks[i].name, clks[i].id,
+			       data->clk_data.num);
+			continue;
+		}
+
+		/*
+		 * clks[i].parent_data[0].name holds the name of the parent GPPLL
+		 * (e.g. "gppll0"), which matches the DT resource name and
+		 * therefore the correct MMIO base.
+		 */
+		void __iomem *pll_base =
+			agilex72_pll_get_regbase(clks[i].parent_data[0].name, data->base);
+
+		if (!pll_base) {
+			pr_err("%s: no PLL base for clock %s (parent '%s')\n",
+			       __func__, clks[i].name, clks[i].parent_data[0].name);
+			continue;
+		}
+		hw_clk = agilex72_register_periph(dev, &clks[i], pll_base);
+		if (IS_ERR(hw_clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+			       clks[i].name);
+			continue;
+		}
+		data->clk_data.hws[clks[i].id] = hw_clk;
+	}
+	return 0;
+}
+
+static int agilex72_clk_register_pll(struct device *dev,
+				     const struct agilex72_pll_clock *clks,
+				     int nums, struct agilex72_clock_data *data)
+{
+	struct clk_hw *hw_clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		if (WARN_ON(clks[i].id >= data->clk_data.num)) {
+			pr_err("%s: clock %s id %u out of range (max %u)\n",
+			       __func__, clks[i].name, clks[i].id,
+			       data->clk_data.num);
+			continue;
+		}
+
+		/* clks[i].name matches the DT resource name for PLL clocks */
+		void __iomem *pll_base =
+			agilex72_pll_get_regbase(clks[i].name, data->base);
+
+		hw_clk = agilex72_register_pll(dev, &clks[i],
+					       data->base[0], pll_base);
+		if (IS_ERR(hw_clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+			       clks[i].name);
+			continue;
+		}
+		data->clk_data.hws[clks[i].id] = hw_clk;
+	}
+
+	return 0;
+}
+
+static int agilex72_clkmgr_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct agilex72_clock_data *clk_data;
+	void __iomem *base[4];
+	int i, num_clks;
+
+	base[0] = devm_platform_ioremap_resource_byname(pdev, "clkmgr");
+	if (IS_ERR(base[0]))
+		return PTR_ERR(base[0]);
+
+	base[1] = devm_platform_ioremap_resource_byname(pdev, "gppll0");
+	if (IS_ERR(base[1]))
+		return PTR_ERR(base[1]);
+
+	base[2] = devm_platform_ioremap_resource_byname(pdev, "gppll1");
+	if (IS_ERR(base[2]))
+		return PTR_ERR(base[2]);
+
+	base[3] = devm_platform_ioremap_resource_byname(pdev, "gppll2");
+	if (IS_ERR(base[3]))
+		return PTR_ERR(base[3]);
+
+	num_clks = AGILEX72_NUM_CLKS;
+
+	clk_data = devm_kzalloc(dev,
+				struct_size(clk_data, clk_data.hws, num_clks),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->base[0] = base[0];
+	clk_data->base[1] = base[1];
+	clk_data->base[2] = base[2];
+	clk_data->base[3] = base[3];
+	clk_data->clk_data.num = num_clks;
+
+	for (i = 0; i < num_clks; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	/*
+	 * Registration order matters: each layer depends on the previous.
+	 *   1. PLLs
+	 *   2. C-peripheral clocks (GPPLL output clocks)
+	 *   3. Cnt-peripheral clocks
+	 *   4. Gate clocks
+	 */
+	agilex72_clk_register_pll(dev, pll_clks, ARRAY_SIZE(pll_clks),
+				  clk_data);
+
+	agilex72_clk_register_c_perip(dev, main_perip_c_clks,
+				      ARRAY_SIZE(main_perip_c_clks),
+				      clk_data);
+
+	agilex72_clk_register_cnt_perip(dev, main_perip_cnt_clks,
+					ARRAY_SIZE(main_perip_cnt_clks),
+					clk_data);
+
+	agilex72_clk_register_gate(dev, gate_clks,
+				   ARRAY_SIZE(gate_clks), clk_data);
+
+	/*
+	 * usb31_ref_clk is a 1:1 alias of usb31_suspend_clk. The DWC3
+	 * controller uses the same source for both its suspend and reference
+	 * clock inputs on this SoC. Register it as a fixed-factor (passthrough)
+	 * clock so that enabling it propagates to the parent gate without
+	 * touching any gate register of its own.
+	 */
+	clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK] =
+		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
+						  "usb31_suspend_clk", 0, 1, 1);
+	if (IS_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]))
+		return dev_err_probe(dev,
+			PTR_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]),
+			"failed to register clock usb31_ref_clk\n");
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   &clk_data->clk_data);
+}
+
+static int agilex72_clkmgr_probe(struct platform_device *pdev)
+{
+	int (*probe_func)(struct platform_device *init_func);
+
+	probe_func = of_device_get_match_data(&pdev->dev);
+	if (!probe_func)
+		return -ENODEV;
+	return probe_func(pdev);
+}
+
+static const struct of_device_id agilex72_clkmgr_match_table[] = {
+	{ .compatible = "altr,agilex72-clkmgr",
+	  .data = agilex72_clkmgr_init },
+	{}
+};
+
+static struct platform_driver agilex72_clkmgr_driver = {
+	.probe		= agilex72_clkmgr_probe,
+	.driver		= {
+		.name	= "agilex72-clkmgr",
+		.suppress_bind_attrs = true,
+		.of_match_table = agilex72_clkmgr_match_table,
+	},
+};
+
+static int __init agilex72_clk_init(void)
+{
+	return platform_driver_register(&agilex72_clkmgr_driver);
+}
+core_initcall(agilex72_clk_init);
-- 
2.43.7

