Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F58156880;
	Wed, 23 Oct 2024 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670398; cv=none; b=JOl6jSIXpqwXfnDaLF5Yyi/wmBRyhteD7eXTxsldcTFHnBxLz9NGb8krTQtDLWnHW9JibJkrXRc/bbBah9yp/pfXCGHUfOparHejKONB0lWsrx11FjQbGCgsfzBgyUGdOuLkcoJh6tSOkpYHFaTfxP8jz48L5P1MER5xWyWW+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670398; c=relaxed/simple;
	bh=yBK1rn8SnhrGLRHe7xEia4FZ8o4/Gm/jXFR+zW/1Mpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNnh3e+OSuMxkldvDGsPw/1Uvk+H1iJcI6UjfEG6AWXLxbCnMnEjEWAgW84BP3WTCLQPgM5jGkIMW9ZxNf1LZ4Ry1VRMT2TsKV3IDUy8MUID5BuBOFkph4FBXsXMGfHq6BKBwtz96xooYkUiydoyoT7EWD5gDLfOSZU78D/d/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Cla1NWMy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aXNPcV7Z; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Cla1NWMy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aXNPcV7Z"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 94E7E1380499;
	Wed, 23 Oct 2024 03:59:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 23 Oct 2024 03:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1729670395; x=1729756795; bh=WgbGYoPlsV0ETAZs3pSvgQG3B7P8eabL
	Oq4NxElS3g8=; b=Cla1NWMyxrCw3ETXbxG0FQkoJ9caxzwYmlpvh0oT+b/Kx78x
	BeU3kjFsNFTu09Z+r0k1DKYd9JElV3Rb+tBP6a1F/24zEPr+YUxJddTjmIOcubm7
	DBnk8l6449JDm3wWaC/cbXmkXUOrYfrq1Mhk2asnrOfJ9kZhT+q7FxPK7J+RQMIL
	h43WW+LWkj7v1F9owYTFBkbuKyQlqyWuoQanFVbm19OWbKwNu3nQZ8o5Q3izKJ6X
	w6B5Bo57cjEmvHabFpa0UJ2H1RJOeWAg33lrG4XiLjbIvC9ho1P72lKIDEJM/tzr
	O+wB4ye5RnF16YfCCjdzPuM78eE9MKjZsYq3lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729670395; x=
	1729756795; bh=WgbGYoPlsV0ETAZs3pSvgQG3B7P8eabLOq4NxElS3g8=; b=a
	XNPcV7ZOT+1wBRRkwT5aT0ropXTPT44Qt0hsniawsKXq0XjWNWY4D16aXKzebDEm
	bv+w+s5OQFyzkXWH5lVj0cI5f9XY+785D97Jnl1lAUYGQdoXrFubRhGZB0GJcXzQ
	3+dtJF4oBwTAu0LgLt+zLOTvkPSteDNCD0EN2Y4Xm00RcN/6zfIYxVUy7T0eyrGU
	yt8YQf0roIV7q3dN4WRESo9fBNUbyFARkBvG1FoEnogVy/Se+4mOfbPGjrKlVfJi
	MXpX9Me1O2XR7z0LKl6TWHPaGl4aq6BjQ5euK48OJaNG42OogojrUjDA7jLXdQvf
	HtAalE/jso52eB0co4JtQ==
X-ME-Sender: <xms:-6wYZ-DVyZuJ5bMH-J7-88UVoHGBojRypjfY16PZ-mAaUbgVlgviVA>
    <xme:-6wYZ4hsjV1qKMSl1enVVRCV-_T1xEqmIewVgHs1svZ3bGxADfmMqSqZw0sQAG9sv
    As9oqXlcggpHMGviA>
X-ME-Received: <xmr:-6wYZxm-ednhXzKmdLryzVcXS9deugu_rq_ghyfpCaIbcd_EKbjfIT8GexyxWa7N9UY-V41fT5W6YCpiMae1SB6xenRteS9KVt5vd7r_fQnh3U5z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieelvdefkeefudehvddtieetfeelkeet
    veduieetgfffheevgffgudevhfevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufi
    hoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepth
    hifigrihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdp
    rhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtph
    htthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtohepmhgrtghr
    ohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphh
    hilhhiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:-6wYZ8zSjyvsuEQLUcN4kP782lCNpLznY2ncSNP-_0YcxKEmxFvbcQ>
    <xmx:-6wYZzTN8zvCICz11vGT4Q4sAkEzOpNzOkRY6VHnj97kTBNbN7l9QA>
    <xmx:-6wYZ3azAVYVxWMO5JHD83l00cmV9jnqP4sKEbIqO4DKL1QMrPJL4Q>
    <xmx:-6wYZ8T-Wl3DKsrT69r4brwhDGDtXDrUbeWaI9rUeSQF9rmHsS7Pgw>
    <xmx:-6wYZ0gJtEtsAjx-pBNLHJGa64lB3oIDxiT9IygipuQNiAkUrQ3xXrtv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:50 -0400 (EDT)
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
Subject: [PATCH v3 5/7] ASoC: sun4i-codec: support allwinner H616 codec
Date: Wed, 23 Oct 2024 20:57:01 +1300
Message-ID: <20241023075917.186835-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
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

Changelog v2..3:
- Restore descriptive codec name and add driver_name to prevent fallback.
---
 sound/soc/sunxi/sun4i-codec.c | 203 ++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 312d2655c3f4e..933a0913237c8 100644
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
@@ -1520,6 +1557,150 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
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
+	card->name		= "H616 Audio Codec";
+	card->driver_name	= "sun4i-codec";
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
@@ -1562,6 +1743,14 @@ static const struct regmap_config sun8i_v3s_codec_regmap_config = {
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
@@ -1647,6 +1836,15 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
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
@@ -1672,6 +1870,10 @@ static const struct of_device_id sun4i_codec_of_match[] = {
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
@@ -1860,4 +2062,5 @@ MODULE_AUTHOR("Emilio López <emilio@elopez.com.ar>");
 MODULE_AUTHOR("Jon Smirl <jonsmirl@gmail.com>");
 MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
 MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
+MODULE_AUTHOR("Ryan Walklin <ryan@testtoast.com");
 MODULE_LICENSE("GPL");
-- 
2.47.0

