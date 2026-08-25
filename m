Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FD3E6DC3
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 21:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693122; cv=none; b=Wwg/FvN1Hjmtpjq3oR+BfPsTPUtEOmXp9kOhvbfWh6wX3UnqOK6Eb1Ifn2Gi3XZ/xkilIu4Hqg9OQzwpXIKe1K6XSmTNpplhbPJdBE2UbSn2hKruzbB4ISl0n2B+f8mgQ2bTWXe1JZEYLWC7O1neCMSoZX7IWzcYE5lYz/2cxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693122; c=relaxed/simple;
	bh=rntOhO6iXa3cIS2ltqTG+RBvjTELPyUsKjyszQhcv3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xcfgvn8d/1QLXTjmGCWB2BYybrJIVvgSms0Bc05y+X7Y1t5A3yBLO/SiP68BaswMh0EmjN3Ql3bwh9mgW6IeGdzJEK1HUoIPhYhtSZ9Y0QS35jPJX5ihoc7FawtPsA8sjkueWe8w7sSZdnkqUPHzRrefmPyxptWbSlJT2N1IVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k28BPwsR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k28BPwsR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so2600036a12.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693119; x=1788297919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGKQQ7JfjPGUcipZyt/Hz4u+b+TL9U6ETVLqO/TNeHM=;
        b=k28BPwsR8WVrx6aanv5XL6QJCOuOPsKlSygl0BuaRhRdVOoFKmTGXUjT6PZUG8oCtP
         MhvOLzKyhhhpMxtZa46YdUC1Q6upBA/Ppqw0u0ZscUAkS65rSgIJw1HyHBl5oT9840xZ
         maIv1AXoQrq1rwJkr5P3gGjMzfp+gJ3Xe5jmQvOJMYdGPd+s84xAR33SyZEzlWFQRxzt
         TnCWCreEmhlek1Pxw+vCMBJbRQtk5SQ61zirjdjTJoeZY+9w2uuSHhYSi8FPWrtZ+FVE
         5vPSP7UfS/x0DL8dJt8Vnr6YjtJjIGAa91U6zE7j5mCMO6nyiIY58fgg+495czq30ImU
         tc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693119; x=1788297919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGKQQ7JfjPGUcipZyt/Hz4u+b+TL9U6ETVLqO/TNeHM=;
        b=Z0KhZVDAKvdupHT3uFb5+DsvrhOTxRQFUrGAbt7WVT+MJYpYAF7so/2yfVsAOD66i5
         UvPQZcHGukKcAjDqZMv6b9gwpDnFaR/wimglxONlBzmxiw8iZNKyTbU/lgjaCVKn2XXw
         zS5FVA8vBv/oTIHYHGQeU+Ip3nNMc7NdUHfIMRFUGRtMmO8IL6kNMO/rYt0lqRPOI5dj
         9xcJHjEiQMWVdOwNEVaS/ixKz7neq9LeS+3EwngTyR3td9UliM++esgERyAS63dAPC+o
         fcLaL5EpaN7JalpunH3XPIOePwcGRqDtk1oubIWtFqVrpN54uO7xz0amtBcHd6bNHlQ/
         rQSg==
X-Gm-Message-State: AFuF++mLrSZtVtL2DXLUPu79PsK7iFiW2iTeodZlAU0jjmHHTxJNdOVR
	pPS/KYmIk2yPUWPmSF3zpzHUpKsMVBhUTDdmzGXRDOzqPstGJaUnvJKm
X-Gm-Gg: AR+sD13PC9KvIXeRADQfp7jbeAm9WV6XAwUOGb/JLU3yR883Fdg3nqur246MfZpELPi
	1J78EuuJyA7n/GPZKUcx4x4Q7tbxGhLFDhh3g9wLi6bqBr+hVfmlUZvA+P027f4zMh6EodsZlNt
	1+x8EjHT/iodihuAWyXNl7smpqvhhr+V8f+X4+kaMjH1vtBqTZ80o8/mnLKcaP8vGH+Z/RcyOSb
	iGRaCvurFsvxGHEDV0mDnlIbxDtZLtEQsVrijnwg9pkkDuNo9mRmS5hCbH2qsAr0e38jFmhBcF5
	4//2I1ED7MLqn9R37cYjujJnrmBgsebyBmWu3iA5gUXbzvycuNMEuSf7GCQoHqQp4y+3rYMzNNS
	ORWWDgV1C1M/4uKcajv4kmWeVWMBn+CI41jdndlFBeYrlsbwsWNVOHmRnRdM2GIWPDV0hyasmqD
	FrSGbJ1BBPjSHeL3WknsICsG8zP0X8ngrwx44yWnUQKKtxcFJZz4jdTlRGguglZQdv61b9l8UjN
	7ukMI1/
X-Received: by 2002:a17:907:8992:b0:c24:df4f:cc66 with SMTP id a640c23a62f3a-c24e2d2b07fmr1178573666b.9.1787693118562;
        Tue, 25 Aug 2026 14:25:18 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:25:09 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:07 +0300
Subject: [PATCH v11 08/12] clk: zte: Add zx PLL support infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-8-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23721;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=rntOhO6iXa3cIS2ltqTG+RBvjTELPyUsKjyszQhcv3k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCsW5gM7L0XsvsoNPM/+pYqqTLvXfSZKIrg
 wV6Bf8fZ1SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL1+Q//RmqVpJb+YBUVlBTUpxQoO2yLkAIapb9
 A4dkuHJHaSp0IynBV9C7VJ7DP4qeTisYrJ1NpBsNprcqvV3ZokzgLmfLZ34ZKMknvgem3WnB8Ty
 55/jqSslLDBbv+iRujSyt6gqZZYDPb7p9KI3+ka8/OOj54hHRmAIpG3FZwej9ZZhryjJOzaXCq0
 8bB/Ot672ENjdyoHwb/SvxTUaZ26JiuD9Smrk+hE212Qom8eNJlEig1CPPmIrjv9ard7ynMhBXi
 lKbF9WcfgDjTdVlTvUEPZexaX+eqernbUc6mjfO7HkTkKWpFfqlMxrDl3ncfTlEMKYzy8GoYIHN
 E92NrRPkvMQZw+agz2UnSb5qWyBoeUR7PHqYTuoTkAqSrEjDpvBSeNL8w1BaLTHdZM9GUHzmszh
 pVDyrQJw94/aZG7zrchAKMUSMQcigra/pWbZc5TH4f+yuPZgd3JvsORGopF2qFYnaxGZaVSu0r0
 8IHd3OpD0d0s5lQSDs9hP+YDX6Uj5Pq87cAKLbNBxt+HtSaOR4+bCfHCb+E7Hx5mQALcCvah4AQ
 YN5q4YBq6DdsRitR20Yiy2OPq6dyUhOvf55iD6NiIYAPWGaFgrAFnGkdwIPtgRDVMmg+Jyw2f0k
 trFCAHZLAgOlYK3JyM0PCX1j2rw8VMBuuP3UCt5FTGlbC8Bd72aA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds code to decode and program PLL settings on ZTE's
zx297520v3 SoC. The PLLs on this SoC are usually programmed to static
values by the boot loader. The only situation where .set_rate matters is
dpll, which is not programmed in some cases. The bootloader always sets
fixed rates though: 624 MHz for mpll, 200 for gpll, 480 for upll.

Parsing the bootloader-programmed values allows the clock driver to fill
the clock tree with appropriately clocked parent clocks instead of
registering fixed clocks with hardcoded rates.

I only tested the code on zx297520v3. From looking at the hardcoded PLL
values in the old zx296702 / zx296718 code I believe that these PLLs use
the same encoding, so the code added by this patch should be reusable
and the file has a relatively generic name pll-zx.c.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 10:
Use FIELD_GET / FIELD_PREP, remove now redundant _SHIFT defines.

Version 9:
*) Take req->min_rate and req->max_rate into account when looking for
possible PLL configurations (sashiko). In practice the code will still
only ever encounter a fixed request to set dpll to 491.52 MHz.

*) The same code style changes Brian requested on the other clk patches.

Version 8:
*) Document the behavior of unlocked PLLs better: They don't pass
through their reference/parent, but pass through the fixed clock-26m
oscillator, even if their reference clock is something else.
*) dpll has working fractionals. Add this in the comment, but there is
no actual code support for it - the LTE hardware doesn't need it.

As for Sashiko's comments on the .set_rate implementation: In practice
.set_rate will only ever set one rate, 491.52 MHz for dpll. All other
PLLs are bootloader configured. Dpll could be handled by writing a magic
constant into its config.

I want to have the rate finding code as documentation, and maybe there
is more elaborate future use for it (e.g. more flexible underclocking),
but attempts to handle eventualities like rate searches or misconfigured
bootloader values would be dead code.

Version 7:
*) Always keep unknownpll enabled when prepared so dpll can acquire a
lock in its prepare() function.
*) Clean up error reporting a bit (Sashiko)

Version 6:
*) Use abs_diff to compare target and candidate PLL rate (Sashiko).
*) Use req->best_parent_rate in zx29_pll_determine_rate. Add a TODO
comment about the parent rate flexibility.

Version 5: Fix some issues pointed out by Sashiko: NULL dev,
zx29_pll_recalc_rate error handling, disable PLL again on enable error.
---
 drivers/clk/zte/pll-zx.c | 564 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 561 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
index fc76c6524a16..d3687495d06c 100644
--- a/drivers/clk/zte/pll-zx.c
+++ b/drivers/clk/zte/pll-zx.c
@@ -3,16 +3,574 @@
  * Copyright (C) 2026 Stefan Dösinger
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/math.h>
+#include <linux/rational.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/units.h>
 
 #include "clk-zx.h"
 
+/*
+ * This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
+ * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
+ * .cmm file (A Lauterbach TRACE32 script) and some unused headers in their U-Boot code dump, which
+ * may not be accurate. When calculating the frequencies from the default PLL configuration the
+ * results match the fixed rate clocks from their clock driver.
+ *
+ * The 26 MHz and 32 kHz clocks can be easily observed with the timers. The 104 MHz output can be
+ * observed through the UART. One 122.88 MHz clock can be observed through the TDM device. All
+ * others can only be indirectly inferred, e.g. by comparing CPU speed or SDIO transfer rate between
+ * the fixed 26 MHz oscillator and the provided PLL frequency.
+ *
+ * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
+ * are given below. There are a few control flags:
+ *
+ * Bit 31: Disables the PLL, but passes clock-26m through unmodified. Whether POSTDIV_OUT_DISABLE
+ *         still matters is different between PLLs.
+ * Bit 30: Returns if the PLL is locked
+ * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
+ *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
+ *         influence GPIOs.
+ * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
+ *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
+ *         lock to the reference clock (from ~400 us to ~300 us).
+ * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
+ *
+ * NB: Some PLLs have an automatic bypass logic that forwards clock-26m (REGARDLESS of reference)
+ * when they don't have a lock, regardless of reason. This can be triggered by disabling the PLL,
+ * setting an out-of-spec VCO frequency or disabling the parent. This shouldn't matter in regular
+ * operation, but caused me some confusion when reverse engineering the clock tree. E.g. clock-26m->
+ * unknownpll(disabled) -> dpll(enabled) counterintuitively results in a 26 MHz output clock.
+ */
+
+#define ZX29_PLL_DISABLE			BIT(31)
+#define ZX29_PLL_LOCKED				BIT(30)
+#define ZX29_PLL_LOCK_FILTER			BIT(29)
+#define ZX29_PLL_DSM_DISABLE			BIT(27)
+#define ZX29_PLL_PARENT_MASK			GENMASK(26, 25)
+#define ZX29_PLL_BYPASS				BIT(24)
+#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
+#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
+#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
+#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
+
+/*
+ * The second register has a 24 bit fractional value, which only matters when ZX29_PLL_DSM_DISABLE
+ * is not set, and only seems to matter for dpll. ZTE's firmware does not make use of the fractional
+ * and it is unimplemented in this driver. Experimental testing confirms that it has an impact on
+ * dpll.
+ *
+ * Bits 27:24 contain more flags:
+ *
+ * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obviates the speed gained from
+ *         !DSM_DISABLE. No other effect observed.
+ *
+ * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
+ *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
+ *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
+ *         work OK if they are fed from mpll without this flag set.
+ *
+ * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
+ *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
+ *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
+ *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock if
+ *         both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
+ *
+ * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
+ *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
+ *         so I could not confirm this. It does not disable the VCO entirely - that's what
+ *         PLL_DISABLE does.
+ *
+ * A spinlock should not be needed. PLLs don't share their registers with anything else and the
+ * global prepare mutex and enable spinlock should be enough. Beware of conflicts in reg2 between
+ * POSTDIV_OUT_DISABLE and the fractional value in case you find out how fractional dividers work
+ * and add support for them.
+ */
+#define ZX29_PLL_REG2_OFFSET			4
+#define ZX29_PLL_DACAP				BIT(27)
+#define ZX29_PLL_4PHASE_OUT_DISABLE		BIT(26)
+#define ZX29_PLL_POSTDIV_OUT_DISABLE		BIT(25)
+#define ZX29_PLL_VCO_OUT_DISABLE		BIT(24)
+#define ZX29_PLL_FRACT				GENMASK(23, 0)
+
+/*
+ * The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
+ * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
+ * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
+ * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
+ * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
+ * likely the PLLs become unstable outside their core range and the SDIO controller is much more
+ * forgiving than CPU and DRAM are.
+ */
+#define ZX29_PLL_VCO_MAX_FREQ			(1300 * HZ_PER_MHZ)
+#define ZX29_PLL_VCO_MIN_FREQ			(900 * HZ_PER_MHZ)
+
+struct zx29_clk_pll {
+	struct clk_hw	hw;
+	struct device	*dev;
+	struct regmap	*map;
+	u16		reg;
+};
+
+static inline struct zx29_clk_pll *to_zx29_clk_pll(struct clk_hw *hw)
+{
+	return container_of(hw, struct zx29_clk_pll, hw);
+}
+
+static int zx29_pll_is_prepared(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	int res;
+
+	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static int zx29_pll_prepare(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val = 0;
+	int res;
+
+	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+	if (res < 0)
+		return res;
+
+	/* Lock duration is usually between 300 us and 500 us */
+	res = regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PLL_LOCKED, 50, 2000);
+	if (res) {
+		regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+		dev_err(pll->dev, "%s: PLL prepare failed: %d. Config value 0x%08x\n",
+			clk_hw_get_name(&pll->hw), res, val);
+	}
+	return res;
+}
+
+static void zx29_pll_unprepare(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+
+	regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+}
+
+static int zx29_pll_is_enabled(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	int res;
+
+	res = regmap_test_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+			       ZX29_PLL_POSTDIV_OUT_DISABLE);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static int zx29_pll_enable(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+
+	return regmap_clear_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+				 ZX29_PLL_POSTDIV_OUT_DISABLE);
+}
+
+static void zx29_pll_disable(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+
+	regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+			ZX29_PLL_POSTDIV_OUT_DISABLE);
+}
+
+static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, unsigned long parent_rate,
+				       u32 setting)
+{
+	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
+	const char *name = clk_hw_get_name(&pll->hw);
+	u64 vco;
+
+	refdiv = FIELD_GET(ZX29_PLL_REFDIV_MASK, setting);
+	fbdiv = FIELD_GET(ZX29_PLL_FBDIV_MASK, setting);
+	postdiv1 = FIELD_GET(ZX29_PLL_POSTDIV1_MASK, setting);
+	postdiv2 = FIELD_GET(ZX29_PLL_POSTDIV2_MASK, setting);
+	dev_dbg(pll->dev, "%s: reference clock %lu Hz, PLL setting 0x%08x\n",
+		name, parent_rate, setting);
+
+	if (!refdiv || !postdiv1 || !postdiv2) {
+		dev_err(pll->dev, "%s: divide by zero (%lu, %lu, %lu)\n", name, refdiv, postdiv1,
+			postdiv2);
+		return 0;
+	}
+
+	vco = div_u64((u64)parent_rate * fbdiv, refdiv);
+	freq = div_u64(div_u64(vco, postdiv1), postdiv2);
+	dev_dbg(pll->dev, "%s: refdiv %lu fbdiv %lu\n", name, refdiv, fbdiv);
+	dev_dbg(pll->dev, "%s: postdiv1 %lu postdiv2 %lu\n", name, postdiv1, postdiv2);
+
+	dev_dbg(pll->dev, "%s: %lu MHz\n", name, freq / HZ_PER_MHZ);
+
+	return freq;
+}
+
+static unsigned long zx29_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+	int res;
+
+	res = regmap_read(pll->map, pll->reg, &val);
+	if (res < 0) {
+		dev_err(pll->dev, "%s: Failed to read PLL settings\n", clk_hw_get_name(&pll->hw));
+		return 0;
+	}
+
+	return zx29_pll_get_rate(pll, parent_rate, val);
+}
+
+static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned long parent_rate,
+				unsigned long rate, unsigned long min_rate, unsigned long max_rate)
+{
+	const unsigned int postdiv1_max = (1 << hweight32(ZX29_PLL_POSTDIV1_MASK)) - 1;
+	const unsigned int postdiv2_max = (1 << hweight32(ZX29_PLL_POSTDIV2_MASK)) - 1;
+	unsigned long fbdiv, refdiv, best_fbdiv = 0, best_refdiv = 0;
+	u32 postdiv1 = 0, postdiv2 = 0, i, j, setting;
+	const char *name = clk_hw_get_name(&pll->hw);
+	long best = LONG_MAX;
+
+	/*
+	 * This code produces the same VCO settings that the boot loader and stock firmware use for
+	 * the standard frequencies. It has seen only very little manual testing beyond that.
+	 *
+	 * The goal is to find a VCO setting that gets us as close as possible to the desired output
+	 * rate, while being within the VCO's operating limits and achievable with the input value
+	 * range. It is iterating over possible post-VCO divider values (1-7)*(1-7) to look for
+	 * valid VCO target frequencies and then looks for refdiv and fbdiv values to achieve the
+	 * VCO frequency from the reference frequency.
+	 */
+	for (j = 1; j <= postdiv2_max; j++) {
+		for (i = 1; i <= postdiv1_max; i++) {
+			u64 vco = (u64)rate * i * j;
+			unsigned long out;
+
+			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
+				continue;
+
+			rational_best_approximation(vco, parent_rate,
+						    (1 << hweight32(ZX29_PLL_FBDIV_MASK)) - 1,
+						    (1 << hweight32(ZX29_PLL_REFDIV_MASK)) - 1,
+						    &fbdiv, &refdiv);
+			setting = FIELD_PREP(ZX29_PLL_FBDIV_MASK, fbdiv);
+			setting |= FIELD_PREP(ZX29_PLL_REFDIV_MASK, refdiv);
+			setting |= FIELD_PREP(ZX29_PLL_POSTDIV1_MASK, i);
+			setting |= FIELD_PREP(ZX29_PLL_POSTDIV2_MASK, j);
+			out = zx29_pll_get_rate(pll, parent_rate, setting);
+
+			if (out < min_rate || out > max_rate)
+				continue;
+
+			if (abs_diff(out, rate) > best)
+				continue;
+
+			if (abs_diff(out, rate) < best) {
+				postdiv1 = i;
+				postdiv2 = j;
+				best_fbdiv = fbdiv;
+				best_refdiv = refdiv;
+				best = abs_diff(out, rate);
+
+				if (!best)
+					goto search_done;
+			}
+		}
+	}
+search_done:
+
+	if (!postdiv1) {
+		dev_err(pll->dev, "Did not find a setting for %lu Hz, parent %lu Hz\n",
+			rate, parent_rate);
+		return 0;
+	}
+
+	dev_dbg(pll->dev, "%s: parent rate %lu\n", name, parent_rate);
+	dev_dbg(pll->dev, "%s: found VCO dividers %u and %u\n", name, postdiv1, postdiv2);
+	dev_dbg(pll->dev, "%s: VCO target rate %lu\n", name, rate * postdiv1 * postdiv2);
+
+	dev_dbg(pll->dev, "%s: Got fbdiv = %lu refdiv = %lu\n", name, best_fbdiv, best_refdiv);
+
+	setting = FIELD_PREP(ZX29_PLL_FBDIV_MASK, best_fbdiv);
+	setting |= FIELD_PREP(ZX29_PLL_REFDIV_MASK, best_refdiv);
+	setting |= FIELD_PREP(ZX29_PLL_POSTDIV1_MASK, postdiv1);
+	setting |= FIELD_PREP(ZX29_PLL_POSTDIV2_MASK, postdiv2);
+	dev_dbg(pll->dev, "%s: Final setting 0x%08x\n", name, setting);
+
+	return setting;
+}
+
+static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	unsigned long new_rate;
+	u32 setting;
+
+	/*
+	 * TODO: DPLL can switch between two parents, one of which is another PLL. Take this into
+	 * account when searching the config space and set req->best_parent_rate.
+	 *
+	 * In practice it shouldn't matter though. Dpll is always configured to a fixed frequency
+	 * and is the only clock with a switchable parent.
+	 */
+	if (!req->best_parent_rate) {
+		dev_err(pll->dev, "Did not expect best_parent_rate=0\n");
+		return -EINVAL;
+	}
+
+	setting = zx29_pll_calc_values(pll, req->best_parent_rate, req->rate, req->min_rate,
+				       req->max_rate);
+	if (!setting)
+		return -EINVAL;
+
+	new_rate = zx29_pll_get_rate(pll, req->best_parent_rate, setting);
+	if (new_rate != req->rate) {
+		dev_dbg(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
+			req->rate, new_rate);
+		req->rate = new_rate;
+	}
+
+	return 0;
+}
+
+static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 setting;
+
+	/*
+	 * TODO: Implement gradual PLL rate change. PLLs can be changed while they are running and
+	 * downstream hardware is generally fine with that. The exception is DRAM, which reads
+	 * incorrect values if changed too fast.
+	 *
+	 * Changing the mpll rate is potentially useful for over/underclocking. Gating mpll is
+	 * unrealistic because too many devices depend on it.
+	 */
+	setting = zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);
+	if (!setting)
+		return -EINVAL;
+
+	dev_dbg(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get_name(hw), setting);
+
+	return regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);
+}
+
+static u8 zx29_pll_get_parent(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 val;
+	int res;
+
+	res = regmap_read(pll->map, pll->reg, &val);
+	if (res < 0)
+		return 0xff;
+
+	val = FIELD_GET(ZX29_PLL_PARENT_MASK, val);
+	dev_dbg(pll->dev, "%s: Parent 0x%x\n", clk_hw_get_name(hw), val);
+
+	return val;
+}
+
+static int zx29_pll_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 parent = FIELD_PREP(ZX29_PLL_PARENT_MASK, index);
+	int res;
+	u32 val;
+
+	res = regmap_update_bits(pll->map, pll->reg, ZX29_PLL_PARENT_MASK, parent);
+	if (res < 0)
+		return res;
+
+	res = regmap_read(pll->map, pll->reg, &val);
+	if (res < 0)
+		return res;
+
+	if ((val & ZX29_PLL_PARENT_MASK) != parent) {
+		dev_err(pll->dev, "Hardware rejected PLL parent %u\n", index);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int zx29_pll_init(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	const char *name = clk_hw_get_name(hw);
+	int res;
+	u32 val;
+
+	dev_dbg(pll->dev, "%s: initializing\n", name);
+
+	/*
+	 * The fractional value is not yet implemented. It works at least with dpll, but I have
+	 * never seen it used on actual hardware.
+	 */
+	res = regmap_read(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET, &val);
+	if (res < 0)
+		return res;
+
+	if (val & ZX29_PLL_FRACT) {
+		dev_warn(pll->dev, "%s: unsupported nonzero fractional value 0x%08lx\n",
+			 name, val & ZX29_PLL_FRACT);
+	}
+
+	/*
+	 * Remove the bypass flag so we don't have to bother with it in enable/disable. I have never
+	 * seen it set by the earlier boot stages anyhow.
+	 */
+	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_BYPASS);
+	if (res < 0)
+		return res;
+
+	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+	if (res > 0) {
+		/*
+		 * Set ZX29_PLL_POSTDIV_OUT_DISABLE for PLLs that have ZX29_PLL_DISABLE for
+		 * consistency with .enable and .prepare. This ensures that .prepare doesn't
+		 * inadvertently enable PLLs without .enable being called.
+		 */
+		res = regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+				      ZX29_PLL_POSTDIV_OUT_DISABLE);
+	}
+
+	return res;
+}
+
+static const struct clk_ops zx29_pll_ops = {
+	.init		= zx29_pll_init,
+	.is_prepared	= zx29_pll_is_prepared,
+	.prepare	= zx29_pll_prepare,
+	.unprepare	= zx29_pll_unprepare,
+	.is_enabled	= zx29_pll_is_enabled,
+	.enable		= zx29_pll_enable,
+	.disable	= zx29_pll_disable,
+	.recalc_rate	= zx29_pll_recalc_rate,
+	.determine_rate = zx29_pll_determine_rate,
+	.get_parent	= zx29_pll_get_parent,
+	.set_parent	= zx29_pll_set_parent,
+	.set_rate	= zx29_pll_set_rate,
+};
+
+/*
+ * A PLL that can be a parent of another PLL needs to produce an output signal when prepared,
+ * otherwise the downstream PLL's prepare() will fail to acquire a lock.
+ */
+static int zx29_pll_nodisable_init(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	const char *name = clk_hw_get_name(hw);
+	int res;
+	u32 val;
+
+	dev_dbg(pll->dev, "%s: initializing, prepare-is-enabled\n", name);
+
+	res = regmap_read(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET, &val);
+	if (res < 0)
+		return res;
+
+	if (val & ZX29_PLL_FRACT) {
+		dev_warn(pll->dev, "%s: unsupported nonzero fractional value 0x%08lx\n",
+			 name, val & ZX29_PLL_FRACT);
+	}
+
+	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_BYPASS);
+	if (res < 0)
+		return res;
+
+	return regmap_clear_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+				 ZX29_PLL_POSTDIV_OUT_DISABLE);
+}
+
+static const struct clk_ops zx29_pll_nodisable_ops = {
+	.init		= zx29_pll_nodisable_init,
+	.is_prepared	= zx29_pll_is_prepared,
+	.prepare	= zx29_pll_prepare,
+	.unprepare	= zx29_pll_unprepare,
+	.recalc_rate	= zx29_pll_recalc_rate,
+	.determine_rate = zx29_pll_determine_rate,
+	.get_parent	= zx29_pll_get_parent,
+	.set_parent	= zx29_pll_set_parent,
+	.set_rate	= zx29_pll_set_rate,
+};
+
 struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
-				   const struct zx_pll_desc *desc,
-				   struct clk_hw * const *clocks)
+				   const struct zx_pll_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zx29_clk_pll *pll;
+	unsigned int i;
+	int res;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	if (desc->flags & CLK_ZX_PLL_PREPARE_IS_ENABLE)
+		init.ops = &zx29_pll_nodisable_ops;
+	else
+		init.ops = &zx29_pll_ops;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	init.name = desc->name;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+
+	/*
+	 * Disallow live reparent, but allow rate changes. PLLs can handle gradual changes fine, but
+	 * large ones cause a temporary incorrect output, which can break downstream devices.
+	 * See zx29_pll_set_rate for considerations on that.
+	 */
+	init.flags = CLK_SET_PARENT_GATE;
+	pll->hw.init = &init;
+	pll->dev = dev;
+	pll->map = regmap;
+	pll->reg = desc->reg;
+
+	res = devm_clk_hw_register(dev, &pll->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	/*
+	 * Set the PLL rate only if the bootloader left it disabled. Keep the bootloader setup
+	 * otherwise.
+	 */
+	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+	if (res < 0)
+		return ERR_PTR(res);
+
+	if (res > 0 && desc->rate) {
+		dev_dbg(pll->dev, "%s: setting to %lu Hz\n", desc->name, desc->rate);
+		res = clk_set_rate(pll->hw.clk, desc->rate);
+		if (res)
+			return ERR_PTR(dev_err_probe(dev, res, "%s: failed to set rate\n",
+						     desc->name));
+	}
+
+	return &pll->hw;
 }

-- 
2.54.0

