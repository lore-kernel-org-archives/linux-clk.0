Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023118.outbound.protection.outlook.com [40.107.44.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADA1624C0;
	Mon, 22 Jun 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095135; cv=fail; b=g5D7b8oS74WkJW0jyDXAKtBxNhsupP7BKs9BUVZsFdNewQ6jBh5YGJWAyBU6F/y++RY0cPvjK6v7xYL6WOqHVXFep0kCbnqfbQG1rJ6P/ofWRwvbvOLGkDi4PfRCkKDjCAeQrDhMfAZYF0e0zh7jIkX7xUbaCynovN9cFa2IQ+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095135; c=relaxed/simple;
	bh=QQuP1YrsgkyGLF86C04FkX+67mGz8msYkaFxSwovV0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeEzgFxy+VKFijAx2VWvpYS2G0Q2I7qcNOWGjkdIysaNu37j9H8AoWvlP6I4W0+WcRYpPW+yyDQLF8hPQB9aYlRcLG1YpkqFiJ1m5+7jMVAnu1r4KAL7fOf8RoC3XhPFQRs/u3iuNP+9HZjOLIFVfJfocCDi4mWFyJnatETdkp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrqrAP88jzZrTUQfQ0KyMX2SMBjl6pm15EBEJZ6Ht9dkPlx3QkmrUUD4ZWSSAncvRk2+f7RPStE6uOuHOoDxXtNUCQFSIpzjYQglHzelgiL1eD0dgtkDEfDDVAwLuuoxbujJ+gaZjfKyO3jK4sppAGk3iGsavaU3nERWwJgaisOAZcXVJ4vTAuXjL1AzcT3wgGOqOVFdvX8Uj7IgGy79CUTezFVC6PuDIoG8ghFH6ymwcKQ05UdweH0xIOgSyp7TKCYE/Dg0gV1Hy+DeOu9HklHVP4271weks2JD05aOhxyB/DV7UTumotTB0PGRfRQk9rGdnhAV76sx50jx+4KrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZQeZ5sUbRle7nT5EoX4IpUrWI/QinTy87pHArlh2Z0=;
 b=V0fK9DCczIz0riiIMmgNOpG7Ni1Z1sIFiYb7ArxqBJor0er9WZuZhkC/Q9U1JZdaOxlpnHcFU+T0o63dWgGjarm+ElEALEeN38YWgpYMaUK+5CddioI/lgeK6skIwSx5WSkQc94PVmxlP3/kdzgOY4K/mUOcRo0ZR6rnxhv6aQ9RH8elT7j3gHz9Dvx2iHbsGc1wTXE7NpU9DTnkftgzeqfPBIJLekK2BWRYewcoRfLtvYP6EscusMSwNFs9zgVBwU3IyKw9LgniOuc+O62rwuhBmtzChCb7OvZiGavxGKQ3pVsi9gU/AW86B15IpLdZ+D9/obK1zA0IJmKJeTLgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTPR01CA0073.jpnprd01.prod.outlook.com (2603:1096:604:21a::9)
 by TYSPR06MB6471.apcprd06.prod.outlook.com (2603:1096:400:480::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 02:25:28 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:604:21a:cafe::85) by OSTPR01CA0073.outlook.office365.com
 (2603:1096:604:21a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 02:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 02:25:27 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8031D40E7F96;
	Mon, 22 Jun 2026 10:25:26 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 2/4] clk: cix: add sky1 audss clock controller
Date: Mon, 22 Jun 2026 10:25:18 +0800
Message-ID: <20260622022520.3127103-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYSPR06MB6471:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 65037f2d-3b98-4e9d-3833-08ded0058666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|376014|82310400026|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x9+0uwLvNLiScArowjBt4nVnkzAqwiiud1M+kvuqjT1svCPzWmjt/Ay5awGSYIB6/BZrpK+bmQMjOaEPrSRdiX2D6bW0d1i0Idh7m4wEjyh22tCzZnNkU8SVJeMdDJl2XyK8XTn8ett1oTm25T/JXX9jIx+pFlX6d8oiXocMozrj3PnxhxcH3VmWzf/bxgBu8mUDPhkCZn2Ifw+yGTPXxEjmUg/iVjZ3kBWoPqvQD+rGzLsY7r1oifiKAjeb0f72MVztub9yLYLjW+fD8ge3BFpTUE0Ir3XCT1cRIuq0retoz2ItTNfl/23axhmPkcOqwsbgnX6vB5h5FpCvWptyuD4QNQrA3JtrITelxI1oOoCg/FKrmGMJAQqwmyz0df/tpfk5zZBHM6ahpf0hD/dnEkufJCYR5UoKn8ZuSRccpUMZzRmTRD38cLZu8I+NpR7V6g9roNWoXji4Tro6HvcgU8suwdtGeQPtuTNTIvBJgKvoXQtSw0WcRtRKoLmVwpEqZDSC+R266eS7o/sHqzJtapl2F/pD9S2Tmo2Bt5oGHZtDILPNDLj+kbQLY3h9hJ6T4LcSZeU+cvBFvw6SjF+3d0elt97sV0yP3gu7g+QRagctE1RvYbF481Iv3i2E+jDXCpQ53e6Zl52LrCZpoc12VJW39XtnaPYDcN7OdQvaZB31IQ977Y5HCIksCh8t1pZQi/KSrwBfPiqwjiP9iMZxhw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	arBdTvMr1oLuND/LWNYxDwqZprKt3Gc4SiDzJo3s/w3G2vsyysIMvJxZL282NtNUE605707XWcw6+tNxt8rGDK6Sq1exsAFmuAujFVAcxJ4Yg33JT6wSc/wWHv4GwxCYXWg73trWpoXc1gIRxhbZ2qQoS6y+vlgOoW5avcMrhJ9Vfn84vdCHmkyVfz2cHfKoyqm1/iBqKqSCq9AK917wX0LFOpvrdalvZy//wEL2R4skY9qXtJrUH8x/7J1Pv6ivg1HQJuaB5dHwTx4FUM7jO9Fo0JHBtaI/Zq3qw5ByB2eJhHTJMQUTNwkofYhG1Z+2qFOIbV+eMRkBfhv8jzcUz8zZTvopquxnaztZOajvzc8plHJ7NxlGcaAGmSR5Uiv4addCenqhEGdUUpFjocXaKhI9e0QI0DEMCS7Oxlbi6oISDIlbTQ0izP+zadC8sgCY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:27.8600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65037f2d-3b98-4e9d-3833-08ded0058666
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6471

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
the CRU registers and registers mux, divider and gate clocks for
DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.

Four SoC-level audio reference clocks are enabled as inputs to the
internal clock tree. The driver releases the AUDSS NOC reset, enables
runtime PM and instantiates the auxiliary reset device.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/clk/Kconfig              |    1 +
 drivers/clk/Makefile             |    1 +
 drivers/clk/cix/Kconfig          |   16 +
 drivers/clk/cix/Makefile         |    3 +
 drivers/clk/cix/clk-sky1-audss.c | 1201 ++++++++++++++++++++++++++++++
 5 files changed, 1222 insertions(+)
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..cfcaab39068a 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -509,6 +509,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/cix/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..87c992f0df54 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
+obj-y					+= cix/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
new file mode 100644
index 000000000000..c92a9a873893
--- /dev/null
+++ b/drivers/clk/cix/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+# Audio subsystem clock support for Cixtech SoC family
+menu "Clock support for Cixtech audss"
+
+config CLK_SKY1_AUDSS
+	tristate "Cixtech Sky1 Audio Subsystem Clock Driver"
+	depends on ARCH_CIX || COMPILE_TEST
+	select AUXILIARY_BUS
+	select REGMAP_MMIO
+	select RESET_CONTROLLER
+	help
+	  Support for the Audio Subsystem clock controller present on
+	  Cixtech Sky1 SoC. This driver provides mux, divider and gate
+	  clocks for DSP, I2S, HDA and related blocks in the audio
+	  subsystem. Say M or Y here if you want to build this driver.
+endmenu
diff --git a/drivers/clk/cix/Makefile b/drivers/clk/cix/Makefile
new file mode 100644
index 000000000000..bc612f1d08b2
--- /dev/null
+++ b/drivers/clk/cix/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_CLK_SKY1_AUDSS) += clk-sky1-audss.o
diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
new file mode 100644
index 000000000000..8a4ab2d9419c
--- /dev/null
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -0,0 +1,1201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2026 Cix Technology Group Co., Ltd.
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/clock/cix,sky1-audss-clock.h>
+
+#define INFO_HIFI0				0x00
+#define INFO_CLK_GATE				0x10
+#define INFO_CLK_DIV				0x14
+#define INFO_CLK_MUX				0x18
+#define INFO_MCLK				0x70
+
+#define SKY1_AUDSS_CLK_PARENTS_CNT		4
+#define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
+
+static u32 sky1_reg_save[][2] = {
+	{ INFO_HIFI0,  0 },
+	{ INFO_CLK_GATE,  0 },
+	{ INFO_CLK_DIV, 0 },
+	{ INFO_CLK_MUX, 0 },
+	{ INFO_MCLK, 0 },
+};
+
+static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
+	"x8k", "x11k", "sys", "48m",
+};
+
+static const u32 sky1_clk_rate_default[SKY1_AUDSS_CLK_PARENTS_CNT] = {
+	294912000,
+	270950400,
+	800000000,
+	48000000,
+};
+
+static const char * const dsp_clk_parent[] = {
+	"audio_clk4"
+};
+
+static const char * const dsp_bclk_parent[] = {
+	"audio_clk4_div2"
+};
+
+static const char * const dsp_pbclk_parent[] = {
+	"audio_clk4_div4"
+};
+
+static const char * const sram_axi_parent[] = {
+	"audio_clk4_div2"
+};
+
+static const char * const hda_sys_parent[] = {
+	"audio_clk4_div2"
+};
+
+static const char * const hda_hda_parent[] = {
+	"audio_clk5"
+};
+
+static const char * const dmac_axi_parent[] = {
+	"audio_clk4_div2"
+};
+
+static const char * const wdg_apb_parent[] = {
+	"audio_clk5_div2"
+};
+
+static const char * const wdg_wdg_parent[] = {
+	"audio_clk5_div2"
+};
+
+static const char * const timer_apb_parent[] = {
+	"audio_clk4_div4"
+};
+
+static const char * const timer_timer_parent[] = {
+	"audio_clk5_div2"
+};
+
+static const char * const mailbox_apb_parent[] = {
+	"audio_clk4_div4"
+};
+
+static const char * const i2s_apb_parent[] = {
+	"audio_clk4_div4"
+};
+
+static const char * const i2s0_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s1_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s2_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s3_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s4_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s5_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s6_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s7_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s8_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const i2s9_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const char * const mclk_parents[] = {
+	"audio_clk0", "audio_clk2"
+};
+
+static const u32 i2s3_mux_table[] = { 0, 2 };
+static const u32 i2s4_mux_table[] = { 0, 2 };
+
+/*
+ * audss composite clock definition
+ */
+struct muxdiv_cfg {
+	int offset;
+	u8 shift;
+	u8 width;
+	u8 flags;
+};
+
+struct gate_cfg {
+	int offset;
+	u8 shift;
+	u8 flags;
+};
+
+struct composite_clk_cfg {
+	u32 id;
+	const char * const name;
+	const char * const *parent_names;
+	int num_parents;
+	const u32 *mux_table;
+	struct muxdiv_cfg *mux_cfg;
+	struct muxdiv_cfg *div_cfg;
+	struct gate_cfg *gate_cfg;
+	unsigned long flags;
+};
+
+#define CFG(_id,\
+	    _name,\
+	    _parent_names,\
+	    _mux_table,\
+	    _mux_offset, _mux_shift, _mux_width, _mux_flags,\
+	    _div_offset, _div_shift, _div_width, _div_flags,\
+	    _gate_offset, _gate_shift, _gate_flags,\
+	    _flags)\
+{\
+	.id = _id,\
+	.name = _name,\
+	.parent_names = _parent_names,\
+	.num_parents = ARRAY_SIZE(_parent_names),\
+	.mux_table = _mux_table,\
+	.mux_cfg = &(struct muxdiv_cfg) { _mux_offset, _mux_shift, _mux_width, _mux_flags },\
+	.div_cfg = &(struct muxdiv_cfg) { _div_offset, _div_shift, _div_width, _div_flags },\
+	.gate_cfg = &(struct gate_cfg) { _gate_offset, _gate_shift, _gate_flags },\
+	.flags = _flags,\
+}
+
+static const struct composite_clk_cfg sky1_audss_clks[] = {
+	/* dsp */
+	CFG(CLK_DSP_CLK,
+	    "audss_dsp_clk",
+	    dsp_clk_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_HIFI0, 0, 0,
+	    0),
+	CFG(CLK_DSP_BCLK,
+	    "audss_dsp_bclk",
+	    dsp_bclk_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    -1, 0, 0,
+	    0),
+	CFG(CLK_DSP_PBCLK,
+	    "audss_dsp_pbclk",
+	    dsp_pbclk_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    -1, 0, 0,
+	    0),
+	/* sram */
+	CFG(CLK_SRAM_AXI,
+	    "audss_sram_axi",
+	    sram_axi_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 16, 0,
+	    0),
+	/* hda */
+	CFG(CLK_HDA_SYS,
+	    "audss_hda_sys",
+	    hda_sys_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 14, 0,
+	    0),
+	CFG(CLK_HDA_HDA,
+	    "audss_hda_hda",
+	    hda_hda_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 14, 0,
+	    0),
+	/* dmac */
+	CFG(CLK_DMAC_AXI,
+	    "audss_dmac_axi",
+	    dmac_axi_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 15, 0,
+	    0),
+	/* wdg */
+	CFG(CLK_WDG_APB,
+	    "audss_wdg_apb",
+	    wdg_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 10, 0,
+	    0),
+	CFG(CLK_WDG_WDG,
+	    "audss_wdg_wdg",
+	    wdg_wdg_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 10, 0,
+	    0),
+	/* timer */
+	CFG(CLK_TIMER_APB,
+	    "audss_timer_apb",
+	    timer_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 11, 0,
+	    0),
+	CFG(CLK_TIMER_TIMER,
+	    "audss_timer_timer",
+	    timer_timer_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 11, 0,
+	    0),
+	/* mailbox: mb0(ap->dsp), mb1(dsp->ap) */
+	CFG(CLK_MB_0_APB,
+	    "audss_mb_0_apb",
+	    mailbox_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 12, 0,
+	    0),
+	CFG(CLK_MB_1_APB,
+	    "audss_mb_1_apb",
+	    mailbox_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    -1, 0, 0, 0,
+	    INFO_CLK_GATE, 13, 0,
+	    0),
+	/* i2s */
+	CFG(CLK_I2S0_APB,
+	    "audss_i2s0_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 0, 0,
+	    0),
+	CFG(CLK_I2S1_APB,
+	    "audss_i2s1_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 1, 0,
+	    0),
+	CFG(CLK_I2S2_APB,
+	    "audss_i2s2_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 2, 0,
+	    0),
+	CFG(CLK_I2S3_APB,
+	    "audss_i2s3_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 3, 0,
+	    0),
+	CFG(CLK_I2S4_APB,
+	    "audss_i2s4_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 4, 0,
+	    0),
+	CFG(CLK_I2S5_APB,
+	    "audss_i2s5_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 5, 0,
+	    0),
+	CFG(CLK_I2S6_APB,
+	    "audss_i2s6_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 6, 0,
+	    0),
+	CFG(CLK_I2S7_APB,
+	    "audss_i2s7_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 7, 0,
+	    0),
+	CFG(CLK_I2S8_APB,
+	    "audss_i2s8_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 8, 0,
+	    0),
+	CFG(CLK_I2S9_APB,
+	    "audss_i2s9_apb",
+	    i2s_apb_parent,
+	    NULL,
+	    -1, 0, 0, 0,
+	    INFO_CLK_DIV, 0, 2, 0,
+	    INFO_CLK_GATE, 9, 0,
+	    0),
+	CFG(CLK_I2S0,
+	    "audss_i2s0",
+	    i2s0_parents,
+	    NULL,
+	    INFO_CLK_MUX, 0, 2, 0,
+	    INFO_CLK_DIV, 2, 2, 0,
+	    INFO_CLK_GATE, 0, 0,
+	    0),
+	CFG(CLK_I2S1,
+	    "audss_i2s1",
+	    i2s1_parents,
+	    NULL,
+	    INFO_CLK_MUX, 2, 2, 0,
+	    INFO_CLK_DIV, 4, 2, 0,
+	    INFO_CLK_GATE, 1, 0,
+	    0),
+	CFG(CLK_I2S2,
+	    "audss_i2s2",
+	    i2s2_parents,
+	    NULL,
+	    INFO_CLK_MUX, 4, 2, 0,
+	    INFO_CLK_DIV, 6, 2, 0,
+	    INFO_CLK_GATE, 2, 0,
+	    0),
+	CFG(CLK_I2S3,
+	    "audss_i2s3",
+	    i2s3_parents,
+	    i2s3_mux_table,
+	    INFO_CLK_MUX, 6, 2, 0,
+	    INFO_CLK_DIV, 8, 2, 0,
+	    INFO_CLK_GATE, 3, 0,
+	    0),
+	CFG(CLK_I2S4,
+	    "audss_i2s4",
+	    i2s4_parents,
+	    i2s4_mux_table,
+	    INFO_CLK_MUX, 8, 2, 0,
+	    INFO_CLK_DIV, 10, 2, 0,
+	    INFO_CLK_GATE, 4, 0,
+	    0),
+	CFG(CLK_I2S5,
+	    "audss_i2s5",
+	    i2s5_parents,
+	    NULL,
+	    INFO_CLK_MUX, 10, 2, 0,
+	    INFO_CLK_DIV, 12, 2, 0,
+	    INFO_CLK_GATE, 5, 0,
+	    0),
+	CFG(CLK_I2S6,
+	    "audss_i2s6",
+	    i2s6_parents,
+	    NULL,
+	    INFO_CLK_MUX, 12, 2, 0,
+	    INFO_CLK_DIV, 14, 2, 0,
+	    INFO_CLK_GATE, 6, 0,
+	    0),
+	CFG(CLK_I2S7,
+	    "audss_i2s7",
+	    i2s7_parents,
+	    NULL,
+	    INFO_CLK_MUX, 14, 2, 0,
+	    INFO_CLK_DIV, 16, 2, 0,
+	    INFO_CLK_GATE, 7, 0,
+	    0),
+	CFG(CLK_I2S8,
+	    "audss_i2s8",
+	    i2s8_parents,
+	    NULL,
+	    INFO_CLK_MUX, 16, 2, 0,
+	    INFO_CLK_DIV, 18, 2, 0,
+	    INFO_CLK_GATE, 8, 0,
+	    0),
+	CFG(CLK_I2S9,
+	    "audss_i2s9",
+	    i2s9_parents,
+	    NULL,
+	    INFO_CLK_MUX, 18, 2, 0,
+	    INFO_CLK_DIV, 20, 2, 0,
+	    INFO_CLK_GATE, 9, 0,
+	    0),
+	/* mclk */
+	CFG(CLK_MCLK0,
+	    "audss_mclk0",
+	    mclk_parents,
+	    NULL,
+	    INFO_MCLK, 5, 1, 0,
+	    -1, 0, 0, 0,
+	    INFO_MCLK, 0, 0,
+	    0),
+	CFG(CLK_MCLK1,
+	    "audss_mclk1",
+	    mclk_parents,
+	    NULL,
+	    INFO_MCLK, 6, 1, 0,
+	    -1, 0, 0, 0,
+	    INFO_MCLK, 1, 0,
+	    0),
+	CFG(CLK_MCLK2,
+	    "audss_mclk2",
+	    mclk_parents,
+	    NULL,
+	    INFO_MCLK, 7, 1, 0,
+	    -1, 0, 0, 0,
+	    INFO_MCLK, 2, 0,
+	    0),
+	CFG(CLK_MCLK3,
+	    "audss_mclk3",
+	    mclk_parents,
+	    NULL,
+	    INFO_MCLK, 8, 1, 0,
+	    -1, 0, 0, 0,
+	    INFO_MCLK, 3, 0,
+	    0),
+	CFG(CLK_MCLK4,
+	    "audss_mclk4",
+	    mclk_parents,
+	    NULL,
+	    INFO_MCLK, 9, 1, 0,
+	    -1, 0, 0, 0,
+	    INFO_MCLK, 4, 0,
+	    0),
+};
+
+struct sky1_audss_clks_devtype_data {
+	u32 (*reg_save)[2];
+	size_t reg_save_size;
+	const char * const *clk_names;
+	size_t clk_num;
+	const u32 *clk_rate_default;
+	const struct composite_clk_cfg *clk_cfg;
+	size_t clk_cfg_size;
+};
+
+static const struct regmap_config sky1_audss_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+struct sky1_audss_clks_priv {
+	struct device *dev;
+	struct regmap *regmap_cru;
+	struct reset_control *rst_noc;
+	struct clk *clks[SKY1_AUDSS_CLK_PARENTS_CNT];
+	const struct sky1_audss_clks_devtype_data *devtype_data;
+	spinlock_t lock;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+#if IS_ENABLED(CONFIG_RESET_SKY1_AUDSS)
+
+static int sky1_audss_reset_controller_register(struct device *dev)
+{
+	struct auxiliary_device *adev;
+
+	if (!of_property_present(dev->of_node, "#reset-cells"))
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, "reset", NULL);
+	if (!adev)
+		return -ENODEV;
+
+	return 0;
+}
+
+#else
+
+static int sky1_audss_reset_controller_register(struct device *dev)
+{
+	return 0;
+}
+
+#endif
+
+/*
+ * clk_ops for audss clock mux/divider/gate
+ */
+struct sky1_clk_divider {
+	struct clk_divider div;
+	struct regmap *regmap;
+	int offset;
+};
+
+struct sky1_clk_gate {
+	struct clk_gate gate;
+	struct regmap *regmap;
+	int offset;
+};
+
+struct sky1_clk_mux {
+	struct clk_mux mux;
+	struct regmap *regmap;
+	int offset;
+};
+
+static inline struct sky1_clk_mux *to_sky1_clk_mux(struct clk_mux *mux)
+{
+	return container_of(mux, struct sky1_clk_mux, mux);
+}
+
+static u8 sky1_audss_clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct sky1_clk_mux *sky1_mux = to_sky1_clk_mux(mux);
+	u32 val;
+
+	regmap_read(sky1_mux->regmap, sky1_mux->offset, &val);
+	val = val >> mux->shift;
+	val &= mux->mask;
+
+	return clk_mux_val_to_index(hw, mux->table, mux->flags, val);
+}
+
+static int sky1_audss_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	u32 val = clk_mux_index_to_val(mux->table, mux->flags, index);
+	struct sky1_clk_mux *sky1_mux = to_sky1_clk_mux(mux);
+	unsigned long flags = 0;
+	u32 reg;
+
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
+
+	if (mux->flags & CLK_MUX_HIWORD_MASK) {
+		reg = mux->mask << (mux->shift + 16);
+	} else {
+		regmap_read(sky1_mux->regmap, sky1_mux->offset, &reg);
+		reg &= ~(mux->mask << mux->shift);
+	}
+	val = val << mux->shift;
+	reg |= val;
+	regmap_write(sky1_mux->regmap, sky1_mux->offset, reg);
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
+
+	return 0;
+}
+
+static int sky1_audss_clk_mux_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+
+	return clk_mux_determine_rate_flags(hw, req, mux->flags);
+}
+
+static const struct clk_ops sky1_audss_clk_mux_ops = {
+	.get_parent = sky1_audss_clk_mux_get_parent,
+	.set_parent = sky1_audss_clk_mux_set_parent,
+	.determine_rate = sky1_audss_clk_mux_determine_rate,
+};
+
+static inline struct sky1_clk_divider *to_sky1_clk_divider(struct clk_divider *div)
+{
+	return container_of(div, struct sky1_clk_divider, div);
+}
+
+static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw *hw,
+							unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
+	unsigned int val;
+
+	regmap_read(sky1_div->regmap, sky1_div->offset, &val);
+	val = val >> divider->shift;
+	val &= clk_div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+				   divider->flags, divider->width);
+}
+
+static int sky1_audss_clk_divider_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
+
+	/* if read only, just return current value */
+	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
+		u32 val;
+
+		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
+		val = val >> divider->shift;
+		val &= clk_div_mask(divider->width);
+
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width,
+						 divider->flags, val);
+	}
+
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
+}
+
+static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
+	int value;
+	unsigned long flags = 0;
+	u32 val;
+
+	value = divider_get_val(rate, parent_rate, divider->table,
+				divider->width, divider->flags);
+	if (value < 0)
+		return value;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
+		val = clk_div_mask(divider->width) << (divider->shift + 16);
+	} else {
+		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
+		val &= ~(clk_div_mask(divider->width) << divider->shift);
+	}
+	val |= (u32)value << divider->shift;
+	regmap_write(sky1_div->regmap, sky1_div->offset, val);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return 0;
+}
+
+static const struct clk_ops sky1_audss_clk_divider_ops = {
+	.recalc_rate = sky1_audss_clk_divider_recalc_rate,
+	.determine_rate = sky1_audss_clk_divider_determine_rate,
+	.set_rate = sky1_audss_clk_divider_set_rate,
+};
+
+static inline struct sky1_clk_gate *to_sky1_clk_gate(struct clk_gate *gate)
+{
+	return container_of(gate, struct sky1_clk_gate, gate);
+}
+
+static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
+	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
+	unsigned long flags = 0;
+	u32 reg;
+
+	set ^= enable;
+
+	if (gate->lock)
+		spin_lock_irqsave(gate->lock, flags);
+	else
+		__acquire(gate->lock);
+
+	if (gate->flags & CLK_GATE_HIWORD_MASK) {
+		reg = BIT(gate->bit_idx + 16);
+		if (set)
+			reg |= BIT(gate->bit_idx);
+	} else {
+		regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
+
+		if (set)
+			reg |= BIT(gate->bit_idx);
+		else
+			reg &= ~BIT(gate->bit_idx);
+	}
+
+	regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);
+
+	if (gate->lock)
+		spin_unlock_irqrestore(gate->lock, flags);
+	else
+		__release(gate->lock);
+}
+
+static int sky1_audss_clk_gate_enable(struct clk_hw *hw)
+{
+	sky1_audss_clk_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+static void sky1_audss_clk_gate_disable(struct clk_hw *hw)
+{
+	sky1_audss_clk_gate_endisable(hw, 0);
+}
+
+static int sky1_audss_clk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
+	u32 reg;
+
+	regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
+
+	/* if a set bit disables this clk, flip it before masking */
+	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
+		reg ^= BIT(gate->bit_idx);
+
+	reg &= BIT(gate->bit_idx);
+
+	return !!reg;
+}
+
+static const struct clk_ops sky1_audss_clk_gate_ops = {
+	.enable = sky1_audss_clk_gate_enable,
+	.disable = sky1_audss_clk_gate_disable,
+	.is_enabled = sky1_audss_clk_gate_is_enabled,
+};
+
+static struct clk_hw *sky1_audss_clk_register(struct device *dev,
+					      const char *name,
+					      const char * const *parent_names,
+					      int num_parents,
+					      struct regmap *regmap,
+					      const u32 *mux_table,
+					      struct muxdiv_cfg *mux_cfg,
+					      struct muxdiv_cfg *div_cfg,
+					      struct gate_cfg *gate_cfg,
+					      unsigned long flags,
+					      spinlock_t *lock)
+{
+	const struct clk_ops *sky1_mux_ops = NULL;
+	const struct clk_ops *sky1_div_ops = NULL;
+	const struct clk_ops *sky1_gate_ops = NULL;
+	struct clk_hw *hw = ERR_PTR(-ENOMEM);
+	struct sky1_clk_divider *sky1_div = NULL;
+	struct sky1_clk_gate *sky1_gate = NULL;
+	struct sky1_clk_mux *sky1_mux = NULL;
+
+	if (mux_cfg->offset >= 0) {
+		sky1_mux = devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KERNEL);
+		if (!sky1_mux)
+			return ERR_PTR(-ENOMEM);
+
+		sky1_mux->mux.reg = NULL;
+		sky1_mux->mux.shift = mux_cfg->shift;
+		sky1_mux->mux.mask = BIT(mux_cfg->width) - 1;
+		sky1_mux->mux.flags = mux_cfg->flags;
+		sky1_mux->mux.table = mux_table;
+		sky1_mux->mux.lock = lock;
+		sky1_mux_ops = &sky1_audss_clk_mux_ops;
+		sky1_mux->regmap = regmap;
+		sky1_mux->offset = mux_cfg->offset;
+	}
+
+	if (div_cfg->offset >= 0) {
+		sky1_div = devm_kzalloc(dev, sizeof(*sky1_div), GFP_KERNEL);
+		if (!sky1_div)
+			return ERR_PTR(-ENOMEM);
+
+		sky1_div->div.reg = NULL;
+		sky1_div->div.shift = div_cfg->shift;
+		sky1_div->div.width = div_cfg->width;
+		sky1_div->div.flags = div_cfg->flags | CLK_DIVIDER_POWER_OF_TWO;
+		sky1_div->div.lock = lock;
+		sky1_div_ops = &sky1_audss_clk_divider_ops;
+		sky1_div->regmap = regmap;
+		sky1_div->offset = div_cfg->offset;
+	}
+
+	if (gate_cfg->offset >= 0) {
+		sky1_gate = devm_kzalloc(dev, sizeof(*sky1_gate), GFP_KERNEL);
+		if (!sky1_gate)
+			return ERR_PTR(-ENOMEM);
+
+		sky1_gate->gate.reg = NULL;
+		sky1_gate->gate.bit_idx = gate_cfg->shift;
+		sky1_gate->gate.flags = gate_cfg->flags;
+		sky1_gate->gate.lock = lock;
+		sky1_gate_ops = &sky1_audss_clk_gate_ops;
+		sky1_gate->regmap = regmap;
+		sky1_gate->offset = gate_cfg->offset;
+	}
+
+	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
+				       sky1_mux ? &sky1_mux->mux.hw : NULL, sky1_mux_ops,
+				       sky1_div ? &sky1_div->div.hw : NULL, sky1_div_ops,
+				       sky1_gate ? &sky1_gate->gate.hw : NULL, sky1_gate_ops,
+				       flags);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "register %s clock failed with err = %ld\n",
+			name, PTR_ERR(hw));
+		return hw;
+	}
+
+	return hw;
+}
+
+static int sky1_audss_clks_get(struct sky1_audss_clks_priv *priv)
+{
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	int i;
+
+	for (i = 0; i < devtype_data->clk_num; i++) {
+		priv->clks[i] = devm_clk_get(priv->dev, devtype_data->clk_names[i]);
+		if (IS_ERR(priv->clks[i]))
+			return dev_err_probe(priv->dev, PTR_ERR(priv->clks[i]),
+					     "failed to get clock %s", devtype_data->clk_names[i]);
+	}
+
+	return 0;
+}
+
+static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
+{
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	int i, err;
+
+	for (i = 0; i < devtype_data->clk_num; i++) {
+		err = clk_prepare_enable(priv->clks[i]);
+		if (err) {
+			dev_err(priv->dev, "failed to enable clock %s\n",
+				devtype_data->clk_names[i]);
+			goto err_clks;
+		}
+	}
+
+	return 0;
+
+err_clks:
+	while (--i >= 0)
+		clk_disable_unprepare(priv->clks[i]);
+
+	return err;
+}
+
+static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
+{
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	int i;
+
+	for (i = 0; i < devtype_data->clk_num; i++)
+		clk_disable_unprepare(priv->clks[i]);
+}
+
+static int sky1_audss_clks_set_rate(struct sky1_audss_clks_priv *priv)
+{
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	int i, err;
+
+	for (i = 0; i < devtype_data->clk_num; i++) {
+		err = clk_set_rate(priv->clks[i], devtype_data->clk_rate_default[i]);
+		if (err) {
+			dev_err(priv->dev, "failed to set clock rate %s\n",
+				devtype_data->clk_names[i]);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+/* register sky1 audio subsystem clocks */
+static int sky1_audss_clk_probe(struct platform_device *pdev)
+{
+	const struct sky1_audss_clks_devtype_data *devtype_data;
+	struct sky1_audss_clks_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct clk_hw **clk_table;
+	void __iomem *base;
+	int i, ret;
+
+	devtype_data = device_get_match_data(dev);
+	if (!devtype_data)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
+	priv->clk_data = devm_kzalloc(dev,
+				      struct_size(priv->clk_data, hws, SKY1_AUDSS_NUM_CLKS),
+				      GFP_KERNEL);
+	if (!priv->clk_data)
+		return -ENOMEM;
+
+	priv->clk_data->num = SKY1_AUDSS_NUM_CLKS;
+	clk_table = priv->clk_data->hws;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap_cru = devm_regmap_init_mmio(dev, base, &sky1_audss_regmap_config);
+	if (IS_ERR(priv->regmap_cru))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap_cru),
+				     "failed to initialize regmap\n");
+
+	priv->dev = dev;
+	priv->devtype_data = devtype_data;
+
+	priv->rst_noc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->rst_noc))
+		return dev_err_probe(dev, PTR_ERR(priv->rst_noc),
+				     "failed to get audss noc reset");
+
+	reset_control_deassert(priv->rst_noc);
+
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = sky1_audss_clks_get(priv);
+	if (ret)
+		goto err_pm;
+
+	ret = sky1_audss_clks_enable(priv);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		goto err_pm;
+	}
+
+	ret = sky1_audss_clks_set_rate(priv);
+	if (ret) {
+		dev_err(dev, "failed to set clocks rate\n");
+		goto fail_clks_set;
+	}
+
+	/* audio_clk4 clock fixed divider */
+	clk_table[CLK_AUD_CLK4_DIV2] =
+		devm_clk_hw_register_fixed_factor(dev,
+						  "audio_clk4_div2",
+						  "audio_clk4",
+						  0,
+						  1, 2);
+	if (IS_ERR(clk_table[CLK_AUD_CLK4_DIV2])) {
+		ret = PTR_ERR(clk_table[CLK_AUD_CLK4_DIV2]);
+		dev_err(dev, "failed to register clock %d, ret:%d\n", CLK_AUD_CLK4_DIV2, ret);
+		goto fail_fixed_clk;
+	}
+
+	clk_table[CLK_AUD_CLK4_DIV4] =
+		devm_clk_hw_register_fixed_factor(dev,
+						  "audio_clk4_div4",
+						  "audio_clk4",
+						  0,
+						  1, 4);
+	if (IS_ERR(clk_table[CLK_AUD_CLK4_DIV4])) {
+		ret = PTR_ERR(clk_table[CLK_AUD_CLK4_DIV4]);
+		dev_err(dev, "failed to register clock %d, ret:%d\n", CLK_AUD_CLK4_DIV4, ret);
+		goto fail_fixed_clk;
+	}
+
+	/* audio_clk5 clock fixed divider */
+	clk_table[CLK_AUD_CLK5_DIV2] =
+		devm_clk_hw_register_fixed_factor(dev,
+						  "audio_clk5_div2",
+						  "audio_clk5",
+						  0,
+						  1, 2);
+	if (IS_ERR(clk_table[CLK_AUD_CLK5_DIV2])) {
+		ret = PTR_ERR(clk_table[CLK_AUD_CLK5_DIV2]);
+		dev_err(dev, "failed to register clock %d, ret:%d\n", CLK_AUD_CLK5_DIV2, ret);
+		goto fail_fixed_clk;
+	}
+
+	for (i = 0; i < devtype_data->clk_cfg_size; i++) {
+		clk_table[devtype_data->clk_cfg[i].id] =
+			sky1_audss_clk_register(dev,
+						devtype_data->clk_cfg[i].name,
+						devtype_data->clk_cfg[i].parent_names,
+						devtype_data->clk_cfg[i].num_parents,
+						priv->regmap_cru,
+						devtype_data->clk_cfg[i].mux_table,
+						devtype_data->clk_cfg[i].mux_cfg,
+						devtype_data->clk_cfg[i].div_cfg,
+						devtype_data->clk_cfg[i].gate_cfg,
+						devtype_data->clk_cfg[i].flags,
+						&priv->lock);
+		if (IS_ERR(clk_table[devtype_data->clk_cfg[i].id])) {
+			ret = PTR_ERR(clk_table[devtype_data->clk_cfg[i].id]);
+			dev_err(dev, "failed to register clock %d, ret:%d\n",
+				devtype_data->clk_cfg[i].id, ret);
+			goto fail_array_clk;
+		}
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv->clk_data);
+	if (ret) {
+		dev_err(dev, "failed to add clock provider: %d\n", ret);
+		goto fail_register;
+	}
+
+	ret = sky1_audss_reset_controller_register(dev);
+	if (ret)
+		goto fail_register;
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+
+fail_register:
+fail_array_clk:
+	while (i--)
+		clk_hw_unregister_composite(clk_table[devtype_data->clk_cfg[i].id]);
+fail_fixed_clk:
+fail_clks_set:
+	pm_runtime_put_sync(dev);
+err_pm:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void sky1_audss_clk_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	int i = 0;
+
+	for (i = 0; i < devtype_data->clk_cfg_size; i++)
+		clk_hw_unregister_composite(priv->clk_data->hws[devtype_data->clk_cfg[i].id]);
+
+	if (!pm_runtime_status_suspended(dev))
+		pm_runtime_force_suspend(dev);
+
+	pm_runtime_disable(dev);
+}
+
+static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
+{
+	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	for (i = 0; i < devtype_data->reg_save_size; i++)
+		regmap_read(priv->regmap_cru,
+			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	sky1_audss_clks_disable(priv);
+
+	return reset_control_assert(priv->rst_noc);
+}
+
+static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
+{
+	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	unsigned long flags;
+	int i, ret;
+
+	ret = reset_control_deassert(priv->rst_noc);
+	if (ret)
+		return ret;
+
+	ret = sky1_audss_clks_enable(priv);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	for (i = 0; i < devtype_data->reg_save_size; i++)
+		regmap_write(priv->regmap_cru,
+			     devtype_data->reg_save[i][0], devtype_data->reg_save[i][1]);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
+	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
+			   sky1_audss_clk_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
+	.reg_save = sky1_reg_save,
+	.reg_save_size = ARRAY_SIZE(sky1_reg_save),
+	.clk_names = sky1_audss_clk_names,
+	.clk_num = ARRAY_SIZE(sky1_audss_clk_names),
+	.clk_rate_default = sky1_clk_rate_default,
+	.clk_cfg = sky1_audss_clks,
+	.clk_cfg_size = ARRAY_SIZE(sky1_audss_clks),
+};
+
+static const struct of_device_id sky1_audss_clk_of_match[] = {
+	{ .compatible = "cix,sky1-audss-cru", .data = &sky1_devtype_data, },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, sky1_audss_clk_of_match);
+
+static struct platform_driver sky1_audss_clk_driver = {
+	.probe = sky1_audss_clk_probe,
+	.remove = sky1_audss_clk_remove,
+	.driver = {
+		.name = "sky1-audss-clk",
+		.suppress_bind_attrs = true,
+		.of_match_table = sky1_audss_clk_of_match,
+		.pm = &sky1_audss_clk_pm_ops,
+	},
+};
+module_platform_driver(sky1_audss_clk_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
+MODULE_DESCRIPTION("Cixtech Sky1 Audio Subsystem Clock Controller Driver");
-- 
2.50.1

