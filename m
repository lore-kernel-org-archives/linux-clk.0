Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277725;
	b=ZkTz1rhxRK4Pas4zrWGQGc0QPpPWSEkfKIMkCY3BhajCzrmizc57WXHQ3pbzJVHRVhE9
	 otPJwslqQ8F0zVCuCL5dAuk6O0g4o1+jUtcuHoWRJJWaztSu45EqPGxOlrtLF02WB1Rkp
	 blcMMjQ4TR4siXNk+CR+FIWcWE+jsYClNX+GAZI1C1Now9kbQetoqK7yF9WnImUNCWFTM
	 WDhp1zvuSmFgMPAsSpLCLvx+uBklkX9iESROpRUvwX49IcWsqFoiGSLCPDHaEdpn1Zv4y
	 cU2SCO7jwm+hr6rmGKFrSNUGPcJRO+vGILDKKbblAn970k+OkjAhmaB38/imZx1FpuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277725;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=;
	b=Ofnrr0l/yWx7SuRebTcTvxyYsmKYrW48DvTHy9eV1BhZwzNeg1NechXeSzYwxa5X/8pB
	 f3CT+mfSOrmmvoLYpnVW24dFQgB8fWaiUUNemYcZCVlIEmK6WXVA7PTmNSoj8k06dbSdU
	 8Inl3k4d4dXD0G46E0T8JsrEp+gho97pj498AP72pZSgGign44A9mJxrJYo0zlV8HT8j6
	 B+EhbsEJlycQkHcEty4WD5Aq/JpmYqxOIinwjWQIJpww3SuHinDzm77doql6n5jFvHWac
	 ZyR2oJ3y5C61WFGYdRIfTor3lAvGRxWydJAHm1z9A7tzqq1ZufYh8aEuIJj8/MtpY3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ca8aUqrU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5A60A2601;
	Tue, 10 Nov 2026 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ca8aUqrU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277724;
	b=bXWcyMCTBHjM6tq98bB3cX+0PV/s/ktoqadaBmNYmiUT91oSIBrl3of7GO3u1kUwmOYp
	 Rvgmu+NkGAEm8gpPSjzwkQ+6lOIvmxFdsw83n5ZYcwAutkvVTIxXTT+9wamG5OOpA3WJO
	 HuOBUHkk70XqqxKJmPB+DWZVffoNVlFSqMCMr1U1wUp4Oh6NSvILBQCjEAdpKRPqmvEqS
	 3yX9RV2+Y5YEinUcL7mEMqo87Gmlv0/G/8CxMN2PX/rAvKgVVa7RzdiicDKYlDIHV1l6j
	 iDghRkohNKM+De9/jF8P4Kga3hPcJRXbZ2j3kJlUaaK8zD9MO18Kga0fKmkJX9oOE9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277724;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=;
	b=0Oe7KLLkc8j3Cpl0MAiMkySJoX3gXqz5jtnIoIOvVwxlAmPYVoQ/n7A/loT37wKj3kJG
	 LmtwSWKEKKAHHwU9/BmL3J8qxnOPPtSgZzc0bY3QTFv6gYb5Fp1hMtlosYFtvh0FqJfRg
	 Sli7TpMqmNWN1AFKTXKjeYKYX2QxC5iuhMWM2Vkhia4vpOKAWj7Vs03APNLLyfdODzp1R
	 2au7D3axkCELEfNQP6VHndtAJmStuMIy+gDqetmo4PzgI11aGh4lZhkttTQC9sdWAKDgm
	 XqYds2v6arFymwP7yYL/j3jDr3sfARU8TVyicw8TaOHFtzMzwl2qcAXXmCLT/51FYCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56DB71F008A3;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277724;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ca8aUqrU7qbc2RmXSNRVGPQirtHZDPTz77wfZwFL+g6/P/YzVjh0gkPWOIFLjZ0yV
	 cOmOxhApxFs26V4p2EPyeeaP8/m2WZAuVFt4XCxm1cR/HnYXlV/C2179H2NE0zeZhh
	 KwJkkxAk4xxCnQkZBwHAGmTz8U9C+a+RTOmfScjEGoJdtZwlFgQMAMORzJObVWgD7+
	 UZsvoW2/ZoeLUI6/nmANCKyq/Fir9ZO30/bPR+nfL/1pURnjj/e8OqvDFzs/RzmRkc
	 uMvxB+LPCM+lT6lkpOfXetc9ZhF8sJ1R3tbo1oocoNRdfXR9Jh5lz2Y2wLkaCStQUV
	 rCbsBxP3zKc8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D346448774;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 10:28:26 +0800
Subject: [PATCH v8 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
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
Message-Id: <20261110-audio_drvier-v8-3-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=5023;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=11hDEGmkESVqDEUzJaCmdn1TV8Fy1sH/bmdnlw0tZp8=;
 b=/85pETYf9mjWldkS6Pl3OyIKF8kIqluerJqqRr7GHDchBi95Ur0pFn0hbSzb4+gVsdf4Okp//
 TrFmzdeSRW5D//zaOW3a70cAPAWI1G0a36ZKlIW4HuD4aQtAiA2ULVR
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
 sound/soc/meson/g12a-toacodec.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..01be0cbc79a9 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -40,6 +40,10 @@
 #define  CTRL0_BCLK_SEL_MSB		5
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
+#define  CTRL0_BCLK_ENABLE_SHIFT_S4	30
+#define  CTRL0_MCLK_ENABLE_SHIFT_S4	29
+#define  CTRL0_DAT_SEL_S4_MSB		20
+#define  CTRL0_DAT_SEL_S4_LSB		19
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -123,6 +127,19 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+/*
+ * The S4 lane selector is one bit wider than the SM1 one, which pushes the
+ * data selector up by one bit as well.
+ */
+static SOC_ENUM_SINGLE_DECL(s4_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_S4_LSB,
+			    g12a_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new s4_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", s4_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -141,6 +158,17 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &s4_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+	SND_SOC_DAPM_SUPPLY("I2S BCLK EN", TOACODEC_CTRL0,
+			    CTRL0_BCLK_ENABLE_SHIFT_S4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S MCLK EN", TOACODEC_CTRL0,
+			    CTRL0_MCLK_ENABLE_SHIFT_S4, 0, NULL, 0),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -226,6 +254,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "OUT Capture", NULL, "OUT EN" },
 };
 
+static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
+	{ "SRC", "I2S A", "IN A Playback" },
+	{ "SRC", "I2S B", "IN B Playback" },
+	{ "SRC", "I2S C", "IN C Playback" },
+	{ "OUT EN", "Switch", "SRC" },
+	{ "OUT Capture", NULL, "OUT EN" },
+	{ "OUT EN", NULL, "I2S BCLK EN" },
+	{ "OUT EN", NULL, "I2S MCLK EN" },
+};
+
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
@@ -234,6 +272,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
 };
 
+static const struct snd_kcontrol_new s4_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -256,6 +298,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
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
@@ -276,6 +329,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
@@ -285,6 +345,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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


