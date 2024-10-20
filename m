Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB07BB0A;
	Sun, 20 Oct 2024 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729413149; cv=none; b=Gh5svT7iPAImVTJCcn3Yzw9PaHd21PV7XzNCEnaWFjj43w/fiORy0B1g46BxGvzFqNw/Gx6RWW3oiSK7Yh1f3/VyjI2bfkGg/JjYpDMF2ttp8EQ6clvQsNYShAVmd2DhH7/dvwiaUTbdIJele2qZQc21o5wzIV2WOrS5RIfa1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729413149; c=relaxed/simple;
	bh=2k2WGPiju6jvfoDrgqwKOJlBX3YbbH2b6X0S0HTzLYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEpnYvr32bX9e1yhINxyL5rCLdRpUHrL8vZoXbL0zrOyd+1yXELaoFro8GvcTmXSLpUqk5Hji1HWXLH1c5ELoPjjcxiyPCNVPXl446ELwppgMZgISXzWeBzydsQQc3azDixIj1VyWiQcikoZYDTbBez8KElVg/4uYkbO/sTihS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LfSAFTuC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oYrSsyAF; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LfSAFTuC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oYrSsyAF"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 706381380193;
	Sun, 20 Oct 2024 04:32:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 20 Oct 2024 04:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1729413146; x=1729499546; bh=2uKcfKf2DZnemF36/L+rBDBFd9HDst9M
	tO620D5V0yk=; b=LfSAFTuC/AjGM4Tet2cQ/+KkXrZFOOc9moRyNzlambJOoe7K
	HEmDFfnQXxVz50/zvJy5OumzkJKWq9AcaVZZTwU+vkUYsnRxkkUtEokmZp+vAYdw
	MwQsvbPVbT9dtvtUwZL/ubZJtJnB8gD0NOpk/IEmjJqzpffzwXtUB5eFEBa/lXra
	v+h9spHxWW/Nlf3dUjQcpYUftMLU0yH+cfm4yjdslo/ZQ7X4A2xBQLjOtjp3+yJC
	O1eXNNtMpM58atbtBsYUzyptt6F+DJQPKTaSlwl3mJ1XiHBMd2t6ynNUvpXv9Yp6
	cgYowPTD/T7EmxlwpGDR/hor6Bxf1doyttuP/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729413146; x=
	1729499546; bh=2uKcfKf2DZnemF36/L+rBDBFd9HDst9MtO620D5V0yk=; b=o
	YrSsyAFotuEiX72GvdaaEADnmfgJ4ugDnm9U51e7SwB6Zlf2IzCuEARqeq04ovD1
	r27JpkyoON1faS5Vf7KNG3ZmOIGgP1O9ezuJLSlM0VtBbWJ+He0ZIp7vKQ9/aBEW
	kNINq6kKS0z1VT+aMgbJJbzLJ554MybJ8ACZ/s1IsrDHCfwZ8kLcCPhvysr3iuWr
	8HESsLx3+3U9S+jaLnE06ZhWDoJKuyl0zhq88beY+59Zls6GjCRiiM28GtCkwqm+
	O/LM1twxq01Sj36ghUvr5tyJNWhnn5j8nf1RS4zB2M5T8LgBr14akztR9rR1VXv2
	XL8K+SvtCRtNaUW3X8Ysw==
X-ME-Sender: <xms:GsAUZ_5RwxKvWD7ldJTLZW7HjtkR_1Hy2fgTfQ3uOFWmGz2Jk8PD5g>
    <xme:GsAUZ0458poPopOtFu3x28t061Qq7UFtHcYclrVaqtVPbs_zuFWWzxaFgQUKP4gE5
    oupSab2MyaqVrA8OQ>
X-ME-Received: <xmr:GsAUZ2fS5gdzR6xs6ORxISQrohzWW5LKgfP2sw01CC6gkeodcFHmrxefXa86lMSXbqL6CfMDUuJ7sVtB9c4Ms7GnsPHSmcqF0H9gQkWGGtJv-xE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepieeiledvfeekfeduhedvtdeiteefleekteev
    udeitefgffehvefggfduvefhveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhho
    rghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhih
    hlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:GsAUZwKMJ0wi4aUQShlNQb2Y3nlp4NPGY8mUH8RGZAyMPspLusogzg>
    <xmx:GsAUZzItvP6gZEkmr2JRi1cbPB26PzjRybmlCaHa1jmKacJNIRhQ1w>
    <xmx:GsAUZ5zGuA3xLkA3x9DGtCcVY-ANjOgKLdRgnLKCtiZvnABFlMcZ3A>
    <xmx:GsAUZ_JJiqxo9Pimz4IbsYTWe_r88f1YpS3hIq8a7CiUXAijsSmi_Q>
    <xmx:GsAUZ05WznUubvmOwjyHFvT-EBGDnmTQWFuHkqMZGdqNNl83rLGMM5jO>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:32:21 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 5/7] ASoC: sun4i-codec: support allwinner H616 codec
Date: Sun, 20 Oct 2024 21:30:55 +1300
Message-ID: <20241020083124.174724-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020083124.174724-1-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The H616 SoC codec is playback-only with a single line-out route, and
has some register differences from prior codecs.

Add the required compatible string, registers, quirks, DAPM widgets,
codec controls and routes, based on existing devices and the H616
datasheet.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v1..2:
- Shorten codec name to fit within 16-char limit.
---
 sound/soc/sunxi/sun4i-codec.c | 202 ++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 312d2655c3f4e..767693819880f 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -226,6 +226,43 @@
 #define SUN8I_H3_CODEC_DAC_DBG			(0x48)
 #define SUN8I_H3_CODEC_ADC_DBG			(0x4c)
 
+/* H616 specific registers */
+#define SUN50I_H616_CODEC_DAC_FIFOC		(0x10)
+
+#define SUN50I_DAC_FIFO_STA			(0x14)
+#define SUN50I_DAC_TXE_INT			(3)
+#define SUN50I_DAC_TXU_INT			(2)
+#define SUN50I_DAC_TXO_INT			(1)
+
+#define SUN50I_DAC_CNT				(0x24)
+#define SUN50I_DAC_DG_REG			(0x28)
+#define SUN50I_DAC_DAP_CTL			(0xf0)
+
+#define SUN50I_H616_DAC_AC_DAC_REG		(0x310)
+#define SUN50I_H616_DAC_LEN			(15)
+#define SUN50I_H616_DAC_REN			(14)
+#define SUN50I_H616_LINEOUTL_EN			(13)
+#define SUN50I_H616_LMUTE			(12)
+#define SUN50I_H616_LINEOUTR_EN			(11)
+#define SUN50I_H616_RMUTE			(10)
+#define SUN50I_H616_RSWITCH			(9)
+#define SUN50I_H616_RAMPEN			(8)
+#define SUN50I_H616_LINEOUTL_SEL		(6)
+#define SUN50I_H616_LINEOUTR_SEL		(5)
+#define SUN50I_H616_LINEOUT_VOL			(0)
+
+#define SUN50I_H616_DAC_AC_MIXER_REG		(0x314)
+#define SUN50I_H616_LMIX_LDAC			(21)
+#define SUN50I_H616_LMIX_RDAC			(20)
+#define SUN50I_H616_RMIX_RDAC			(17)
+#define SUN50I_H616_RMIX_LDAC			(16)
+#define SUN50I_H616_LMIXEN			(11)
+#define SUN50I_H616_RMIXEN			(10)
+
+#define SUN50I_H616_DAC_AC_RAMP_REG		(0x31c)
+#define SUN50I_H616_RAMP_STEP			(4)
+#define SUN50I_H616_RDEN			(0)
+
 /* TODO H3 DAP (Digital Audio Processing) bits */
 
 struct sun4i_codec {
@@ -1520,6 +1557,149 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
 	return card;
 };
 
+static const struct snd_kcontrol_new sun50i_h616_codec_codec_controls[] = {
+	SOC_SINGLE_TLV("DAC Playback Volume", SUN4I_CODEC_DAC_DPC,
+		       SUN4I_CODEC_DAC_DPC_DVOL, 0x3f, 1,
+		       sun6i_codec_dvol_scale),
+	SOC_SINGLE_TLV("Line Out Playback Volume",
+		       SUN50I_H616_DAC_AC_DAC_REG,
+		       SUN50I_H616_LINEOUT_VOL, 0x1f, 0,
+		       sun6i_codec_lineout_vol_scale),
+	SOC_DOUBLE("Line Out Playback Switch",
+		   SUN50I_H616_DAC_AC_DAC_REG,
+		   SUN50I_H616_LINEOUTL_EN,
+		   SUN50I_H616_LINEOUTR_EN, 1, 0),
+};
+
+static const struct snd_kcontrol_new sun50i_h616_codec_mixer_controls[] = {
+	SOC_DAPM_DOUBLE("DAC Playback Switch",
+			SUN50I_H616_DAC_AC_MIXER_REG,
+			SUN50I_H616_LMIX_LDAC,
+			SUN50I_H616_RMIX_RDAC, 1, 0),
+	SOC_DAPM_DOUBLE("DAC Reversed Playback Switch",
+			SUN50I_H616_DAC_AC_MIXER_REG,
+			SUN50I_H616_LMIX_RDAC,
+			SUN50I_H616_RMIX_LDAC, 1, 0),
+};
+
+static SOC_ENUM_DOUBLE_DECL(sun50i_h616_codec_lineout_src_enum,
+			    SUN50I_H616_DAC_AC_DAC_REG,
+			    SUN50I_H616_LINEOUTL_SEL,
+			    SUN50I_H616_LINEOUTR_SEL,
+			    sun6i_codec_lineout_src_enum_text);
+
+static const struct snd_kcontrol_new sun50i_h616_codec_lineout_src[] = {
+		SOC_DAPM_ENUM("Line Out Source Playback Route",
+			      sun50i_h616_codec_lineout_src_enum),
+};
+
+static const struct snd_soc_dapm_widget sun50i_h616_codec_codec_widgets[] = {
+	/* Digital parts of the DACs */
+	SND_SOC_DAPM_SUPPLY("DAC Enable", SUN4I_CODEC_DAC_DPC,
+			    SUN4I_CODEC_DAC_DPC_EN_DA, 0,
+			    NULL, 0),
+
+	/* Analog parts of the DACs */
+	SND_SOC_DAPM_DAC("Left DAC", "Codec Playback",
+			 SUN50I_H616_DAC_AC_DAC_REG,
+			 SUN50I_H616_DAC_LEN, 0),
+	SND_SOC_DAPM_DAC("Right DAC", "Codec Playback",
+			 SUN50I_H616_DAC_AC_DAC_REG,
+			 SUN50I_H616_DAC_REN, 0),
+
+	/* Mixers */
+	SOC_MIXER_ARRAY("Left Mixer", SUN50I_H616_DAC_AC_MIXER_REG,
+			SUN50I_H616_LMIXEN, 0,
+			sun50i_h616_codec_mixer_controls),
+	SOC_MIXER_ARRAY("Right Mixer", SUN50I_H616_DAC_AC_MIXER_REG,
+			SUN50I_H616_RMIXEN, 0,
+			sun50i_h616_codec_mixer_controls),
+
+	/* Line Out path */
+	SND_SOC_DAPM_MUX("Line Out Source Playback Route",
+			 SND_SOC_NOPM, 0, 0, sun50i_h616_codec_lineout_src),
+	SND_SOC_DAPM_OUT_DRV("Line Out Ramp Controller",
+			     SUN50I_H616_DAC_AC_RAMP_REG,
+			     SUN50I_H616_RDEN, 0, NULL, 0),
+	SND_SOC_DAPM_OUTPUT("LINEOUT"),
+};
+
+static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
+	.controls   = sun50i_h616_codec_codec_controls,
+	.num_controls   = ARRAY_SIZE(sun50i_h616_codec_codec_controls),
+	.dapm_widgets   = sun50i_h616_codec_codec_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sun50i_h616_codec_codec_widgets),
+	.idle_bias_on   = 1,
+	.use_pmdown_time  = 1,
+	.endianness   = 1,
+};
+
+static const struct snd_kcontrol_new sun50i_h616_card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("LINEOUT"),
+};
+
+static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widgets[] = {
+	SND_SOC_DAPM_LINE("Line Out", NULL),
+	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
+};
+
+/* Connect digital side enables to analog side widgets */
+static const struct snd_soc_dapm_route sun50i_h616_codec_card_routes[] = {
+	/* DAC Routes */
+	{ "Left DAC", NULL, "DAC Enable" },
+	{ "Right DAC", NULL, "DAC Enable" },
+
+	/* Left Mixer Routes */
+	{ "Left Mixer", "DAC Playback Switch", "Left DAC" },
+	{ "Left Mixer", "DAC Reversed Playback Switch", "Right DAC" },
+
+	/* Right Mixer Routes */
+	{ "Right Mixer", "DAC Playback Switch", "Right DAC" },
+	{ "Right Mixer", "DAC Reversed Playback Switch", "Left DAC" },
+
+	/* Line Out Routes */
+	{ "Line Out Source Playback Route", "Stereo", "Left Mixer" },
+	{ "Line Out Source Playback Route", "Stereo", "Right Mixer" },
+	{ "Line Out Source Playback Route", "Mono Differential", "Left Mixer" },
+	{ "Line Out Source Playback Route", "Mono Differential", "Right Mixer" },
+	{ "Line Out Ramp Controller", NULL, "Line Out Source Playback Route" },
+	{ "LINEOUT", NULL, "Line Out Ramp Controller" },
+};
+
+static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
+{
+	struct snd_soc_card *card;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return ERR_PTR(-ENOMEM);
+
+	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
+	if (!card->dai_link)
+		return ERR_PTR(-ENOMEM);
+
+	card->dai_link->playback_only = true;
+	card->dai_link->capture_only = false;
+
+	card->dev		= dev;
+	card->owner		= THIS_MODULE;
+	card->name		= "sun4i-codec";
+	card->controls		= sun50i_h616_card_controls;
+	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
+	card->dapm_widgets	= sun50i_h616_codec_card_dapm_widgets;
+	card->num_dapm_widgets	= ARRAY_SIZE(sun50i_h616_codec_card_dapm_widgets);
+	card->dapm_routes	= sun50i_h616_codec_card_routes;
+	card->num_dapm_routes	= ARRAY_SIZE(sun50i_h616_codec_card_routes);
+	card->fully_routed	= true;
+
+	ret = snd_soc_of_parse_audio_routing(card, "allwinner,audio-routing");
+	if (ret)
+		dev_warn(dev, "failed to parse audio-routing: %d\n", ret);
+
+	return card;
+};
+
 static const struct regmap_config sun4i_codec_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -1562,6 +1742,14 @@ static const struct regmap_config sun8i_v3s_codec_regmap_config = {
 	.max_register	= SUN8I_H3_CODEC_ADC_DBG,
 };
 
+static const struct regmap_config sun50i_h616_codec_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= SUN50I_H616_DAC_AC_RAMP_REG,
+	.cache_type	= REGCACHE_NONE,
+};
+
 struct sun4i_codec_quirks {
 	const struct regmap_config *regmap_config;
 	const struct snd_soc_component_driver *codec;
@@ -1647,6 +1835,15 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
 	.has_reset	= true,
 };
 
+static const struct sun4i_codec_quirks sun50i_h616_codec_quirks = {
+	.regmap_config	= &sun50i_h616_codec_regmap_config,
+	.codec		= &sun50i_h616_codec_codec,
+	.create_card	= sun50i_h616_codec_create_card,
+	.reg_dac_fifoc	= REG_FIELD(SUN50I_H616_CODEC_DAC_FIFOC, 0, 31),
+	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
+	.has_reset	= true,
+};
+
 static const struct of_device_id sun4i_codec_of_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-codec",
@@ -1672,6 +1869,10 @@ static const struct of_device_id sun4i_codec_of_match[] = {
 		.compatible = "allwinner,sun8i-v3s-codec",
 		.data = &sun8i_v3s_codec_quirks,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-codec",
+		.data = &sun50i_h616_codec_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun4i_codec_of_match);
@@ -1860,4 +2061,5 @@ MODULE_AUTHOR("Emilio López <emilio@elopez.com.ar>");
 MODULE_AUTHOR("Jon Smirl <jonsmirl@gmail.com>");
 MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
 MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
+MODULE_AUTHOR("Ryan Walklin <ryan@testtoast.com");
 MODULE_LICENSE("GPL");
-- 
2.47.0

