Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE15519AA
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188203; cv=none; b=ID+L9aGEEE/gTV7uyerFQjTOTljUhxH/YgI3C/PYHgymMGyWrxeixK2L3nrW/dpftwyhWSLOHXuEIsEdNwiQ2W4+CzJhfvn11dPid52xGpjt8OYuKzUxhcVnnnzHNmrqy2mP5EKVqwWnw16vqJVsVmEj5shu3yHLDWWX/JuY1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188203; c=relaxed/simple;
	bh=sbLJ0u4oUa7S2k0ecc0xf8M8SDdDseo5IJY3miTfvzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4ugG4rs2dWe8NjJq4fJSfUHIH1JX5NrQZeMzH9DTpXnsXwxGgkfiQQzMr8nfrfU4eeeGxNAJIWVmLuoP6jVO7nWmku5WyJ2HGyF6eiRg+L9aG0KlOAAEDrFrbcOPxnwZ75/1S4deziKuWqEyRIQFS3X5RsERFYMGyMYGhMDeOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbeAkq39; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbeAkq39"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so7219035e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188196; x=1790792996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO7civX8MGJPH4ILny1DZ3vkVbAWd1DfDXfWosRBdpk=;
        b=QbeAkq396wLUWJa0XsDZC4AM+VyKZ7f1oKXEuVzKqpvOPfkZ7wEOMZGnsYGR2e2znw
         ch90kSQ4/ckJA6s/F83J0VBFD0OWSCpf4+zURmM+HmF4QThXpQ4/4NtZTEXpEGyHbHPt
         BiGPC1B8Tk8pnYYkXrmgn2o4K39w5S4+SI5VOg+t0vit/wnIET6fpg+IGU1DfKOk/uX7
         QLileyLTY/qoHNBrD2ham2E3gn+gwH1AVgOPADI3/tNXMVdPqfdVGV+QFGubeVFMqdT9
         Q3iRYBN9gCSljMKw0ONUZCit6hJIDS8fkazZyei6ITVlXu65iXqgGzTxKJJiv3rOqeTP
         OP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188196; x=1790792996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YO7civX8MGJPH4ILny1DZ3vkVbAWd1DfDXfWosRBdpk=;
        b=r9zDZWTowu1vnDLfbsluQfkkggxgPhLePS+qP9WprWW7vZtiS6DI9kIzXD3XERHpyE
         kirrqsdXqyurdj+pvknT4nm+QcyKKW3EPXXJziT2YuwQTQnw5qmVP7wJCezx5dMmqy/6
         HcYPpXfzdBG6FDBRXJyRjOw5NJtx+g9YDG32aK1YnnbqwSn042GnfDwwj9gU2vHRRJeO
         7wkPC/CTEBt99AWWWMm7Ud4+x37tKtqwPpXbVytcd2rQFCmOZK30WabXvGUREh8Aq0co
         CM7SrtyMt5pwQGHo/mgnW9fDoFvzqu5ZoeTd2+yilaKG2b47WSAG8Sc2RYxtfNcz7oON
         8Ekg==
X-Gm-Message-State: AFuF++kxAD58gsHUQq2znS/0jMT0/8t3bfdAyDosZX7s0JgEX/JjULSF
	Nbt67zVb46teMBxMJnIi1Os2QepD536JagIEA0zytRhei4NcRdJQ/vyJ
X-Gm-Gg: AYBFou1+1B03wySs9xmSFEZG3beCoHxplGtuHnGqR5DIUNiSTPwn6xOMZF5StSrrTM9
	oesK44KUk429zXI9QalpzEUjThsu9Ye98/ykZYHYkywog/XumKA+yXDobVJW0sgF9OzwFLQrFAr
	2bFItpoVZ0Ve2PINTFEzpfZbK3nl4mbU6WO5b5lt4awTn5DE4mbi3uaoumwiB74rpHEBecAvx/b
	wYnY7t64Ohx85yR7wOEvnaUjxaZMwmcdAOf/PTm0ojGdTKNKyP2/10F1LfU+i3r9X2rS8+uWJjh
	ZRPP850P74VghrFb9OSmwlMwcjdi3lusi5tlSEcboMcYtTxZrOUvU9ZCZSH+k1ZTfXcmwC5Md0y
	GpmUj6ZCJ5hxdVXnN6qhfwuNaHXDT86b0ocghMR+pZlfaI2DGJl/TQLEL8TfMsy0PjQqLt2197r
	wcpLZTCjZKIBJkPAuzFwQlfgF6qg2NPTe9Vk7qQD70o+/O76haYQtu9bLGZYfqnvBP7vPWYe/2p
	XUC4YBqkK3D8rBS
X-Received: by 2002:a05:600c:1c25:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-49fe66f19demr1194485e9.18.1790188196090;
        Wed, 23 Sep 2026 11:29:56 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:55 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:53 +0300
Subject: [PATCH v12 07/12] clk: zte: Add zx PLL support infrastructure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-7-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23750;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=sbLJ0u4oUa7S2k0ecc0xf8M8SDdDseo5IJY3miTfvzI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpuSxzhqLCe9cIm9gxyltqx+F2nlJqToOtuP
 DWX3bX6/4KJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK3gA/8D7yU/QeTIpFS+iCyQSOdr+78EOEEwvw
 CEgJ8W9TDLYMUWeRFJos3OGjoQMd8zrki21QTrCZ9+QcUNwyzU8GQQJNw4cSAG1ycknwNF8xeXv
 1MsS36Kk2ACsfl142lp7ZjwS9pjYj5YIApTHM4ohVxh4tUUav9zwvde7tDqBKhBXTeGVJVh4Znp
 w9bnElrrOg9rUxx22YIjBasA9JUXMwBWU2jJCHulzaUs/8At6WcBWIk/W0llyT5n9f5ZOdKsZAJ
 JMPJDEMkkXJTNtpYAC0yo/HYyQfPVvm+5lIyKRyuJAk61OkVEaKLLFB4YDtiF3NM6GlclkeLRRn
 tFQWIYbkIXIO9hAANqpn9Smm7pB5H8nl8YbZRT3qeFhUc7J+raWNvKIoBXooBSAtfZl8Jvl4+5e
 cAd3oi88QYUAUxmLb4kYtJfz+lvcFU2fFuN5OdnJznJd2mMA9uuebAMEyek6SirwNbHqJKYRjI2
 V6bJzQKwzQMCucDn3WE+MY0/EfxWkdLb7uYuepODDMaG1FxjrgpRGPlFBW+DXF6r5ZFd0zRt110
 lcdY1IVGoydExilmnzy/WAlvM7rHjKQJX2VCqFJHGTC1qRFQ79SjhZ+ymnWaO8Smk4OAbvmW+tZ
 uiYVh6EaRWb2yzbqDK1GhOmCh5IJU7ty6c4s7Ou7PkTQjlrMUaU8=
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

Version 11, 12: Unchanged

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
2.55.0

