Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B904262FD0
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702884; cv=none; b=dWZArCpZuq3XYN7Yl1KT24S5eDn2ewfOwK8qbi7uBsDXycCdxwtiKGc8X0Fp7gPTd1BZIwLo+Xnz+inv7nVlg19GWBT923P1546rbCMbaCO9hCUXXLbzVAqt8JpS3nxivcNndBp8PQE4trKqODnVWThHqkHqiAqEDkYLrWUhaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702884; c=relaxed/simple;
	bh=L0mRFzceHyyVEZjtgEBEN/2/jL1ecWAiS0Nz1YsJE+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LT2pUebdL3iMpmNDkkF0mUeWLLFvBPvd5FxsXNxIioXQFTfmYQIHVBSmSB9Q71F1IKVe/NeYbE6IdMfhJE8NjcHt1RWIZ46DCVwOiAgf98AHbcjUU9DU5DUkqOCztZUvv2v87dt5gRsxOT9I+tdFqOzoKpQo7YlE6YbN1NbYCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNQkKGgF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNQkKGgF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8806815e9.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702880; x=1786307680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cq0l+WIUQ3dHFQYylacYFfNzUv1KLEoLLifLFBt5J8Y=;
        b=cNQkKGgFAto0h58/7HGJpzH7k+e7LWnn0BtXFT34BLF4Up3CsXtfNRtLu0Sb9JftMx
         SiZ9aghKm4trb4tb5Z6KIAe3GxfyL+zNbsMQrvcNaiNoPUhZDcNbtpN/yt5QCX6gbE5s
         VcvFwKwzENx9jSvu7ovX3ZfG9igSPMXMOYsKGtI0aI5FFjapCk7hExEMH6t4XmgxzAgP
         rdCsbYvaD9Xpvyc9sV9mOeKCV+jdcsyXuSEdWEUwz895PkQ+TwMbb+J17BIZ2g0CKtPZ
         95JS3M3fvApH7rK/FALnkkAe/ElfDZWDvVyF0au7++YCz272vXayLSr7sLSLAsBg0zod
         r7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702880; x=1786307680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cq0l+WIUQ3dHFQYylacYFfNzUv1KLEoLLifLFBt5J8Y=;
        b=Fk2U7R10Ocb73EXYAv0MTcCC6s4Znf/NILx2DcU27FrfjR2RxBKlIFvyCYzB3ukeck
         X8Rlb8Nrzf1tSGfukyjHQJA2sNcGt4FxSMP9zh9rA7XWmMVfYFm1z/9GmzOLvEuGgJw0
         eRKy0zmPyNGt5f8ChiD61Q9yITvZC0Thbq9s7rHfXDIW0ARs9OGQJ0REp3ysy9v63fva
         vSxjS9WoqpgJf737sA31u8LsLzFm63ilE0ZWQdyt0yGrdwi4jzeXBqw9CcDaCSKrPw72
         rCMZih51ydjbGBchwE1HOm2wa7lYYSLoguXqgrDekl3CFN9r/IpIIv/AdopYxiFalcD2
         RuTA==
X-Gm-Message-State: AOJu0Yz47Zpo0sumAI2093pMkSNxt1miUqglKFypxOSKDk5+aU0Jmb5W
	vBD60HNg/mdDom/AytticRcc8q2ba0GYwcdPZ46O/UhFnW4HqyaAY1/1
X-Gm-Gg: AR+sD10PVnH2PC8uE4uujZ6TPUikURRJHNWt7uzRJJvG2ZlOg35V8rtAtAqckS+xxgz
	9PJTOGjM1IM05/cvjSYnLzPqr++qXYHOBSAuQ98gxyaTfeFw8L7Sf5m9DH6mzoIuXHsDrbc/PIC
	xKjJT5BHBV9xNjWZbsrtIPrqruPKfDL05mZKa89z65umsyLjvyV+aNB3Q8jPHg/+bPpswFt2I4l
	O2HIkZ1BFTstIq+s5YIrP9OLwERwBjioZbZ9b7K4UHbRpec6FJys6b2WHAoP4aHi8GRtL286dYa
	xpX5U7QXSNAkajyJ8TWJ0+B+mUqIpXf2VNSIu0/AmAKMW8p6skbioHebQf8OChdCpuLvaRvnxY5
	+g5M5Qp8xmZPmuLki2ZAaA4cBZuI2wrwiiUu2z0ut27xOOUYDHMYRoFb8CMWUhtQ+o3B8wH7DWn
	t2W7p0vAuE3R2wM9SwBLN1vl96WwxkZw0//kDvHZKFSM4MrYm1HiOJi71asMQvGjQ5Jh1ygb3w
X-Received: by 2002:a05:600c:8b13:b0:498:8e6:d464 with SMTP id 5b1f17b1804b1-4980c65cd2fmr166733515e9.14.1785702879566;
        Sun, 02 Aug 2026 13:34:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:38 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:39 +0300
Subject: [PATCH v9 07/12] clk: zte: Add zx PLL support infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23186;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=L0mRFzceHyyVEZjtgEBEN/2/jL1ecWAiS0Nz1YsJE+0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6mydClZTSFDkFcWtYpDTlA9rVKTqTu4kcA6O
 DR+VCUsYaqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI6vg//aBwXMLTH1q59DlZ6uOoDh70s+9tUPYF
 tNF8bYCHuy+JAuanh4c08doCptw9jcR585JtuWZOQNy/WLWvhSEYsa0iXcnYVUbKyC0UQfMSAfq
 eothjgFqwItP4IEVZpLDbNy6cDOImicSSQgOfIxTI2V9AALqDX3Tig0RGHTFLP0+f1u7lN1aBwK
 nOX20klUarsZ0ieFx+7M15lvoOfdUbA6ODqesMDeC6SNxxb02XBSzxPxoibywWQ3izIh+qUE3bL
 D2ZnhUA2s1GQSw45IxJg9Id+6BqsVX/N1nmZyShPtPe5WX7oUNMnby43C1rpS5kQCLgbsGj/qWF
 7jiac9EkdANtVp1Og29FmRtosRpbufOSXcsuTLkLI+MCQzSds5j/nEVvWg/qvYyHeoWAoUa+TYG
 2t+906mVdeCVJlOt22XgiQLVfdDy+rkAZe+IDw4VI8XUmQMMp6UmeLChHmkj3RzsB5CiUpawtqG
 S2yy4mSvhMwgVGWUwCFX5sqMqRiy9OBTHX+4fpEw5VDrcKZIAFo9YOJt43LkNBpOdr8kM2o8xlL
 h3dG9nFfQ3DPLVAj5YYepnbDcDYNsqx2utj75xye96YXunPvVOLhVtX7qH7Mx4EViz86d3IMgDx
 RhhGO6anM0nV03O9QZsPaP3PG8Jm/tsiJ2C66bGQq/svUb+9bd2Q=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

I am guessing how much of this is reusable among other zx chips or even
differently named ZTE platforms (if there are any). From reading the old
zx2967 code, I think the PLL code would be reusable there, maybe with
platform-specific bitmasks but otherwise the same logic.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 drivers/clk/zte/pll-zx.c | 568 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 565 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
index fc76c6524a16..e61b462ec0b4 100644
--- a/drivers/clk/zte/pll-zx.c
+++ b/drivers/clk/zte/pll-zx.c
@@ -4,15 +4,577 @@
  */
 
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
+#define ZX29_PLL_PARENT_SHIFT			25
+#define ZX29_PLL_BYPASS				BIT(24)
+#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
+#define ZX29_PLL_REFDIV_SHIFT			18
+#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
+#define ZX29_PLL_FBDIV_SHIFT			6
+#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
+#define ZX29_PLL_POSTDIV1_SHIFT			3
+#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
+#define ZX29_PLL_POSTDIV2_SHIFT			0
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
+	refdiv = (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
+	fbdiv = (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
+	postdiv1 = (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SHIFT;
+	postdiv2 = (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SHIFT;
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
+			setting = fbdiv << ZX29_PLL_FBDIV_SHIFT;
+			setting |= refdiv << ZX29_PLL_REFDIV_SHIFT;
+			setting |= i << ZX29_PLL_POSTDIV1_SHIFT;
+			setting |= j << ZX29_PLL_POSTDIV2_SHIFT;
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
+	setting = best_fbdiv << ZX29_PLL_FBDIV_SHIFT;
+	setting |= best_refdiv << ZX29_PLL_REFDIV_SHIFT;
+	setting |= postdiv1 << ZX29_PLL_POSTDIV1_SHIFT;
+	setting |= postdiv2 << ZX29_PLL_POSTDIV2_SHIFT;
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
+		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
+			 req->rate, new_rate);
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
+	dev_info(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get_name(hw), setting);
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
+	val = (val & ZX29_PLL_PARENT_MASK) >> ZX29_PLL_PARENT_SHIFT;
+	dev_dbg(pll->dev, "%s: Parent 0x%x\n", clk_hw_get_name(hw), val);
+
+	return val;
+}
+
+static int zx29_pll_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	u32 idx_shift = index << ZX29_PLL_PARENT_SHIFT;
+	int res;
+	u32 val;
+
+	res = regmap_update_bits(pll->map, pll->reg, ZX29_PLL_PARENT_MASK, idx_shift);
+	if (res < 0)
+		return res;
+
+	res = regmap_read(pll->map, pll->reg, &val);
+	if (res < 0)
+		return res;
+
+	if ((val & ZX29_PLL_PARENT_MASK) != idx_shift) {
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

