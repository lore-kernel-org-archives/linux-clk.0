Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B671543991E
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344142; cv=none; b=namVAPXbzmHIuqAhp3nL1EKShIDJUs/gpMWtt/sY+jNeeAOLqvSeLSSxHtPSxfA3ptIYsx++qqju7Htqee4L96T/3QCjkA+DTaUMsWtRX7pg2PxVZk9awzyUflh/8XEo7wIFrdXPPvMD0U5HRoYlHs6+FClHciapY6xGRxXUSXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344142; c=relaxed/simple;
	bh=djsfKymx3tMLcByw2qsIGk3qUTSro+L1NXGOEPTiGTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXGgEIo7U730EFKY5PP15yxd2BuF2S7mYdnWRqUTdRNABPv1YXkBuAIL8ko5BiZw4SFGWHvdtnnSvB+9wgTkE4vnN1f+fXMSK0PygS565zozYv7hQ/eITOZaYeNzCe2dSKRvF+xg+fHDhOuS4V4B09pXRMLnvomeb4c/+1FhbzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A9Jm8DUx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A9Jm8DUx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so9116105e9.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344139; x=1788948939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnN3xP1zwvn+tmeo5Jp/4ETSSusDTxDKIJZOHepiHeg=;
        b=A9Jm8DUxTTBTp4E93ZvZmlONLqt97n94bxRomAasROvh4a+pvg50Co4OiyV5zlGaxu
         oDQ6RVqjNIR8xIU/e6jLoMOo3oIgkdEV7n3QNOhCuB0FD2WDuCdxvQV4aVNpIv/2HD54
         8wsr+jhWRFygURxCe/xW+yI9b2Q76ry8jZJPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344139; x=1788948939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnN3xP1zwvn+tmeo5Jp/4ETSSusDTxDKIJZOHepiHeg=;
        b=HTXHm6jBY+PyI+wnumGB5Dmbpyalc539vKHSna1XF8g05hQNFC5Zz2vKfqSVazGimI
         8bA1mJ7R7DGWZEOQx7D5bYA+U2KhYlfwdpO4vI5EV082FYdiibbWiJ51EL+X44wlu3XG
         2cuZFHthfkv+laoLA4/dXLJqbftx5/GTQMVnHmPgB79Oj+EIJdRZOx3LMqjkk6fPkPms
         RN2j+arB+w6x9JeclgCCwxZcRXwa6Ru5SOLOvm8SDFm7FFaL8LQu4bpaOfklhGs/+Y7m
         FiymIbznzlam9g8YJpXNCpFLEpxXsEd6c8KLvK95pGoixklZZVsVSnZsrjMlIeNkj8rO
         7q0A==
X-Forwarded-Encrypted: i=1; AHgh+RqhVnDU7VamVmEQxzQbYRQ0V4bTcj1RtBQcPVgtwSzL1CJhythC5+/m8reLyP2xgug7zaR8+uAqk4o=@vger.kernel.org
X-Gm-Message-State: AFuF++nDpHGvV/oSIbq147iPT/xHJulxV+2qzrfp1MpLoS1agQmngFkT
	SNbLW/pcOdOuS7usB9sNn+dN/HgdF4OYwIJS0JzBSEuwPpw07CV9qLZtVXllqgZIuss=
X-Gm-Gg: AR+sD10FJ/DSU3Hu/IEbnngKFDVhaP7khLKLNjn4FLluU+6VeQMqio2muhv3LNJAEfB
	WvMDKrDMjtWBXRFZVD5WQYXf6kR+aTbs5WQu9KVnkWpCtzHg4PTuge9Nutb4IkEczw2o8bWBabM
	XEcVSA2g7w4ig/Ugv82qWx8s6TubP6km6An15Jx2qoP1331yFbKPD2xWtQXYjDP6BN+T8arWmms
	R6lHrVgcRf1DLAXN83xEzFXRIJ4GkpgeiHoOaN7+Z7gyf1ZWi5GZe+EyeMlfwfbHl5ZMrmInamx
	MjzbFaTf79vh1G5YbbVSFFpsgwGoLH58yLOknD14gf3dMMdCtKQjRnt53UPwxbMhWQzhBjQeYOW
	IjX3dmmpD8a19FQuPwlpLFAMHJzp9hFgdA8cfyXdrV0wnm8jvbqXdBEm0SLFQoXyeRpLDIDF0Jl
	rd+FpEy8TBnwnVDCjZN+HVGR2o5S1NvgWhmU3+UayMGkf6qUPvs8nKU5qB6vUazTkVjUJcN9cs4
	igB7Abcyk4rz+brhLrqc+/IZEme572Lve3RyRsgIc9h3+rMhyq3z8nw5XjvcNUbQN1++7luQ8jL
	aCm2+XI8mK8nrqnoff3Ppb6V8wQH273j2/+iqjLt0BhJx2v+qM2RjN5hsTgS
X-Received: by 2002:a05:600c:e558:10b0:49c:e906:ba16 with SMTP id 5b1f17b1804b1-49ce906bb7cmr17496535e9.15.1788344137993;
        Wed, 02 Sep 2026 03:15:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 3/3] clk: imx: pll14xx: support spread spectrum clock generation
Date: Wed,  2 Sep 2026 12:07:35 +0200
Message-ID: <20260902101515.167819-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
References: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v12:
 - Apply the SSC settings also from the set_spread_spectrum() callback
   to handle the case the clock framework skips set_rate() if the
   requested rate is unchanged.

Changes in v11:
 - Drop the dt-bindings/clock/clock.h include and use the enum
   clk_ssc_method values from clk-provider.h, as clk-scmi-oem.c does.
 - Disable SSC and clear the modulation fields in SSCG_CTRL when no
   spread method is configured, so that a setup left enabled by the
   bootloader is not kept active.
 - Skip the SSC setup instead of dividing by zero when modfreq_hz is
   zero or mfr truncates to zero.
 - Reject mfr and mrr values that do not fit the MFREQ_CTL and MRAT_CTL
   register fields instead of letting FIELD_PREP silently truncate
   them. This also prevents the 10000 * mfr multiplication from
   overflowing.
 - Compute the mfr divisor in 64-bit arithmetic, as the 32-bit product
   could wrap with out of range modfreq_hz values.

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..5b187101c558 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/jiffies.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,58 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	switch (conf->method) {
+	case CLK_SPREAD_CENTER:
+		sel_pf = SEL_PF_CENTER_SPREAD;
+		break;
+	case CLK_SPREAD_UP:
+		sel_pf = SEL_PF_UP_SPREAD;
+		break;
+	case CLK_SPREAD_DOWN:
+		sel_pf = SEL_PF_DOWN_SPREAD;
+		break;
+	default:
+		/* No spread: disable modulation and clear any stale state */
+		goto out;
+	}
+
+	if (!conf->modfreq_hz || !parent_rate || !pdiv)
+		goto out;
+
+	mfr = div64_u64(parent_rate, (u64)conf->modfreq_hz * pdiv * BIT(5));
+	if (!mfr || mfr > FIELD_MAX(MFREQ_CTL_MASK)) {
+		pr_warn("%s: SSC disabled, modulation frequency (%u Hz) out of range\n",
+			clk_hw_get_name(hw), conf->modfreq_hz);
+		goto out;
+	}
+
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+	if (!mrr || mrr > FIELD_MAX(MRAT_CTL_MASK)) {
+		pr_warn("%s: SSC disabled, spread (%u permyriad) out of range\n",
+			clk_hw_get_name(hw), conf->spread_bp);
+		goto out;
+	}
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+out:
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +453,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +477,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +505,36 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = parent ? clk_hw_get_rate(parent) : 0;
+	unsigned long flags;
+	u32 div_ctl0;
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	pll->ss_conf = *ss_conf;
+
+	/*
+	 * Apply the configuration to the hardware right away, using the
+	 * current PLL dividers: the clock framework does not call set_rate()
+	 * if the requested rate is unchanged, so relying on it would leave
+	 * the SSC settings unapplied when the PLL is already at the target
+	 * rate (e.g. configured by the bootloader).
+	 */
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	__clk_pll1443x_set_spread_spectrum(hw, parent_rate,
+					   FIELD_GET(PDIV_MASK, div_ctl0),
+					   FIELD_GET(MDIV_MASK, div_ctl0));
+
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +607,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

