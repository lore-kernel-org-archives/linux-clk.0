Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD29C04FDF
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235739AbjHCMEN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 08:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbjHCMEM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 08:04:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DB32726
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 05:04:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe110de46dso8897975e9.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064248; x=1691669048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agCUhn/8LSgqkRC+TGbYPlU94ThrQwri2McEeBSjgT0=;
        b=NeORpJsLziOeCO1BdsWktBjvU36UtFWoqUJ3KsnKxxQNwVUcvshE7/4BeU7FzlgoSG
         v65Nb0J3cvRjmNEDuWsUiqbr9Lo7BnrF9lwnpXYfsBJtpTsAnQ0I4cO7RA0NGHUXyuJK
         YrDRcY7dt8CkYSrikpQ+l5PxImhX+Vqu0oR6ePQd6y8qYtsqO1zcZ9s3UGkn/x+dDVEy
         mZvFdRJrYzk5urLQdpE0RY30Ihk48bbOW1Q6W6T7xfkNULig8Fx4wUwk0uM7B1H9vkZP
         2i2KdSdVTyRxBYa0moU3JNeTTSrxxd7j/mMIceREFFfaNzxavQ4t2er+fbccMrvOYOAO
         Mj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064248; x=1691669048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agCUhn/8LSgqkRC+TGbYPlU94ThrQwri2McEeBSjgT0=;
        b=RI4E7Byy8fIzjaNmJTYkWCoL7J5Vav8PYGOjaXVnQL9dSMfmd2aDZz8T7nfV2jrPiU
         7zvH7Yv5ePUymVVfh330NmaJnH5YowuUHpvSpl69lwley6VD+1R0nON++kiRjxRSRd75
         5dymGvE/jR0PTAyJsn3yow7CWqmseeqfxT3zRmel6oHU/RJFDwt4Lr/QFfO82rv4gt73
         IZiywdhChoyHcoMrq5SdMAlLGknBaX5MI25GBh+9ks4nV2HGEFlWORghSz50s2PtBL9L
         E+YOhjDqbgaxx4kCtK542upvQBRFv5gxnuVcwAm1PQDLDOXayjNYXdumeBAGHHXmTqmp
         IdnA==
X-Gm-Message-State: ABy/qLbQ9yXk8iMb+LUqGAlH4m/w4W1DmDEuKoF/l+hN7dbn1y5cO6jd
        /LZJ0JCqsZ3skCfw00LcTosQlQ==
X-Google-Smtp-Source: APBJJlGrd4/x48ci8+s8FZHyJJ9hNY9yGdowrfOU/DikNzuW5wMt3TwsnezHzRKsLorjeI6dCKTryg==
X-Received: by 2002:adf:ef42:0:b0:317:5b5f:2328 with SMTP id c2-20020adfef42000000b003175b5f2328mr7059886wrp.24.1691064248055;
        Thu, 03 Aug 2023 05:04:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:07 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 14:03:57 +0200
Subject: [PATCH v7 3/9] clk: meson: add vclk driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-3-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9036;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QRCNRMlZZPU+/GYJx9LR/JWNNbQG1u0cT+Nsy+8OVWo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5ew/TNqFil/5IVGUZ5//ATYuIpNCvOsmw7yr9va
 ICLqYfSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsAAKCRB33NvayMhJ0cIeD/
 4nNrr8EzbM8rKH9R9ev8qR3ccpdOthSLAol0rqB1wkxAbegfpWAOPG/Dkf7kWnP6ZU9dnSu2xGcxwZ
 PEYG/5C31rzh5IMSp5mGitty60xv/FuaeCURDv09I+QAli3rji9adHUdn7aV/tTrfFpzUp4ZtixO/O
 dMq64rjJ/99lFMFjz+F3QZX0Ca9MIE4EvKdzr7B5/bw5n0OkRNF8XQb8CsQ40/71Nl67Ps8gFiOyzg
 1V4JIXMrvvTuXKQperENdnz1cJ20pXlz4tR6BD/Vqkd1fNoRSKAct5531a1eCVoi5lrY/RhWif4zC9
 1olGZz165kYJg6Y4oRq8k31EfejNBW8extOLZfblVze83mse1T8cxAUCffTJv0IZsZizF9H+21VUk0
 Wu70Fb4JGy2lMiOc7sH4d6zW1nOf5PZ4isUF2WzCQWHNeWrtPoJ3JvWZ3dPywn/Tr8mhszRP6nuyqV
 hGeiuVJ/OOFESZmMxs49phiplf0wvayIhcdzSMaAwgqEZTy+LzTupq/4dm5rDc55AV24ttrNt3c/1a
 ybACIpiq3Ru08sidVzz/BXIBdHsZ+/x9gBb06UierpaRfjHlLBfXct4fZhCQXMA7tMbgfVufumtfY0
 maYF2AdAuP2x6i+bnH5ghbsT+8sFPkVAs4DSQpUCipFGTw07b4O7nQeq7x7g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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
 drivers/clk/meson/vclk.c   | 146 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  68 +++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 135da8f2d0b1..83f629515e96 100644
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
index cd961cc4f4db..6efeb8c7bd2a 100644
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
index 000000000000..0df84403b17f
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,146 @@
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
+static int clk_regmap_vclk_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+
+	/* Do a reset pulse */
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+
+	return 0;
+}
+
+static void clk_regmap_vclk_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+}
+
+static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+	unsigned int val;
+
+	regmap_read(clk->map, vclk->offset, &val);
+
+	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
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
+static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
+						     unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, vclk->offset, &val);
+	if (ret)
+		/* Gives a hint that something is wrong */
+		return 0;
+
+	val >>= vclk->shift;
+	val &= clk_div_mask(vclk->width);
+
+	return divider_recalc_rate(hw, prate, val, vclk->table, vclk->flags,
+				   vclk->width);
+}
+
+static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->width,
+				      vclk->flags);
+}
+
+static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->width,
+			      vclk->flags);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << vclk->shift;
+	return regmap_update_bits(clk->map, vclk->offset,
+				  clk_div_mask(vclk->width) << vclk->shift, val);
+};
+
+static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+
+	return regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+}
+
+static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+}
+
+static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+
+	regmap_read(clk->map, vclk->offset, &val);
+
+	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
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
index 000000000000..90786552a7f3
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+
+/**
+ * struct clk_regmap_vclk_data - vclk regmap backed specific data
+ *
+ * @offset:		offset of the register controlling gate
+ * @enable_bit_idx:	single bit controlling vclk enable
+ * @reset_bit_idx:	single bit controlling vclk reset
+ * @flags:		hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_data {
+	unsigned int	offset;
+	u8		enable_bit_idx;
+	u8		reset_bit_idx;
+	u8		flags;
+};
+
+static inline struct clk_regmap_vclk_data *
+clk_get_regmap_vclk_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_data *)clk->data;
+}
+
+extern const struct clk_ops clk_regmap_vclk_ops;
+
+/**
+ * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @offset:	offset of the register controlling the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @enable_bit_idx:	single bit controlling vclk divider enable
+ * @reset_bit_idx:	single bit controlling vclk divider reset
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_div_data {
+	unsigned int	offset;
+	u8		shift;
+	u8		width;
+	u8		enable_bit_idx;
+	u8		reset_bit_idx;
+	const struct clk_div_table      *table;
+	u8		flags;
+};
+
+static inline struct clk_regmap_vclk_div_data *
+clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_div_data *)clk->data;
+}
+
+extern const struct clk_ops clk_regmap_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1

