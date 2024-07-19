Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24E57CBC
	for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721382571; cv=none; b=ogXWdEMtwXFeydf39qu1kmyrB1DrX+bpiSPE8karxDe75dGALFM5bkLSv5qi1ADPheF98loklfURmQc4hLRHigHjQhEqq6+QVpdFwQOAtFahNu330kZe+2OioUHS+BYNPTAloYOud3L7Gf38cj8o24sjSBa+PC7kmqqJCJGD2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721382571; c=relaxed/simple;
	bh=OsAHbWLRy1wIeGDs9oSlc5cxE8YAFrNcw4MR1v3aKV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRBCGHfaav+JV9FplgKRq2F7jhEsu9cMAI72ppF7VFxAGKO+R2yZMW0Ex2QzQ08jhdqcqB/3UzuWR7vizsqsEw96tToXxZ0BrGkxXbDY3b1UU7G/QRDt+00x5ew3xvm/yp+Uzo7rT3EkBt8SAEV/6XNf4xZJvJelMlCmYY+44gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IA7U9tTc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IA7U9tTc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-427cede1e86so10149475e9.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721382567; x=1721987367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zq2RQGZuDy6qYpeBCpDDmOGgnGZyyaD1WUEcAiHg4k0=;
        b=IA7U9tTccQPbOWjpWcVowxkA4GE226DfJVmBrUerdBKFPPbxuX7Xim4YiHNTDVF4xi
         EYY5aA07JFxvyQOZ4Pb5efBiwoC44ItaWs0pO5kv0dwoAlIuptZ5PxE3MHLbQ0ob6+lQ
         FjugbYQVoSUNYL8bnRf8tAby4L27xDBjo44II/wpXyz7914QO+SVVyP1wUiu6Pg/R91x
         D3/Y6AadM2/VqZxxuBAZt9kdYR+n/8sJdgNbAFwt6Fpj1wr1UGzx4DylbyNqZQZclR3C
         TCxdBbjEKVsuW7aB/4QRcUW8hYAkGXU0cY+u5uv2i6QeGuDeJIGvsNDbz98/J36y4uju
         Xyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382567; x=1721987367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq2RQGZuDy6qYpeBCpDDmOGgnGZyyaD1WUEcAiHg4k0=;
        b=evzbDAiZkEOTMElffzhNxpkB6tVRIKmGDHBN+LUARN5YrJCRNEzQb0yswNkRPJL0Q7
         7+gwPQsJASEeQZftssBLgHvtEIEPKZ3EGa0KmanbZJFjyV+zBz69hP4mYIKQ4ZYSEXf0
         J4gtetgWlo2BQqn8La1/6X22EzololgD0JrAenJe+Y7xS0H6yVfJGfBJff5BMPgpQbWy
         HXFh4m3AmbkFBxjYHWovciY3HG9L6Xtgox8xAo21LvXRlub8ft1rDWUSdIA3I2Hr3iye
         pXzmMk9ZWUMN301C65MP9gevFB1AwYmqibwopPM/lk2q8f4iK8Qkv7p/ViYP++c7yJTb
         k/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf8CTFgpcbRe3/EJRiCsT2w9J13hORfoh6Wt4YA92CZZMY5QUZhgtWjACv8QbNizGi8eiZFqSvpbeoKnxXYj92N0JlGPsmeU93
X-Gm-Message-State: AOJu0YwMFnybnaaqspBDoGUgENDnOetquUuncuSM0GdgyJYfu3F64CBz
	Yeord4PNKr+6RhjKEyGTlMGOG9SkdJUw5rDr+HwvpsnmGEunQwafY0FVyVs0bMa8UdQSv1tAf41
	2His=
X-Google-Smtp-Source: AGHT+IGRKBl1lSL0UQrFZiYoZM+nJVDbvxjGEQmi1be9dpn1ik4Ql/UT3k5rut4+VYEiE0/gmd6RDw==
X-Received: by 2002:a5d:58cf:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36831745e31mr5263732f8f.56.1721382566978;
        Fri, 19 Jul 2024 02:49:26 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-368786848basm1140202f8f.15.2024.07.19.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:49:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Fri, 19 Jul 2024 11:49:07 +0200
Message-ID: <20240719094910.3986450-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by the reset framework
on the auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Note: This depends on the amlogic auxiliary reset patchset.
V2 of the patchset is available here [1]. A v3 will be sent
but it does not affect this change.

[1]: https://lore.kernel.org/linux-clk/20240718095755.3511992-1-jbrunet@baylibre.com

 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 109 +++-------------------------------
 2 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 78f648c9c97d..7cb21fc223b0 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,6 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index beda86349389..9887ac8b51cf 100644
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
@@ -1678,84 +1680,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
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
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,16 +1690,14 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
 	unsigned int max_register;
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
@@ -1834,22 +1756,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
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
@@ -1869,9 +1780,8 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1881,9 +1791,8 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
 	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
+	.rst_drvname = "rst-sm1",
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0

