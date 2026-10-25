Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956282;
	b=rJVW51jg7MHeKrSDrbITPnJnz7ru28FAe4hoDh3T5FsNWPdwY9hBgOHg9Dmq5wWJFyap
	 FnlG0OM5/HTLb2aRUFYs4Fx4kyJTLTR10cor45urNWroCSZIz+IzB+Fo3KYSvowDjgQ/X
	 nsz80fLfLX6zaMHuLmfupxg7h2NAp20Sov9GDmAz9Midh/7MnAvzMxLZlUoCMYFRyCd7g
	 CS/aaLFtkvmhHkcF7xUBJmpcqJnmLiQTxwPxDzFGowfEPXOZJQwJCU1zk8d7XRWr31K9J
	 z841R4CybTDyanPvVlJDMsn3pngOj6xS9w4TXknpqZZ95+MmXfnGsR3fdarL6SHDyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956282;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=aFcLdqnEIhkV5k1glsDX1/kR5E9pECkLZvvjtAi3TNA=;
	b=pCYSLScZ2CXrc43gv/f8+6Wv1NRsc56D4pbbsw2vs9tF6vbjINkcdI7tcfRbZXfF8OYo
	 wN56bk/UYYypt2/iHTTih1tf9kQG1HGp19dJKpPKSFxQh7POAwmx5jCNjhjp7PjWHqd8g
	 17XzPUQssGQKQ943F0+WV2m+eAW0sNazbt/t+iOMBtBxv1N9OQY1fPfOk8GDe5HLaAYK+
	 558ZeNmKSZeNblEOSF0Xxh5zZQxTl+v9hPJ3likN9ubA1KiXPz/nroCbug3TYReiYy6BC
	 eezY7mMbBbvz5KmzmRadzRD7jvBGzKfC6QektcOAz6nVq+S6YBMFRNm7l+eRJYggd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=NVqw7Lp7;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77660A5BC0;
	Sun, 25 Oct 2026 19:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A77660A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=NVqw7Lp7
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ig518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:21 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ig518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956262;
	bh=aFcLdqnEIhkV5k1glsDX1/kR5E9pECkLZvvjtAi3TNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVqw7Lp71L2MjRoTl1gj/Iuy1AO7VsQsPgBm8r8VAmTRXmsNKojncPZmPHgvqMYBP
	 ySk0FC3WHrA4NeRksLjAmcFXFwDP6l/dzh2UyUc4zTX0kydGb/o+yXlqDdNtdZbVWs
	 b4TrGkaSppJmKyNGVzKl+FRMa8RV0Z2peXvXv2MM=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 7/7] ASoC: meson: g12a-tohdmitx: add S4 support
Date: Sun, 25 Oct 2026 20:24:04 +0100
Message-ID: <20261025192404.209695-8-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Jiebing Chen <jiebing.chen@amlogic.com>

S4 replaces the single ENABLE bit of the G12A HDMI TX glue with
separate data and clock enables for each of the I2S and SPDIF paths.
Model the clock enables as supply widgets and give S4 its own component
driver, selected through match data.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
[ckoever@outlook.de: rebased, use the SPDIF data bit for the SPDIF
 output enable, style fixes]
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 sound/soc/meson/g12a-tohdmitx.c | 80 ++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 967109ca2b57..eafade3d7474 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -31,6 +31,15 @@
 #define  CTRL0_SPDIF_SEL		(0x1 << CTRL0_SPDIF_SEL_SHIFT)
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
+#define  CTRL0_I2S_DATA_SHIFT		29
+#define  CTRL0_I2S_CLK_SHIFT		28
+#define  CTRL0_SPDIF_DATA_SHIFT		31
+#define  CTRL0_SPDIF_CLK_SHIFT		30
+
+struct g12a_tohdmitx_match_data {
+	const struct snd_soc_component_driver *component_drv;
+};
+
 static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
@@ -130,6 +139,13 @@ static const struct snd_kcontrol_new g12a_tohdmitx_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
 
+static const struct snd_kcontrol_new s4_i2s_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
+				    CTRL0_I2S_DATA_SHIFT, 1, 0);
+static const struct snd_kcontrol_new s4_spdif_out_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOHDMITX_CTRL0,
+				    CTRL0_SPDIF_DATA_SHIFT, 1, 0);
+
 static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 	SND_SOC_DAPM_MUX("I2S SRC", SND_SOC_NOPM, 0, 0,
 			 &g12a_tohdmitx_i2s_mux),
@@ -141,6 +157,21 @@ static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 			    &g12a_tohdmitx_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_tohdmitx_widgets[] = {
+	SND_SOC_DAPM_MUX("I2S SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_i2s_mux),
+	SND_SOC_DAPM_SWITCH("I2S OUT EN", SND_SOC_NOPM, 0, 0,
+			    &s4_i2s_out_enable),
+	SND_SOC_DAPM_MUX("SPDIF SRC", SND_SOC_NOPM, 0, 0,
+			 &g12a_tohdmitx_spdif_mux),
+	SND_SOC_DAPM_SWITCH("SPDIF OUT EN", SND_SOC_NOPM, 0, 0,
+			    &s4_spdif_out_enable),
+	SND_SOC_DAPM_SUPPLY("I2S CLK Gate", TOHDMITX_CTRL0,
+			    CTRL0_I2S_CLK_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SPDIF CLK Gate", TOHDMITX_CTRL0,
+			    CTRL0_SPDIF_CLK_SHIFT, 0, NULL, 0),
+};
+
 static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
 	.probe		= meson_codec_glue_input_dai_probe,
 	.remove		= meson_codec_glue_input_dai_remove,
@@ -221,6 +252,20 @@ static const struct snd_soc_dapm_route g12a_tohdmitx_routes[] = {
 	{ "SPDIF OUT Capture", NULL, "SPDIF OUT EN" },
 };
 
+static const struct snd_soc_dapm_route s4_tohdmitx_routes[] = {
+	{ "I2S SRC", "I2S A", "I2S IN A Playback" },
+	{ "I2S SRC", "I2S B", "I2S IN B Playback" },
+	{ "I2S SRC", "I2S C", "I2S IN C Playback" },
+	{ "I2S OUT EN", "Switch", "I2S SRC" },
+	{ "I2S OUT EN", NULL, "I2S CLK Gate" },
+	{ "I2S OUT Capture", NULL, "I2S OUT EN" },
+	{ "SPDIF SRC", "SPDIF A", "SPDIF IN A Playback" },
+	{ "SPDIF SRC", "SPDIF B", "SPDIF IN B Playback" },
+	{ "SPDIF OUT EN", "Switch", "SPDIF SRC" },
+	{ "SPDIF OUT EN", NULL, "SPDIF CLK Gate" },
+	{ "SPDIF OUT Capture", NULL, "SPDIF OUT EN" },
+};
+
 static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.probe			= g12a_tohdmi_component_probe,
 	.dapm_widgets		= g12a_tohdmitx_widgets,
@@ -230,25 +275,56 @@ static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver s4_tohdmitx_component_drv = {
+	.probe			= g12a_tohdmi_component_probe,
+	.dapm_widgets		= s4_tohdmitx_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(s4_tohdmitx_widgets),
+	.dapm_routes		= s4_tohdmitx_routes,
+	.num_dapm_routes	= ARRAY_SIZE(s4_tohdmitx_routes),
+	.endianness		= 1,
+};
+
 static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 };
 
+static const struct g12a_tohdmitx_match_data g12a_hdmitx_match_data = {
+	.component_drv	= &g12a_tohdmitx_component_drv,
+};
+
+static const struct g12a_tohdmitx_match_data s4_hdmitx_match_data = {
+	.component_drv	= &s4_tohdmitx_component_drv,
+};
+
 static const struct of_device_id g12a_tohdmitx_of_match[] = {
-	{ .compatible = "amlogic,g12a-tohdmitx", },
+	{
+		.compatible = "amlogic,g12a-tohdmitx",
+		.data = &g12a_hdmitx_match_data,
+	},
+	{
+		.compatible = "amlogic,s4-tohdmitx",
+		.data = &s4_hdmitx_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_tohdmitx_of_match);
 
 static int g12a_tohdmitx_probe(struct platform_device *pdev)
 {
+	const struct g12a_tohdmitx_match_data *data;
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
 	ret = device_reset(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset device\n");
@@ -265,7 +341,7 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	}
 
 	return devm_snd_soc_register_component(dev,
-			&g12a_tohdmitx_component_drv, g12a_tohdmitx_dai_drv,
+			data->component_drv, g12a_tohdmitx_dai_drv,
 			ARRAY_SIZE(g12a_tohdmitx_dai_drv));
 }
 
-- 
2.56.0

