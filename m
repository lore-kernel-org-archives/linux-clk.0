Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4646214EC4C
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872140; cv=none; b=VGPNjJhHHchaS0UGAHeXq1guJvPJ1d8P4JHEv1dSUiMgaVjST/CNHUuS/EQB/gOoa7+TI/xkIk9Sg9be3N1yGU8rcEF3w3eSZqTO/56WzuGtkVNHfiu2M+0AdgBtSFZ9ZvLEvfiHurC6yEeQPPplCA9DLrzIZtP56zKewd8XKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872140; c=relaxed/simple;
	bh=2Va0ITxM0suedkhfLIJ7a6V95PomOw82XQ9JMnUFjws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHuJXe5DXWm3oA/Qr3I/9RAjUNsGoo6c8SGzcyZ5T6pkI4b/CSh6oH4Wb6FgGWSelFpYNRvdv2brlw/tdXVrsFLPCDNHMcK8SqZ412Dh30TvXVyKi4qDFArY6ZKBnF7TrQ5DExwhtutKG5JJTrahEAsEOggJD4FKSbple6LLT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PhQN27Oh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PhQN27Oh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42011507a54so33474365e9.0
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872135; x=1716476935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL5f80GGi83nhgomz2kgPXZIzOXSZK09LD8gHLnVu8c=;
        b=PhQN27OhGCBho6daqYyVBWZcGjM1J1+bP11BeXMc86+IgsqsDpHEMWwVmtjEBtcNZ7
         Hh9KW+nXAHCBmK9zLZzZR3kUys4pXUgOeNGqH6nFjz/69mgiux/Xw8QHC3iBOQRmDi7w
         3csljkYK8A85Bd8xhR9MOnpcodxMM+BCJeXSEi8sSQ6RjJs48P+Cf3wOsrqwiuqjj2rM
         2sVcI2wsB/k29G/ax/csPG5pjYGza7kU2X0ehX5NPHRgkCWh8e8JkOSJn+OyW/rJPEIl
         3d3dWbIs3m+fkLqmh+IKhRqlGrypnSOAKTPWOVpBDOO7Tv7BoTfHK/ynh2G5n4p61LMQ
         HdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872135; x=1716476935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL5f80GGi83nhgomz2kgPXZIzOXSZK09LD8gHLnVu8c=;
        b=JeWsVGdli6jwR/MAycWuw5HUb2GF9z5FRWhXxiJWGyOhGUn49D1VBaFTuMYG9AYdaH
         35LFxTAUDxZDjT8uv1NZDbX0ZHwUEGv1MiJ2nskuKDLU0gdE8qKSozzbBVVCRN+RNq/g
         p80RfAU/8iuei7mwAmqMc/nHvs5zxWNp0iovXI2I9Jg64faV/+gVqf28RaVC9HIJrSOC
         4AOB/R8yDzR0QkIrMzTY5JD9d6L9QsJ2JN87VqSVnMnbm15zv2bOFuctXwQVDiznXlcF
         OuJp8wEm8OgrP436l3qsxlpN+Rh3n97+ng99VMW4kwafsf060axY2dKJ+4k1F2CVxW8J
         GPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJoOjKBRCpy4exQechvbUeElK+2twBmg0cFdnUUEZr6ZwybmXXw1eUNlmAhGUDWc2Au73WkEdJQcQgI9zaCW4UXOd/Y/hDvLyL
X-Gm-Message-State: AOJu0YwEuJaubpI8f9/4t+eiR0VJTa3r9XmhS6R+KE5Qs9PKEYy1Qcu3
	9Pw4PNKD0DG5wivS50Z9DAk3BHPIGC+7aC6NQROPj1viMQHcM3GlCEwZHKq72hE=
X-Google-Smtp-Source: AGHT+IF30UqBoIXs9icx2iDgiQ7TuYEvX0q0rV/70GCuE7s1xRKQ4Arx1HOxMSeUsJUlVOSEqHZT6Q==
X-Received: by 2002:a05:600c:358f:b0:420:29dd:84d4 with SMTP id 5b1f17b1804b1-42029dd885amr21620795e9.13.1715872135697;
        Thu, 16 May 2024 08:08:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 9/9] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Thu, 16 May 2024 17:08:39 +0200
Message-ID: <20240516150842.705844-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
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
on auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 108 +++-------------------------------
 2 files changed, 9 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 6905aa2f080c..b89e769a6362 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -110,6 +110,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_PHASE
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_CLK_RST_AUX
 	select REGMAP_MMIO
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 93e6a6d321be..dc9191a9ab0f 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -15,6 +15,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 
+#include "meson-clk-rst-aux.h"
 #include "meson-clkc-utils.h"
 #include "axg-audio.h"
 #include "clk-regmap.h"
@@ -1678,84 +1679,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_earcrx_dmac_clk,
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
@@ -1766,15 +1689,13 @@ struct audioclk_data {
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
@@ -1832,22 +1753,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
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
+		ret = devm_meson_clk_rst_aux_register(dev, map, data->rst_drvname);
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return ret;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1866,8 +1776,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1877,8 +1786,7 @@ static const struct audioclk_data sm1_audioclk_data = {
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

