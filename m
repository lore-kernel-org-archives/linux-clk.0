Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566514;
	b=qMUJkfyukDtUP68KOYOIv5lwslgbwr0y2EMLx0GxgtkcmweNGhDwOc5DaF0her3gYcRM
	 7Q7aMhvcureR0v1IvCo8GZUvPRPOD9Squw17Q+hD1wnk4/nko4pcWT0nMLWGpNDwSbGRD
	 d3aiewWz0pU3yoBHATfTDij94LPG9WclyFSySUeWNwn7kV3Dg98XQg/Cu4r0kInUwrtq8
	 XvIuTnAOxxzYzTHpmseKWRTypKXtH24hT3q3ait4W0bBd+7X2u4/TjQ5QteYUD3V4YfKk
	 P12CCwY8EKN+zhxqHsvUcS4mXOWywOV6qrE1XsN1z73+ImfMPo9t0ll5wiAZgYyjQsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566514;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAUJeCOS+/MlC3wrCBCavhbBNsK3kckElZYb0VO/Yu8=;
	b=3mIQ90vUJGFYQdW/bnAbLUdNhuK8e86GeXciZ1FAZT2/W2MFNRKM0YujZIbIc7siwfgX
	 vEODlGVw1wep7fzxu5EgEYrrofqrNgaRcX9t2qfVWxYzK3ls22XNFuf8tM7rs4dNj0u9j
	 h+XIMlHd1QMWtwOBRajRAUgkgh8TZBTZxE6J2iIbRQ0A0YSn6Buj1Vpn8LOHyhEAzJVeH
	 pfMeyuOYopRSY3isdC0X026FipiwzUvv0RYvGgzNCJRkgNWifUIoXT7vPz/TiXH7Mrpf9
	 b5NNQ2ANxjkeeXeibhl308oHiHYjCN70vD4IZInNLD1zem40/VnZimaEy/zwhM1Qn/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or1Efdgi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8B606A33D;
	Wed, 21 Oct 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or1Efdgi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566513;
	b=cqATUavev3JNIifr8+GBC01RTj1J3qecVZrJIDe/Puwz3jvjbKYG6JOTSKxVQHMj5pdU
	 zGcUSVsOPVCpme7skzHS3Kf4HeOU89vy/0xmnasPz8H1/U+AHye06bbOoPskouTs1Hvir
	 LK9riXqGzG6q7/VOzYoC/F+XLSmt6KErGhWwio9u9tDLnzzlFFZF8DqaSv/lIxDBsWYTu
	 T8yz/9VyxRIbmb93m97p+yn4PRsaIKx03JB7cdSy5FFPJ6HE7Og8Bz9DJYA2QGzMJsjLu
	 3D3Ac+1ydYqh1cJMUgZMw7YXiRW1f2CTaD+7G8LdVU4HNyH0v+1lDSK8JcQyyX3b+aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566513;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAUJeCOS+/MlC3wrCBCavhbBNsK3kckElZYb0VO/Yu8=;
	b=MNclLb8VZZYy81RKMd1kolJ1I5mfCxLNjIzYwm8GmKxVkFkR/LOsnMfe05VtVxa9vc7u
	 U/22MpfBwyOL5ULhwuvn9GWrF4WcvQcL2bTnqLlBjNTYQPFJuQ+qakmL8guf4GnFgvyLS
	 7zYTbVdNlZfazo8q7tXab0tUX8daNsm0+lIB9p3PFJLcfMgvJN1AyNLq/0zIlyui/KN3k
	 6feZPNW3leNKaKO2AT61/b464BJsMPCLab6sOcg4WG9n5NiepSUuIOk4/3TIPPiMEge/0
	 9xMsygZ1+7W+ZSLJYKBarcrHxUSayJPSDaeUhzlV68ERet+gZfn92cAVGHOWoxbY5YA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A58E11F000CB;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566513;
	bh=LAUJeCOS+/MlC3wrCBCavhbBNsK3kckElZYb0VO/Yu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=or1EfdgiYQnH+xM/lEYLsSeTMUpzXR3ogZFMYnLBnPBf6vkiibR1D6Ll90/JHw6Tw
	 BqE/k2ORA2IKnF6x+9wJdqEHK7mf6gUddFWo8xAKxAc9tnN0ytEy9nUcdy3ITLgbUg
	 kIS/M7ZutJDgF9aoe4kqn9ArhyIjetuYwTd0CPPyIpnyG8FTMg1MihGsJ201mTOOzy
	 wmGcMrpA8KqP3+h9NYhJoT6hfvgFhxTzmJyPXF6Z0r0+7mn2ydE9dTfc6DF0W4c0qj
	 n8KRYFQOwT1v8/KvFl0zppA+PqylkGDd/tZ4+JlKzW1Xyf17bHZ4lJSbcmhN5anniM
	 X3FwuqmWrO+MQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1DB5E432F8;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 21 Oct 2026 15:08:30 +0800
Subject: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
In-Reply-To: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=4166;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=YgYCWD7HPb1VU+RF4UtLzjsrq8Zfw/cRTc3jOM6GMQI=;
 b=Fu5JY8hTJvrw0CUWls5oTEZn6YNENrqzUCc8VM8NHMJJAmdhk7kRZbWsE/hF81yov8G2tuDBD
 AHplds0N6kbDenTNTFG9XjmaWddcrhPiI8YZbTCSCAA/Zut9Raoe18S
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jiebing Chen <jiebing.chen@amlogic.com>

The S4 requires additional clock control bits to be turn on while enabled.
The S4 has 8 TDM lanes, instead of 4 on previous SoC.
Update the widget accordingly.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 sound/soc/meson/g12a-toacodec.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..10f26b4bc8b0 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -41,6 +41,9 @@
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
 
+#define CTRL0_BCLK_ENABLE_SHIFT		30
+#define CTRL0_MCLK_ENABLE_SHIFT		29
+
 #define TOACODEC_OUT_CHMAX		2
 
 struct g12a_toacodec {
@@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &sm1_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+	SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0, NULL, 0),
+
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -226,6 +239,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "OUT Capture", NULL, "OUT EN" },
 };
 
+static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
+	{ "SRC", "I2S A", "IN A Playback" },
+	{ "SRC", "I2S B", "IN B Playback" },
+	{ "SRC", "I2S C", "IN C Playback" },
+	{ "OUT EN", "Switch", "SRC" },
+	{ "OUT Capture", NULL, "OUT EN" },
+	{ "OUT EN", NULL, "I2S BCLK Gate" },
+	{ "I2S BCLK Gate", NULL, "I2S MCLK Gate" },
+};
+
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
@@ -234,6 +257,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
 };
 
+static const struct snd_kcontrol_new s4_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -256,6 +283,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver s4_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= s4_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
+	.dapm_widgets		= s4_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
+	.dapm_routes		= s4_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(s4_toacodec_routes),
+	.endianness		= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -276,6 +314,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
 };
 
+static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
+	.component_drv	= &s4_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
@@ -285,6 +330,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
 		.compatible = "amlogic,sm1-toacodec",
 		.data = &sm1_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,s4-toacodec",
+		.data = &s4_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
2.52.0


