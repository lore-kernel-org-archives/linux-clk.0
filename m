Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07A432E7A
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176748; cv=none; b=D+Lz7JsDPKcav7mE7XGqdnHZwZKNvXuqlMfKi4aGaaM1Fz3Yfax8u7DKDYoLIoUslPlmGJKKiKNgVNV7W2ENrKyMmDedkNtifFCryoRhdD+I1DWpkxx3ZpPh69awsc/WWuxVC09eBv0D5ioQbNVCRXY3gdG9SmkqnMEvj44yUuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176748; c=relaxed/simple;
	bh=lkEo1hQX818bV8klOl1rHkApNx2dWCjcL/vdwmX3gt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEWquahi4glICZFHMg9qjd+zIrFw1lOkame2cx/JajJ3k9Mt75M+VVyPYPaU6zR4/QaLlHhB7f8rbDi5D4CMnrVGlCPEwUoobGcczU4LbI7PPlQ7G/IxL3qmlyRVE2G/037LyuIFUjfkA0mzkklsE97jc3ziMSgqrgW2KkzvYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpYflj0a; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpYflj0a"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1504778f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176744; x=1785781544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPLJsnr4mJ5WRyjiR/tQT2OoQCWwzvDXHsBaYmk+BYc=;
        b=BpYflj0azZ47rl9xah/dnYWGnWTZYZZaz+5WLywdohJK9KT5zUiQlBOEbOxBWroScB
         O4QF5PFJ/jwt3n6oyW1/OehgCCYi3k5RVAfnQZjrIOOjODpwIp0ydDhXkliEqBD42E3t
         G9TRF7hE0dCdKHNENL7ztvrZEUFvPc6uGTPW1Yn2Xm69R0Izo9GRoREuFpnFz/J0lEME
         tsUqRVdyz7Ktx/bzqYOdqz8v8bLiXZcymnALD3400+SyYsgnW6f0rB9RyUVncBLrDsX/
         MpEC5+9gmnxuS+/eEXIZmt7lqm+nXwCXvP0q4gjhozZkr6PL1OJvOA1GcI87QmHPI/Mv
         y7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176744; x=1785781544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPLJsnr4mJ5WRyjiR/tQT2OoQCWwzvDXHsBaYmk+BYc=;
        b=aQdNe/JouTxJxixePcbl8bNVYDbebbAcse0G4vpa3BQ3CK4+5NExxf1V3lkrTd3dWS
         K5EJ6qSTieTIqS3DsTdd3Kgj4NvcPLUIDcKpUUBSTvwJ3pk+ljacbzVypJEbjw5yW413
         m0XNZZia+2/r5IlPuWuBaRujf7Yj0YPJeFz3L9Qsmvk4lPmuRpupDfMwUvMYwrIjR+Qn
         GBMG6cSE1Tcl5zV6M9MVra1lEL0O/jxO7J0PLz8OLgsgLaeVuKjIpUlamOsJDgNasjAe
         WkL6/g40B4r0NH/6Gmhl5ON4FaoKzwYA+lWbrGJwx0dMPSP2PGYcP5JqIc1KMLKJCs2J
         BVog==
X-Gm-Message-State: AOJu0Yz5xy7fqBXMxj1NqNumb1hkdq5kHjsm6A0T8CRvGzuIgR2iwIv0
	Z2YCc86guJ63gfCEKU5RGu0+34Gpx2JXzJhNkZV9W+VA/4IPmKEcqwkJ
X-Gm-Gg: AR+sD12CAUQ8FlDaKKf0JbyMxSZwdTLl2qdq4OGcuB7UYZk/OMmxr4tJn82JpM3B8ZC
	WEnS621JfPeCslK3R1SInIGZLqSG3sOMzf83HH0164Qs9fb4As4HmzlixVRerRKb7U3C6U7ZqTf
	bixhJ09ABGrT5xwxLwhNye/Ggr3kVH5evLz3qjuOYiFGkd5NOKWsgNj36tTcp0mARAPzS4fL5hv
	M+MT3bhzlVgEq4cpGrGKtye1gcNAqcDPHlrN3SOHEqD952PrPha7zeFo+8V4owb7K74XGkvFVLo
	cxtwZIn2L74iz05CmujmaZ4+yyBuUxXaLq+D01n2+x1O9ATm6JeGWPsuMv4M6EQkX06iOsmlHM2
	8zCxTkxsHU5Azxf6MsrWLQc516gPwRAvrHqj/gQGkG2hfPfyYHY0U3sRqgYX822bjG1UPsYmQJM
	l9i2H25gv1gsc9z54CXU2I71w=
X-Received: by 2002:adf:e012:0:20b0:47f:959f:f69c with SMTP id ffacd0b85a97d-47fafa52c34mr225094f8f.7.1785176744473;
        Mon, 27 Jul 2026 11:25:44 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:44 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:21 +0300
Subject: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7625;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lkEo1hQX818bV8klOl1rHkApNx2dWCjcL/vdwmX3gt8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6voGaIGRnfkw/WsvKWgG7Xojp9nR0+4Hg6
 CO/uoksqHaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI7RQ//Rzt23Kal4l7Ii5GLG5TwdgjHSQKUtSo
 //BFxzyh8/ITW3MgaZwGr63F49p9DbaVw8a/EK0IUaftdyU+P/RiqW3QEP4z6QXmQVp5MCedOIG
 NZzcXSkum6/iOCgcrr/eyMKM79SraSEKDQDDO1SB7qcMHAwVvi7109U5xisa6BkvRG9LX1YJ2Hg
 M3o2uAm3LxHxQyaoCnE6AS0dubNOMgkz4SLNyLCCaOCZkVT0q6wZ0vUAJR1yJYu8Fd+Ek0myu32
 5Y0UY7aECGe/Wzuj8auVqlge/zs8ggfiD0YFCvR2zYmVbGx2CLJmYxNTRVQ6heyrcZvoyXVvvUl
 7yja8y04XEshU5yWu9SFUHx+2F92CluaCJF/3AprE9yeZBsDlmKwJaEFGPV52qeLIMTgLXYpr8j
 WfgpxUcf+5dZp2iih/CxYpNmAXXJRnb+qojAUPVk2BC8UBxsW+U0L6aMqYPT7VZ3/iDXLEoBIbo
 x2tNfOigN8HMhq+1Q0qqRrur+kSQRsdVkS/3gFiBOFGZBBjHsOjI3oRVY5tJGzND/LfanPqL3/l
 unsr+j2+INDpDqNegm2M4+2SOU6t1HQt3jqvCgWxoyNKISY8BHI5q2DqzKHwZyAnkqP3LthN2RE
 PzOXzaaZs2RFT8QwlVadTzWb5DgCJ5ddpxDrc5omllc0HMzL0RSg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 984abeb45ab2..671b81bcda4d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,28 +7,240 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/err.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
 			  const struct zx_gate_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_gate_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = 1;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		/* Gives a hint that something is wrong */
+		return 0;
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_divider_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+	}
+
+	return 0;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
 			  const struct zx_mux_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_mux_ops;
+		init.parent_names = desc[i].parents;
+		init.num_parents = desc[i].num_parents;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
 }

-- 
2.54.0

