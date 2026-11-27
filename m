Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822959;
	b=FYdFOD3ehQHKsPVnktmY/syeRlvSzwY4B/hyCh6gG9GcWenJ50gertn47dt8+5TXJYsP
	 3ouqlTALp9v6dsExF9DrjTYW/+zs9PewjStdLHnRM/J5RGHOQOs9dykqlhnRVRQxbsWr9
	 QhgGvLbRciFBpT8+ExkYTuhIULurFRGYQs/EkoqPOroIhAYtiop3A2yFJIRA2wzanir99
	 EmQuG5YDpSdwE7d3l2E82hqqUN4e4TSuX5ts/5Sa8bz5UBKFA7AcNM6Nb4r7Mq22Zr/zw
	 iMmHGAz5/mx0osaZ198qds/IZUWg7oH50ju/LvU1OJNtKMI6iUuHZXXcOw5n2DFFKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822959;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=U4xx5YvVOcvcEjqksoW6QRvcGwL3WGnKWnm7u39mUEM=;
	b=V+SKwUisWHa35XGoUxrhqwgebvqN7l2r9DEFstl1YbLBKZscYkHKyEsPKHrDPQxEhPuW
	 Yg8rZkvZw3PY1NQf53uqbD/rs/CFaVREfVeilYmpwIW8VBumnw57UR+4LP00Afs+E08Yr
	 x0IgHjND5NZDPcuQZqgf6q/xe9GXUVfGrnKg+ieJFC4g5pDXRWw1WOdfr110xgSI/sD7f
	 JPWLp9Rsc0Df/XdbmAGBwkHtam5a9bKX/MmCayOZw7UACWlKiIvpCzbefojCiVeo3RP1u
	 x+wkZQwiV7UaU9FADyHCGRFGblXjV8ZS8POEuIEd4S8CnDu7lU9nK+IX7/BMBVarTIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFI6BSVM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887EC606A31C;
	Fri, 27 Nov 2026 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFI6BSVM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E051F00897;
	Fri, 27 Nov 2026 23:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822958;
	bh=U4xx5YvVOcvcEjqksoW6QRvcGwL3WGnKWnm7u39mUEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZFI6BSVMqqt4q7baZcHWWNB5Ma6X796NTYduUjpwF5EDXjHuGjp8WbLvEW5r0Mfay
	 tLuvi0CvWU2Kcl+oSKBfxAKQIW+44P49ZIZhHeAYAqNywfOgRZvXDiKV0u8bdZfu+x
	 fuhVPMU+I5zovwFFGS7I/dKckBQw8jWpTU0v09KU3TSDMa8YbzZEAmomVZEKpEv0pV
	 QxZQloC9PyE9PgEE6+z8WbBRDCj6ymsDoWmgIAEhuCNdrwUEfqLPwcSuN/jR3DPbAw
	 CrYVh1lheKTVaePtzgi6IUZNubPCEFBwCraaLKOsoooUkS4IaDpZqMzq323L/VmwRT
	 4tMkrKt0uEgUA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:30 +0100
Subject: [PATCH 2/6] clk: ux500: Move CLKOUT programming to the clock
 driver
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
Message-Id: <20261128-ux500-prcmu-clock-move-v1-2-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

The programmable clock outputs only use MMIO and have no firmware
transaction. Move their register definitions, lock and request
bookkeeping next to their CCF operations. Use the existing PRCMU
register accessors rather than exposing the mapping.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/clk/ux500/clk-prcmu.c    | 87 ++++++++++++++++++++++++++++++++++++++--
 drivers/mfd/db8500-prcmu-regs.h  | 16 --------
 drivers/mfd/db8500-prcmu.c       | 67 -------------------------------
 include/linux/mfd/db8500-prcmu.h |  6 ---
 4 files changed, 84 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 842962be7f9e..82c905394eff 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -6,9 +6,11 @@
  * Author: Ulf Hansson <ulf.hansson@linaro.org>
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/db8500-prcmu.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include "clk.h"
@@ -350,13 +352,92 @@ struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
 			&clk_prcmu_opp_volt_scalable_ops);
 }
 
-/* The clkout (external) clock is special and need special ops */
+/* External programmable clock outputs */
+
+#define PRCM_CLKOCR		   0x1CC
+#define PRCM_CLKOCR_CLKODIV0_SHIFT	0
+#define PRCM_CLKOCR_CLKODIV0_MASK	GENMASK(5, 0)
+#define PRCM_CLKOCR_CLKOSEL0_SHIFT	6
+#define PRCM_CLKOCR_CLKOSEL0_MASK	GENMASK(8, 6)
+#define PRCM_CLKOCR_CLKODIV1_SHIFT	16
+#define PRCM_CLKOCR_CLKODIV1_MASK	GENMASK(21, 16)
+#define PRCM_CLKOCR_CLKOSEL1_SHIFT	22
+#define PRCM_CLKOCR_CLKOSEL1_MASK	GENMASK(24, 22)
+#define PRCM_CLKOCR_CLK1TYPE		BIT(28)
+
+static DEFINE_SPINLOCK(clkout_lock);
+
+/**
+ * clk_prcmu_config_clkout - Configure one of the programmable clock outputs.
+ * @clkout:	The CLKOUT number (0 or 1).
+ * @source:	The clock to be used (one of the PRCMU_CLKSRC_*).
+ * @div:	The divider to be applied.
+ *
+ * Configures one of the programmable clock outputs (CLKOUTs).
+ * @div should be in the range [1,63] to request a configuration, or 0 to
+ * inform that the configuration is no longer requested.
+ */
+static int clk_prcmu_config_clkout(u8 clkout, u8 source, u8 div)
+{
+	static int requests[2];
+	int r = 0;
+	unsigned long flags;
+	u32 val;
+	u32 bits;
+	u32 mask;
+	u32 div_mask;
+
+	BUG_ON(clkout > 1);
+	BUG_ON(div > 63);
+	BUG_ON((clkout == 0) && (source > PRCMU_CLKSRC_CLK009));
+
+	if (!div && !requests[clkout])
+		return -EINVAL;
+
+	if (clkout == 0) {
+		div_mask = PRCM_CLKOCR_CLKODIV0_MASK;
+		mask = (PRCM_CLKOCR_CLKODIV0_MASK | PRCM_CLKOCR_CLKOSEL0_MASK);
+		bits = ((source << PRCM_CLKOCR_CLKOSEL0_SHIFT) |
+			(div << PRCM_CLKOCR_CLKODIV0_SHIFT));
+	} else {
+		div_mask = PRCM_CLKOCR_CLKODIV1_MASK;
+		mask = (PRCM_CLKOCR_CLKODIV1_MASK | PRCM_CLKOCR_CLKOSEL1_MASK |
+			PRCM_CLKOCR_CLK1TYPE);
+		bits = ((source << PRCM_CLKOCR_CLKOSEL1_SHIFT) |
+			(div << PRCM_CLKOCR_CLKODIV1_SHIFT));
+	}
+	bits &= mask;
+
+	spin_lock_irqsave(&clkout_lock, flags);
+
+	val = db8500_prcmu_read(PRCM_CLKOCR);
+	if (val & div_mask) {
+		if (div) {
+			if ((val & mask) != bits) {
+				r = -EBUSY;
+				goto unlock_and_return;
+			}
+		} else {
+			if ((val & mask & ~div_mask) != bits) {
+				r = -EINVAL;
+				goto unlock_and_return;
+			}
+		}
+	}
+	db8500_prcmu_write(PRCM_CLKOCR, bits | (val & ~mask));
+	requests[clkout] += (div ? 1 : -1);
+
+unlock_and_return:
+	spin_unlock_irqrestore(&clkout_lock, flags);
+
+	return r;
+}
 
 static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
 {
 	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
 
-	return prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
+	return clk_prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
 }
 
 static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
@@ -365,7 +446,7 @@ static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
 	int ret;
 
 	/* The clkout clock is disabled by dividing by 0 */
-	ret = prcmu_config_clkout(clk->clkout_id, clk->source, 0);
+	ret = clk_prcmu_config_clkout(clk->clkout_id, clk->source, 0);
 	if (ret)
 		pr_err("clk_prcmu: %s failed to disable %s\n", __func__,
 		       clk_hw_get_name(hw));
diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 75fd1069372c..e024400c4e80 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -161,12 +161,6 @@
 
 #define PRCM_APE_RESETN_DSIPLL_RESETN BIT(14)
 
-#define PRCM_CLKOCR		   (prcmu_base + 0x1CC)
-#define PRCM_CLKOCR_CLKOUT0_REF_CLK	(1 << 0)
-#define PRCM_CLKOCR_CLKOUT0_MASK	BITS(0, 13)
-#define PRCM_CLKOCR_CLKOUT1_REF_CLK	(1 << 16)
-#define PRCM_CLKOCR_CLKOUT1_MASK	BITS(16, 29)
-
 /* ePOD and memory power signal control registers */
 #define PRCM_EPOD_C_SET            (prcmu_base + 0x410)
 #define PRCM_SRAM_LS_SLEEP         (prcmu_base + 0x304)
@@ -189,16 +183,6 @@
 #define PRCM_TCR_STOP_TIMERS       BIT(16)
 #define PRCM_TCR_DOZE_MODE         BIT(17)
 
-#define PRCM_CLKOCR_CLKODIV0_SHIFT	0
-#define PRCM_CLKOCR_CLKODIV0_MASK	BITS(0, 5)
-#define PRCM_CLKOCR_CLKOSEL0_SHIFT	6
-#define PRCM_CLKOCR_CLKOSEL0_MASK	BITS(6, 8)
-#define PRCM_CLKOCR_CLKODIV1_SHIFT	16
-#define PRCM_CLKOCR_CLKODIV1_MASK	BITS(16, 21)
-#define PRCM_CLKOCR_CLKOSEL1_SHIFT	22
-#define PRCM_CLKOCR_CLKOSEL1_MASK	BITS(22, 24)
-#define PRCM_CLKOCR_CLK1TYPE		BIT(28)
-
 #define PRCM_CLK_MGT_CLKPLLDIV_MASK		BITS(0, 4)
 #define PRCM_CLK_MGT_CLKPLLSW_SOC0		BIT(5)
 #define PRCM_CLK_MGT_CLKPLLSW_SOC1		BIT(6)
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index befc8d4ab922..1d9114edfbdb 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -441,7 +441,6 @@ static atomic_t ac_wake_req_state = ATOMIC_INIT(0);
 
 /* Spinlocks */
 static DEFINE_SPINLOCK(prcmu_lock);
-static DEFINE_SPINLOCK(clkout_lock);
 
 /* Global var to runtime determine TCDM base for v2 or v1 */
 static __iomem void *tcdm_base;
@@ -622,72 +621,6 @@ enum ap_pwrst prcmu_get_xp70_current_state(void)
 	return readb(tcdm_base + PRCM_XP70_CUR_PWR_STATE);
 }
 
-/**
- * prcmu_config_clkout - Configure one of the programmable clock outputs.
- * @clkout:	The CLKOUT number (0 or 1).
- * @source:	The clock to be used (one of the PRCMU_CLKSRC_*).
- * @div:	The divider to be applied.
- *
- * Configures one of the programmable clock outputs (CLKOUTs).
- * @div should be in the range [1,63] to request a configuration, or 0 to
- * inform that the configuration is no longer requested.
- */
-int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
-{
-	static int requests[2];
-	int r = 0;
-	unsigned long flags;
-	u32 val;
-	u32 bits;
-	u32 mask;
-	u32 div_mask;
-
-	BUG_ON(clkout > 1);
-	BUG_ON(div > 63);
-	BUG_ON((clkout == 0) && (source > PRCMU_CLKSRC_CLK009));
-
-	if (!div && !requests[clkout])
-		return -EINVAL;
-
-	if (clkout == 0) {
-		div_mask = PRCM_CLKOCR_CLKODIV0_MASK;
-		mask = (PRCM_CLKOCR_CLKODIV0_MASK | PRCM_CLKOCR_CLKOSEL0_MASK);
-		bits = ((source << PRCM_CLKOCR_CLKOSEL0_SHIFT) |
-			(div << PRCM_CLKOCR_CLKODIV0_SHIFT));
-	} else {
-		div_mask = PRCM_CLKOCR_CLKODIV1_MASK;
-		mask = (PRCM_CLKOCR_CLKODIV1_MASK | PRCM_CLKOCR_CLKOSEL1_MASK |
-			PRCM_CLKOCR_CLK1TYPE);
-		bits = ((source << PRCM_CLKOCR_CLKOSEL1_SHIFT) |
-			(div << PRCM_CLKOCR_CLKODIV1_SHIFT));
-	}
-	bits &= mask;
-
-	spin_lock_irqsave(&clkout_lock, flags);
-
-	val = readl(PRCM_CLKOCR);
-	if (val & div_mask) {
-		if (div) {
-			if ((val & mask) != bits) {
-				r = -EBUSY;
-				goto unlock_and_return;
-			}
-		} else {
-			if ((val & mask & ~div_mask) != bits) {
-				r = -EINVAL;
-				goto unlock_and_return;
-			}
-		}
-	}
-	writel((bits | (val & ~mask)), PRCM_CLKOCR);
-	requests[clkout] += (div ? 1 : -1);
-
-unlock_and_return:
-	spin_unlock_irqrestore(&clkout_lock, flags);
-
-	return r;
-}
-
 int db8500_prcmu_set_power_state(u8 state, bool keep_ulp_clk, bool keep_ap_pll)
 {
 	unsigned long flags;
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index 87a28c4f1d81..b6e3450b1d11 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -706,7 +706,6 @@ void prcmu_configure_auto_pm(struct prcmu_auto_pm_config *sleep,
 	struct prcmu_auto_pm_config *idle);
 bool prcmu_is_auto_pm_enabled(void);
 
-int prcmu_config_clkout(u8 clkout, u8 source, u8 div);
 unsigned long prcmu_clock_rate(u8 clock);
 long prcmu_round_clock_rate(u8 clock, unsigned long rate);
 int prcmu_set_clock_rate(u8 clock, unsigned long rate);
@@ -816,11 +815,6 @@ static inline bool prcmu_is_auto_pm_enabled(void)
 	return false;
 }
 
-static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
-{
-	return 0;
-}
-
 static inline unsigned long prcmu_clock_rate(u8 clock)
 {
 	return 0;

-- 
2.56.1

