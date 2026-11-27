Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822965;
	b=CLmG+8Zo0HmVwPdw/ZhAAqxNVTtWsrQ7BNql4LOr6OgXLM7yKTaXKM1NLlaaBhtWXlMb
	 qiWodwXpjeZc6zvhHVikxJjGuS0QNlCMquhlcCG1VL3it/VhI068pCrZ7NUrHGMHZl71p
	 egd2s4qyNP6MtpbALo4Ahjy36OnabtYR3GDqgys3k/rVv2Fx1Q6q53Vz3BZ2sR082Ydn7
	 6RsbqX+AzJoY0UYNO56jEFZ0qYsU0Ib4KrhfONJZvKIzQUMM3D24RYh3M6igf/JBI+YPz
	 T81BS2F6oheUwjV8Pul8k6LjttDuHBNuMsp6P75Hx+FUeNylaAya6p01d7pIxbyZe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822965;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=27suijanqLHNw7RcUA2V9ZZkw01OrPFuOHBh1t7OB98=;
	b=VtOU3RpxOb9LBRHzAENn0OIodtdfyGqd/Jz4SbNhejR1Gqn3LNjHvVkMF0x2chONa/Xe
	 6viST5q0WrVneUmzqwBfbaVShZSzFLba+1XZ6pzafhs4ZugvzgFIvoB1EoQwI1mpXLCKt
	 dtORh56ialGYPvcsabnmFTKkZcOujBFCbz2SALGXx603QTi+TFoZwOalicmccz8rfR863
	 8BtfVNEUYhd86tBBOewBCkUjG7N4eM8DGx4V2geoTjooFFkH7i++zAtrXxkO3lTfn9Mqi
	 0Id6ZWc0k6p/CNehsOmO9jyQLwRCwF9kCEVbPHrMF5J9ZMn8hdcv4eudLwhZ0xHB3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0FzOHQF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5E606A31C;
	Fri, 27 Nov 2026 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0FzOHQF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FAB1F00919;
	Fri, 27 Nov 2026 23:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822964;
	bh=27suijanqLHNw7RcUA2V9ZZkw01OrPFuOHBh1t7OB98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H0FzOHQF1DTuMsHLqP92k93PSWZ4qJZ8tdFAe6CZ/6DwIie4eFr+jj1lRsnwySMnC
	 pt2yJrl5Wo5+kh+/626Hzjs9QhQToxBHD1LMFtTHULGHvFFs4YmqRtLKHQGTOeIyNl
	 /E2mq+HKV7AlDPiwTrmFKSE7v2fZGt2rZtoF/yTq12iEjcCtfAkJn7L+tCdxaDaqg7
	 IpaElnZdYLERScJHGUQE0ACh849aUrMWM5Q3aoR4cgU48r2Gy4VPSAeMmHPNU2Nnwp
	 g+ehrhgN3zv6+kJsLMqUaZEJyjjaYKkBbBJbb9SF6PG8JRHQz8nMGA/0BmkMVmscqr
	 sygiqGXWWza6w==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:32 +0100
Subject: [PATCH 4/6] clk: ux500: Move PRCMU clock register handling out of
 MFD
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
Message-Id: <20261128-ux500-prcmu-clock-move-v1-4-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

Keep the PRCMU mapping and the SYSCLK and SoC PLL mailbox commands
in MFD. Move the gate, timer, PLL rate, DSI and divider handling into
the clock driver and use the existing offset-based MMIO accessors.

Preserve the clock management spinlock and the hardware semaphore
around shared clock register updates. Leave rate calculation and
clock IDs unchanged.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/clk/ux500/Makefile       |   2 +-
 drivers/clk/ux500/clk-prcmu-hw.c | 830 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.h |  12 +
 drivers/clk/ux500/clk-prcmu.c    |  19 +-
 drivers/mfd/db8500-prcmu-regs.h  | 112 ------
 drivers/mfd/db8500-prcmu.c       | 725 +---------------------------------
 include/linux/mfd/db8500-prcmu.h |  32 +-
 7 files changed, 857 insertions(+), 875 deletions(-)

diff --git a/drivers/clk/ux500/Makefile b/drivers/clk/ux500/Makefile
index c29b83df403e..afd8c7babcbd 100644
--- a/drivers/clk/ux500/Makefile
+++ b/drivers/clk/ux500/Makefile
@@ -5,7 +5,7 @@
 
 # Clock types
 obj-y += clk-prcc.o
-obj-y += clk-prcmu.o
+obj-y += clk-prcmu.o clk-prcmu-hw.o
 obj-y += clk-sysctrl.o
 
 # Reset control
diff --git a/drivers/clk/ux500/clk-prcmu-hw.c b/drivers/clk/ux500/clk-prcmu-hw.c
new file mode 100644
index 000000000000..db1fc1ca117c
--- /dev/null
+++ b/drivers/clk/ux500/clk-prcmu-hw.c
@@ -0,0 +1,830 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DB8500 PRCMU clock register handling
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
+#include <linux/spinlock.h>
+
+#include "clk-prcmu-hw.h"
+
+/* Offsets in the shared PRCMU register window. */
+#define PRCM_SGACLK_MGT		(0x014)
+#define PRCM_UARTCLK_MGT	(0x018)
+#define PRCM_MSP02CLK_MGT	(0x01C)
+#define PRCM_I2CCLK_MGT		(0x020)
+#define PRCM_SDMMCCLK_MGT	(0x024)
+#define PRCM_SLIMCLK_MGT	(0x028)
+#define PRCM_PER1CLK_MGT	(0x02C)
+#define PRCM_PER2CLK_MGT	(0x030)
+#define PRCM_PER3CLK_MGT	(0x034)
+#define PRCM_PER5CLK_MGT	(0x038)
+#define PRCM_PER6CLK_MGT	(0x03C)
+#define PRCM_PER7CLK_MGT	(0x040)
+#define PRCM_LCDCLK_MGT		(0x044)
+#define PRCM_BMLCLK_MGT		(0x04C)
+#define PRCM_HSITXCLK_MGT	(0x050)
+#define PRCM_HSIRXCLK_MGT	(0x054)
+#define PRCM_HDMICLK_MGT	(0x058)
+#define PRCM_APEATCLK_MGT	(0x05C)
+#define PRCM_APETRACECLK_MGT	(0x060)
+#define PRCM_MCDECLK_MGT	(0x064)
+#define PRCM_IPI2CCLK_MGT	(0x068)
+#define PRCM_DSIALTCLK_MGT	(0x06C)
+#define PRCM_DMACLK_MGT		(0x074)
+#define PRCM_B2R2CLK_MGT	(0x078)
+#define PRCM_TVCLK_MGT		(0x07C)
+#define PRCM_SSPCLK_MGT		(0x280)
+#define PRCM_RNGCLK_MGT		(0x284)
+#define PRCM_UICCCLK_MGT	(0x27C)
+#define PRCM_MSP1CLK_MGT	(0x288)
+#define PRCM_ARM_CHGCLKREQ	0x114
+#define PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ	BIT(0)
+#define PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL	BIT(16)
+#define PRCM_ARMCLKFIX_MGT	0x0
+#define PRCM_MMIP_LS_CLAMP_SET     0x420
+#define PRCM_MMIP_LS_CLAMP_CLR     0x424
+#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP		BIT(11)
+#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI	BIT(22)
+#define PRCM_PLLSOC0_FREQ	   0x080
+#define PRCM_PLLSOC1_FREQ	   0x084
+#define PRCM_PLLARM_FREQ	   0x088
+#define PRCM_PLLDDR_FREQ	   0x08C
+#define PRCM_PLL_FREQ_D_SHIFT	0
+#define PRCM_PLL_FREQ_D_MASK	GENMASK(7, 0)
+#define PRCM_PLL_FREQ_N_SHIFT	8
+#define PRCM_PLL_FREQ_N_MASK	GENMASK(13, 8)
+#define PRCM_PLL_FREQ_R_SHIFT	16
+#define PRCM_PLL_FREQ_R_MASK	GENMASK(18, 16)
+#define PRCM_PLL_FREQ_SELDIV2	BIT(24)
+#define PRCM_PLL_FREQ_DIV2EN	BIT(25)
+#define PRCM_PLLDSI_FREQ           0x500
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
+#define PRCM_SEM                   0x400
+#define PRCM_SEM_PRCM_SEM BIT(0)
+#define PRCM_TCR                   0x1C8
+#define PRCM_TCR_TENSEL_MASK       GENMASK(7, 0)
+#define PRCM_TCR_STOP_TIMERS       BIT(16)
+#define PRCM_TCR_DOZE_MODE         BIT(17)
+#define PRCM_CLK_MGT_CLKPLLDIV_MASK		GENMASK(4, 0)
+#define PRCM_CLK_MGT_CLKPLLSW_SOC0		BIT(5)
+#define PRCM_CLK_MGT_CLKPLLSW_SOC1		BIT(6)
+#define PRCM_CLK_MGT_CLKPLLSW_DDR		BIT(7)
+#define PRCM_CLK_MGT_CLKPLLSW_MASK		GENMASK(7, 5)
+#define PRCM_CLK_MGT_CLKEN			BIT(8)
+#define PRCM_CLK_MGT_CLK38			BIT(9)
+#define PRCM_CLK_MGT_CLK38DIV			BIT(11)
+#define PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN	BIT(12)
+#define PRCM_CGATING_BYPASS		0x134
+#define PRCM_CGATING_BYPASS_ICN2	BIT(6)
+
+struct clk_mgt {
+	u32 offset;
+	u32 pllsw;
+	int branch;
+	bool clk38div;
+};
+
+enum {
+	PLL_RAW,
+	PLL_FIX,
+	PLL_DIV
+};
+
+static DEFINE_SPINLOCK(clk_mgt_lock);
+
+#define CLK_MGT_ENTRY(_name, _branch, _clk38div)[PRCMU_##_name] = \
+	{ PRCM_##_name##_MGT, 0, _branch, _clk38div }
+static struct clk_mgt clk_mgt[PRCMU_NUM_REG_CLOCKS] = {
+	CLK_MGT_ENTRY(SGACLK, PLL_DIV, false),
+	CLK_MGT_ENTRY(UARTCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(MSP02CLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(MSP1CLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(I2CCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(SDMMCCLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(SLIMCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(PER1CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(PER2CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(PER3CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(PER5CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(PER6CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(PER7CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(LCDCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(BMLCLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(HSITXCLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(HSIRXCLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(HDMICLK, PLL_FIX, false),
+	CLK_MGT_ENTRY(APEATCLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(APETRACECLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(MCDECLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(IPI2CCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(DSIALTCLK, PLL_FIX, false),
+	CLK_MGT_ENTRY(DMACLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(B2R2CLK, PLL_DIV, true),
+	CLK_MGT_ENTRY(TVCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(SSPCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(RNGCLK, PLL_FIX, true),
+	CLK_MGT_ENTRY(UICCCLK, PLL_FIX, false),
+};
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
+static bool prcmu_is_ulppll_disabled(void)
+{
+	struct prcmu_fw_version *ver;
+
+	ver = prcmu_get_fw_version();
+	return ver && ver->project == PRCMU_FW_PROJECT_U8420_SYSCLK;
+}
+
+static int request_timclk(bool enable)
+{
+	u32 val;
+
+	/*
+	 * On the U8420_CLKSEL firmware, the ULP (Ultra Low Power)
+	 * PLL is disabled so we cannot use doze mode, this will
+	 * stop the clock on this firmware.
+	 */
+	if (prcmu_is_ulppll_disabled())
+		val = 0;
+	else
+		val = (PRCM_TCR_DOZE_MODE | PRCM_TCR_TENSEL_MASK);
+
+	if (!enable)
+		val |= PRCM_TCR_STOP_TIMERS |
+			PRCM_TCR_DOZE_MODE |
+			PRCM_TCR_TENSEL_MASK;
+
+	db8500_prcmu_write(PRCM_TCR, val);
+
+	return 0;
+}
+
+static int request_clock(u8 clock, bool enable)
+{
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&clk_mgt_lock, flags);
+
+	/* Grab the HW semaphore. */
+	while ((db8500_prcmu_read(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
+		cpu_relax();
+
+	val = db8500_prcmu_read(clk_mgt[clock].offset);
+	if (enable) {
+		val |= (PRCM_CLK_MGT_CLKEN | clk_mgt[clock].pllsw);
+	} else {
+		clk_mgt[clock].pllsw = (val & PRCM_CLK_MGT_CLKPLLSW_MASK);
+		val &= ~(PRCM_CLK_MGT_CLKEN | PRCM_CLK_MGT_CLKPLLSW_MASK);
+	}
+	db8500_prcmu_write(clk_mgt[clock].offset, val);
+
+	/* Release the HW semaphore. */
+	db8500_prcmu_write(PRCM_SEM, 0);
+
+	spin_unlock_irqrestore(&clk_mgt_lock, flags);
+
+	return 0;
+}
+
+static int request_sga_clock(u8 clock, bool enable)
+{
+	u32 val;
+	int ret;
+
+	if (enable) {
+		val = db8500_prcmu_read(PRCM_CGATING_BYPASS);
+		db8500_prcmu_write(PRCM_CGATING_BYPASS, val | PRCM_CGATING_BYPASS_ICN2);
+	}
+
+	ret = request_clock(clock, enable);
+
+	if (!ret && !enable) {
+		val = db8500_prcmu_read(PRCM_CGATING_BYPASS);
+		db8500_prcmu_write(PRCM_CGATING_BYPASS, val & ~PRCM_CGATING_BYPASS_ICN2);
+	}
+
+	return ret;
+}
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
+static int request_plldsi(bool enable)
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
+static int request_dsiclk(u8 n, bool enable)
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
+static int request_dsiescclk(u8 n, bool enable)
+{
+	u32 val;
+
+	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	enable ? (val |= dsiescclk[n].en) : (val &= ~dsiescclk[n].en);
+	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
+	return 0;
+}
+
+int ux500_prcmu_clk_request(u8 clock, bool enable)
+{
+	if (clock == PRCMU_SGACLK)
+		return request_sga_clock(clock, enable);
+	else if (clock < PRCMU_NUM_REG_CLOCKS)
+		return request_clock(clock, enable);
+	else if (clock == PRCMU_TIMCLK)
+		return request_timclk(enable);
+	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
+		return request_dsiclk((clock - PRCMU_DSI0CLK), enable);
+	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
+		return request_dsiescclk((clock - PRCMU_DSI0ESCCLK), enable);
+	else if (clock == PRCMU_PLLDSI)
+		return request_plldsi(enable);
+	else if (clock == PRCMU_SYSCLK)
+		return db8500_prcmu_request_sysclk(enable);
+	else if ((clock == PRCMU_PLLSOC0) || (clock == PRCMU_PLLSOC1))
+		return db8500_prcmu_request_pll(clock, enable);
+	else
+		return -EINVAL;
+}
+
+static unsigned long pll_rate(unsigned int reg, unsigned long src_rate,
+			      int branch)
+{
+	u64 rate;
+	u32 val;
+	u32 d;
+	u32 div = 1;
+
+	val = db8500_prcmu_read(reg);
+
+	rate = src_rate;
+	rate *= ((val & PRCM_PLL_FREQ_D_MASK) >> PRCM_PLL_FREQ_D_SHIFT);
+
+	d = ((val & PRCM_PLL_FREQ_N_MASK) >> PRCM_PLL_FREQ_N_SHIFT);
+	if (d > 1)
+		div *= d;
+
+	d = ((val & PRCM_PLL_FREQ_R_MASK) >> PRCM_PLL_FREQ_R_SHIFT);
+	if (d > 1)
+		div *= d;
+
+	if (val & PRCM_PLL_FREQ_SELDIV2)
+		div *= 2;
+
+	if ((branch == PLL_FIX) || ((branch == PLL_DIV) &&
+		(val & PRCM_PLL_FREQ_DIV2EN) &&
+		((reg == PRCM_PLLSOC0_FREQ) ||
+		 (reg == PRCM_PLLARM_FREQ) ||
+		 (reg == PRCM_PLLDDR_FREQ))))
+		div *= 2;
+
+	(void)do_div(rate, div);
+
+	return (unsigned long)rate;
+}
+
+#define ROOT_CLOCK_RATE 38400000
+
+static unsigned long clock_rate(u8 clock)
+{
+	u32 val;
+	u32 pllsw;
+	unsigned long rate = ROOT_CLOCK_RATE;
+
+	val = db8500_prcmu_read(clk_mgt[clock].offset);
+
+	if (val & PRCM_CLK_MGT_CLK38) {
+		if (clk_mgt[clock].clk38div && (val & PRCM_CLK_MGT_CLK38DIV))
+			rate /= 2;
+		return rate;
+	}
+
+	val |= clk_mgt[clock].pllsw;
+	pllsw = (val & PRCM_CLK_MGT_CLKPLLSW_MASK);
+
+	if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC0)
+		rate = pll_rate(PRCM_PLLSOC0_FREQ, rate, clk_mgt[clock].branch);
+	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC1)
+		rate = pll_rate(PRCM_PLLSOC1_FREQ, rate, clk_mgt[clock].branch);
+	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_DDR)
+		rate = pll_rate(PRCM_PLLDDR_FREQ, rate, clk_mgt[clock].branch);
+	else
+		return 0;
+
+	if ((clock == PRCMU_SGACLK) &&
+		(val & PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN)) {
+		u64 r = (rate * 10);
+
+		(void)do_div(r, 25);
+		return (unsigned long)r;
+	}
+	val &= PRCM_CLK_MGT_CLKPLLDIV_MASK;
+	if (val)
+		return rate / val;
+	else
+		return 0;
+}
+
+static unsigned long armss_rate(void)
+{
+	u32 r;
+	unsigned long rate;
+
+	r = db8500_prcmu_read(PRCM_ARM_CHGCLKREQ);
+
+	if (r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ) {
+		/* External ARMCLKFIX clock */
+
+		rate = pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_FIX);
+
+		/* Check PRCM_ARM_CHGCLKREQ divider */
+		if (!(r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL))
+			rate /= 2;
+
+		/* Check PRCM_ARMCLKFIX_MGT divider */
+		r = db8500_prcmu_read(PRCM_ARMCLKFIX_MGT);
+		r &= PRCM_CLK_MGT_CLKPLLDIV_MASK;
+		rate /= r;
+
+	} else {/* ARM PLL */
+		rate = pll_rate(PRCM_PLLARM_FREQ, ROOT_CLOCK_RATE, PLL_DIV);
+	}
+
+	return rate;
+}
+
+static unsigned long dsiclk_rate(u8 n)
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
+		return pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
+			PLL_RAW) / div;
+	default:
+		return 0;
+	}
+}
+
+static unsigned long dsiescclk_rate(u8 n)
+{
+	u32 div;
+
+	div = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	div = ((div & dsiescclk[n].div_mask) >> (dsiescclk[n].div_shift));
+	return clock_rate(PRCMU_TVCLK) / max_t(u32, div, 1);
+}
+
+unsigned long ux500_prcmu_clk_rate(u8 clock)
+{
+	if (clock < PRCMU_NUM_REG_CLOCKS)
+		return clock_rate(clock);
+	else if (clock == PRCMU_TIMCLK)
+		return prcmu_is_ulppll_disabled() ?
+			32768 : ROOT_CLOCK_RATE / 16;
+	else if (clock == PRCMU_SYSCLK)
+		return ROOT_CLOCK_RATE;
+	else if (clock == PRCMU_PLLSOC0)
+		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+	else if (clock == PRCMU_PLLSOC1)
+		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+	else if (clock == PRCMU_ARMSS)
+		return armss_rate();
+	else if (clock == PRCMU_PLLDDR)
+		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
+	else if (clock == PRCMU_PLLDSI)
+		return pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
+			PLL_RAW);
+	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
+		return dsiclk_rate(clock - PRCMU_DSI0CLK);
+	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
+		return dsiescclk_rate(clock - PRCMU_DSI0ESCCLK);
+	else
+		return 0;
+}
+
+static unsigned long clock_source_rate(u32 clk_mgt_val, int branch)
+{
+	if (clk_mgt_val & PRCM_CLK_MGT_CLK38)
+		return ROOT_CLOCK_RATE;
+	clk_mgt_val &= PRCM_CLK_MGT_CLKPLLSW_MASK;
+	if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC0)
+		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, branch);
+	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC1)
+		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, branch);
+	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_DDR)
+		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, branch);
+	else
+		return 0;
+}
+
+static u32 clock_divider(unsigned long src_rate, unsigned long rate)
+{
+	u32 div;
+
+	div = (src_rate / rate);
+	if (div == 0)
+		return 1;
+	if (rate < (src_rate / div))
+		div++;
+	return div;
+}
+
+static long round_clock_rate(u8 clock, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+	unsigned long src_rate;
+	long rounded_rate;
+
+	val = db8500_prcmu_read(clk_mgt[clock].offset);
+	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
+		clk_mgt[clock].branch);
+	div = clock_divider(src_rate, rate);
+	if (val & PRCM_CLK_MGT_CLK38) {
+		if (clk_mgt[clock].clk38div) {
+			if (div > 2)
+				div = 2;
+		} else {
+			div = 1;
+		}
+	} else if ((clock == PRCMU_SGACLK) && (div == 3)) {
+		u64 r = (src_rate * 10);
+
+		(void)do_div(r, 25);
+		if (r <= rate)
+			return (unsigned long)r;
+	}
+	rounded_rate = (src_rate / min_t(u32, div, 31));
+
+	return rounded_rate;
+}
+
+#define MIN_PLL_VCO_RATE 600000000ULL
+#define MAX_PLL_VCO_RATE 1680640000ULL
+
+static long round_plldsi_rate(unsigned long rate)
+{
+	long rounded_rate = 0;
+	unsigned long src_rate;
+	unsigned long rem;
+	u32 r;
+
+	src_rate = clock_rate(PRCMU_HDMICLK);
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
+static long round_dsiclk_rate(unsigned long rate)
+{
+	u32 div;
+	unsigned long src_rate;
+	long rounded_rate;
+
+	src_rate = pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
+		PLL_RAW);
+	div = clock_divider(src_rate, rate);
+	rounded_rate = (src_rate / ((div > 2) ? 4 : div));
+
+	return rounded_rate;
+}
+
+static long round_dsiescclk_rate(unsigned long rate)
+{
+	u32 div;
+	unsigned long src_rate;
+	long rounded_rate;
+
+	src_rate = clock_rate(PRCMU_TVCLK);
+	div = clock_divider(src_rate, rate);
+	rounded_rate = (src_rate / min_t(u32, div, 255));
+
+	return rounded_rate;
+}
+
+long ux500_prcmu_clk_round_rate(u8 clock, unsigned long rate)
+{
+	if (clock < PRCMU_NUM_REG_CLOCKS)
+		return round_clock_rate(clock, rate);
+	else if (clock == PRCMU_PLLDSI)
+		return round_plldsi_rate(rate);
+	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
+		return round_dsiclk_rate(rate);
+	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
+		return round_dsiescclk_rate(rate);
+	else
+		return (long)ux500_prcmu_clk_rate(clock);
+}
+
+static void set_clock_rate(u8 clock, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+	unsigned long src_rate;
+	unsigned long flags;
+
+	spin_lock_irqsave(&clk_mgt_lock, flags);
+
+	/* Grab the HW semaphore. */
+	while ((db8500_prcmu_read(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
+		cpu_relax();
+
+	val = db8500_prcmu_read(clk_mgt[clock].offset);
+	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
+		clk_mgt[clock].branch);
+	div = clock_divider(src_rate, rate);
+	if (val & PRCM_CLK_MGT_CLK38) {
+		if (clk_mgt[clock].clk38div) {
+			if (div > 1)
+				val |= PRCM_CLK_MGT_CLK38DIV;
+			else
+				val &= ~PRCM_CLK_MGT_CLK38DIV;
+		}
+	} else if (clock == PRCMU_SGACLK) {
+		val &= ~(PRCM_CLK_MGT_CLKPLLDIV_MASK |
+			PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN);
+		if (div == 3) {
+			u64 r = (src_rate * 10);
+
+			(void)do_div(r, 25);
+			if (r <= rate) {
+				val |= PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN;
+				div = 0;
+			}
+		}
+		val |= min_t(u32, div, 31);
+	} else {
+		val &= ~PRCM_CLK_MGT_CLKPLLDIV_MASK;
+		val |= min_t(u32, div, 31);
+	}
+	db8500_prcmu_write(clk_mgt[clock].offset, val);
+
+	/* Release the HW semaphore. */
+	db8500_prcmu_write(PRCM_SEM, 0);
+
+	spin_unlock_irqrestore(&clk_mgt_lock, flags);
+}
+
+static int set_plldsi_rate(unsigned long rate)
+{
+	unsigned long src_rate;
+	unsigned long rem;
+	u32 pll_freq = 0;
+	u32 r;
+
+	src_rate = clock_rate(PRCMU_HDMICLK);
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
+static void set_dsiclk_rate(u8 n, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+
+	div = clock_divider(pll_rate(PRCM_PLLDSI_FREQ,
+			clock_rate(PRCMU_HDMICLK), PLL_RAW), rate);
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
+static void set_dsiescclk_rate(u8 n, unsigned long rate)
+{
+	u32 val;
+	u32 div;
+
+	div = clock_divider(clock_rate(PRCMU_TVCLK), rate);
+	val = db8500_prcmu_read(PRCM_DSITVCLK_DIV);
+	val &= ~dsiescclk[n].div_mask;
+	val |= (min_t(u32, div, 255) << dsiescclk[n].div_shift);
+	db8500_prcmu_write(PRCM_DSITVCLK_DIV, val);
+}
+
+int ux500_prcmu_clk_set_rate(u8 clock, unsigned long rate)
+{
+	if (clock < PRCMU_NUM_REG_CLOCKS)
+		set_clock_rate(clock, rate);
+	else if (clock == PRCMU_PLLDSI)
+		return set_plldsi_rate(rate);
+	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
+		set_dsiclk_rate((clock - PRCMU_DSI0CLK), rate);
+	else if (clock >= PRCMU_DSI0ESCCLK && clock <= PRCMU_DSI2ESCCLK)
+		set_dsiescclk_rate((clock - PRCMU_DSI0ESCCLK), rate);
+	return 0;
+}
diff --git a/drivers/clk/ux500/clk-prcmu-hw.h b/drivers/clk/ux500/clk-prcmu-hw.h
new file mode 100644
index 000000000000..52fe9eb39c09
--- /dev/null
+++ b/drivers/clk/ux500/clk-prcmu-hw.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef UX500_CLK_PRCMU_HW_H
+#define UX500_CLK_PRCMU_HW_H
+
+#include <linux/types.h>
+
+int ux500_prcmu_clk_request(u8 clock, bool enable);
+unsigned long ux500_prcmu_clk_rate(u8 clock);
+long ux500_prcmu_clk_round_rate(u8 clock, unsigned long rate);
+int ux500_prcmu_clk_set_rate(u8 clock, unsigned long rate);
+
+#endif
diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 82c905394eff..f9c13c28b810 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include "clk.h"
+#include "clk-prcmu-hw.h"
 
 #define to_clk_prcmu(_hw) container_of(_hw, struct clk_prcmu, hw)
 #define to_clk_prcmu_clkout(_hw) container_of(_hw, struct clk_prcmu_clkout, hw)
@@ -37,13 +38,13 @@ static int clk_prcmu_prepare(struct clk_hw *hw)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
 
-	return db8500_prcmu_request_clock(clk->cg_sel, true);
+	return ux500_prcmu_clk_request(clk->cg_sel, true);
 }
 
 static void clk_prcmu_unprepare(struct clk_hw *hw)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	if (db8500_prcmu_request_clock(clk->cg_sel, false))
+	if (ux500_prcmu_clk_request(clk->cg_sel, false))
 		pr_err("clk_prcmu: %s failed to disable %s.\n", __func__,
 		       clk_hw_get_name(hw));
 }
@@ -52,7 +53,7 @@ static unsigned long clk_prcmu_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	return prcmu_clock_rate(clk->cg_sel);
+	return ux500_prcmu_clk_rate(clk->cg_sel);
 }
 
 static const struct {
@@ -103,7 +104,7 @@ static int clk_prcmu_set_clock_rate(u8 clock, unsigned long rate)
 	if (clock == PRCMU_ARMSS)
 		return clk_prcmu_set_armss_rate(rate);
 
-	return prcmu_set_clock_rate(clock, rate);
+	return ux500_prcmu_clk_set_rate(clock, rate);
 }
 
 static int clk_prcmu_determine_rate(struct clk_hw *hw,
@@ -114,7 +115,7 @@ static int clk_prcmu_determine_rate(struct clk_hw *hw,
 	if (clk->cg_sel == PRCMU_ARMSS)
 		req->rate = clk_prcmu_round_armss_rate(req->rate);
 	else
-		req->rate = prcmu_round_clock_rate(clk->cg_sel, req->rate);
+		req->rate = ux500_prcmu_clk_round_rate(clk->cg_sel, req->rate);
 
 	return 0;
 }
@@ -143,7 +144,7 @@ static int clk_prcmu_opp_prepare(struct clk_hw *hw)
 		clk->opp_requested = 1;
 	}
 
-	err = db8500_prcmu_request_clock(clk->cg_sel, true);
+	err = ux500_prcmu_clk_request(clk->cg_sel, true);
 	if (err) {
 		prcmu_qos_remove_requirement(PRCMU_QOS_APE_OPP,
 					(char *)clk_hw_get_name(hw));
@@ -158,7 +159,7 @@ static void clk_prcmu_opp_unprepare(struct clk_hw *hw)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
 
-	if (db8500_prcmu_request_clock(clk->cg_sel, false)) {
+	if (ux500_prcmu_clk_request(clk->cg_sel, false)) {
 		pr_err("clk_prcmu: %s failed to disable %s.\n", __func__,
 			clk_hw_get_name(hw));
 		return;
@@ -186,7 +187,7 @@ static int clk_prcmu_opp_volt_prepare(struct clk_hw *hw)
 		clk->opp_requested = 1;
 	}
 
-	err = db8500_prcmu_request_clock(clk->cg_sel, true);
+	err = ux500_prcmu_clk_request(clk->cg_sel, true);
 	if (err) {
 		db8500_prcmu_request_ape_opp_100_voltage(false);
 		clk->opp_requested = 0;
@@ -200,7 +201,7 @@ static void clk_prcmu_opp_volt_unprepare(struct clk_hw *hw)
 {
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
 
-	if (db8500_prcmu_request_clock(clk->cg_sel, false)) {
+	if (ux500_prcmu_clk_request(clk->cg_sel, false)) {
 		pr_err("clk_prcmu: %s failed to disable %s.\n", __func__,
 			clk_hw_get_name(hw));
 		return;
diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index e024400c4e80..1fda4ca043e0 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -17,36 +17,7 @@
 #define PRCM_ACLK_MGT		(0x004)
 #define PRCM_SVAMMCSPCLK_MGT	(0x008)
 #define PRCM_SIAMMDSPCLK_MGT	(0x00C)
-#define PRCM_SGACLK_MGT		(0x014)
-#define PRCM_UARTCLK_MGT	(0x018)
-#define PRCM_MSP02CLK_MGT	(0x01C)
-#define PRCM_I2CCLK_MGT		(0x020)
-#define PRCM_SDMMCCLK_MGT	(0x024)
-#define PRCM_SLIMCLK_MGT	(0x028)
-#define PRCM_PER1CLK_MGT	(0x02C)
-#define PRCM_PER2CLK_MGT	(0x030)
-#define PRCM_PER3CLK_MGT	(0x034)
-#define PRCM_PER5CLK_MGT	(0x038)
-#define PRCM_PER6CLK_MGT	(0x03C)
-#define PRCM_PER7CLK_MGT	(0x040)
-#define PRCM_LCDCLK_MGT		(0x044)
-#define PRCM_BMLCLK_MGT		(0x04C)
-#define PRCM_HSITXCLK_MGT	(0x050)
-#define PRCM_HSIRXCLK_MGT	(0x054)
-#define PRCM_HDMICLK_MGT	(0x058)
-#define PRCM_APEATCLK_MGT	(0x05C)
-#define PRCM_APETRACECLK_MGT	(0x060)
-#define PRCM_MCDECLK_MGT	(0x064)
-#define PRCM_IPI2CCLK_MGT	(0x068)
-#define PRCM_DSIALTCLK_MGT	(0x06C)
-#define PRCM_DMACLK_MGT		(0x074)
-#define PRCM_B2R2CLK_MGT	(0x078)
-#define PRCM_TVCLK_MGT		(0x07C)
 #define PRCM_UNIPROCLK_MGT	(0x278)
-#define PRCM_SSPCLK_MGT		(0x280)
-#define PRCM_RNGCLK_MGT		(0x284)
-#define PRCM_UICCCLK_MGT	(0x27C)
-#define PRCM_MSP1CLK_MGT	(0x288)
 
 #define PRCM_ARM_PLLDIVPS	(prcmu_base + 0x118)
 #define PRCM_ARM_PLLDIVPS_ARM_BRM_RATE		0x3f
@@ -55,15 +26,10 @@
 #define PRCM_PLLARM_LOCKP       (prcmu_base + 0x0a8)
 #define PRCM_PLLARM_LOCKP_PRCM_PLLARM_LOCKP3	0x2
 
-#define PRCM_ARM_CHGCLKREQ	(prcmu_base + 0x114)
-#define PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ	BIT(0)
-#define PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL	BIT(16)
-
 #define PRCM_PLLARM_ENABLE	(prcmu_base + 0x98)
 #define PRCM_PLLARM_ENABLE_PRCM_PLLARM_ENABLE	0x1
 #define PRCM_PLLARM_ENABLE_PRCM_PLLARM_COUNTON	0x100
 
-#define PRCM_ARMCLKFIX_MGT	(prcmu_base + 0x0)
 #define PRCM_A9PL_FORCE_CLKEN	(prcmu_base + 0x19C)
 #define PRCM_A9_RESETN_CLR	(prcmu_base + 0x1f4)
 #define PRCM_A9_RESETN_SET	(prcmu_base + 0x1f0)
@@ -104,63 +70,6 @@
 /* System reset register */
 #define PRCM_APE_SOFTRST	(prcmu_base + 0x228)
 
-/* Level shifter and clamp control registers */
-#define PRCM_MMIP_LS_CLAMP_SET     (prcmu_base + 0x420)
-#define PRCM_MMIP_LS_CLAMP_CLR     (prcmu_base + 0x424)
-
-#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP		BIT(11)
-#define PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI	BIT(22)
-
-/* PRCMU clock/PLL/reset registers */
-#define PRCM_PLLSOC0_FREQ	   (prcmu_base + 0x080)
-#define PRCM_PLLSOC1_FREQ	   (prcmu_base + 0x084)
-#define PRCM_PLLARM_FREQ	   (prcmu_base + 0x088)
-#define PRCM_PLLDDR_FREQ	   (prcmu_base + 0x08C)
-#define PRCM_PLL_FREQ_D_SHIFT	0
-#define PRCM_PLL_FREQ_D_MASK	BITS(0, 7)
-#define PRCM_PLL_FREQ_N_SHIFT	8
-#define PRCM_PLL_FREQ_N_MASK	BITS(8, 13)
-#define PRCM_PLL_FREQ_R_SHIFT	16
-#define PRCM_PLL_FREQ_R_MASK	BITS(16, 18)
-#define PRCM_PLL_FREQ_SELDIV2	BIT(24)
-#define PRCM_PLL_FREQ_DIV2EN	BIT(25)
-
-#define PRCM_PLLDSI_FREQ           (prcmu_base + 0x500)
-#define PRCM_PLLDSI_ENABLE         (prcmu_base + 0x504)
-#define PRCM_PLLDSI_LOCKP          (prcmu_base + 0x508)
-#define PRCM_DSI_PLLOUT_SEL        (prcmu_base + 0x530)
-#define PRCM_DSITVCLK_DIV          (prcmu_base + 0x52C)
-#define PRCM_PLLDSI_LOCKP          (prcmu_base + 0x508)
-#define PRCM_APE_RESETN_SET        (prcmu_base + 0x1E4)
-#define PRCM_APE_RESETN_CLR        (prcmu_base + 0x1E8)
-
-#define PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE BIT(0)
-
-#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10	BIT(0)
-#define PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3	BIT(1)
-
-#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_SHIFT	0
-#define PRCM_DSI_PLLOUT_SEL_DSI0_PLLOUT_DIVSEL_MASK	BITS(0, 2)
-#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_SHIFT	8
-#define PRCM_DSI_PLLOUT_SEL_DSI1_PLLOUT_DIVSEL_MASK	BITS(8, 10)
-
-#define PRCM_DSI_PLLOUT_SEL_OFF		0
-#define PRCM_DSI_PLLOUT_SEL_PHI		1
-#define PRCM_DSI_PLLOUT_SEL_PHI_2	2
-#define PRCM_DSI_PLLOUT_SEL_PHI_4	3
-
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_SHIFT	0
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_DIV_MASK		BITS(0, 7)
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_SHIFT	8
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_DIV_MASK		BITS(8, 15)
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_SHIFT	16
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_DIV_MASK		BITS(16, 23)
-#define PRCM_DSITVCLK_DIV_DSI0_ESC_CLK_EN		BIT(24)
-#define PRCM_DSITVCLK_DIV_DSI1_ESC_CLK_EN		BIT(25)
-#define PRCM_DSITVCLK_DIV_DSI2_ESC_CLK_EN		BIT(26)
-
-#define PRCM_APE_RESETN_DSIPLL_RESETN BIT(14)
-
 /* ePOD and memory power signal control registers */
 #define PRCM_EPOD_C_SET            (prcmu_base + 0x410)
 #define PRCM_SRAM_LS_SLEEP         (prcmu_base + 0x304)
@@ -174,31 +83,10 @@
 #define PRCM_GPIOCR_DBG_STM_MOD_CMD1            0x800
 #define PRCM_GPIOCR_DBG_UARTMOD_CMD0            0x1
 
-/* PRCMU HW semaphore */
-#define PRCM_SEM                   (prcmu_base + 0x400)
-#define PRCM_SEM_PRCM_SEM BIT(0)
-
-#define PRCM_TCR                   (prcmu_base + 0x1C8)
-#define PRCM_TCR_TENSEL_MASK       BITS(0, 7)
-#define PRCM_TCR_STOP_TIMERS       BIT(16)
-#define PRCM_TCR_DOZE_MODE         BIT(17)
-
-#define PRCM_CLK_MGT_CLKPLLDIV_MASK		BITS(0, 4)
-#define PRCM_CLK_MGT_CLKPLLSW_SOC0		BIT(5)
-#define PRCM_CLK_MGT_CLKPLLSW_SOC1		BIT(6)
-#define PRCM_CLK_MGT_CLKPLLSW_DDR		BIT(7)
-#define PRCM_CLK_MGT_CLKPLLSW_MASK		BITS(5, 7)
-#define PRCM_CLK_MGT_CLKEN			BIT(8)
-#define PRCM_CLK_MGT_CLK38			BIT(9)
-#define PRCM_CLK_MGT_CLK38DIV			BIT(11)
-#define PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN	BIT(12)
-
 /* GPIOCR register */
 #define PRCM_GPIOCR_SPI2_SELECT BIT(23)
 
 #define PRCM_DDR_SUBSYS_APE_MINBW	(prcmu_base + 0x438)
-#define PRCM_CGATING_BYPASS		(prcmu_base + 0x134)
-#define PRCM_CGATING_BYPASS_ICN2	BIT(6)
 
 /* Miscellaneous unit registers */
 #define PRCM_RESOUTN_SET		(prcmu_base + 0x214)
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 1c58cf804e4e..98ab0dc3d145 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -446,98 +446,6 @@ static DEFINE_SPINLOCK(prcmu_lock);
 static __iomem void *tcdm_base;
 static __iomem void *prcmu_base;
 
-struct clk_mgt {
-	u32 offset;
-	u32 pllsw;
-	int branch;
-	bool clk38div;
-};
-
-enum {
-	PLL_RAW,
-	PLL_FIX,
-	PLL_DIV
-};
-
-static DEFINE_SPINLOCK(clk_mgt_lock);
-
-#define CLK_MGT_ENTRY(_name, _branch, _clk38div)[PRCMU_##_name] = \
-	{ (PRCM_##_name##_MGT), 0 , _branch, _clk38div}
-static struct clk_mgt clk_mgt[PRCMU_NUM_REG_CLOCKS] = {
-	CLK_MGT_ENTRY(SGACLK, PLL_DIV, false),
-	CLK_MGT_ENTRY(UARTCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(MSP02CLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(MSP1CLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(I2CCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(SDMMCCLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(SLIMCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(PER1CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(PER2CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(PER3CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(PER5CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(PER6CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(PER7CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(LCDCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(BMLCLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(HSITXCLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(HSIRXCLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(HDMICLK, PLL_FIX, false),
-	CLK_MGT_ENTRY(APEATCLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(APETRACECLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(MCDECLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(IPI2CCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(DSIALTCLK, PLL_FIX, false),
-	CLK_MGT_ENTRY(DMACLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(B2R2CLK, PLL_DIV, true),
-	CLK_MGT_ENTRY(TVCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(SSPCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(RNGCLK, PLL_FIX, true),
-	CLK_MGT_ENTRY(UICCCLK, PLL_FIX, false),
-};
-
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
 u32 db8500_prcmu_read(unsigned int reg)
 {
 	return readl(prcmu_base + reg);
@@ -569,14 +477,6 @@ struct prcmu_fw_version *prcmu_get_fw_version(void)
 	return fw_info.valid ? &fw_info.version : NULL;
 }
 
-static bool prcmu_is_ulppll_disabled(void)
-{
-	struct prcmu_fw_version *ver;
-
-	ver = prcmu_get_fw_version();
-	return ver && ver->project == PRCMU_FW_PROJECT_U8420_SYSCLK;
-}
-
 bool prcmu_has_arm_maxopp(void)
 {
 	return (readb(tcdm_base + PRCM_AVS_VARM_MAX_OPP) &
@@ -908,7 +808,7 @@ int prcmu_release_usb_wakeup_state(void)
 	return r;
 }
 
-static int request_pll(u8 clock, bool enable)
+int db8500_prcmu_request_pll(u8 clock, bool enable)
 {
 	int r = 0;
 
@@ -1059,7 +959,7 @@ bool prcmu_is_auto_pm_enabled(void)
 	return mb2_transfer.auto_pm_enabled;
 }
 
-static int request_sysclk(bool enable)
+int db8500_prcmu_request_sysclk(bool enable)
 {
 	int r;
 	unsigned long flags;
@@ -1096,627 +996,6 @@ static int request_sysclk(bool enable)
 	return r;
 }
 
-static int request_timclk(bool enable)
-{
-	u32 val;
-
-	/*
-	 * On the U8420_CLKSEL firmware, the ULP (Ultra Low Power)
-	 * PLL is disabled so we cannot use doze mode, this will
-	 * stop the clock on this firmware.
-	 */
-	if (prcmu_is_ulppll_disabled())
-		val = 0;
-	else
-		val = (PRCM_TCR_DOZE_MODE | PRCM_TCR_TENSEL_MASK);
-
-	if (!enable)
-		val |= PRCM_TCR_STOP_TIMERS |
-			PRCM_TCR_DOZE_MODE |
-			PRCM_TCR_TENSEL_MASK;
-
-	writel(val, PRCM_TCR);
-
-	return 0;
-}
-
-static int request_clock(u8 clock, bool enable)
-{
-	u32 val;
-	unsigned long flags;
-
-	spin_lock_irqsave(&clk_mgt_lock, flags);
-
-	/* Grab the HW semaphore. */
-	while ((readl(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
-		cpu_relax();
-
-	val = readl(prcmu_base + clk_mgt[clock].offset);
-	if (enable) {
-		val |= (PRCM_CLK_MGT_CLKEN | clk_mgt[clock].pllsw);
-	} else {
-		clk_mgt[clock].pllsw = (val & PRCM_CLK_MGT_CLKPLLSW_MASK);
-		val &= ~(PRCM_CLK_MGT_CLKEN | PRCM_CLK_MGT_CLKPLLSW_MASK);
-	}
-	writel(val, prcmu_base + clk_mgt[clock].offset);
-
-	/* Release the HW semaphore. */
-	writel(0, PRCM_SEM);
-
-	spin_unlock_irqrestore(&clk_mgt_lock, flags);
-
-	return 0;
-}
-
-static int request_sga_clock(u8 clock, bool enable)
-{
-	u32 val;
-	int ret;
-
-	if (enable) {
-		val = readl(PRCM_CGATING_BYPASS);
-		writel(val | PRCM_CGATING_BYPASS_ICN2, PRCM_CGATING_BYPASS);
-	}
-
-	ret = request_clock(clock, enable);
-
-	if (!ret && !enable) {
-		val = readl(PRCM_CGATING_BYPASS);
-		writel(val & ~PRCM_CGATING_BYPASS_ICN2, PRCM_CGATING_BYPASS);
-	}
-
-	return ret;
-}
-
-static inline bool plldsi_locked(void)
-{
-	return (readl(PRCM_PLLDSI_LOCKP) &
-		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
-		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3)) ==
-		(PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP10 |
-		 PRCM_PLLDSI_LOCKP_PRCM_PLLDSI_LOCKP3);
-}
-
-static int request_plldsi(bool enable)
-{
-	int r = 0;
-	u32 val;
-
-	writel((PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP |
-		PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI), (enable ?
-		PRCM_MMIP_LS_CLAMP_CLR : PRCM_MMIP_LS_CLAMP_SET));
-
-	val = readl(PRCM_PLLDSI_ENABLE);
-	if (enable)
-		val |= PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-	else
-		val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-	writel(val, PRCM_PLLDSI_ENABLE);
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
-			writel(PRCM_APE_RESETN_DSIPLL_RESETN,
-				PRCM_APE_RESETN_SET);
-		} else {
-			writel((PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMP |
-				PRCM_MMIP_LS_CLAMP_DSIPLL_CLAMPI),
-				PRCM_MMIP_LS_CLAMP_SET);
-			val &= ~PRCM_PLLDSI_ENABLE_PRCM_PLLDSI_ENABLE;
-			writel(val, PRCM_PLLDSI_ENABLE);
-			r = -EAGAIN;
-		}
-	} else {
-		writel(PRCM_APE_RESETN_DSIPLL_RESETN, PRCM_APE_RESETN_CLR);
-	}
-	return r;
-}
-
-static int request_dsiclk(u8 n, bool enable)
-{
-	u32 val;
-
-	val = readl(PRCM_DSI_PLLOUT_SEL);
-	val &= ~dsiclk[n].divsel_mask;
-	val |= ((enable ? dsiclk[n].divsel : PRCM_DSI_PLLOUT_SEL_OFF) <<
-		dsiclk[n].divsel_shift);
-	writel(val, PRCM_DSI_PLLOUT_SEL);
-	return 0;
-}
-
-static int request_dsiescclk(u8 n, bool enable)
-{
-	u32 val;
-
-	val = readl(PRCM_DSITVCLK_DIV);
-	enable ? (val |= dsiescclk[n].en) : (val &= ~dsiescclk[n].en);
-	writel(val, PRCM_DSITVCLK_DIV);
-	return 0;
-}
-
-/**
- * db8500_prcmu_request_clock() - Request for a clock to be enabled or disabled.
- * @clock:      The clock for which the request is made.
- * @enable:     Whether the clock should be enabled (true) or disabled (false).
- *
- * This function should only be used by the clock implementation.
- * Do not use it from any other place!
- */
-int db8500_prcmu_request_clock(u8 clock, bool enable)
-{
-	if (clock == PRCMU_SGACLK)
-		return request_sga_clock(clock, enable);
-	else if (clock < PRCMU_NUM_REG_CLOCKS)
-		return request_clock(clock, enable);
-	else if (clock == PRCMU_TIMCLK)
-		return request_timclk(enable);
-	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return request_dsiclk((clock - PRCMU_DSI0CLK), enable);
-	else if ((PRCMU_DSI0ESCCLK <= clock) && (clock <= PRCMU_DSI2ESCCLK))
-		return request_dsiescclk((clock - PRCMU_DSI0ESCCLK), enable);
-	else if (clock == PRCMU_PLLDSI)
-		return request_plldsi(enable);
-	else if (clock == PRCMU_SYSCLK)
-		return request_sysclk(enable);
-	else if ((clock == PRCMU_PLLSOC0) || (clock == PRCMU_PLLSOC1))
-		return request_pll(clock, enable);
-	else
-		return -EINVAL;
-}
-
-static unsigned long pll_rate(void __iomem *reg, unsigned long src_rate,
-	int branch)
-{
-	u64 rate;
-	u32 val;
-	u32 d;
-	u32 div = 1;
-
-	val = readl(reg);
-
-	rate = src_rate;
-	rate *= ((val & PRCM_PLL_FREQ_D_MASK) >> PRCM_PLL_FREQ_D_SHIFT);
-
-	d = ((val & PRCM_PLL_FREQ_N_MASK) >> PRCM_PLL_FREQ_N_SHIFT);
-	if (d > 1)
-		div *= d;
-
-	d = ((val & PRCM_PLL_FREQ_R_MASK) >> PRCM_PLL_FREQ_R_SHIFT);
-	if (d > 1)
-		div *= d;
-
-	if (val & PRCM_PLL_FREQ_SELDIV2)
-		div *= 2;
-
-	if ((branch == PLL_FIX) || ((branch == PLL_DIV) &&
-		(val & PRCM_PLL_FREQ_DIV2EN) &&
-		((reg == PRCM_PLLSOC0_FREQ) ||
-		 (reg == PRCM_PLLARM_FREQ) ||
-		 (reg == PRCM_PLLDDR_FREQ))))
-		div *= 2;
-
-	(void)do_div(rate, div);
-
-	return (unsigned long)rate;
-}
-
-#define ROOT_CLOCK_RATE 38400000
-
-static unsigned long clock_rate(u8 clock)
-{
-	u32 val;
-	u32 pllsw;
-	unsigned long rate = ROOT_CLOCK_RATE;
-
-	val = readl(prcmu_base + clk_mgt[clock].offset);
-
-	if (val & PRCM_CLK_MGT_CLK38) {
-		if (clk_mgt[clock].clk38div && (val & PRCM_CLK_MGT_CLK38DIV))
-			rate /= 2;
-		return rate;
-	}
-
-	val |= clk_mgt[clock].pllsw;
-	pllsw = (val & PRCM_CLK_MGT_CLKPLLSW_MASK);
-
-	if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC0)
-		rate = pll_rate(PRCM_PLLSOC0_FREQ, rate, clk_mgt[clock].branch);
-	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_SOC1)
-		rate = pll_rate(PRCM_PLLSOC1_FREQ, rate, clk_mgt[clock].branch);
-	else if (pllsw == PRCM_CLK_MGT_CLKPLLSW_DDR)
-		rate = pll_rate(PRCM_PLLDDR_FREQ, rate, clk_mgt[clock].branch);
-	else
-		return 0;
-
-	if ((clock == PRCMU_SGACLK) &&
-		(val & PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN)) {
-		u64 r = (rate * 10);
-
-		(void)do_div(r, 25);
-		return (unsigned long)r;
-	}
-	val &= PRCM_CLK_MGT_CLKPLLDIV_MASK;
-	if (val)
-		return rate / val;
-	else
-		return 0;
-}
-
-static unsigned long armss_rate(void)
-{
-	u32 r;
-	unsigned long rate;
-
-	r = readl(PRCM_ARM_CHGCLKREQ);
-
-	if (r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_CHGCLKREQ) {
-		/* External ARMCLKFIX clock */
-
-		rate = pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_FIX);
-
-		/* Check PRCM_ARM_CHGCLKREQ divider */
-		if (!(r & PRCM_ARM_CHGCLKREQ_PRCM_ARM_DIVSEL))
-			rate /= 2;
-
-		/* Check PRCM_ARMCLKFIX_MGT divider */
-		r = readl(PRCM_ARMCLKFIX_MGT);
-		r &= PRCM_CLK_MGT_CLKPLLDIV_MASK;
-		rate /= r;
-
-	} else {/* ARM PLL */
-		rate = pll_rate(PRCM_PLLARM_FREQ, ROOT_CLOCK_RATE, PLL_DIV);
-	}
-
-	return rate;
-}
-
-static unsigned long dsiclk_rate(u8 n)
-{
-	u32 divsel;
-	u32 div = 1;
-
-	divsel = readl(PRCM_DSI_PLLOUT_SEL);
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
-	div = readl(PRCM_DSITVCLK_DIV);
-	div = ((div & dsiescclk[n].div_mask) >> (dsiescclk[n].div_shift));
-	return clock_rate(PRCMU_TVCLK) / max((u32)1, div);
-}
-
-unsigned long prcmu_clock_rate(u8 clock)
-{
-	if (clock < PRCMU_NUM_REG_CLOCKS)
-		return clock_rate(clock);
-	else if (clock == PRCMU_TIMCLK)
-		return prcmu_is_ulppll_disabled() ?
-			32768 : ROOT_CLOCK_RATE / 16;
-	else if (clock == PRCMU_SYSCLK)
-		return ROOT_CLOCK_RATE;
-	else if (clock == PRCMU_PLLSOC0)
-		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
-	else if (clock == PRCMU_PLLSOC1)
-		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
-	else if (clock == PRCMU_ARMSS)
-		return armss_rate();
-	else if (clock == PRCMU_PLLDDR)
-		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, PLL_RAW);
-	else if (clock == PRCMU_PLLDSI)
-		return pll_rate(PRCM_PLLDSI_FREQ, clock_rate(PRCMU_HDMICLK),
-			PLL_RAW);
-	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return dsiclk_rate(clock - PRCMU_DSI0CLK);
-	else if ((PRCMU_DSI0ESCCLK <= clock) && (clock <= PRCMU_DSI2ESCCLK))
-		return dsiescclk_rate(clock - PRCMU_DSI0ESCCLK);
-	else
-		return 0;
-}
-
-static unsigned long clock_source_rate(u32 clk_mgt_val, int branch)
-{
-	if (clk_mgt_val & PRCM_CLK_MGT_CLK38)
-		return ROOT_CLOCK_RATE;
-	clk_mgt_val &= PRCM_CLK_MGT_CLKPLLSW_MASK;
-	if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC0)
-		return pll_rate(PRCM_PLLSOC0_FREQ, ROOT_CLOCK_RATE, branch);
-	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_SOC1)
-		return pll_rate(PRCM_PLLSOC1_FREQ, ROOT_CLOCK_RATE, branch);
-	else if (clk_mgt_val == PRCM_CLK_MGT_CLKPLLSW_DDR)
-		return pll_rate(PRCM_PLLDDR_FREQ, ROOT_CLOCK_RATE, branch);
-	else
-		return 0;
-}
-
-static u32 clock_divider(unsigned long src_rate, unsigned long rate)
-{
-	u32 div;
-
-	div = (src_rate / rate);
-	if (div == 0)
-		return 1;
-	if (rate < (src_rate / div))
-		div++;
-	return div;
-}
-
-static long round_clock_rate(u8 clock, unsigned long rate)
-{
-	u32 val;
-	u32 div;
-	unsigned long src_rate;
-	long rounded_rate;
-
-	val = readl(prcmu_base + clk_mgt[clock].offset);
-	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
-		clk_mgt[clock].branch);
-	div = clock_divider(src_rate, rate);
-	if (val & PRCM_CLK_MGT_CLK38) {
-		if (clk_mgt[clock].clk38div) {
-			if (div > 2)
-				div = 2;
-		} else {
-			div = 1;
-		}
-	} else if ((clock == PRCMU_SGACLK) && (div == 3)) {
-		u64 r = (src_rate * 10);
-
-		(void)do_div(r, 25);
-		if (r <= rate)
-			return (unsigned long)r;
-	}
-	rounded_rate = (src_rate / min(div, (u32)31));
-
-	return rounded_rate;
-}
-
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
-	rounded_rate = (src_rate / min(div, (u32)255));
-
-	return rounded_rate;
-}
-
-long prcmu_round_clock_rate(u8 clock, unsigned long rate)
-{
-	if (clock < PRCMU_NUM_REG_CLOCKS)
-		return round_clock_rate(clock, rate);
-	else if (clock == PRCMU_PLLDSI)
-		return round_plldsi_rate(rate);
-	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		return round_dsiclk_rate(rate);
-	else if ((PRCMU_DSI0ESCCLK <= clock) && (clock <= PRCMU_DSI2ESCCLK))
-		return round_dsiescclk_rate(rate);
-	else
-		return (long)prcmu_clock_rate(clock);
-}
-
-static void set_clock_rate(u8 clock, unsigned long rate)
-{
-	u32 val;
-	u32 div;
-	unsigned long src_rate;
-	unsigned long flags;
-
-	spin_lock_irqsave(&clk_mgt_lock, flags);
-
-	/* Grab the HW semaphore. */
-	while ((readl(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
-		cpu_relax();
-
-	val = readl(prcmu_base + clk_mgt[clock].offset);
-	src_rate = clock_source_rate((val | clk_mgt[clock].pllsw),
-		clk_mgt[clock].branch);
-	div = clock_divider(src_rate, rate);
-	if (val & PRCM_CLK_MGT_CLK38) {
-		if (clk_mgt[clock].clk38div) {
-			if (div > 1)
-				val |= PRCM_CLK_MGT_CLK38DIV;
-			else
-				val &= ~PRCM_CLK_MGT_CLK38DIV;
-		}
-	} else if (clock == PRCMU_SGACLK) {
-		val &= ~(PRCM_CLK_MGT_CLKPLLDIV_MASK |
-			PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN);
-		if (div == 3) {
-			u64 r = (src_rate * 10);
-
-			(void)do_div(r, 25);
-			if (r <= rate) {
-				val |= PRCM_SGACLK_MGT_SGACLKDIV_BY_2_5_EN;
-				div = 0;
-			}
-		}
-		val |= min(div, (u32)31);
-	} else {
-		val &= ~PRCM_CLK_MGT_CLKPLLDIV_MASK;
-		val |= min(div, (u32)31);
-	}
-	writel(val, prcmu_base + clk_mgt[clock].offset);
-
-	/* Release the HW semaphore. */
-	writel(0, PRCM_SEM);
-
-	spin_unlock_irqrestore(&clk_mgt_lock, flags);
-}
-
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
-	writel(pll_freq, PRCM_PLLDSI_FREQ);
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
-	val = readl(PRCM_DSI_PLLOUT_SEL);
-	val &= ~dsiclk[n].divsel_mask;
-	val |= (dsiclk[n].divsel << dsiclk[n].divsel_shift);
-	writel(val, PRCM_DSI_PLLOUT_SEL);
-}
-
-static void set_dsiescclk_rate(u8 n, unsigned long rate)
-{
-	u32 val;
-	u32 div;
-
-	div = clock_divider(clock_rate(PRCMU_TVCLK), rate);
-	val = readl(PRCM_DSITVCLK_DIV);
-	val &= ~dsiescclk[n].div_mask;
-	val |= (min(div, (u32)255) << dsiescclk[n].div_shift);
-	writel(val, PRCM_DSITVCLK_DIV);
-}
-
-int prcmu_set_clock_rate(u8 clock, unsigned long rate)
-{
-	if (clock < PRCMU_NUM_REG_CLOCKS)
-		set_clock_rate(clock, rate);
-	else if (clock == PRCMU_PLLDSI)
-		return set_plldsi_rate(rate);
-	else if ((clock == PRCMU_DSI0CLK) || (clock == PRCMU_DSI1CLK))
-		set_dsiclk_rate((clock - PRCMU_DSI0CLK), rate);
-	else if ((PRCMU_DSI0ESCCLK <= clock) && (clock <= PRCMU_DSI2ESCCLK))
-		set_dsiescclk_rate((clock - PRCMU_DSI0ESCCLK), rate);
-	return 0;
-}
-
 int db8500_prcmu_config_esram0_deep_sleep(u8 state)
 {
 	if ((state > ESRAM0_DEEP_SLEEP_STATE_RET) ||
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index 7306303494f1..d3815a5390da 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -704,10 +704,6 @@ void prcmu_configure_auto_pm(struct prcmu_auto_pm_config *sleep,
 	struct prcmu_auto_pm_config *idle);
 bool prcmu_is_auto_pm_enabled(void);
 
-unsigned long prcmu_clock_rate(u8 clock);
-long prcmu_round_clock_rate(u8 clock, unsigned long rate);
-int prcmu_set_clock_rate(u8 clock, unsigned long rate);
-int prcmu_set_clock_divider(u8 clock, u8 divider);
 int db8500_prcmu_config_hotdog(u8 threshold);
 int db8500_prcmu_config_hotmon(u8 low, u8 high);
 int db8500_prcmu_start_temp_sense(u16 cycles32k);
@@ -732,7 +728,6 @@ int db8500_prcmu_set_power_state(u8 state, bool keep_ulp_clk, bool keep_ap_pll);
 u8 db8500_prcmu_get_power_state_result(void);
 void db8500_prcmu_enable_wakeups(u32 wakeups);
 int db8500_prcmu_set_epod(u16 epod_id, u8 epod_state);
-int db8500_prcmu_request_clock(u8 clock, bool enable);
 void db8500_prcmu_config_abb_event_readout(u32 abb_events);
 void db8500_prcmu_get_abb_event_buffer(void __iomem **buf);
 int db8500_prcmu_config_esram0_deep_sleep(u8 state);
@@ -740,6 +735,8 @@ u16 db8500_prcmu_get_reset_code(void);
 bool db8500_prcmu_is_ac_wake_requested(void);
 int db8500_prcmu_set_arm_opp(u8 opp);
 int db8500_prcmu_get_arm_opp(void);
+int db8500_prcmu_request_pll(u8 clock, bool enable);
+int db8500_prcmu_request_sysclk(bool enable);
 int db8500_prcmu_set_ape_opp(u8 opp);
 int db8500_prcmu_get_ape_opp(void);
 int db8500_prcmu_request_ape_opp_100_voltage(bool enable);
@@ -813,26 +810,6 @@ static inline bool prcmu_is_auto_pm_enabled(void)
 	return false;
 }
 
-static inline unsigned long prcmu_clock_rate(u8 clock)
-{
-	return 0;
-}
-
-static inline long prcmu_round_clock_rate(u8 clock, unsigned long rate)
-{
-	return 0;
-}
-
-static inline int prcmu_set_clock_rate(u8 clock, unsigned long rate)
-{
-	return 0;
-}
-
-static inline int prcmu_set_clock_divider(u8 clock, u8 divider)
-{
-	return 0;
-}
-
 static inline int db8500_prcmu_config_hotdog(u8 threshold)
 {
 	return 0;
@@ -898,11 +875,6 @@ static inline int db8500_prcmu_set_epod(u16 epod_id, u8 epod_state)
 	return 0;
 }
 
-static inline int db8500_prcmu_request_clock(u8 clock, bool enable)
-{
-	return 0;
-}
-
 static inline int db8500_prcmu_config_esram0_deep_sleep(u8 state)
 {
 	return 0;

-- 
2.56.1

