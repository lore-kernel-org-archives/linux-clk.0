Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307357;
	b=qVdspYB9frfrHvZ256jwLUR5KSHnOUE2ITyXjYkhSw8LMhnFljNtMOBCCBRxDsu95nGV
	 QLN1rxoZYv7+LgyVb7ps/K8rLMVK4OotVAD0sSH+zzlDEitLUwIRTxEX56TF4UaPu6HLO
	 NcVlnd4XtASxLpbom+IIAR9lvp60rchlOcyND4qel9Ca4x+Rn/CwtkAR+EZJzU0ZxgdMT
	 IB+qX/1psPbsVUACvr6PheJxa53/h6Z9z9pM4FAb0mK002eGLaya/W42UYs9gIcjVr7a6
	 6PMfV9ld2cDnbuiYLTB/xJ3b8Ozmcg4MIk3YWiRVXpKV2FEXyd8w9YhR7AGMKo8ZkGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307357;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
	b=wXbCp6fq7VAo2cpy1HSGavCmSVJs0AF713GWw0Hxis6H5hC8M2iE+4+2tjTRro8Hno/n
	 qcWCupt52NaVLMTkHREh3KwiixgpfgetQR5XaDTtF0JjtQSWrphSxW1y2g06Gi/nDoW1X
	 z64WXM4nxru/YIA09hJ3t2zPYHY6q6zg4BrBbK8swR/H6FNgO0Qwgfp4NJOFmqlbLYV0N
	 zwI5OELnkrdbaRiyrPDmYhpnmRV2DoWD7j2EMsaIXYNrGI3UX+Sj2NC4uGDqu1E/X61/r
	 E5zi6J1odAHy1md3KTKvf2UGeapq+/crin+q76sToVk7/iSPA6Fk66RnNO2912rksdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cessqdGU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.68
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D260A3803;
	Tue, 10 Nov 2026 10:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3D260A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cessqdGU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDE29mnm6N30MVYP5RXulvpunD5U/D2y3RztyL8Sy0q146kT1V5oKHANZMRla5FvBwtdQgI63gB52AX0UDGScamBxBJyYcREW+uW43/QVyJIY+GiPWJNkRW07QL948XoFWKZvLIFKZywms5oCB1m6ni43bBAOFnB5/7s3TdyEx283F/ULJJMxoCE4EFSc7imEe7NVZM28j0AWZjbbctNP2TGhLjC5Qgg5ysNqEDGqCArPLjUiqktrF3soVJmbLluZt8FwkAvxS15ddcgXgPT6GqvJHkENLsmkih/XhcdeU5JgboQCiVd5KIi1oNktZ+vVgZlWErvmljdcqv1tyCMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
 b=HAmDuLmeC90zmoYsFWMkTdYdY23akLMDoSIq3+QWmrVKdCk/XEuzgu/zNT5mSQZQ9rkABQWlFhqZi+CEy5lvNriQlsdTBXpxOTMzKEA+6LL36u0Etb77yE//rjV3N2eZJHRunmWTO3UXNRzjN9MIUcu3G7/UpGA7VmCDnyGBSmXzKKyZLUHhuU847LQT5+EjmPA6v/bkyVab/eZ4TPxbfsYTGulbu1dCanWg0xPlFKGLUErFdVQ9FhoWFB6nCb1HCL8d08q6GxwxpLghQYad5H25a1z0/HrUgjQ4ZrBql+Xf5FCXosjkqj1sFh7K9aM/4YVRYbTFKYIr0TNnWA4j7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfmEDI2aB8q+5oH8lglRkxHWssrtlRbOz4Ue1JsdrRw=;
 b=cessqdGU8/xHqdtLbOxwfWUSgqfVGEy9ADXiFs9g+tmyEKTteyQZ/IujjIuUXFjBP+BnoQpsKt342INr+Gimuk37bFDEWkE7uyaJWxMZC6AWr4wtgBNDbgmwEhvG0nTbbsu+zPnOMkw3jmgW0D387HoJ9vBo7PIWzEB31E9kxqhzjpL5pVZ9UvWwk84Cu+3/Ah3u8jt6LmO7PBHgqcR3KLNZg6+5vTrtFSc5sOTEWM6pEYiF4TWvmQ30uTZvDs5SdHw5LuZcoaW4qlDtKe0g/3HmHJcIRge5QlD1FOEX6IbTo0kBW3eW4q3aFVT91xxuGEsMFuXP+1YYVIJrjH2rPw==
Received: from DU7P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::28)
 by AS8PR10MB6530.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:567::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Tue, 10 Nov
 2026 10:42:28 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::77) by DU7P250CA0010.outlook.office365.com
 (2603:10a6:10:54f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 10:42:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:03 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:22 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 11:42:18 +0100
Subject: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307340; l=7137;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=dv40+MDWCuL2eVVnwhdIenGwlzLv8ZtCsARwXSkjPSM=;
 b=Lz9hWW0UHYtdiaFcgUJo89kSkAA1B87oz9GGDwp2/hV784iABQy3Llqb2wxKnujhrnLsBgNDP
 zf9qALG9MmYA2k3t2L9C/kZWggP2u38epSg+siVMbxJQUQO2lxczA2L
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AS8PR10MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: b7889250-4282-460c-122e-08df3f1750ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|18002099003|22082099003|11063799006|56012099006|3023799007|261009221227099003|261009223027099003|261102123227099003|261028144727099003|261022105027099003|261021135927099003|261022075727099003|261021121427099003|261026140227099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	08D5lh58/vBwwGf2gVg8rKDt0ZuJKA6RnA0CxgZM1fObFDJT8fXCfs2z6Q0hmKVQgxdNs/Vsh/LNxL9xE5H7DbsuHT6M3VqVYK04lFP95pKcgx/0chPqEEGRSyO6AC/HJOKUAIOK1iJbrXofP/MXeVEsWJbwnvEzwNYXkZwrqKwy7ulP4hMDCOQDLwRTYRf1AzaWMDBLtmVVjuDXKnvxwRfyRbGUl6Sc/3mAqJkb/EkIJJFvs/ajcILdm8nsEokO5ugoxfiTXZFchADhnF5TPVvx81GJtF98ctUlUME4X+t+F+OC4sUvxDEAXAx51Jl6x0fi+g1aKuLw0dLnZC2ZX8Ad8toBxEsGKCSaOu61IbDubL3BvlDr8PiMzUR3spTrgfTJ+iNyqSDNhsSEzzN3HrPLiAS536PvIG9MfmP5TdtkhPAOo2Wxy5lXsP7Lsu7biBCiVf5lJNKMHWqkP5/bgOrP+Jpu9I3ADovPbT+xjLOlOVU7K2nN4I8T6UJAPcYJK7xJsXgMCGzfPUV7zYejfreSnOmdmQ6yJW+RuCuermIASMiLHu7qH9/k7HG3BVJOIuUb5ASEG0GHo159CEpw5LCpHs4Xr/tpTXEfmuiMVlrLgBXyxhyzRcde2HkkBLVCqBbNygcci9C5OLDO2SS9FMhbu/5iqzsAvKSrUlE6gmVZ83GtVGMJLcZaKASr+vRifU+cbzqS/e7XJ2eUmcBmww==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(261009221227099003)(261009223027099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021135927099003)(261022075727099003)(261021121427099003)(261026140227099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XVKUen0QjDS+aI9p70r8fa7oO+PzuT2sCPG2VguotdFlDX3Q0qc2ELobnG4/uoDmMZLM3W2WSpdIbSV3DG/GhIKh9PduYuINE9PcffwHjbr2vASC6RZz/kfBnPJwENoKBYw5XWycBBgcD6M51GKkvIBr3uxDieuYOLCZPH0caS/63IDg81u3vm00Qo3wln4ok40VF+q2ek3K/QjYQbA5Yand4zSHj1pSaccA7qY9iPBQI1rJ5J6iyxfkYuuZDVSA6mv7HzHBoFttuQiGnz/5VGLn/jZGK3vi81CEbnyWG8yrhU42nD82P7/8wFrAFyDENx3bKf8h02idwgHLIWz5O5QjYQpDEcfwjtWpStLNwv0tmfP2Xgr3MtVkkr1Cc9QzEkdF88hmqknKyZZ3qi2F8k17FcgwYAkhkhAmKm7d1fy5j5nZmc9be2e4lNzqH0kx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:28.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7889250-4282-460c-122e-08df3f1750ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6530

On STM32MP23x and STM32MP25x, the LTDC pixel clock is selected in the
SYSCFG DISPLAYCLKCR register among the DSI PHY byte lane clock, the LVDS
PHY pixel clock (reset value) and the LTDC kernel clock, the latter
being the one needed by the RGB (DPI) output.

No driver registers this clock, so the selection can't be changed from
its reset value and a display connected to the LTDC RGB output can't
work.

Add a driver registering this clock as a mux. The SYSCFG node is bound
to the STM32MP2 SYSCFG driver, which populates its sub-nodes, so the
driver is probed from the "st,stm32mp25-syscfg-clk" clock-controller
sub-node and uses the regmap of the parent SYSCFG node. The mux parents
are taken from the "clocks" property of the sub-node, and the clock is
exposed through a onecell provider so that the other SYSCFG clocks can
be added later.

Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Kconfig                |  11 +++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 134 +++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..a298983f5511 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,16 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	select MFD_SYSCON
+	default COMMON_CLK_STM32MP257
+	help
+	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
+	  the LTDC pixel clock source selection between the LTDC kernel
+	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
+	  lane clock.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index e04727b59449..8088d172651f 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
new file mode 100644
index 000000000000..69b9a7592838
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+#define STM32MP25_SYSCFG_NUM_CLKS	(CK_SYSCFG_PIX_LTDC + 1)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ *
+ * The parents are listed in the DPIVSLVDS field order, while .index refers
+ * to the "clocks" property of the node, ordered "ltdc", "lvds", "dsi" so
+ * that the inputs missing on a SoC can be omitted at the end of the list.
+ */
+static const struct clk_parent_data clk_pix_ltdc_parents[] = {
+	{ .index = 2 },	/* dsi */
+	{ .index = 1 },	/* lvds */
+	{ .index = 0 },	/* ltdc */
+};
+
+struct stm32mp25_syscfg_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
+{
+	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
+}
+
+static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+	unsigned int val;
+
+	regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+
+	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
+}
+
+static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+
+	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
+				  DISPLAYCLKCR_DPIVSLVDS,
+				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
+}
+
+static const struct clk_ops stm32mp25_syscfg_mux_ops = {
+	.get_parent = stm32mp25_syscfg_mux_get_parent,
+	.set_parent = stm32mp25_syscfg_mux_set_parent,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+};
+
+static int stm32mp25_syscfg_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_init_data init = { };
+	struct stm32mp25_syscfg_mux *mux;
+	int ret;
+
+	clk_data = devm_kzalloc_flex(dev, *clk_data, hws,
+				     STM32MP25_SYSCFG_NUM_CLKS);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = STM32MP25_SYSCFG_NUM_CLKS;
+
+	mux = devm_kzalloc_obj(dev, *mux);
+	if (!mux)
+		return -ENOMEM;
+
+	/* The mux is a sub-node of the SYSCFG, whose regmap it shares */
+	mux->regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_data = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	clk_data->hws[CK_SYSCFG_PIX_LTDC] = &mux->hw;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id stm32mp25_syscfg_clk_of_match[] = {
+	{ .compatible = "st,stm32mp25-syscfg-clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp25_syscfg_clk_of_match);
+
+static struct platform_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.driver = {
+		.name = "stm32mp25-syscfg-clk",
+		.of_match_table = stm32mp25_syscfg_clk_of_match,
+	},
+};
+module_platform_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

