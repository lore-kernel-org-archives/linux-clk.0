Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52269 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1041984AbdDUSeu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 14:34:50 -0400
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com,
        cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org,
        jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 6/7] ASoC: samsung: Add Odroid ASoC machine driver
Date: Fri, 21 Apr 2017 19:19:50 +0200
Message-id: <1492795191-31298-7-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172046epcas1p32778006ff0ddc30083d49b31497b5b5b@epcas1p3.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This dedicated driver allows to support SoC specific clock
settings and helps to ensure proper number of channels gets
negotiated in multicodec system configurations.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/Kconfig  |   8 ++
 sound/soc/samsung/Makefile |   2 +
 sound/soc/samsung/odroid.c | 219 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 sound/soc/samsung/odroid.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index f1f1d79..0520f5a 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -185,6 +185,14 @@ config SND_SOC_SNOW
 	  Say Y if you want to add audio support for various Snow
 	  boards based on Exynos5 series of SoCs.
 
+config SND_SOC_ODROID
+	tristate "Audio support for Odroid XU3/XU4"
+	depends on SND_SOC_SAMSUNG && I2C
+	select SND_SOC_MAX98090
+	select SND_SAMSUNG_I2S
+	help
+	  Say Y here to enable audio support for the Odroid XU3/XU4.
+
 config SND_SOC_ARNDALE_RT5631_ALC5631
         tristate "Audio support for RT5631(ALC5631) on Arndale Board"
         depends on I2C
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index b5df5e2e..b6c2ee3 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -40,6 +40,7 @@ snd-soc-tobermory-objs := tobermory.o
 snd-soc-lowland-objs := lowland.o
 snd-soc-littlemill-objs := littlemill.o
 snd-soc-bells-objs := bells.o
+snd-soc-odroid-objs := odroid.o
 snd-soc-arndale-rt5631-objs := arndale_rt5631.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
 
@@ -62,5 +63,6 @@ obj-$(CONFIG_SND_SOC_TOBERMORY) += snd-soc-tobermory.o
 obj-$(CONFIG_SND_SOC_LOWLAND) += snd-soc-lowland.o
 obj-$(CONFIG_SND_SOC_LITTLEMILL) += snd-soc-littlemill.o
 obj-$(CONFIG_SND_SOC_BELLS) += snd-soc-bells.o
+obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
 obj-$(CONFIG_SND_SOC_ARNDALE_RT5631_ALC5631) += snd-soc-arndale-rt5631.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
new file mode 100644
index 0000000..0c0b00e
--- /dev/null
+++ b/sound/soc/samsung/odroid.c
@@ -0,0 +1,219 @@
+/*
+ * Copyright (C) 2017 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "i2s.h"
+#include "i2s-regs.h"
+
+struct odroid_priv {
+	struct snd_soc_card card;
+	struct snd_soc_dai_link dai_link;
+
+	struct clk *pll;
+	struct clk *rclk;
+};
+
+static int odroid_card_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
+	return 0;
+}
+
+static int odroid_card_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	unsigned int pll_freq, rclk_freq;
+	int ret;
+
+	switch (params_rate(params)) {
+	case 32000:
+	case 64000:
+		pll_freq = 131072000U;
+		break;
+	case 44100:
+	case 88200:
+	case 176400:
+		pll_freq = 180633600U;
+		break;
+	case 48000:
+	case 96000:
+	case 192000:
+		pll_freq = 196608000U;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = clk_set_rate(priv->pll, pll_freq + 1);
+	if (ret < 0)
+		return ret;
+
+	rclk_freq = params_rate(params) * 256 * 4;
+
+	ret = clk_set_rate(priv->rclk, rclk_freq);
+	if (ret < 0)
+		return ret;
+
+	if (rtd->num_codecs > 1) {
+		struct snd_soc_dai *codec_dai = rtd->codec_dais[1];
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops odroid_card_ops = {
+	.startup = odroid_card_startup,
+	.hw_params = odroid_card_hw_params,
+};
+
+static void odroid_put_codec_of_nodes(struct snd_soc_dai_link *link)
+{
+	struct snd_soc_dai_link_component *component = link->codecs;
+	int i;
+
+	for (i = 0; i < link->num_codecs; i++, component++) {
+		if (!component->of_node)
+			break;
+		of_node_put(component->of_node);
+	}
+}
+
+static int odroid_audio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *cpu, *codec;
+	struct odroid_priv *priv;
+	struct snd_soc_dai_link *link;
+	struct snd_soc_card *card;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	card = &priv->card;
+	card->dev = dev;
+
+	card->owner = THIS_MODULE;
+	card->fully_routed = true;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	priv->pll = devm_clk_get(dev, "epll");
+	if (IS_ERR(priv->pll))
+		return PTR_ERR(priv->pll);
+
+	priv->rclk = devm_clk_get(dev, "i2s_rclk");
+	if (IS_ERR(priv->rclk))
+		return PTR_ERR(priv->rclk);
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret < 0)
+		return ret;
+
+	if (of_property_read_bool(dev->of_node, "samsung,audio-widgets")) {
+		ret = snd_soc_of_parse_audio_simple_widgets(card,
+						"samsung,audio-widgets");
+		if (ret < 0)
+			return ret;
+	}
+
+	if (of_property_read_bool(dev->of_node, "samsung,audio-routing")) {
+		ret = snd_soc_of_parse_audio_routing(card,
+						"samsung,audio-routing");
+		if (ret < 0)
+			return ret;
+	}
+
+	link = &priv->dai_link;
+
+	link->ops = &odroid_card_ops;
+	link->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS;
+
+	card->dai_link = &priv->dai_link;
+	card->num_links = 1;
+
+	cpu = of_get_child_by_name(dev->of_node, "cpu");
+	codec = of_get_child_by_name(dev->of_node, "codec");
+
+	link->cpu_of_node = of_parse_phandle(cpu, "sound-dai", 0);
+	if (!link->cpu_of_node) {
+		dev_err(dev, "Failed parsing cpu/sound-dai property\n");
+		return -EINVAL;
+	}
+
+	ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+	if (ret < 0)
+		goto err_put_codec_n;
+
+	link->platform_of_node = link->cpu_of_node;
+
+	link->name = "Primary";
+	link->stream_name = link->name;
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret < 0) {
+		dev_err(dev, "snd_soc_register_card() failed: %d\n", ret);
+		goto err_put_i2s_n;
+	}
+
+	return 0;
+
+err_put_i2s_n:
+	of_node_put(link->cpu_of_node);
+err_put_codec_n:
+	odroid_put_codec_of_nodes(link);
+	return ret;
+}
+
+static int odroid_audio_remove(struct platform_device *pdev)
+{
+	struct odroid_priv *priv = platform_get_drvdata(pdev);
+
+	of_node_put(priv->dai_link.cpu_of_node);
+	odroid_put_codec_of_nodes(&priv->dai_link);
+
+	return 0;
+}
+
+static const struct of_device_id odroid_audio_of_match[] = {
+	{ .compatible	= "samsung,odroid-xu3-audio" },
+	{ .compatible	= "samsung,odroid-xu4-audio"},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, odroid_audio_of_match);
+
+static struct platform_driver odroid_audio_driver = {
+	.driver = {
+		.name		= "odroid-audio",
+		.of_match_table	= odroid_audio_of_match,
+		.pm		= &snd_soc_pm_ops,
+	},
+	.probe	= odroid_audio_probe,
+	.remove	= odroid_audio_remove,
+};
+module_platform_driver(odroid_audio_driver);
+
+MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
+MODULE_DESCRIPTION("Odroid XU3/XU4 audio support");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

