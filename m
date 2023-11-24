Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yi7Dyyv9"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F0010EF
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:35 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso1084381f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815293; x=1701420093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3jkqVLYPsEBC2yHh5HSbHQhmKply71guvy25cYHi9Y=;
        b=yi7Dyyv9JzjDtQHxY/HXPMVv+P2T1rKxO9m6InhsvZHixKmsbWtJapA2LNdD0S6AdD
         vf/MF9M1z+JkU/Sthx7IjDwYrqdOhiMkmvtqFNn3VHXTaPX3k1zTV8blyKILNpPbHbvy
         Ov3XfgxrCSCUD5zCjKDkIc9QU03Boq3Fw5jDxpw6vtFmPQamjO4ADHt1kwHCVh++8xZs
         03qw99UlcqRH2Y1OeevZy96FHVaH1c9Cv8K2NfwGa5xieVK5TGMUvggj5yvu+3mtbqcS
         OP6WNwOn7V9JMatl3KiFLyljGLPkyiBVDNXdIufCl50j6IvuWAH+wWnYtrABbMysEkX2
         jr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815293; x=1701420093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3jkqVLYPsEBC2yHh5HSbHQhmKply71guvy25cYHi9Y=;
        b=FRK8YV73P4ZvoDDfB5HlGpab/8W637yGt9+2y/wmAEzx/f9IquQJ/AmoCiQ0CsxybO
         xQUSvtdol0WmArF74v2ELMNbtucSn/gbxkIiNSobhCwKNK/88HTwmOVqNzTY8U3vWZ7o
         gydpeecFi5pZYug1BKDoyvAESgujuT4VOfb2t9cfeL5RH1XTjn3o2patdOQ5IDpWl9Ry
         hXx27MCNFyMoKs7VwY02HMxB423X1o0ahmH7k3cCKrQa2mvncQHIdSJThtvUg6Lv7el/
         EUfjL3pHmtzyuA16CwuYRNJ8GFDRAPU25Cjezev7ZNAe1GDrbHFjkso1G6MXCo74nPD/
         twMA==
X-Gm-Message-State: AOJu0YwnSGtv0TMNc1qvSSaSLIlyjSXJeqw0jk0ZJNqd6+6NCLpnbD1m
	eAog3BCcJNDvX+Xy1SnhgF43/A==
X-Google-Smtp-Source: AGHT+IG/skb+8Ptal+nS5jVokW1Mln4lSQFVUSzxMMIXZ8cBj7G4ZDrsA+Ldcfzj6m3z7ooJn7ALJg==
X-Received: by 2002:a5d:6987:0:b0:331:41ef:61f2 with SMTP id g7-20020a5d6987000000b0033141ef61f2mr1666976wru.15.1700815293525;
        Fri, 24 Nov 2023 00:41:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:18 +0100
Subject: [PATCH v9 07/12] clk: meson: add vclk driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8101;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TV2XB6ZHVpJ07IkqSO4nzY+I+xu/Xq9oDCoWcFAVONI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGwtOkO34THj9KcGPAlKC53gPRu5CVHayIIw38c
 QeP3RoaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsAAKCRB33NvayMhJ0RLfD/
 kBQ6skhdahfbqkOJ3pA7v+Kkim1QWBoAXjhxLrynanMSAuGBPLNzvAfm9/mHxU5R3ViyjPjJtvsO2j
 eBsnsm3ZSAUQndGAlgg28RU7pP7/CIMl3qed2EfhTOqATPU383HVLrZSPLn4S8JEbdgxhoIo92gkU5
 jdadiicEocfwi6NTCM+vo06Ma1/DZqUXUfUaj+QnvEzCzAYexw5S2/KWE3k9RE56wSSkSpCs03q4AZ
 LcVX02SIg3YGh7qVmMRHMiXytNkezLNln5rkREg5QXb6+i8K1EwHurgBdqwXzUT1GBfi8Kx7S9evRa
 ElsS60l+DiVRf+xLTaeSry9PssIZgi8CpriSBiFHQPTgwpVxcM6iwIxsiM0dAJZXrtPhV9tSzMKC/H
 PvH2F5YLnE04vXIRrect1qwFmr3skPJ+dmxIaRH9/OCWn9ZMap6bZ50MXMgIo9G2NKV28rednit9nC
 snyu0aIF/+aWdcyo//uA8SOsP/v26M5W+IXB8n842hAP1PP4XiQE/J8QM6BuenGSawckRLsWEuVqAr
 Nm7+R/baf3tC5yWaaPAorreRazBY0TPBe0//0jbGF/sJA8IFan9qrSK/m5npRUvUWpzrFztDhn3fW0
 39ueYWe7IbxtsW0dr0DLy7tbBhnbufExY5UalsD5VnALorQp+hVSEYwd0E5Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The VCLK and VCLK_DIV clocks have supplementary bits.

The VCLK has a "SOFT RESET" bit to toggle after the whole
VCLK sub-tree rate has been set, this is implemented in
the gate enable callback.

The VCLK_DIV clocks as enable and reset bits used to disable
and reset the divider, associated with CLK_SET_RATE_GATE it ensures
the rate is set while the divider is disabled and in reset mode.

The VCLK_DIV enable bit isn't implemented as a gate since it's part
of the divider logic and vendor does this exact sequence to ensure
the divider is correctly set.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig  |   5 ++
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
 4 files changed, 198 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 29ffd14d267b..59a40a49f8e1 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
 	tristate
 	select COMMON_CLK_MESON_REGMAP
 
+config COMMON_CLK_MESON_VCLK
+	tristate
+	select COMMON_CLK_MESON_REGMAP
+
 config COMMON_CLK_MESON_CLKC_UTILS
 	tristate
 
@@ -140,6 +144,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
+	select COMMON_CLK_MESON_VCLK
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 9ee4b954c896..9ba43fe7a07a 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
 obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
 obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
+obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
 
 # Amlogic Clock controllers
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
new file mode 100644
index 000000000000..47f08a52b49f
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/module.h>
+#include "vclk.h"
+
+/* The VCLK gate has a supplementary reset bit to pulse after ungating */
+
+static inline struct clk_regmap_vclk_data *
+clk_get_regmap_vclk_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_data *)clk->data;
+}
+
+static int clk_regmap_vclk_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	/* Do a reset pulse */
+	meson_parm_write(clk->map, &vclk->reset, 1);
+	meson_parm_write(clk->map, &vclk->reset, 0);
+
+	return 0;
+}
+
+static void clk_regmap_vclk_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 0);
+}
+
+static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops clk_regmap_vclk_ops = {
+	.enable = clk_regmap_vclk_enable,
+	.disable = clk_regmap_vclk_disable,
+	.is_enabled = clk_regmap_vclk_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
+
+/* The VCLK Divider has supplementary reset & enable bits */
+
+static inline struct clk_regmap_vclk_div_data *
+clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_div_data *)clk->data;
+}
+
+static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
+						     unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
+				   vclk->table, vclk->flags, vclk->div.width);
+}
+
+static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
+				      vclk->flags);
+}
+
+static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
+			      vclk->flags);
+	if (ret < 0)
+		return ret;
+
+	meson_parm_write(clk->map, &vclk->div, ret);
+
+	return 0;
+};
+
+static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	meson_parm_write(clk->map, &vclk->reset, 0);
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	return 0;
+}
+
+static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	meson_parm_write(clk->map, &vclk->enable, 0);
+	meson_parm_write(clk->map, &vclk->reset, 1);
+}
+
+static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops clk_regmap_vclk_div_ops = {
+	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
+	.determine_rate = clk_regmap_vclk_div_determine_rate,
+	.set_rate = clk_regmap_vclk_div_set_rate,
+	.enable = clk_regmap_vclk_div_enable,
+	.disable = clk_regmap_vclk_div_disable,
+	.is_enabled = clk_regmap_vclk_div_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic vclk clock driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
new file mode 100644
index 000000000000..4f25d7ad2717
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+#include "parm.h"
+
+/**
+ * struct clk_regmap_vclk_data - vclk regmap backed specific data
+ *
+ * @enable:	vclk enable field
+ * @reset:	vclk reset field
+ * @flags:	hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_data {
+	struct parm enable;
+	struct parm reset;
+	u8 flags;
+};
+
+extern const struct clk_ops clk_regmap_vclk_ops;
+
+/**
+ * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @div:	divider field
+ * @enable:	vclk divider enable field
+ * @reset:	vclk divider reset field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_div_data {
+	struct parm div;
+	struct parm enable;
+	struct parm reset;
+	const struct clk_div_table *table;
+	u8 flags;
+};
+
+extern const struct clk_ops clk_regmap_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1

