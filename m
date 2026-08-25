Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA63E9C0E
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693108; cv=none; b=KeMYBSX0U6dUuv9ZiLtNGQZ1KkmsVG0AQTB+YuGxgWwcq8h9crn6YLvy7Ay9xSEpytQ0N0W3qvyNovJgzA20k+Jof5hQsft200dP96xFlQH+VvlSugmwMNqCEiYRGxErNMUXv+brNzV8D+FKDCKTdYo0iuKP+VeRjGZWKxc0mlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693108; c=relaxed/simple;
	bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WL9TR+n+RJ9n2fnJ4AWKkxxSLjYKZDaDv4XUKLkStR4p/9uoVQIgeFbwJJ/97LVVUy0+YYhbRt1mjjIokhzsRi/xjaPsDlf2sE1alJxs5LvMGymA8GtOV0zM/4FTwBhp9tfVziGjbWAJS74xHs+4MrHWmrZMQMw9Gs733OxVnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS3UP0KS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS3UP0KS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso454789a12.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693104; x=1788297904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=OS3UP0KSonpsejNcYVSHH44iWoQmjFvLhBPdKtgexpYAPW9hmLVqcijGEDgImVpKuv
         qyAUPqs2RuRanFnS2BAgaV/pKQV2uTctOlBmh/lcr6ANGk8HbM5a9A6KjIKfqtAlrJT2
         oADyvC6dFD4xqkb7KEEMCfCEqeIGD+2RJb44vsHva1ySMTmbpxwvf+f+ogtmciMb9HUs
         tgV7twPVcKySN0xQO05eN6/0AZyRdNY4F8IhOAX0HZ1r0QZbWvEVdnWkC95AUnio9G1X
         g2WIEAwzOL1N19dJ89sA3ExT5pFU7p2dsKSERgduToIuEuHrJPc+pAZ9su9yPRPHfjek
         az4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693104; x=1788297904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQDk0f/CX/nJddxBbewiApCN1TYaT4l9+ANcNSyara4=;
        b=V7P6bc2UKCe5PzctI8SXQYwARr3t0LyJ2DIbxqhTfaGnPOrooW6RoBrpk9cWRlxX9b
         sT/maG0/G6kfOQaShKYZERp/9Csx2QcjFUiOuPuNrU61itveadBCmS8BNehNkCEBZbcj
         hW/PwWdvNQXbQdDV19in0VPELNWRslmETz8uRXP6zUlH+ki30ZD3dRD6B2KKjEULeavO
         a6VU0YsjRsqWAO4XYNJy+eptmbv7qZlM7VVOZ047GQI+9k9KWpTNFO0m2VU2J2U28TOO
         4ZWrllwzJekIxN2BKDgBokEhC1Z2wyEBE1Scu5NArWInziRdEtDtG5k0t10FvOdI1myW
         9CmQ==
X-Gm-Message-State: AFuF++kA6wBGg1lbbxoama6CHmJcFTd0eXBDcMzinh8UUGXdZoWGoeQJ
	+EuK+VyO7GMzTgQ4aAyz5nJK7148wz2iyeLUu/fiYDf0nC81xRM4t0AR
X-Gm-Gg: AR+sD11LiHdEe4TS8YQosMbhYEfzAyfMAv7aHmL/3oNWZ1k+m5WUjoUwnGiSPp7JQUb
	hDw6w9qgNKeESoyRJoXS48zZrlfLFOjX+UvouezisNrp1brFky1v6TA8Ob4PGk9CLexlpMz13nY
	2ZGhRQonN8ii9D9X+ZElK+0C5Orj8dmgMOR1wYdpOn2g/f1c+Ob4HDWYm+EicqcdM1y42bC39dD
	ZldYVBTTJ3CBbgdD+XmW2P0qTXq21hY8a4g6qeoKh6TKE66GABna7L+SPFgfbYmhiZ+IBVyZcyK
	Ng9rXqZutJx/wuL1uak8BydEQefnA4XHP690uMJ/GcadvdUfT4jkkgR987Hui/gYr7rts3hOrnu
	8VPcc4jwZWWjLXUWj2SJJvyUnNu5KyeBCuL4JGy7WXIDulTPTzGidwgIgtEua9X9d2YmmwfCMw4
	pejg3sPPdJPDex1co1ZUUksCRkiVLS0WqnaIbhKGYbqTSadAPfr+BbM8ilks5pc3qcIpJoFg==
X-Received: by 2002:a17:907:9617:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c250c3529f9mr174769166b.21.1787693104284;
        Tue, 25 Aug 2026 14:25:04 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:25:03 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:06 +0300
Subject: [PATCH v11 07/12] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-7-f8ad59c6426c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZNxJpzwsBO3OBV6aHCCiuyx42Ef/rjHbiRWZumnp96k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCIC28UmBdGZJ95zPM7HMHwPmFY6c9sa9Vr
 FqMgfkEmoqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJSVxAAlbmAMHPAVgwZhMZ6pj7+zSxR4B6+WwA
 1IYbbRDR956wUWkjR7Or9LJPNjJTv646vSGxpI+UwYC10ykyDZoXR/9tX5USecVD1Bkd8l1Vb6f
 TmbmF/7iazsEYM/d/8TbbjeD0ykzGaK7ntWCUUQecmVglODOq4Xf/2NEWhBjo0/AEUzkTEW8uXO
 1OBjq9cXlUdkZkbfNP9pt5DvoaNOrxqKCK6Diy4/HzI3FvOHqtzMOeM4tb2isti2FLMhQIJc8N9
 gATRR9Rdk0R//G9Jy/MctZxBA/8eF0cHwk6PTAtG2lbuckApw5ctnKj3nPjPOrZT3B5rSyECCvM
 2vFuztbY5oI2YqBCu7k/QPLO22EpBQ+hQahx33YOFYRT3MEvJ36fRlxtp+amjTXwc6up71EAnQl
 y4kd5qZP6nl5BXCS/9c4O44ojT/0u5mcU2tlBF0cze2HukRt5VaU8fbNhnjEkuZq9dB8kSy76Av
 hrxl3UetHfIs5mm1mo+06zxyOCySaEa32byJdcyVjIA1iQn8USjmQI6PtX91qdfwR+qXfZOIpqj
 NMvSa0Lw7lrB6d7TGf3zP+MTj2MxrYk1NAHAY+bmlprEiZVo9RdVuRGP4bJHUM5jjU2+eA/6htl
 Iu0vpG1uJl9m/18P2fC7JI6jCCNJJjTiqQwB3MBDU0jMVCJ0k96Y=
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

