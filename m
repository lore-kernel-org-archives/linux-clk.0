Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF03A6B9A
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024133; cv=none; b=AJ3MNBslBhYTVWv+6nNQqjTFP4OekQ1Pc+6aKfUMd+oDrMgQG4mGjF5lJFmHd/AMDDJjy0Y1jR3EBFlD45YECEafFnRFA7szXd0hmqO7gn820Oc9cO/f5WelWVV07arKUtleSpdyDrffzRRBQCNAVdy3MnzUGKanN45+lCVvBSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024133; c=relaxed/simple;
	bh=2jrY2goJwHqx0QF64e77XWB3kl4hSelit10NU180RzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spF+ILt+qIQwvJ1okdEEybFdIOPtrU39PvK8CiwvUOKuxdOLiibiMxccMt9FWxgoJnyEh9en5D1YE7iZmHufQiV/riUnkB7nzm2pISVtnMMbgNfvvjIEj0BNfqa4PYQRzZb6cpdPrSqILFOFMmogVoMYxSciS3jnSYiQ6BMkkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFwuthJw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFwuthJw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c486f012so7129465e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024130; x=1783628930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=rFwuthJwh4M/0nEj+tSFyf6i1MkGpujwJMqVnNSYDLf3qlkb3rZ986ANcVu3Kuo+xo
         OGD5lC54FWNpAMQS2metQRD+OJM1B5A9tiPQWEkzXWRiLOMrivG9uf5OGfTLW3UOxmKo
         3RJJSeJzW64e2SkGiFfJx03D486Rx+jSWW3/UR+kGRi1d0GVDs9sBNzMchm3r+RC0GiN
         SQZ2A3TyL3VhJZzZ5JhI93BCQL8Ot1yWiFCek1fNeKKN8LO2LqOWH9VQn93VuPUSThCB
         2BfRW//EqAh3BFbLeXZXQJ7JJxDwPDq/Qo/98EghrRCWplSj9N73YK9rj2C1Cr8uKtis
         SSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024130; x=1783628930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=BFWfRN2rhIT0ix0r/J5xsOfSpnRa8VNaU2djSxrmXuXrdJVWrAp43OKzW7T6YxOKmf
         8SzuvkVHeNJMKr6EFqTwOMPq29tzLD5JOmDr+0TZyLggHq+BcehpasxjuJDOMufXxUim
         W3icTPli99wbXiswZmO4oclnELfjm5+fA3uwWoxRzIJcN2rp06xMYLPSJzx5e3Gi5NVR
         C7vIyAAd0+5ENItAzfDqA+XLndQWn1aCB+BAbth6+JKaz8zn34jZ7NX8LL5GW2TdpBON
         O4GHqWueZS1ulkLQa1s4JYUJmKZ64IF8hFxph+UP1TrprEt4cHfvt2crUsiv1LCZt7D2
         VAwQ==
X-Gm-Message-State: AOJu0Yyr732h82GVJJiNUg2QOWbP15+xm1vIA8vWo+Qqt3fA5NzHhkeV
	yYBPgyY03nXQySBlprR5sUrz9guW/bkjXVRuNkubacknKFOALgp6ibDI
X-Gm-Gg: AfdE7cmq2zOCBUQ1ftUEvmhyPCgB9Z7P2VOeEjZ1DuQIuYIiuJVz805rPDJs7vT3IPL
	ZIly++35S6m0NmcXIhkVD4OzPO7sSCr6AUD469NmuRvJQ/ABU0rfr5CUQQ3dq3eMsJxYaOd2ufz
	A0/CdOs3C0G+gnZGxCo6D0+5dMpynITPFfGndS0A9/AU/jP9yGdS78FmiU/B3Q4RYIp1GOUgZWR
	zGoBBWpNl7dZwzbyiReRI1dPZ4pr0q/SHNAbJ2NV9sHj8YStP+tqfeA2WJPdGGcgRwdkhZXBXug
	c/wm6UIGrwMZhNOI4LAfC+8T0seKCdAbuvRyu15IToKwqoCvX4U/d/fmV6FkeeUpQ8hAVopeykU
	QKK11CmthWZ4ypQinGsCw55mv7iPY11y0Zgrne3w1sjel1BRYsYNqJ/cb/D3ZOnPLernFGhuPJF
	4jGAOxBiYcaD/jEboyP1Dc+D8=
X-Received: by 2002:a05:600c:34d4:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493c2b3a6camr106126825e9.1.1783024130084;
        Thu, 02 Jul 2026 13:28:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:49 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:01 +0300
Subject: [PATCH v6 06/12] clk: zte: Add regmap based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-6-377b704f80c4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7587;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2jrY2goJwHqx0QF64e77XWB3kl4hSelit10NU180RzI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpzGKYz7rhnkLlcbV+yYeEafn5yjHtbdK7i
 Pe+JVNWdryJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI4nw/+IrddksVAYQrK61nzNX3tkrz76coJtSm
 DLC7t/PdfPSyvufFwHDd4WRYZvjkhHChmMMLYuYhDvVFzLqo9+FNmCiJLnr4eKlrc3Jzt4LIm8w
 ygr8afZ7RiDuZphPrIfVW9G9IXO3X9wGSZjzqxoK12cow3SYziRwBcZFr+9pNYVkPruCpqV2Fkz
 9Wsz7SusrXl1Xeye9Fk2IX/0++aUHEM5jXWCOfxcjanyKYFKlMvWkB+U16dA+obpC7JCTT4jG5h
 7zFKlCw5nBAbTno2Tq05s3i5/VZoxuPLfhjuS8cW85hFx8LXz+tgM2mOqrYexKOiJLoWf/bBoKb
 5nx8Z9m9edcHYSdaLgf5BBEw9JkH+Ar7fSr5bejoD4cDiVBDxMPBm9Aj2WS212CV2MnmgV6tk32
 AQ2lkpvPgAgBqcbtDdaGq2KU5NNWx8+u4AaEHiq8+HI/wq9xZlZtVR7aSwlhIqPj9cveqjPYtVh
 KHxSQSzxB1R50o6ti0Ob4tsFKHvDoQBgp1NeYN7AxwH1PCpsgCR64YQZc9kA55qGto34OFAqjSA
 Mhfn3LNkaSq1I35J/7jfoYTlEAmlKexK4UVoTjQjGZcmdUDQTFtpYJCMXVj9lwg8xxRYSgdnGgK
 hjceDOHpPkdY7s3A3axeT+SlkMy1TbhRkrAPWqHBfk5Ah40fIhgI=
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

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 221 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 1180d7aa7d62..642db1aaac0a 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,29 +7,244 @@
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
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
 }
 
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
+}
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
2.54.0

