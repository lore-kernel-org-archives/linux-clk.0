Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F4395DAC
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641638; cv=none; b=sLuzWy9C3hRvA9cajJ3NC1lBofg0axTjXMJEWlThXJBDE3tRb6IPuG71wry3U96gVclKGZepOwJ4W8ueawuUgyg5sb71klHmHBY9IKQIGAGagdCY4TMjLK0ET4s8AySw19CS33Yxo0mPAlciuhC1mAfQghbtiXzgr/k/KOOJ+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641638; c=relaxed/simple;
	bh=wYgtHGRukfQ+uMOMTNkE7udfhe0qluyVy0T100d++n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/fpax6p7tRt9EQoar29eHYy121lEMCBweyS1vw4XGLWe6XJrLgtcB0Ilk1lSoiRMUSlJBIYLs9kq/WAm273O/DgVOgxR1wVGZJ5eIUJ/pewixaYlu36HYJZqFOGMNK4J52bEbZtGqTjQgGOpChxM45PNNH+fBhTo7zAnTOoLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBxO7MK+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBxO7MK+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4923139e940so6841195e9.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641635; x=1782246435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGipdqLCxq5G0EmePkbO7V4LoprWK6DBkEcoR7sOMUQ=;
        b=sBxO7MK+iN7I3M16mXJoBtxpQIc4jqvyIAW59/CkcQMwADW+YDy0mcsq1T6dd98QNW
         pT/SkViSrb6cx/0eUihpz6FdIEQwXqTHS7awiuTFDIooX8ZTqNF9AYXHOoGGtlznpQCl
         ghZziH1AHoGfjX8kU5lGflHKS0wgDjPTUrP7pzX/jmnDOsg+hjb9AbcckR8uxWJoWADa
         1ZFhPugzRg8K0n6aiIijETYFst9lAuOo1sjZ8pZVvPBAUjdB8ChVooIF0JdR1/gccWQ6
         SGcLt08o2zJxkNOUhGRoSlJR8n7H9xeSB0wrosNFLUy7XUd5lN43Mn8PcHJKujdWciXS
         NP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641635; x=1782246435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGipdqLCxq5G0EmePkbO7V4LoprWK6DBkEcoR7sOMUQ=;
        b=V3d8V60p5TZBIj8SNJ8WIM2lxDPZ7HkMNNHsmCfwDLjYvtoFALPUUWHDUO6driUqoC
         UUr50Tj8duHvcSvrxpe2jKEz8DalHyQczKl1KC4Qo4MKEzCrXqZXCUHINErIse3dODNq
         dCwvDIVGDJD1VTfEFJgWKZzWToqtpHTMHTrVowx+TxE92iXSag0UtJvREET+Z4EQky7c
         2XfDcJIy4E8089iRDjf9t6B2gqJBHytLNIm7brY1oiT0/yk+EmD7OeKrGsygGS790jk2
         GGec8ldT6stZiN1LGqLDNFSD4r3B+6SV61piWX3DJ4V34feXDkGhTejrNNq9IF1DZBmU
         xyuQ==
X-Gm-Message-State: AOJu0YxtQO9spzSAzvVV9EgEmbFri6zZjrnhf2TZwF9PJ/rN+ph48Uhe
	yukHjpUzx4+2QY3BSZ0Gqyjz3p/UKDsinnapHqh7vwjCyeDNuRZroOa6
X-Gm-Gg: Acq92OFOVgpMpqnHzlB8bVozMCCQM2qYTflho6vdnSQ3DBaN0zOsiWPrwepIVbjTnPt
	00wdJfvm6w+yEGu7QFnjVazUV1V+ayCaN31cYW2S/I6v7TDHFk7MKJ3DFTZmIu8DGrY7APll9mZ
	N8yYYnIK8KyfGhttELegsfMXWifEkb1kDUq/0nDwZzWoVQUX9MZq0beR6uZio9EwDzDqP4GUcAq
	nGlb20MnwgUhT069B4ZyJ69Y4ydqOe+LfEe0RNNcyKR13dELE6TZpy3F0LQ3U+m9AzA/AaoKlAU
	3p6ghxv090XxFM4IvOJmguhDs0rDsxpRIBVIDddo17aKYvJKl/wUiwgaDAybMlNAy2uOmt2ZdF4
	ZM9Vs9E6sFEJ3LiXrlEEc7AZSeV8erRKqzu6S3p+vCtGgwv0I5ZslItUvlx8drSmF2uF938ury+
	x3UbMBnkS1yRRewUSBPnqjJUY2qIgUNn2AhvtUstKQSkhV
X-Received: by 2002:a05:600c:c3ce:20b0:490:c682:e37d with SMTP id 5b1f17b1804b1-4923413c249mr1984505e9.32.1781641634917;
        Tue, 16 Jun 2026 13:27:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:26 +0300
Subject: [PATCH RFC v4 06/12] clk: zte: Add regmap based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-6-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7393;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=wYgtHGRukfQ+uMOMTNkE7udfhe0qluyVy0T100d++n4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGXar6sQjjyUXBAtw3LjbBqdR7RyhsyEnFt
 VfCX1LQt3OJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKpbA//aKmOhY9N5dT2IVBCWEv7XQWgU/O0TjP
 HlG+KI3DCoTnN/nOpBdPrJWBU1FIVGNQGvvwt2BxGoUmcss7JggfoCxtP+fkZ+YaXKgFuiDIMYT
 FuOWMQo3gz8Jr8QTFgaKocsCtPBgWRckgFqEr7UxHWbYcrF1Zv4maJyq0XPQlCO4BmGeS0MMmWM
 UNI2IQsagnRBhgMZybTzz38CamhZ8IsHcqIDVE6Ta5YU8yo/Qj+7QomX1M2yIiDioTIlmCGqjt9
 ppmVANKUzyfb5q+XWZhZCXzZJm2scbESYH6Zm4BusPf1lCtke2i0T2HTOCxPoSVH0gt4zxActKW
 F3HDeckj+6Bnyz85mGy0VpeJoWq1MHe8ct9pvMgrvI1387x7Y6LKMSJGEMamwZsoQN5iBg7ZgL/
 hwtWztJlo/ZlsUrvKBQ9fkMkB5fzYI6pgCkfZrCfoRKOVQ/MkC+5Kv4ld28GM4cetbm8LMrwwpe
 wVWq5IGN+uaBncXKg70S/hsHDDt+N0wwj7zKZi4eWUBEa4UzxxhsC6S0WCvVVEqVdcJJUVZn2Uf
 ORi8iiw/92PkwJpu3g7wF7EhB1OWvDTWZ7XlWVdEZXxiGzdvcjuYPy76uVCDxa+pX/DtBIe4iW7
 JqX79kd1OwqqjFsdAxrdmdxwZAhD9nTCuMdtToJaOxS+CLk6fpds=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

I see that numerous clock drivers have their own incarnation of regmap
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code liks clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-regmap.c | 223 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 7908f1562f63..d9459417d17d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -6,25 +6,242 @@
  * Author: Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/device.h>
+
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
+	u32 val;
+
+	regmap_read(clk->map, clk->reg, &val);
+	return !!val;
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
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						unsigned long prate)
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
 }
 
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
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
+};
+
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num,
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
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
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
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
 }

-- 
2.53.0

