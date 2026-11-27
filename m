Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822967;
	b=2rHxehXi0Z5UMC3A5gK9ieXaU7rFsTORErGfOwns5ZwhjiRoIOzDhxZDZ4kLtpoomokd
	 fv4s+++AuOVd2XsyD/seqa1Sd4Yhv4jQ8RDd4kkMll1bL1OXrBEujaL0cK8truui9tr1D
	 XVOxnpVtZd3h/UE4YbpojVehnYJn76vJ9lAFkfteHelSV3uEnQ83JohwiBKMKDz7oMuOa
	 DXEz9j1LPsPq0Oh7MZz5XQv+w01zYJCeEDOHc/wSWliDPY/vnxXNOed7GFnEBO1Ae0e7d
	 uACFnDX8WlzgxPu4si8+pVoMGUfu86e0wksxUmCVnYtmkR6wFuD+ajzdIztFnrQLJ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822967;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=J+fxwrT3QwhbW6bU4LByOR+BLO2rDyU+o5OJE+CNEYo=;
	b=lLFtmA/UjXGFjlNitGiQTaF8yPuPHTj8NHpKTvDz4PsPfOIwb416cik4p4hLjUMGTQyO
	 VfnkVY205QjlBTXIN6zPpshPKPGzPtWS0IUabGUr/FSZUZt+6NFXQsxxFLbY2K9LrYbZ4
	 zfM7p18BZNhOiAWSFWtgFSoVoNA5ABWg3SuiWPT3EHER3Yci8eOaSduhghy2DYzbrLfpu
	 9XQKj8c5ypKsUTvlLOyd5A5NuUntZLt4NrD1GSPbZqLV0g53spUW58Y7jo4DBXDWfuyDU
	 JSzb0fX+vbt/iXBcjMg6tmDjFQ6KFgkHMX+H7HwVFIqpMr6h1fJjJNwAoIeNZ2Ss8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yph+/37/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE7606A31C;
	Fri, 27 Nov 2026 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yph+/37/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1274D1F00893;
	Fri, 27 Nov 2026 23:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822966;
	bh=J+fxwrT3QwhbW6bU4LByOR+BLO2rDyU+o5OJE+CNEYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Yph+/37/mwrpgTC+DgB3gk/15fTx7tUuS0MHa58kR8lm8fWpiVCK30ywTvmjBsaPm
	 6Cfedj3G+7CFq8muZX+G7S+LUXQ7eni1UzQkBpXncTQ+0NfgPw3DTC1YhEzR7sdd5V
	 BLTg6uv/BRHy2RN8q9cCXbT5h2JCR4Mflkt02XKsFARkK7K5uvRZNZ6nn9k81qY3hW
	 hm7vLSRMop6AJCnHR++3GfLuWthPFYOEzqFv5vdSOfukboJepqKNUuqKfVTogx4QkZ
	 mqvIvlMDChtJy8nzFYp0eArb5YElAuPI7uOpq0tSv4Y1iGGe6SbxwQSW4aWYjvOczy
	 VRQOH0u6IawvA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:33 +0100
Subject: [PATCH 5/6] clk: ux500: Separate the PRCMU DSI clock
 implementation
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
Message-Id: <20261128-ux500-prcmu-clock-move-v1-5-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

Keep DSI PLL lock, clamp, output and escape clock programming in a
dedicated implementation. Share the PLL rate decoder and divider
arithmetic with the other PRCMU clocks without changing their clock
IDs, CCF operations or DT bindings.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/clk/ux500/Makefile        |   2 +-
 drivers/clk/ux500/clk-prcmu-dsi.c | 352 ++++++++++++++++++++++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.c  | 394 +++-----------------------------------
 drivers/clk/ux500/clk-prcmu-hw.h  |  27 +++
 4 files changed, 408 insertions(+), 367 deletions(-)

diff --git a/drivers/clk/ux500/Makefile b/drivers/clk/ux500/Makefile
index afd8c7babcbd..a94dda86736c 100644
--- a/drivers/clk/ux500/Makefile
+++ b/drivers/clk/ux500/Makefile
@@ -5,7 +5,7 @@
 
 # Clock types
 obj-y += clk-prcc.o
-obj-y += clk-prcmu.o clk-prcmu-hw.o
+obj-y += clk-prcmu.o clk-prcmu-hw.o clk-prcmu-dsi.o
 obj-y += clk-sysctrl.o
 
 # Reset control
diff --git a/drivers/clk/ux500/clk-prcmu-dsi.c b/drivers/clk/ux500/clk-prcmu-dsi.c
new file mode 100644
index 000000000000..446fb8075ac6
--- /dev/null
+++ b/drivers/clk/ux500/clk-prcmu-dsi.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DB8500 PRCMU DSI PLL and output clocks
+ *
+ * Copyright (C) STMicroelectronics 2009
+ * Copyright (C) ST-Ericsson SA 2010
+ *
+ * Authors: Kumar Sanghvi <kumar.sanghvi@stericsson.com>
+ *          Sundar Iyer <sundar.iyer@stericsson.com>
+ *          Mattias Nilsson <mattias.i.nilsson@stericsson.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/mfd/db8500-prcmu.h>
+
+#include "clk-prcmu-hw.h"
+
+#define PRCM_PLLDSI_FREQ		0x500
+#define PRCM_MMIP_LS_CLAMP_SET     0x420
+#define PRCM_MMIP_LS_CLAMP_CLR     0x424
+#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP		BIT(11)
+#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI	BIT(22)
+#define PRCM_PLLDSI_ENABLE         0x504
+#define PRCM_PLLDSI_LOCKP          0x508
+#define PRCM_DSI_PLLOUT_SEL        0x530
+#define PRCM_DSITVCLK_DIV          0x52C
+#define PRCM_APE_RESETN_SET        0x1E4
+#define PRCM_APE_RESETN_CLR        0x1E8
+#define PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE BIT(0)
+#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10	BIT(0)
+#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3	BIT(1)
+#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_SHIFT	0
+#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_MASK	GENMASK(2, 0)
+#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_SHIFT	8
+#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_MASK	GENMASK(10, 8)
+#define PRCM_DSI_PLLOUT_SEL_OFF		0
+#define PRCM_DSI_PLLOUT_SEL_PHI		1
+#define PRCM_DSI_PLLOUT_SEL_PHI_2	2
+#define PRCM_DSI_PLLOUT_SEL_PHI_4	3
+#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_SHIFT	0
+#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_MASK		GENMASK(7, 0)
+#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_SHIFT	8
+#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_MASK		GENMASK(15, 8)
+#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_SHIFT	16
+#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_MASK		GENMASK(23, 16)
+#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_EN		BIT(24)
+#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_EN		BIT(25)
+#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_EN		BIT(26)
+#define PRCM_APE_RESETN_DSIPLL_RESETN BIT(14)
+
+struct dsiclk {
+	u32 divsel_mask;
+	u32 divsel_shift;
+	u32 divsel;
+};
+
+static struct dsiclk dsiclk[2] = {
+	{
+		.divsel_mask = PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_MASK,
+		.divsel_shift = PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_SHIFT,
+		.divsel = PRCM_DSI_PLLOUT_SEL_PHI,
+	},
+	{
+		.divsel_mask = PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_MASK,
+		.divsel_shift = PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_SHIFT,
+		.divsel = PRCM_DSI_PLLOUT_SEL_PHI,
+	}
+};
+
+struct dsiescclk {
+	u32 en;
+	u32 div_mask;
+	u32 div_shift;
+};
+
+static struct dsiescclk dsiescclk[3] = {
+	{
+		.en = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_EN,
+		.div_mask = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_MASK,
+		.div_shift = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_SHIFT,
+	},
+	{
+		.en = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_EN,
+		.div_mask = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_MASK,
+		.div_shift = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_SHIFT,
+	},
+	{
+		.en = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_EN,
+		.div_mask = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_MASK,
+		.div_shift = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_SHIFT,
+	}
+};
+
+static inline bool plldsi_locked(void)
+{
+	return (db8500_prcmu_read(PRCM_PLLDSI_LOCKP) &
+		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
+		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3)) ==
+		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
+		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3);
+}
+
+int ux500_prcmu_request_plldsi(bool enable)
+{
+	u32 clamp = PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP |
+		    PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI;
+	int r = 0;
+	u32 val;
+
+	db8500_prcmu_write(enable ? PRCM_MMIP_LS_CLAMP_CLR :
+			   PRCM_MMIP_LS_CLAMP_SET, clamp);
+
+	val = db8500_prcmu_read(PRCM_PLLDSI_ENABLE);
+	if (enable)
+		val |= PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
+	else
+		val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
+	db8500_prcmu_write(PRCM_PLLDSI_ENABLE, val);
+
+	if (enable) {
+		unsigned int i;
+		bool locked = plldsi_locked();
+
+		for (i = 10; !locked && (i > 0); --i) {
+			udelay(100);
+			locked = plldsi_locked();
+		}
+		if (locked) {
+			db8500_prcmu_write(PRCM_APE_RESETN_SET,
+					   PRCM_APE_RESETN_DSIPLL_RESETN);
+		} else {
+			db8500_prcmu_write(PRCM_MMIP_LS_CLAMP_SET, clamp);
+			val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
+			db8500_prcmu_write(PRCM_PLLDSI_ENABLE, val);
+			r = -EAGAIN;
+		}
+	} else {
+		db8500_prcmu_write(PRCM_APE_RESETN_CLR,
+				   PRCM_APE_RESETN_DSIPLL_RESETN);
+	}
+	return r;
+}
+
+int ux500_prcmu_request_dsiclk(u8 n, bool enable)
+{
+	u32 val;
+
+	val = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
+	val &= ~dsiclk[n].divsel_mask;
+	val |= ((enable ? dsiclk[n].divsel : PRCM_DSI_PLLOUT_SEL_OFF) <<
+		dsiclk[n].divsel_shift);
+	db8500_prcmu_write(PRCM_DSI_PLLOUT_SEL, val);
+	return 0;
+}
+
+int ux500_prcmu_request_dsiescclk(u8 n, bool enable)
+{
+	u32 val;
+
+	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	enable ? (val |= dsiescclk[n].en) : (val &= ~dsiescclk[n].en);
+	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
+	return 0;
+}
+
+unsigned long ux500_prcmu_plldsi_rate(void)
+{
+	return ux500_prcmu_pll_rate(PRCM_PLLDSI_FREQ,
+				   ux500_prcmu_clk_rate(PRCMU_HDMICLK),
+				   PLL_RAW);
+}
+
+unsigned long ux500_prcmu_dsiclk_rate(u8 n)
+{
+	u32 divsel;
+	u32 div = 1;
+
+	divsel = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
+	divsel = ((divsel & dsiclk[n].divsel_mask) >> dsiclk[n].divsel_shift);
+
+	if (divsel == PRCM_DSI_PLLOUT_SEL_OFF)
+		divsel = dsiclk[n].divsel;
+	else
+		dsiclk[n].divsel = divsel;
+
+	switch (divsel) {
+	case PRCM_DSI_PLLOUT_SEL_PHI_4:
+		div *= 2;
+		fallthrough;
+	case PRCM_DSI_PLLOUT_SEL_PHI_2:
+		div *= 2;
+		fallthrough;
+	case PRCM_DSI_PLLOUT_SEL_PHI:
+		return ux500_prcmu_plldsi_rate() / div;
+	default:
+		return 0;
+	}
+}
+
+unsigned long ux500_prcmu_dsiescclk_rate(u8 n)
+{
+	u32 div;
+
+	div = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	div = ((div & dsiescclk[n].div_mask) >> (dsiescclk[n].div_shift));
+	return ux500_prcmu_clk_rate(PRCMU_TVCLK) / max_t(u32, div, 1);
+}
+
+#define MIN_PLL_VCO_RATE 600000000ULL
+#define MAX_PLL_VCO_RATE 1680640000ULL
+
+long ux500_prcmu_round_plldsi_rate(unsigned long rate)
+{
+	long rounded_rate = 0;
+	unsigned long src_rate;
+	unsigned long rem;
+	u32 r;
+
+	src_rate = ux500_prcmu_clk_rate(PRCMU_HDMICLK);
+	rem = rate;
+
+	for (r = 7; (rem > 0) && (r > 0); r--) {
+		u64 d;
+
+		d = (r * rate);
+		(void)do_div(d, src_rate);
+		if (d < 6)
+			d = 6;
+		else if (d > 255)
+			d = 255;
+		d *= src_rate;
+		if (((2 * d) < (r * MIN_PLL_VCO_RATE)) ||
+			((r * MAX_PLL_VCO_RATE) < (2 * d)))
+			continue;
+		(void)do_div(d, r);
+		if (rate < d) {
+			if (rounded_rate == 0)
+				rounded_rate = (long)d;
+			break;
+		}
+		if ((rate - d) < rem) {
+			rem = (rate - d);
+			rounded_rate = (long)d;
+		}
+	}
+	return rounded_rate;
+}
+
+long ux500_prcmu_round_dsiclk_rate(unsigned long rate)
+{
+	u32 div;
+	unsigned long src_rate;
+	long rounded_rate;
+
+	src_rate = ux500_prcmu_plldsi_rate();
+	div = ux500_prcmu_clk_divider(src_rate, rate);
+	rounded_rate = (src_rate / ((div > 2) ? 4 : div));
+
+	return rounded_rate;
+}
+
+long ux500_prcmu_round_dsiescclk_rate(unsigned long rate)
+{
+	u32 div;
+	unsigned long src_rate;
+	long rounded_rate;
+
+	src_rate = ux500_prcmu_clk_rate(PRCMU_TVCLK);
+	div = ux500_prcmu_clk_divider(src_rate, rate);
+	rounded_rate = (src_rate / min_t(u32, div, 255));
+
+	return rounded_rate;
+}
+
+int ux500_prcmu_set_plldsi_rate(unsigned long rate)
+{
+	unsigned long src_rate;
+	unsigned long rem;
+	u32 pll_freq = 0;
+	u32 r;
+
+	src_rate = ux500_prcmu_clk_rate(PRCMU_HDMICLK);
+	rem = rate;
+
+	for (r = 7; (rem > 0) && (r > 0); r--) {
+		u64 d;
+		u64 hwrate;
+
+		d = (r * rate);
+		(void)do_div(d, src_rate);
+		if (d < 6)
+			d = 6;
+		else if (d > 255)
+			d = 255;
+		hwrate = (d * src_rate);
+		if (((2 * hwrate) < (r * MIN_PLL_VCO_RATE)) ||
+			((r * MAX_PLL_VCO_RATE) < (2 * hwrate)))
+			continue;
+		(void)do_div(hwrate, r);
+		if (rate < hwrate) {
+			if (pll_freq == 0)
+				pll_freq = (((u32)d << PRCM_PLL_FREQ_D_SHIFT) |
+					(r << PRCM_PLL_FREQ_R_SHIFT));
+			break;
+		}
+		if ((rate - hwrate) < rem) {
+			rem = (rate - hwrate);
+			pll_freq = (((u32)d << PRCM_PLL_FREQ_D_SHIFT) |
+				(r << PRCM_PLL_FREQ_R_SHIFT));
+		}
+	}
+	if (pll_freq == 0)
+		return -EINVAL;
+
+	pll_freq |= (1 << PRCM_PLL_FREQ_N_SHIFT);
+	db8500_prcmu_write(PRCM_PLLDSI_FREQ, pll_freq);
+
+	return 0;
+}
+
+void ux500_prcmu_set_dsiclk_rate(u8 n, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+
+	div = ux500_prcmu_clk_divider(ux500_prcmu_plldsi_rate(), rate);
+
+	dsiclk[n].divsel = (div == 1) ? PRCM_DSI_PLLOUT_SEL_PHI :
+			   (div == 2) ? PRCM_DSI_PLLOUT_SEL_PHI_2 :
+			   /* else */	PRCM_DSI_PLLOUT_SEL_PHI_4;
+
+	val = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
+	val &= ~dsiclk[n].divsel_mask;
+	val |= (dsiclk[n].divsel << dsiclk[n].divsel_shift);
+	db8500_prcmu_write(PRCM_DSI_PLLOUT_SEL, val);
+}
+
+void ux500_prcmu_set_dsiescclk_rate(u8 n, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+
+	div = ux500_prcmu_clk_divider(ux500_prcmu_clk_rate(PRCMU_TVCLK), rate);
+	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	val &= ~dsiescclk[n].div_mask;
+	val |= (min_t(u32, div, 255) << dsiescclk[n].div_shift);
+	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
+}
diff --git a/drivers/clk/ux500/clk-prcmu-hw.c b/drivers/clk/ux500/clk-prcmu-hw.c
index db1fc1ca117c..36fc6e62f7d1 100644
--- a/drivers/clk/ux500/clk-prcmu-hw.c
+++ b/drivers/clk/ux500/clk-prcmu-hw.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
@@ -54,50 +53,15 @@
 #define PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ	BIT(0)
 #define PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL	BIT(16)
 #define PRCM_ARMCLKFIX_MGT	0x0
-#define PRCM_MMIP_LS_CLAMP_SET     0x420
-#define PRCM_MMIP_LS_CLAMP_CLR     0x424
-#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP		BIT(11)
-#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI	BIT(22)
 #define PRCM_PLLSOC0_FREQ	   0x080
 #define PRCM_PLLSOC1_FREQ	   0x084
 #define PRCM_PLLARM_FREQ	   0x088
 #define PRCM_PLLDDR_FREQ	   0x08C
-#define PRCM_PLL_FREQ_D_SHIFT	0
 #define PRCM_PLL_FREQ_D_MASK	GENMASK(7, 0)
-#define PRCM_PLL_FREQ_N_SHIFT	8
 #define PRCM_PLL_FREQ_N_MASK	GENMASK(13, 8)
-#define PRCM_PLL_FREQ_R_SHIFT	16
 #define PRCM_PLL_FREQ_R_MASK	GENMASK(18, 16)
 #define PRCM_PLL_FREQ_SELDIV2	BIT(24)
 #define PRCM_PLL_FREQ_DIV2EN	BIT(25)
-#define PRCM_PLLDSI_FREQ           0x500
-#define PRCM_PLLDSI_ENABLE         0x504
-#define PRCM_PLLDSI_LOCKP          0x508
-#define PRCM_DSI_PLLOUT_SEL        0x530
-#define PRCM_DSITVCLK_DIV          0x52C
-#define PRCM_APE_RESETN_SET        0x1E4
-#define PRCM_APE_RESETN_CLR        0x1E8
-#define PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE BIT(0)
-#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10	BIT(0)
-#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3	BIT(1)
-#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_SHIFT	0
-#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_MASK	GENMASK(2, 0)
-#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_SHIFT	8
-#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_MASK	GENMASK(10, 8)
-#define PRCM_DSI_PLLOUT_SEL_OFF		0
-#define PRCM_DSI_PLLOUT_SEL_PHI		1
-#define PRCM_DSI_PLLOUT_SEL_PHI_2	2
-#define PRCM_DSI_PLLOUT_SEL_PHI_4	3
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_SHIFT	0
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_MASK		GENMASK(7, 0)
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_SHIFT	8
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_MASK		GENMASK(15, 8)
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_SHIFT	16
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_MASK		GENMASK(23, 16)
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_EN		BIT(24)
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_EN		BIT(25)
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_EN		BIT(26)
-#define PRCM_APE_RESETN_DSIPLL_RESETN BIT(14)
 #define PRCM_SEM                   0x400
 #define PRCM_SEM_PRCM_SEM BIT(0)
 #define PRCM_TCR                   0x1C8
@@ -123,12 +87,6 @@ struct clk_mgt {
 	bool clk38div;
 };
 
-enum {
-	PLL_RAW,
-	PLL_FIX,
-	PLL_DIV
-};
-
 static DEFINE_SPINLOCK(clk_mgt_lock);
 
 #define CLK_MGT_ENTRY(_name, _branch, _clk38div)[PRCMU_##_name] = \
@@ -165,49 +123,6 @@ static struct clk_mgt clk_mgt[PRCMU_NUM_REG_CLOCKS] = {
 	CLK_MGT_ENTRY(UICCCLK, PLL_FIX, false),
 };
 
-struct dsiclk {
-	u32 divsel_mask;
-	u32 divsel_shift;
-	u32 divsel;
-};
-
-static struct dsiclk dsiclk[2] = {
-	{
-		.divsel_mask = PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_MASK,
-		.divsel_shift = PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_SHIFT,
-		.divsel = PRCM_DSI_PLLOUT_SEL_PHI,
-	},
-	{
-		.divsel_mask = PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_MASK,
-		.divsel_shift = PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_SHIFT,
-		.divsel = PRCM_DSI_PLLOUT_SEL_PHI,
-	}
-};
-
-struct dsiescclk {
-	u32 en;
-	u32 div_mask;
-	u32 div_shift;
-};
-
-static struct dsiescclk dsiescclk[3] = {
-	{
-		.en = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_EN,
-		.div_mask = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_MASK,
-		.div_shift = PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_SHIFT,
-	},
-	{
-		.en = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_EN,
-		.div_mask = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_MASK,
-		.div_shift = PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_SHIFT,
-	},
-	{
-		.en = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_EN,
-		.div_mask = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_MASK,
-		.div_shift = PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_SHIFT,
-	}
-};
-
 static bool prcmu_is_ulppll_disabled(void)
 {
 	struct prcmu_fw_version *ver;
@@ -288,78 +203,6 @@ static int request_sga_clock(u8 clock, bool enable)
 	return ret;
 }
 
-static inline bool plldsi_locked(void)
-{
-	return (db8500_prcmu_read(PRCM_PLLDSI_LOCKP) &
-		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
-		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3)) ==
-		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
-		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3);
-}
-
-static int request_plldsi(bool enable)
-{
-	u32 clamp = PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP |
-		    PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI;
-	int r = 0;
-	u32 val;
-
-	db8500_prcmu_write(enable ? PRCM_MMIP_LS_CLAMP_CLR :
-			   PRCM_MMIP_LS_CLAMP_SET, clamp);
-
-	val = db8500_prcmu_read(PRCM_PLLDSI_ENABLE);
-	if (enable)
-		val |= PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-	else
-		val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-	db8500_prcmu_write(PRCM_PLLDSI_ENABLE, val);
-
-	if (enable) {
-		unsigned int i;
-		bool locked = plldsi_locked();
-
-		for (i = 10; !locked && (i > 0); --i) {
-			udelay(100);
-			locked = plldsi_locked();
-		}
-		if (locked) {
-			db8500_prcmu_write(PRCM_APE_RESETN_SET,
-					   PRCM_APE_RESETN_DSIPLL_RESETN);
-		} else {
-			db8500_prcmu_write(PRCM_MMIP_LS_CLAMP_SET, clamp);
-			val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-			db8500_prcmu_write(PRCM_PLLDSI_ENABLE, val);
-			r = -EAGAIN;
-		}
-	} else {
-		db8500_prcmu_write(PRCM_APE_RESETN_CLR,
-				   PRCM_APE_RESETN_DSIPLL_RESETN);
-	}
-	return r;
-}
-
-static int request_dsiclk(u8 n, bool enable)
-{
-	u32 val;
-
-	val = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
-	val &= ~dsiclk[n].divsel_mask;
-	val |= ((enable ? dsiclk[n].divsel : PRCM_DSI_PLLOUT_SEL_OFF) <<
-		dsiclk[n].divsel_shift);
-	db8500_prcmu_write(PRCM_DSI_PLLOUT_SEL, val);
-	return 0;
-}
-
-static int request_dsiescclk(u8 n, bool enable)
-{
-	u32 val;
-
-	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
-	enable ? (val |= dsiescclk[n].en) : (val &= ~dsiescclk[n].en);
-	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
-	return 0;
-}
-
 int ux500_prcmu_clk_request(u8 clock, bool enable)
 {
 	if (clock == PRCMU_SGACLK)
@@ -369,11 +212,11 @@ int ux500_prcmu_clk_request(u8 clock, bool enable)
 	else if (clock == PRCMU_TIMCLK)
 		return request_timclk(enable);
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return request_dsiclk((clock - PRCMU_DSI0CLK), enable);
+		return ux500_prcmu_request_dsiclk((clock - PRCMU_DSI0CLK), enable);
 	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
-		return request_dsiescclk((clock - PRCMU_DSI0ESCCLK), enable);
+		return ux500_prcmu_request_dsiescclk((clock - PRCMU_DSI0ESCCLK), enable);
 	else if (clock == PRCMU_PLLDSI)
-		return request_plldsi(enable);
+		return ux500_prcmu_request_plldsi(enable);
 	else if (clock == PRCMU_SYSCLK)
 		return db8500_prcmu_request_sysclk(enable);
 	else if ((clock == PRCMU_PLLSOC0) || (clock == PRCMU_PLLSOC1))
@@ -382,8 +225,8 @@ int ux500_prcmu_clk_request(u8 clock, bool enable)
 		return -EINVAL;
 }
 
-static unsigned long pll_rate(unsigned int reg, unsigned long src_rate,
-			      int branch)
+unsigned long ux500_prcmu_pll_rate(unsigned int reg, unsigned long src_rate,
+				  int branch)
 {
 	u64 rate;
 	u32 val;
@@ -438,11 +281,11 @@ static unsigned long clock_rate(u8 clock)
 	pllsw = (val & PRCM_CLK_MGT_CLKPLLSW_MASK);
 
 	if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC0)
-		rate = pll_rate(PRCM_PLLSOC0_FREQ, rate, clk_mgt[clock].branch);
+		rate = ux500_prcmu_pll_rate(PRCM_PLLSOC0_FREQ, rate, clk_mgt[clock].branch);
 	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC1)
-		rate = pll_rate(PRCM_PLLSOC1_FREQ, rate, clk_mgt[clock].branch);
+		rate = ux500_prcmu_pll_rate(PRCM_PLLSOC1_FREQ, rate, clk_mgt[clock].branch);
 	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_DDR)
-		rate = pll_rate(PRCM_PLLDDR_FREQ, rate, clk_mgt[clock].branch);
+		rate = ux500_prcmu_pll_rate(PRCM_PLLDDR_FREQ, rate, clk_mgt[clock].branch);
 	else
 		return 0;
 
@@ -470,7 +313,7 @@ static unsigned long armss_rate(void)
 	if (r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ) {
 		/* External ARMCLKFIX clock */
 
-		rate = pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_FIX);
+		rate = ux500_prcmu_pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_FIX);
 
 		/* Check PRCM_ARM_CHGCLKREQ divider */
 		if (!(r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL))
@@ -482,49 +325,12 @@ static unsigned long armss_rate(void)
 		rate /= r;
 
 	} else {/* ARM PLL */
-		rate = pll_rate(PRCM_PLLARM_FREQ, ROOT_CLOCK_RATE, PLL_DIV);
+		rate = ux500_prcmu_pll_rate(PRCM_PLLARM_FREQ, ROOT_CLOCK_RATE, PLL_DIV);
 	}
 
 	return rate;
 }
 
-static unsigned long dsiclk_rate(u8 n)
-{
-	u32 divsel;
-	u32 div = 1;
-
-	divsel = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
-	divsel = ((divsel & dsiclk[n].divsel_mask) >> dsiclk[n].divsel_shift);
-
-	if (divsel == PRCM_DSI_PLLOUT_SEL_OFF)
-		divsel = dsiclk[n].divsel;
-	else
-		dsiclk[n].divsel = divsel;
-
-	switch (divsel) {
-	case PRCM_DSI_PLLOUT_SEL_PHI_4:
-		div *= 2;
-		fallthrough;
-	case PRCM_DSI_PLLOUT_SEL_PHI_2:
-		div *= 2;
-		fallthrough;
-	case PRCM_DSI_PLLOUT_SEL_PHI:
-		return pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
-			PLL_RAW) / div;
-	default:
-		return 0;
-	}
-}
-
-static unsigned long dsiescclk_rate(u8 n)
-{
-	u32 div;
-
-	div = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
-	div = ((div & dsiescclk[n].div_mask) >> (dsiescclk[n].div_shift));
-	return clock_rate(PRCMU_TVCLK) / max_t(u32, div, 1);
-}
-
 unsigned long ux500_prcmu_clk_rate(u8 clock)
 {
 	if (clock < PRCMU_NUM_REG_CLOCKS)
@@ -535,20 +341,19 @@ unsigned long ux500_prcmu_clk_rate(u8 clock)
 	else if (clock == PRCMU_SYSCLK)
 		return ROOT_CLOCK_RATE;
 	else if (clock == PRCMU_PLLSOC0)
-		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+		return ux500_prcmu_pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
 	else if (clock == PRCMU_PLLSOC1)
-		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+		return ux500_prcmu_pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
 	else if (clock == PRCMU_ARMSS)
 		return armss_rate();
 	else if (clock == PRCMU_PLLDDR)
-		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+		return ux500_prcmu_pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
 	else if (clock == PRCMU_PLLDSI)
-		return pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
-			PLL_RAW);
+		return ux500_prcmu_plldsi_rate();
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return dsiclk_rate(clock - PRCMU_DSI0CLK);
+		return ux500_prcmu_dsiclk_rate(clock - PRCMU_DSI0CLK);
 	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
-		return dsiescclk_rate(clock - PRCMU_DSI0ESCCLK);
+		return ux500_prcmu_dsiescclk_rate(clock - PRCMU_DSI0ESCCLK);
 	else
 		return 0;
 }
@@ -559,16 +364,16 @@ static unsigned long clock_source_rate(u32 clk_mgt_val, int branch)
 		return ROOT_CLOCK_RATE;
 	clk_mgt_val &= PRCM_CLK_MGT_CLKPLLSW_MASK;
 	if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC0)
-		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, branch);
+		return ux500_prcmu_pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, branch);
 	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC1)
-		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, branch);
+		return ux500_prcmu_pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, branch);
 	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_DDR)
-		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, branch);
+		return ux500_prcmu_pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, branch);
 	else
 		return 0;
 }
 
-static u32 clock_divider(unsigned long src_rate, unsigned long rate)
+u32 ux500_prcmu_clk_divider(unsigned long src_rate, unsigned long rate)
 {
 	u32 div;
 
@@ -590,7 +395,7 @@ static long round_clock_rate(u8 clock, unsigned long rate)
 	val = db8500_prcmu_read(clk_mgt[clock].offset);
 	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
 		clk_mgt[clock].branch);
-	div = clock_divider(src_rate, rate);
+	div = ux500_prcmu_clk_divider(src_rate, rate);
 	if (val & PRCM_CLK_MGT_CLK38) {
 		if (clk_mgt[clock].clk38div) {
 			if (div > 2)
@@ -610,83 +415,16 @@ static long round_clock_rate(u8 clock, unsigned long rate)
 	return rounded_rate;
 }
 
-#define MIN_PLL_VCO_RATE 600000000ULL
-#define MAX_PLL_VCO_RATE 1680640000ULL
-
-static long round_plldsi_rate(unsigned long rate)
-{
-	long rounded_rate = 0;
-	unsigned long src_rate;
-	unsigned long rem;
-	u32 r;
-
-	src_rate = clock_rate(PRCMU_HDMICLK);
-	rem = rate;
-
-	for (r = 7; (rem > 0) && (r > 0); r--) {
-		u64 d;
-
-		d = (r * rate);
-		(void)do_div(d, src_rate);
-		if (d < 6)
-			d = 6;
-		else if (d > 255)
-			d = 255;
-		d *= src_rate;
-		if (((2 * d) < (r * MIN_PLL_VCO_RATE)) ||
-			((r * MAX_PLL_VCO_RATE) < (2 * d)))
-			continue;
-		(void)do_div(d, r);
-		if (rate < d) {
-			if (rounded_rate == 0)
-				rounded_rate = (long)d;
-			break;
-		}
-		if ((rate - d) < rem) {
-			rem = (rate - d);
-			rounded_rate = (long)d;
-		}
-	}
-	return rounded_rate;
-}
-
-static long round_dsiclk_rate(unsigned long rate)
-{
-	u32 div;
-	unsigned long src_rate;
-	long rounded_rate;
-
-	src_rate = pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
-		PLL_RAW);
-	div = clock_divider(src_rate, rate);
-	rounded_rate = (src_rate / ((div > 2) ? 4 : div));
-
-	return rounded_rate;
-}
-
-static long round_dsiescclk_rate(unsigned long rate)
-{
-	u32 div;
-	unsigned long src_rate;
-	long rounded_rate;
-
-	src_rate = clock_rate(PRCMU_TVCLK);
-	div = clock_divider(src_rate, rate);
-	rounded_rate = (src_rate / min_t(u32, div, 255));
-
-	return rounded_rate;
-}
-
 long ux500_prcmu_clk_round_rate(u8 clock, unsigned long rate)
 {
 	if (clock < PRCMU_NUM_REG_CLOCKS)
 		return round_clock_rate(clock, rate);
 	else if (clock == PRCMU_PLLDSI)
-		return round_plldsi_rate(rate);
+		return ux500_prcmu_round_plldsi_rate(rate);
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return round_dsiclk_rate(rate);
+		return ux500_prcmu_round_dsiclk_rate(rate);
 	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
-		return round_dsiescclk_rate(rate);
+		return ux500_prcmu_round_dsiescclk_rate(rate);
 	else
 		return (long)ux500_prcmu_clk_rate(clock);
 }
@@ -707,7 +445,7 @@ static void set_clock_rate(u8 clock, unsigned long rate)
 	val = db8500_prcmu_read(clk_mgt[clock].offset);
 	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
 		clk_mgt[clock].branch);
-	div = clock_divider(src_rate, rate);
+	div = ux500_prcmu_clk_divider(src_rate, rate);
 	if (val & PRCM_CLK_MGT_CLK38) {
 		if (clk_mgt[clock].clk38div) {
 			if (div > 1)
@@ -740,91 +478,15 @@ static void set_clock_rate(u8 clock, unsigned long rate)
 	spin_unlock_irqrestore(&clk_mgt_lock, flags);
 }
 
-static int set_plldsi_rate(unsigned long rate)
-{
-	unsigned long src_rate;
-	unsigned long rem;
-	u32 pll_freq = 0;
-	u32 r;
-
-	src_rate = clock_rate(PRCMU_HDMICLK);
-	rem = rate;
-
-	for (r = 7; (rem > 0) && (r > 0); r--) {
-		u64 d;
-		u64 hwrate;
-
-		d = (r * rate);
-		(void)do_div(d, src_rate);
-		if (d < 6)
-			d = 6;
-		else if (d > 255)
-			d = 255;
-		hwrate = (d * src_rate);
-		if (((2 * hwrate) < (r * MIN_PLL_VCO_RATE)) ||
-			((r * MAX_PLL_VCO_RATE) < (2 * hwrate)))
-			continue;
-		(void)do_div(hwrate, r);
-		if (rate < hwrate) {
-			if (pll_freq == 0)
-				pll_freq = (((u32)d << PRCM_PLL_FREQ_D_SHIFT) |
-					(r << PRCM_PLL_FREQ_R_SHIFT));
-			break;
-		}
-		if ((rate - hwrate) < rem) {
-			rem = (rate - hwrate);
-			pll_freq = (((u32)d << PRCM_PLL_FREQ_D_SHIFT) |
-				(r << PRCM_PLL_FREQ_R_SHIFT));
-		}
-	}
-	if (pll_freq == 0)
-		return -EINVAL;
-
-	pll_freq |= (1 << PRCM_PLL_FREQ_N_SHIFT);
-	db8500_prcmu_write(PRCM_PLLDSI_FREQ, pll_freq);
-
-	return 0;
-}
-
-static void set_dsiclk_rate(u8 n, unsigned long rate)
-{
-	u32 val;
-	u32 div;
-
-	div = clock_divider(pll_rate(PRCM_PLLDSI_FREQ,
-			clock_rate(PRCMU_HDMICLK), PLL_RAW), rate);
-
-	dsiclk[n].divsel = (div == 1) ? PRCM_DSI_PLLOUT_SEL_PHI :
-			   (div == 2) ? PRCM_DSI_PLLOUT_SEL_PHI_2 :
-			   /* else */	PRCM_DSI_PLLOUT_SEL_PHI_4;
-
-	val = db8500_prcmu_read(PRCM_DSI_PLLOUT_SEL);
-	val &= ~dsiclk[n].divsel_mask;
-	val |= (dsiclk[n].divsel << dsiclk[n].divsel_shift);
-	db8500_prcmu_write(PRCM_DSI_PLLOUT_SEL, val);
-}
-
-static void set_dsiescclk_rate(u8 n, unsigned long rate)
-{
-	u32 val;
-	u32 div;
-
-	div = clock_divider(clock_rate(PRCMU_TVCLK), rate);
-	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
-	val &= ~dsiescclk[n].div_mask;
-	val |= (min_t(u32, div, 255) << dsiescclk[n].div_shift);
-	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
-}
-
 int ux500_prcmu_clk_set_rate(u8 clock, unsigned long rate)
 {
 	if (clock < PRCMU_NUM_REG_CLOCKS)
 		set_clock_rate(clock, rate);
 	else if (clock == PRCMU_PLLDSI)
-		return set_plldsi_rate(rate);
+		return ux500_prcmu_set_plldsi_rate(rate);
 	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		set_dsiclk_rate((clock - PRCMU_DSI0CLK), rate);
+		ux500_prcmu_set_dsiclk_rate((clock - PRCMU_DSI0CLK), rate);
 	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
-		set_dsiescclk_rate((clock - PRCMU_DSI0ESCCLK), rate);
+		ux500_prcmu_set_dsiescclk_rate((clock - PRCMU_DSI0ESCCLK), rate);
 	return 0;
 }
diff --git a/drivers/clk/ux500/clk-prcmu-hw.h b/drivers/clk/ux500/clk-prcmu-hw.h
index 52fe9eb39c09..dcd437e2730f 100644
--- a/drivers/clk/ux500/clk-prcmu-hw.h
+++ b/drivers/clk/ux500/clk-prcmu-hw.h
@@ -4,9 +4,36 @@
 
 #include <linux/types.h>
 
+#define PRCM_PLL_FREQ_D_SHIFT	0
+#define PRCM_PLL_FREQ_N_SHIFT	8
+#define PRCM_PLL_FREQ_R_SHIFT	16
+
+enum {
+	PLL_RAW,
+	PLL_FIX,
+	PLL_DIV
+};
+
 int ux500_prcmu_clk_request(u8 clock, bool enable);
 unsigned long ux500_prcmu_clk_rate(u8 clock);
 long ux500_prcmu_clk_round_rate(u8 clock, unsigned long rate);
 int ux500_prcmu_clk_set_rate(u8 clock, unsigned long rate);
 
+unsigned long ux500_prcmu_pll_rate(unsigned int reg, unsigned long src_rate,
+				  int branch);
+u32 ux500_prcmu_clk_divider(unsigned long src_rate, unsigned long rate);
+
+int ux500_prcmu_request_plldsi(bool enable);
+int ux500_prcmu_request_dsiclk(u8 n, bool enable);
+int ux500_prcmu_request_dsiescclk(u8 n, bool enable);
+unsigned long ux500_prcmu_dsiclk_rate(u8 n);
+unsigned long ux500_prcmu_dsiescclk_rate(u8 n);
+unsigned long ux500_prcmu_plldsi_rate(void);
+long ux500_prcmu_round_plldsi_rate(unsigned long rate);
+long ux500_prcmu_round_dsiclk_rate(unsigned long rate);
+long ux500_prcmu_round_dsiescclk_rate(unsigned long rate);
+int ux500_prcmu_set_plldsi_rate(unsigned long rate);
+void ux500_prcmu_set_dsiclk_rate(u8 n, unsigned long rate);
+void ux500_prcmu_set_dsiescclk_rate(u8 n, unsigned long rate);
+
 #endif

-- 
2.56.1

