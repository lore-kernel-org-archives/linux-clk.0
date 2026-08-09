Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D5C3793C3
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310964; cv=none; b=EHegQvzEX0Pr2uUIIoZJekSxOKjPOdVPrBUgGf+MBSgeEJtUKJviww5M40sYaGEGY9ey5NhB+LsyyEjxe4T9tJT+h1ZGm7MEy9GOsZ4QO5v5+Zri1mmQyzfJN2/gkxyCca6PhRelMS73LHC0pO/QPdbCifYvnNC57Kkxm3cSzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310964; c=relaxed/simple;
	bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCfltTuKClCnAKQ4SBFjGFLhd7p2e62dSCGfR7ufmoxf9imSssvG7HuBdeD8jGXaAp0lEpeq9dKS70tFGNgZaj9LjqqghiPu/VWxvgQJB+IUPK6eZeihkPtiMdUJIhiPHVNZ+gDwbIbvmS/DoUViUxK+St4nJqzsufJgZmbaVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxcrsIoe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxcrsIoe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496b7622a83so12244115e9.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310961; x=1786915761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=jxcrsIoeTngOsIIl8p16MADOeiQQPmjaEfayOa4i/ht9XkA95ZZNbYKMlpwAz6/v6l
         sqtW5Wv71v3INSMPDSuZbZ+wbcB9J9dTpMh3ljiSx6rfOOV0HN3vSlNdWm11dvmz2M05
         nBHxwC5Gq2tEQRlP/ELlXFFI+Unyb5EgoNvttJ8XjX5hsPRSS3Xn0rTgzKFNOXuV6wj0
         qOSh8ny5MaxW5l7doeTX4dHMCiucyrHN5BMPXFcyeC8HiboLTIUciTSaxJaBKbhtSCn0
         ajp7J9Hvvbm/AVMKnrkgQCqf8QAAmHbYIOmG6tp+yozxyJRJC+pki68zYFv/LlBucXi1
         U4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310961; x=1786915761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=mLnndf3D0qa3DsY1FWCbpy9qJWcZHoNrO6+K7XSlseC1ENwHFXdfLveahPkHFrFYj7
         Dp3QYTuqL/cVtLKmp2b7/gB0C0p8st6R7mbB4v4jJf1bEuK6lEeuTFFp+Vs8gorE5Xm6
         izzcnU9Z+lQp2aRfCphq3ZPTAOz/Y48a0vAwnG2fqTQc4npf3vRaO77Cdg4r7V1DKJ4F
         0MZ1wioCP51kcdkZS4Zj1f9DenpyOShHJfV5j6PUg4Y7DxqnsyjIUjtcPceFc0vy7K8n
         kbcS8+qbBffTmLaJG0uEOUAMU4QR2dojAAh0APoLlHOnMne3a/ebqGe9mDhJfTf/Zr0Q
         fgcg==
X-Gm-Message-State: AOJu0YzDG4A0XrpLCrJnTjZUWH8uexScLJHM4mtHALVD7OTM+fDdgCdH
	aG6UBEl3WNgBJnrcDa5xi5+0sAORsvcIUDzXnBgHroD4AMPvg+B7hSUf
X-Gm-Gg: AR+sD11xr5LyHC1aY2mVQIeog/UYwMQ7egpWolKQpC7T1NSBanIiutW1nE0qRXINSgi
	bsaOZiCWUWYWSnE5gbcKUVnRx+RhpwZIATALBS/d320jHMupEg7GNE1QPaduHWVH+QOY+5xBsTm
	v0Q4PLfuQE6YBu6cHn0k46oBpT0KiDldTjp3Yukq/8CUwp8pKEsmBz4E6LgU1cunmshbZg7Xp7k
	6QBko6u07csAvXwxw3FoFlb5JV0quMz7Yx6HBMcQhM9ZD7xOzn4IGVOUz5f//xUnl3vam5z7Bk3
	SloGq9b42lLTS0+WmKIJ9ewnAh8+j/xume3dViwnuQCwkkRv7kt2oF9odEkE83FCEzHaOPYr4GU
	7E6wV1uYgtqXjv7b8M9GEGs3i6sx9IiWXZzMQVUylmQiDOrZxn8GWs2ymRWf4orhatvmiJeZPkH
	q4S5zIrK+xrURzllQeLMjLojJN2yVuR4UUJeIdz3Hkr0sGg/yILpW3NuYWwcvp2voKed7wOX1iY
	XQw3kX/3w==
X-Received: by 2002:a05:600c:3b93:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4996193de3fmr201180815e9.2.1786310960960;
        Sun, 09 Aug 2026 14:29:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:25 +0300
Subject: [PATCH v10 06/12] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-6-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEObWXRtKfarCx01D6fhXjDV487TIvwmkZzF
 Coi2W0vEheJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKNmQ/+MrhQUGhu5/mlbTjDgGqPO48LTQMNRnR
 Y/8GxNsJE9/yZUfV0bQGelbfJzwRK7mFYdc3RfEMdlRwPUqtjxGnCYRn84PJYM0NSDVOHVxiXoe
 aTiXCPO3S8JzKPbJUBq9MyKW7iS5GY/obxR+yjOar7sZasaaetNJyZCWpgbafk2E0tKTSVha7R+
 b4Tn+luIyBUWxbKg9sy2zWQhkaddYxD+qCtYflpTx3RewUlTLqeEdxvpTUlnRdVXDuHeoycbuR2
 XfM6dNZxZtxGfpWd9acSz5YtylbT05s+D72bOm8Vd3pXQVYPAhK/tmgZoqj6zpR1cq271kSNUdn
 8T4LSMpBtkCDf2HtL/8ONtrYgOmADnX21y9ASeiNohISjB8vNXUPW0i6jYgJfWLPV/NPQDGMa7X
 3nQWXVCsryf23iAToCg0q5J57tpzBUO3vUZ8xoFys9ia7vSCVqdM2XRRe4b9ItR3PC5Q7L7pTZ1
 0ZJnGNqj19GVTAv1VkKtpkXjU7VFbMFTZ5GeMZrlHRV3xECDpSPg2ddn/fnLuEyvYBVrn7cMwtU
 QDJDzAo+yNipcg/shjeYH3Ab9cfCUvOBjkTR78o+JnbU6L6oWD7dSCY625bTw0XjgJL+FWd8LPr
 q1Z5ZeRCW1MAXCXZL585VXQ+CrUZXNzOHHPsMOK1Bzu6LzPOTvxI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
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
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
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
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
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
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
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
+
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
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.54.0

