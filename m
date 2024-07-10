Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8DA19645C
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628748; cv=none; b=clfcq86+daf5KqMsyot1pErDdYqzK/iRAxfWtFpnzFwvqbC9T/+aBn/WhWiyerZiurbpMJWgLLqvqGBUgpUTAn0T6/mKHmAoZGs5q+AJxg+AHZr3ectQ+hRdRfnqZMW+SShKqqy+p3qO34o3ghnelvOcuJtA2bE6OF8149/8IWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628748; c=relaxed/simple;
	bh=q6Lo9F9np38QXthpgPQglkdYejHog0Z9FiVrNEKK5zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY08epyG5Z3sMAK0CQjgK5fbNXRNbCVhEH7krd3P0juFPGNg6q0IRAhWzkfBtQFwgRQv6/+JviuA6mxGgRJWNKRa0QNDeC6U3XEzHv0Yh0xEnqQj4yeZGU+y1X1EHFFc5mhwmoFOWlmB8T8x/denDnSIjlCw2lvkBbxxXpzTFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AxwB1iBz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AxwB1iBz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so10571955e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628745; x=1721233545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWAYmRVC1zdYp+5kEeD3DX2tiXmWy9shCUGw6lB/NDk=;
        b=AxwB1iBzcIyhdAbvXXjkaV16N69a1RqjvZg5CkB8DOpCAC9s88tG0pDYEgifIWRrz1
         TFP/KCepu5iY+kEBcOHFoA7WAhCrJ49TG3xI9t/QG0zM1cfHTv9BqNnswICPD4CnZrqS
         5umWasYONrNWKOduOSiNNtXx5di2FeBHDnrKfpan0p5K1hfpv9TVdwEQDOyWFDJgHy29
         Tuvg8vtJtsgav2lB4Gj7wKIx9DLmCCk5O+W/TAlPyh+hJ9+7TyZyR6jPpeK4EMMAEMrR
         oIUcCUpyhj4HCQN7QKQwjJBbSq0AhzX5MH1rvpSxh/h2AAIZS29uILM03t3f8ZLO6jxT
         Q7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628745; x=1721233545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWAYmRVC1zdYp+5kEeD3DX2tiXmWy9shCUGw6lB/NDk=;
        b=rls6e8rmwaUGuDWSVKWDu5xU6u+MSw5CG79oir0qnjLjnaIsgo1wu5LGD+RNOXUnVt
         sK8OvbUfEztSOuNz6U1iH/NS7H65C18uppJGuj9VRFO08Nq9yL0mBX08SyAO6JbnH8dh
         ZaFhLpvL6BZxS2zAw5H7x8TdRMjSlkgIF+LI++TOichfeXIXuozIkwBKscplKDPmMeEO
         K9V5WaDnqdWS8/5r2Ih/aoLlcla97XhWdYymrtI/J5lWEd+8Hiogm5iK5zpfw+sxe5Wj
         jzRoYVB/oD30oHVWEYYxbIEVCiRAjuiMZPNERkkFvAp/iyBlVcgC1FD4xm+uWHahpkbv
         m2qg==
X-Forwarded-Encrypted: i=1; AJvYcCX2sAxozFQo2XSsoOUConIibvlkEw3u5o9hnWn9Ak2BkEgvugchAF2dtEM3onxOn25qD6yGjb4C/LzDmJKWq/v54N5nlcgdtuWt
X-Gm-Message-State: AOJu0YztXg5GoJj8/OiEpHF7NVOOP1LhzXpVPzIdOHpakGZaGef5KdkM
	I31dG9d5WG1z4eaBQPFnWmRsi5DRL7mJyLI8Z2QTSx+QrcUY9d3gSgOgTjuK9Zw=
X-Google-Smtp-Source: AGHT+IGGZi85nj3MyP+JCseFqVZr7mDscU35q6/iFQCn7BlAqB5PjPfA1ynbuw3U8clnF3YPLAROIw==
X-Received: by 2002:a05:600c:4930:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-426708f1f07mr38446345e9.35.1720628744794;
        Wed, 10 Jul 2024 09:25:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 8/8] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Wed, 10 Jul 2024 18:25:17 +0200
Message-ID: <20240710162526.2341399-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by reset framework
on the auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 109 +++-------------------------------
 2 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 78f648c9c97d..b1c0c3ba96c4 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,6 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
+	imply RESET_MESON
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..6e199e751856 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -15,6 +15,8 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 
+#include <soc/amlogic/meson-auxiliary-reset.h>
+
 #include "meson-clkc-utils.h"
 #include "axg-audio.h"
 #include "clk-regmap.h"
@@ -1648,84 +1650,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_sysclk_b_en,
 };
 
-struct axg_audio_reset_data {
-	struct reset_controller_dev rstc;
-	struct regmap *map;
-	unsigned int offset;
-};
-
-static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
-					unsigned long id,
-					unsigned int *reg,
-					unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(rst->map);
-
-	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
-	*reg += rst->offset;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
-				unsigned long id, bool assert)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_update_bits(rst->map, offset, BIT(bit),
-			assert ? BIT(bit) : 0);
-
-	return 0;
-}
-
-static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int val, offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_read(rst->map, offset, &val);
-
-	return !!(val & BIT(bit));
-}
-
-static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, true);
-}
-
-static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, false);
-}
-
-static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	int ret;
-
-	ret = axg_audio_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return axg_audio_reset_deassert(rcdev, id);
-}
-
-static const struct reset_control_ops axg_audio_rstc_ops = {
-	.assert = axg_audio_reset_assert,
-	.deassert = axg_audio_reset_deassert,
-	.reset = axg_audio_reset_toggle,
-	.status = axg_audio_reset_status,
-};
-
 static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1737,15 +1661,13 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
+	const char *rst_drvname;
 };
 
 static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
-	struct axg_audio_reset_data *rst;
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
@@ -1803,22 +1725,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Stop here if there is no reset */
-	if (!data->reset_num)
-		return 0;
-
-	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
-	if (!rst)
-		return -ENOMEM;
-
-	rst->map = map;
-	rst->offset = data->reset_offset;
-	rst->rstc.nr_resets = data->reset_num;
-	rst->rstc.ops = &axg_audio_rstc_ops;
-	rst->rstc.of_node = dev->of_node;
-	rst->rstc.owner = THIS_MODULE;
+	/* Register auxiliary reset driver when applicable */
+	if (data->rst_drvname)
+		ret = devm_meson_rst_aux_register(dev, map, data->rst_drvname);
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return ret;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1837,8 +1748,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1848,8 +1758,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
+	.rst_drvname = "rst-sm1",
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0

