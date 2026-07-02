Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3653A9D84
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024139; cv=none; b=TD8FVxJ2dWubIlw2duUHg/jM/qhAMuIYWz9FW8PePrLbqsel5nsKzdiiW/20ZvJpoOSM1Oj8443GDND7owEWGvc43x2X0ocXruUWgjIQnh3NMXmEXAuMXyZo4Ur9FzeE7Qpreb0kolC17oMrmDV4olnOJ0+vBFQk5NzIiobW/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024139; c=relaxed/simple;
	bh=ckM/IgCDyyRSMRUtCjdmQSw1iQOQTRmNiYS81ylnRSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZnM+brZ0U8BUFExu2eUNhH2bkMG1aTwcIo8FlhpJIXG5iD3lA2lUnwqSSsCEtfK9erZYZqQfYeuGxj6vAEi/ey6JqK4EyWs5hfdtWmB9kdu3R1jSiObRXwlK0vJaSDntkXcCZsXs9Q7C3iGUFa2CyIJkhm7yuUuXZJjzPe1AAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLaPkYKx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLaPkYKx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493be1b9564so16597375e9.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024136; x=1783628936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shmRjxS/f2hR+aN29JbAdGivDrg3KmKiAXcpZNhvqK4=;
        b=sLaPkYKxOVBplbGNEOH5+s043/ha0yWK99h2IllVUIU2mzRBY78frRdV8MJbNTzULd
         dsVov1+o9v4JmeGQLqhWFe712JeBkB4VwLCfmU08rQe//pkH+kdAYR8rl6w0j5ECiWg2
         fhWxEEiUIB+d88GRvBz4WxIbpMObjX1STiVAZxOl/+bf0sF3b0LC/nI6ylRBRap6JpEH
         hvRu894oNbiDHTtm4qMr65VN293QPw72L7MGz2D6ZNJNZIVl9wmeJmn5qcOXdzoShP5f
         Y3/E/JEqq2rAxxXxL3Ll8BQf5wgffe+81owdBtv5WiRGSSdvCNNUrzh9Vr9lT5OJtpDS
         7/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024136; x=1783628936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shmRjxS/f2hR+aN29JbAdGivDrg3KmKiAXcpZNhvqK4=;
        b=Q/tfFTu2WcwLhCUJfp73ZJe3VIfjhAAeLncAoj04l6aRqi/4DUoQbsP/+RDZUqXej/
         TqR0OBfCMGpr2dlIyPLbrf2tSoaKRJgSusvRxU57ibumCuuW6kHp+EVTnTkyzH8J5RoN
         np3W/yZP1Bl8xZMOkw1we+z6JRq3E1LY9MgvPDPh1qVjVNWNnWOayXdlF8eQw4yz0kkO
         OYs0vTWR/zRM1YgBH12U7dP4IsMNy3Hz8HBdc1du6f55aH/F9UixkyNE3IdSJweD/oog
         GoXO4scVyHQx1qeaxYLtQBMU6KO3obw5Vz4z4oXIV0UqnRv0FPf8O9JsvSRZCEqUWcX9
         4f/w==
X-Gm-Message-State: AOJu0Yxm18AxiujpAtumeUqZb8VrL2qmi/qLs3cOtbKy8vrJ8pdrMYZR
	lpTami+UecXTgSrExxm4jAUty+5Ax83IwcTua7vf1/dDHdDC0bbVUO+J
X-Gm-Gg: AfdE7cnNZtzLnpSAA7E05HmMB5dZYwbjE+6dCckCZfcctvytJgGrgQF5fAx+XxX5sVq
	wiLSADNnkfc43wYsHv+IAmrNRH3v6nSjllSevZm5KAdFDEFBif4AZ1LZGiW2ssXK+G+b0mf3J4j
	s4nqGXHZHjgQfPg85PwOlQQwWOTV3ZIsbTByk7pHBsYPUtZNlmWWMdC9QwapTs6fwB3XDtQfDqT
	ypAhw6eCwwcVyaWd+TPvx6ECMk3KJknh5YPSArnvp8tg+QAbML4PjzD73amy3RNCuRgSbHzNN+z
	mluJi91pRH35MzE++/KTZt+/XAUWvvM4wwZ5F23JXyUVs7ttE9o4PgrYjLbYJs5cels/ITckuO9
	ajDeWeiiOqaI5pjccZURsFUntSKDg+fTMSsyk96V/mLUpVCaGeEFGwX6SPZsbF6UPrS3cXdEg6q
	8ke4zrYzM8xXaY3BCMsryfq24=
X-Received: by 2002:a05:600c:3b2a:b0:493:c998:fd11 with SMTP id 5b1f17b1804b1-493c998fd21mr25222715e9.35.1783024135719;
        Thu, 02 Jul 2026 13:28:55 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:54 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:02 +0300
Subject: [PATCH v6 07/12] clk: zte: Add zx PLL support infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-7-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=18924;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ckM/IgCDyyRSMRUtCjdmQSw1iQOQTRmNiYS81ylnRSM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnppMfXE9a4dEZ1p4gdUqcWlbgpLLwviQdk4
 pUF/esp8KuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI5ow//ZYl8kiFVLhew7896ukYIfc5EmA8cNlw
 XATQRM6QgxCI8FJxdX6EZOKithl0vPng8AdZayUwI3S3xhBFfia+LAhO+SK9P9NXMV6i+CmA12P
 QotSYU8aeGorHkiW/U8GM4OoV6qPVq0rpbn5o4fe4RpjBgnfeksZ5IaMrF8uXcGdrGLoUYclmGF
 IICZtzw4GiZY1dQUGvhwwy1gpcUf1XalKU18HCMFPY7kdjtSrKlcMLaVvmP5vdyT5dk2PDoBPLl
 pIb3uWEMuOGrXG/OW9Cixwa9xD1Adhb2xc5jsR4nqpXbET2xbIS8eGTuJXblUsdaNyjO8tCeyUB
 jG/6XGUYf5m6NEsTYFeJT5eCee/YahENSjHI6lw6IG57yEQZUPyGtDbqrO7LpHHx3EpX1TbXgjg
 zRdz+AYebGx4e1nsc+eBbZ09ru7qbPqcE0Rzsl/iu3TJiFpw0rrMqFB6QqvDo7UkjRo5coLAMqi
 PQdpML9uwbya/Egcivy4J2p6C5BXmLdGPYHXdrPdf58z75/9kDDvIGlyZYjsIdDviLXqOIm62L6
 5iUgjYRsk3G+BrbQ+WMtfoCOV+JCHNVywoxm08kWpjQTL7l4fy/jJqgKMIXQXKv5tq/JzKzCR3+
 A5UIAa4eRY4miBMjXZ7r57I/kQVGBfNa721y+F29GKNJbcK5mWQs=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

I am guessing how much of this is reusable among other zx chips or even
differently named ZTE platforms (if there are any). From reading the old
zx2967 code, I think the PLL code would be reusable there, maybe with
platform specific bitmasks but otherwise the same logic.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 6:
*) Use abs_diff to compare target and candidate PLL rate (Sashiko).
*) Use req->best_parent_rate in zx29_pll_determine_rate. Add a TODO
comment about the parent rate flexibility.

Version 5: Fix Some issues pointed out by Sashiko: NULL dev,
zx29_pll_recalc_rate error handling, disable PLL again on enable error.
---
 drivers/clk/zte/pll-zx.c | 480 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 479 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
index 1a8cb37ca7e2..f527c15be01e 100644
--- a/drivers/clk/zte/pll-zx.c
+++ b/drivers/clk/zte/pll-zx.c
@@ -3,15 +3,493 @@
  * Copyright (C) 2026 Stefan Dösinger
  */
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/rational.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
+#include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/math.h>
+#include <linux/clk.h>
+#include <linux/err.h>
 
 #include "clk-zx.h"
 
+/* This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
+ * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
+ * .cmm file (A Lauterback TRACE32 script) and some unused headers in their U-Boot code dump, which
+ * may not be accurate. When calculating the frequencies from the default PLL configuration the
+ * results match the fixed rate clocks from their clock driver.
+ *
+ * The 26mhz and 32khz clocks can be easily observed with the timers. The 104mhz output can be
+ * observed through the UART. One 122.88 PLL can be observed through the TDM device. All others can
+ * only be indirectly infered, e.g. by comparing CPU speed or SDIO transfer rate between the fixed
+ * 26 MHz oscillator and the provided PLL frequency.
+ *
+ * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
+ * are given below. There are a few control flags:
+ *
+ * Bit 31: Disables the PLL, but passes the reference through unmodified. If POSTDIV_OUT_DISABLE
+ *         still matters is different between PLLs.
+ * Bit 30: Returns if the PLL is locked
+ * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
+ *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
+ *         influence GPIOs.
+ * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
+ *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
+ *         lock to the reference clock (from ~400us to ~300us). Regardless of this bit I could not
+ *         make the supposed fractional part in register 2 work.
+ * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
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
+/* The second register is supposed to have another 24 bit value that gets added to fbdiv but it is
+ * always 0 in the preconfigured values. I could not observe any effect from setting it to something
+ * other than 0, regardless of the DSM disable bit. It is possible that it is only supported by
+ * dpll, which is a possible parent for i2s.
+ *
+ * Bits 28:25 contain more flags:
+ *
+ * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obivates the speed gained from
+ *         !DSM_DISABLE. No other effect observed.
+ *
+ * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
+ *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
+ *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
+ *         work ok if they are fed from mpll without this flag set.
+ *
+ * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
+ *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
+ *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
+ *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock
+ *         if both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
+ *
+ * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
+ *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
+ *         so I could not confirm  this. It does not disable the VCO entirely - that's what
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
+
+/* The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
+ * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
+ * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
+ * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
+ * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
+ * likely the PLLs become unstable outside their core range and the SDIO controller is much more
+ * forgiving than CPU and DRAM are.
+ */
+#define ZX29_PLL_VCO_MAX_FREQ			(1300*HZ_PER_MHZ)
+#define ZX29_PLL_VCO_MIN_FREQ			(900*HZ_PER_MHZ)
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
+	u32 val;
+	int res;
+
+	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+	if (res < 0)
+		return res;
+
+	/* Lock duration is usually between 300us to 500us */
+	res = regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PLL_LOCKED, 50, 2000);
+	if (res) {
+		regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
+		dev_err(pll->dev, "%s: PLL enable failed: %d\n", clk_hw_get_name(&pll->hw), val);
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
+	dev_dbg(pll->dev, "%s: reference clock %lu HZ, PLL setting 0x%08x\n",
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
+	dev_dbg(pll->dev, "%s: %lu MHZ\n", name, freq / HZ_PER_MHZ);
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
+				unsigned long rate)
+{
+	const unsigned int postdiv1_max = (1 << hweight32(ZX29_PLL_POSTDIV1_MASK)) - 1;
+	const unsigned int postdiv2_max = (1 << hweight32(ZX29_PLL_POSTDIV2_MASK)) - 1;
+	unsigned long fbdiv, refdiv, best_fbdiv = 0, best_refdiv = 0;
+	u32 postdiv1 = 0, postdiv2 = 0, i, j, setting;
+	const char *name = clk_hw_get_name(&pll->hw);
+	long best = LONG_MAX;
+
+	/* This code produces the same VCO settings that the boot loader and stock firmware use for
+	 * the standard frequencies. It has seen only very little manual testing beyond that.
+	 *
+	 * The goal is to find a VCO setting that gets us as close as possible to the desired output
+	 * rate, while being within the VCO's operating limits and achievable with the input value
+	 * range. It is iterating over possible post-VCO diver values (1-7)*(1-7) to look for valid
+	 * VCO target frequencies and then looks for refdiv and fbdiv values to achieve the VCO
+	 * frequency from the reference frequency.
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
+	/* TODO: DPLL can switch between two parents, one of which is another PLL. Take this into
+	 * account when searching the config space and set req->best_parent_rate.
+	 *
+	 * In practise it shouldn't matter though. DPLL is always configured to a fixed frequency.
+	 */
+	setting = zx29_pll_calc_values(pll, req->best_parent_rate, req->rate);
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
+		      unsigned long parent_rate)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	int res = -EINVAL;
+	u32 setting;
+
+	setting = zx29_pll_calc_values(pll, parent_rate, rate);
+	if (zx29_pll_get_rate(pll, parent_rate, setting) == rate) {
+		res = regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);
+		dev_info(pll->dev, "%s: Setting rate: 0x%08x\n", clk_hw_get_name(hw), setting);
+	}
+
+	return res;
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
+	return 0;
+}
+
+static int zx29_pll_init(struct clk_hw *hw)
+{
+	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
+	const char *name = clk_hw_get_name(hw);
+	int res;
+
+	dev_dbg(pll->dev, "%s: initializing\n", name);
+
+	/* Remove the bypass flag so we don't have to bother with it in enable/disable. I have
+	 * never seen it set by the earlier boot stages anyhow.
+	 */
+	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_BYPASS);
+	if (res < 0)
+		return res;
+
+	if (regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE) > 0) {
+		/* Set ZX29_PLL_POSTDIV_OUT_DISABLE for PLLs that have ZX29_PLL_DISABLE for
+		 * consistency with .enable and .prepare. This ensures that .prepare doesn't
+		 * inadvertedly enable PLLs without .enable being called.
+		 */
+		res = regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
+				      ZX29_PLL_POSTDIV_OUT_DISABLE);
+		if (res < 0)
+			return res;
+	}
+
+	return 0;
+}
+
+const struct clk_ops zx29_pll_ops = {
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
 int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
 			 const struct zx_pll_desc *desc, unsigned int num,
 			 struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zx29_clk_pll *pll;
+	unsigned int i, f;
+	struct clk_hw *hw;
+	char plldiv[32];
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+		if (!pll)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zx29_pll_ops;
+		init.parent_names = desc[i].parents;
+		init.num_parents = desc[i].num_parents;
+		pll->hw.init = &init;
+		pll->dev = dev;
+		pll->map = regmap;
+		pll->reg = desc[i].reg;
+
+		res = devm_clk_hw_register(dev, &pll->hw);
+		if (res)
+			return res;
+
+		/* Set the PLL rate only if the bootloader left it disabled. Keep the bootloader
+		 * setup otherwise.
+		 */
+		if (regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE) > 0 && desc[i].rate) {
+			dev_dbg(pll->dev, "%s: Setting to %lu Hz\n", desc[i].name, desc[i].rate);
+			res = clk_set_rate(pll->hw.clk, desc[i].rate);
+			if (res) {
+				dev_err(dev, "%s: Failed to set rate.\n", desc[i].name);
+				return res;
+			}
+		}
+
+		if (desc[i].id && desc[i].postdivs && desc[i].postdivs[0] == 1)
+			clocks->hws[desc[i].id] = &pll->hw;
+
+		for (f = 0; f < desc[i].num_postdivs; ++f) {
+			if (desc[i].postdivs[f] == 1)
+				continue;
+
+			snprintf(plldiv, sizeof(plldiv), "%s_d%u", desc[i].name,
+				 desc[i].postdivs[f]);
+			hw = devm_clk_hw_register_fixed_factor(dev, plldiv, desc[i].name,
+							       0, 1, desc[i].postdivs[f]);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			dev_dbg(pll->dev, "%s: %lu hz\n", clk_hw_get_name(hw), clk_hw_get_rate(hw));
+
+			if (desc[i].id)
+				clocks->hws[desc[i].id + f] = hw;
+		}
+	}
+
+	return 0;
 }

-- 
2.54.0

