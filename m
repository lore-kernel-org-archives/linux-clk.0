Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2A2F1FED
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702879; cv=none; b=YvSe6Cf/D/DC6FXLJmLlHK1LdCk0n7j/COWl1nAwINNd51LD7iFRRrGiI5Au3h3NqHOMkSWwMHb67e7fJkApxRk4862UhPUwx/Ld9OafJKE/3hxjTVAZN+2YWKPliFUvb8/NDvwPeaV6w/nk9niW9cddIg/RJQcOlF8j+OUsBuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702879; c=relaxed/simple;
	bh=hwocxe5+u6ehkp1tzrBoab02wtvHlqFQtFOPzVR5cRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qA5vEwE8wwQ99n7s993Js1FUFLf9MiEtb8DeE91+NqPAVbkAoESsQ5259BTM7CafO9f2GkE2+fymFIxbtZPCYRAOcfDEpUy+0NtayqF8BkKi61APMteUEaV+j1uPNgyrUnE3xe0T93hcarRhhrj1P5Q5y9hzG3aTkN7BtR9+RRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnyGkIiS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnyGkIiS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso9342035e9.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702875; x=1786307675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkbxqvrSP7FNKqOtnrygIoBIqlq6kCfy6ei6tYOO/2c=;
        b=jnyGkIiSisqDzYWCV5kuioUXG8ZDo3QXZzWC2Qtl9JsFSMa2Ko4PqhbIhFKT/jO38Q
         TVbcR0o6noPbF2h3v6Og3xC7TiQfQ9M4xUK7vKZ1NNRGWF9B0AroEVrKeCHaftM+OLfr
         BUST6UE4K7p4GIYIgRXC8QWcTW3svGH9+EzBShLslPmMq+Pg+vHipt37WWJDWb7Ei0dD
         yotywsiXH9HGGx4n+HGwjJFw/jyFBtqztbfg9nFmAxL9cPOdweMpOaYJSHIb3E5rQ28p
         uOUjfUC6GXMHdoMMPEUc1HRfOC4MQGuK/uFaz39ZAlHyFfa4YCEn/n/+1XrxBdvukBVm
         AQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702875; x=1786307675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkbxqvrSP7FNKqOtnrygIoBIqlq6kCfy6ei6tYOO/2c=;
        b=ApP8Lup2l3ooht2a7C8T2AJsVXeRX/iCOI8txYk604QdHZY0OlnO67Kl+76pRlYzdL
         5AIhq5XnsdjgeavBA4X0AbGZhRzE2LlPa2CqhnEtqJ34hYZ6s6TW+OmocwY1zdFdqd95
         KhVRyOtw0bR8iRXDwStXXkZLFcSRZLJxF5llUdg2VZ9YtMhRej1Kd8ByxrO6qS1psX79
         GLlwfRQ5+zp55r/20Nxwtnt8Fe5bmfB2WmcsRJ73Sbpjw9C5kDBT50HSQs30aum8IwYQ
         EjfYytZe2/xfSdbM445sMcfo01CHTRQpr8IGXyM0mOUNUESveNhV/kpPYOxXXTWr8/iG
         26VQ==
X-Gm-Message-State: AOJu0Yz9mQLf13BMDJZmhIbzrSxSKlDKx92JTo7NIayBKxRWdLrmBFn7
	fFro5wLwpzvjEkoz5cvkFffE6ScBn+F1mCjApMe0eyYIQxJZlwV3EmBZ
X-Gm-Gg: AR+sD13TWR04c6MeRlJ4CULSPCK36vUiIHVm00+au0LjPYfywYy+avGQEK59oRreH9V
	e8L+j9tvpG5Lrskk5pues/+rXnUIKC5sWKIRVmq7gt5HRF3ZoDJ5mwFO7qj/2ISzUoNXtubK45v
	Sj0KpCkctFXpMZpg2Ry3NiNg6sWoY8bWZphvxpZZD6Fwb2jTrItwnYazvwybwuZfYDBd+a23JQ9
	Bq5EZSpeBR8NTcTcOYIfXaSrkgWsyGAlaMDNkR+2L5wUrnQVKohuXD6wt6GMpWTvBYfRDB4zRc5
	lIspT+wQDdZkx6JYk31JDPKfkVSERN/b10vTvO7rEG/7sHFsYmrBtPLfg+JutBy91iaA8LbNGLg
	oZlv0yk9is3RoSa9kkJ3pwlj7MdW+G1V3aFYDwZlflG3/b3sGrx7UPlbFJsSf4EC4+3r2ovNPpU
	0OaKEbHiz/U4vEHYjGfJ3Igb2VG6GK3Y3x/q4toGO9hqeMQEzTe6dwN8fTNJqYxWhRzzEhT0b6
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr136043935e9.9.1785702874569;
        Sun, 02 Aug 2026 13:34:34 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:33 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:38 +0300
Subject: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7881;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=hwocxe5+u6ehkp1tzrBoab02wtvHlqFQtFOPzVR5cRA=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGpvqbLIugDYVd/qJHlvaMqXemgRyFkWffskH7DS7eUe5stJh
 4kCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqb6myGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIoNPD/94Qr+VzDNoe4cx4Roq2IynmbVoaR4tXLuaea48bgg
 /GdYV+iVXrv90AxkFbnYE1Vtni2NTVQjnLOIUlU8E8ThHTNaBTTmbokhwNals0RAXymiknmDZTJ
 r8sCB77VJoKofuszKxQ4587XXQTdZb9rncLubvZzxPOY5R3+1OPYuluk8PDitHFgfgYLqAFGspQ
 XsLdzFBvo1kE0RsTsV7BskK+uqSn5eKtc/ut5/ydUKeu9xMyRiceN9MSChzxcBoBl7bjjZyAw+d
 xx5y5+H7us6/AsZ8U0bELZfD38nICBNN/9oyxlHyo0odC+ithC+cn2daPTSNN59/Oqrjzim9b7d
 wrweTLaQOjsZyGSrLfyfd95GDev6e1CkYmz23MEtmmIWN7a18YF7wYUglpl4Mlw41TFI+zvKszw
 MK8fmSQPcJ/DdA/VaK1jyJnYSmwEXU0Bttf+VcDPqU3h+Cv2bnpda7X6Y1ekam2vMbT3LdKNAyp
 5xYqxMhBbak70vQz73K65cnO9PJnIxonf0mVE5LZ6XyYLx0h9bpzSKbPHLyK+LmgSC5adi+l8hI
 B5NPzpLLwIYspB/1cifD5AtioUFV/YZxPGVJf5nLeey08juVB7syGM6kSwIyELm8t3zR4ltL3eP
 gscMXYCYladS5bF5SebGuBVzwDic908k/iKw38geT1A==
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

