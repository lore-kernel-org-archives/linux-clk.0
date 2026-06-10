Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023097.outbound.protection.outlook.com [52.101.127.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F458374A1B;
	Wed, 10 Jun 2026 06:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072248; cv=fail; b=uT+iMkHgKsqOzNW7GkWKsFe2R8hffXokxHk9zfoX0wyiqKPRP1kww+kYYJ7TUcGLaQLCslLtfVxa2z8/CnwpQ6ecqb5mrK7JkgfECeczrmUi02/Ylc45p+Rl3w0mNjgppPn+15MuEIYD1YT1IUpBJhosmXXAuikS4OwLMjmAFTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072248; c=relaxed/simple;
	bh=Orn8H41F1OkG75/lbQ3YB7cZroc1bgoKzmOKswvYNHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hw0mQWnMgszex7BXYFTwdDl+8qgv0kRqC8JJ+X+YfWnmdktWguDsLB8a2tduwF7QKSp2LS+VqGxDp5sLb3kDls3Yjzo8TvIVmOOpWazAxnp5EEFNWpQAqfoPCpgGeV5guMdPMLRKHcPmMW3V86uwg/zbjen/UjU1hE9trb9AEBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCtj7AiFBC2iqDE0wkfQBiYFTVaPk81ARSBCTjt5AXX336fZwWuJUDlewaG4Fa3hNf3r4Z/XTeNyeaY5OsBGyMrZ7dIFevOr0HTL02mGtJ33KEGyczNKzFNgW583/CaS3pAesuhvQLF45D8EHR0+nh4DFh8AeDghPg7JA+ZDRnf7Vhm4ghcf10poKgPKcIWMLcjRyf4aqvI7TGG81fZ6MU/zbperYtvIfkJdG3RKYDpBkDfKoffHu6Z/8GWtTDVt8wDJeyzST4kL6qU0VCfjFs8+x5mfEvGlta/d9RPzh1n6fjLcXLG8Mj3tuYVofmxVQllo9At0C2tQ2Mwb9+zETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuftJ8O2XwLe3tBvnXCJQ8pmRDlDfJCyqPsiFzz1mbY=;
 b=tPGNT7dui8UfQd+IoAxMUVOYEe0uUFqlUN0yDyIEmw/DXDxrRb2wOZdEIYV3EjUGAaeafzMmH4W4YhqNly26SzeRydCZptgpGEpiwkqJpV5ouo/QTBH+Qt1Z12JZkOjM7hAbiVb2fjojbavEWvaRlH0Zb9jNPfuBFdcy5IRX9x+nVz+nHVXs1cPoSPVHXMmraXB7CuEAq7Aii8MXD4S4HMdKxenuJvIbZGAjqY54asagPVbihopvOkl17krGXqGTySmNW8T0xPpuWGVwnXqx2hoz3P7hrJUGTL5pqk4Y1ZbjjK8bMr/4KCG7YCqIHneEKqiA7MHq09+fNCbP2Ere7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13) by
 TY2PPF86E4C9764.apcprd06.prod.outlook.com (2603:1096:408::79b) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.34; Wed, 10 Jun 2026 06:17:21 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::c1) by SG2P153CA0026.outlook.office365.com
 (2603:1096:4:c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.3 via Frontend Transport; Wed, 10
 Jun 2026 06:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:17:19 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 820B94084277;
	Wed, 10 Jun 2026 14:17:15 +0800 (CST)
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
Subject: [PATCH v3 4/5] clk: cix: add sky1 audss clock controller
Date: Wed, 10 Jun 2026 14:17:11 +0800
Message-ID: <20260610061712.3203984-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
References: <20260610061712.3203984-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY2PPF86E4C9764:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 76828475-be4a-4eca-e482-08dec6b7edbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|7416014|1800799024|22082099003|3023799007|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	U+Tx87qGfY1jNeAjeo5x2eBtbN6juV89ndkaau2rfPJM5Yf1rhRL0aG1ZQIPLfmNAiGY2QEePL+93v+7evRmCPWtX9sjvlbaO56dbMDSCJ/HZthxJwi4vO5s/NmLBcrpRbxCJ6PbYGQ9SGr242jlHwqJPMyQIcSFb1kV8qmjGxJDTA7gubBmw3FXfcmitbp+JZwYMyIYTlNk7/c5Wsh/rCfP67dxP1ZW/SUlJfAmRB64fnw7kp/rfuQOsz3sBefqFHWJ1P4gaJj/EZfTJBAKrqYKNZet7ZVeMZqBQOUIXeICuAqQpHjzZtnBrG1dlwHW4V0WX8w3dGdpcaLU7RsVlngx/2KfJQ2VRIitlIWLo1mWiTV973DV3ngSW7umA741bvsW3Jl96vlSMDICgQM52tt+1fZ7IN6ADKBtleq2DgYnChhT0WQIY8ycp+F77zXN9ofR9Ne3Rp+8XLpap+1KF8Btiuy4ZWhZqj0C9XzEryXxLHCA4zkHIsrRMepaLMGiWX+8b64Z3LM5LLtnvaOZjtPyqchgumP32VQHdBaLhA8+47IisiTbkpwllh2JECMEHtGAoP+8kfNUP4d+O96cntvDwQ8jyO2wc+GfNgj1GRGsr6vYWh8FPd9QMYTp4CogvdgQqZYbB+TxOKJlRhOAx5QcrfDo6XNiBqIYla/PvszF2zw1PMUui/PnfmvIhu+VltW2BsnA5OrBOkHVDCVmEwHONnzbshZob7o8ETso+sI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(7416014)(1800799024)(22082099003)(3023799007)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oV9+45bHr62pnTmfVwqd+u0OkdGAi7CqNFQB+3SOiuefC0ltFfAA0SFt3EJF5myaF69+SqL73SnH1jknAYUaFZjmi5FBoqY4KYY/vIeaNE+WGrlZjNk9Jzu5hSBkMh2klaXRn/ukVKdel/IURbyvUTfqzc2oMkEnl9xjoZ/JcHp8iDST/gaLrk5MXogOJ+0lznIYtZjzEnjNTK6By/AUl8SLEMDTzwHn9I27N5fSTQhJoVlvnT/n9vvQc/4oHgDO0eDhPB0LRehJlIhZg6ATTnMiMXes4yNPYLS1uxfof+hjcriISZ0LF8ty8jH8yicTpHosO9ZRuwsRCLjEHcVDJGhoGDTzPYziptq/GdUg8PrafTpV93FkfQKyDAHOrBSW+MRtjO6p55udQ1OuXRjd6cUEB++q6mm6DWV7Qf+namGRDxx6NNgNGXj/rfW6nEg3
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:17:19.7852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76828475-be4a-4eca-e482-08dec6b7edbe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF86E4C9764

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add a platform driver for the Cix Sky1 Audio Subsystem (AUDSS) internal
clock controller. The driver binds to a cix,sky1-audss-clock device tree
node under the AUDSS syscon, obtains the parent regmap via
syscon_node_to_regmap(), and registers mux/divider/gate composite clocks
for DSP, SRAM, HDA, DMAC, watchdog, timer, mailbox and I2S outputs. Four
SoC-level audio reference clocks are brought up as inputs to the tree.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/clk/Kconfig              |    1 +
 drivers/clk/Makefile             |    1 +
 drivers/clk/cix/Kconfig          |   16 +
 drivers/clk/cix/Makefile         |    3 +
 drivers/clk/cix/clk-sky1-audss.c | 1175 ++++++++++++++++++++++++++++++
 5 files changed, 1196 insertions(+)
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..ead41e45c0f6 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -503,6 +503,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/cix/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..9135ea6e5a8f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
+obj-y					+= cix/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
new file mode 100644
index 000000000000..3909796f8656
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
+	select MFD_SYSCON
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
index 000000000000..3ec6bea93b73
--- /dev/null
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -0,0 +1,1175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2026 Cix Technology Group Co., Ltd.
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/clock/cix,sky1-audss.h>
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
+struct sky1_audss_clks_priv {
+	struct device *dev;
+	struct regmap *regmap_cru;
+	struct clk *clks[SKY1_AUDSS_CLK_PARENTS_CNT];
+	struct reset_control *rst_noc;
+	const struct sky1_audss_clks_devtype_data *devtype_data;
+	spinlock_t lock;
+	struct clk_hw_onecell_data *clk_data;
+};
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
+	struct device_node *parent_np;
+	struct device *dev = &pdev->dev;
+	struct reset_control *rst_noc;
+	struct clk_hw **clk_table;
+	struct regmap *regmap_cru;
+	int i, ret;
+
+	parent_np = of_get_parent(pdev->dev.of_node);
+	regmap_cru = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(regmap_cru))
+		return dev_err_probe(dev, PTR_ERR(regmap_cru),
+				     "unable to get audss cru regmap");
+
+	devtype_data = device_get_match_data(dev);
+	if (!devtype_data)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
+	priv->clk_data = devm_kzalloc(&pdev->dev,
+				      struct_size(priv->clk_data, hws, SKY1_AUDSS_NUM_CLKS),
+				      GFP_KERNEL);
+	if (!priv->clk_data)
+		return -ENOMEM;
+
+	priv->clk_data->num = SKY1_AUDSS_NUM_CLKS;
+	clk_table = priv->clk_data->hws;
+
+	priv->dev = dev;
+	priv->regmap_cru = regmap_cru;
+	priv->devtype_data = devtype_data;
+
+	ret = sky1_audss_clks_get(priv);
+	if (ret)
+		return ret;
+
+	rst_noc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(rst_noc))
+		return dev_err_probe(dev, PTR_ERR(rst_noc),
+				     "failed to get noc reset");
+	priv->rst_noc = rst_noc;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = sky1_audss_clks_enable(priv);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	/*
+	 * Enable runtime PM here to allow the clock core using runtime PM
+	 * for the registered clocks.
+	 */
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = sky1_audss_clks_set_rate(priv);
+	if (ret) {
+		dev_err(dev, "failed to set clocks rate\n");
+		goto fail_clks_set;
+	}
+
+	/* assert reset */
+	reset_control_assert(rst_noc);
+	usleep_range(1, 2);
+
+	/* deassert reset */
+	reset_control_deassert(rst_noc);
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
+						regmap_cru,
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
+	reset_control_assert(priv->rst_noc);
+
+	sky1_audss_clks_disable(priv);
+
+	return 0;
+}
+
+static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
+{
+	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
+	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
+	unsigned long flags;
+	int i, ret;
+
+	ret = sky1_audss_clks_enable(priv);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	reset_control_deassert(priv->rst_noc);
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
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
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
+	{ .compatible = "cix,sky1-audss-clock", .data = &sky1_devtype_data, },
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

