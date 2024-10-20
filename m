Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE86839E4;
	Sun, 20 Oct 2024 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729425648; cv=none; b=dDdr3shdhzudCodZEwqX9/Ad69vuqxWEFDQRzAgnSyXU9/PcVP1hGfXYIPQQvoYMAvC0B7A6knbfgBRof0dI8H+IdA8m4u9PGmId0LkzkOTRSbsZUCErZWsG1+C8DRm4VnVvywGRU/kHwY4/ygFcNVYQbo6H78J0zvQXdRN+Fz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729425648; c=relaxed/simple;
	bh=fxH69eYbXQTteV6jC9orLCBgJAs5T33rZtPO4rzkQ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgKNHMMeueOqLJsPa9FmO6vNA3S8M58YmNDauPmkA1orXEjVO2frnrgagcqb93iNtUwQ2ftf5JvURBx78enPixFkAOaKiHH9iDdfAb69+G0ey0RzpFvQFxiC3jLp3egbmh58ydlsJ/BxQfAl4Fdkv7Ck5BhwDvqqcjP/atp75bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 391E6DA7;
	Sun, 20 Oct 2024 05:01:15 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FB723F58B;
	Sun, 20 Oct 2024 05:00:43 -0700 (PDT)
Date: Sun, 20 Oct 2024 12:59:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/7] ASoC: sun4i-codec: support allwinner H616 codec
Message-ID: <20241020125948.44c27e9e@minigeek.lan>
In-Reply-To: <20241020083124.174724-6-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
	<20241020083124.174724-6-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 20 Oct 2024 21:30:55 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> The H616 SoC codec is playback-only with a single line-out route, and
> has some register differences from prior codecs.
>=20
> Add the required compatible string, registers, quirks, DAPM widgets,
> codec controls and routes, based on existing devices and the H616
> datasheet.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v1..2:
> - Shorten codec name to fit within 16-char limit.
> ---
>  sound/soc/sunxi/sun4i-codec.c | 202 ++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>=20
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 312d2655c3f4e..767693819880f 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -226,6 +226,43 @@
>  #define SUN8I_H3_CODEC_DAC_DBG			(0x48)
>  #define SUN8I_H3_CODEC_ADC_DBG			(0x4c)
> =20
> +/* H616 specific registers */
> +#define SUN50I_H616_CODEC_DAC_FIFOC		(0x10)
> +
> +#define SUN50I_DAC_FIFO_STA			(0x14)
> +#define SUN50I_DAC_TXE_INT			(3)
> +#define SUN50I_DAC_TXU_INT			(2)
> +#define SUN50I_DAC_TXO_INT			(1)
> +
> +#define SUN50I_DAC_CNT				(0x24)
> +#define SUN50I_DAC_DG_REG			(0x28)
> +#define SUN50I_DAC_DAP_CTL			(0xf0)
> +
> +#define SUN50I_H616_DAC_AC_DAC_REG		(0x310)
> +#define SUN50I_H616_DAC_LEN			(15)
> +#define SUN50I_H616_DAC_REN			(14)
> +#define SUN50I_H616_LINEOUTL_EN			(13)
> +#define SUN50I_H616_LMUTE			(12)
> +#define SUN50I_H616_LINEOUTR_EN			(11)
> +#define SUN50I_H616_RMUTE			(10)
> +#define SUN50I_H616_RSWITCH			(9)
> +#define SUN50I_H616_RAMPEN			(8)
> +#define SUN50I_H616_LINEOUTL_SEL		(6)
> +#define SUN50I_H616_LINEOUTR_SEL		(5)
> +#define SUN50I_H616_LINEOUT_VOL			(0)
> +
> +#define SUN50I_H616_DAC_AC_MIXER_REG		(0x314)
> +#define SUN50I_H616_LMIX_LDAC			(21)
> +#define SUN50I_H616_LMIX_RDAC			(20)
> +#define SUN50I_H616_RMIX_RDAC			(17)
> +#define SUN50I_H616_RMIX_LDAC			(16)
> +#define SUN50I_H616_LMIXEN			(11)
> +#define SUN50I_H616_RMIXEN			(10)
> +
> +#define SUN50I_H616_DAC_AC_RAMP_REG		(0x31c)
> +#define SUN50I_H616_RAMP_STEP			(4)
> +#define SUN50I_H616_RDEN			(0)
> +
>  /* TODO H3 DAP (Digital Audio Processing) bits */
> =20
>  struct sun4i_codec {
> @@ -1520,6 +1557,149 @@ static struct snd_soc_card *sun8i_v3s_codec_creat=
e_card(struct device *dev)
>  	return card;
>  };
> =20
> +static const struct snd_kcontrol_new sun50i_h616_codec_codec_controls[] =
=3D {
> +	SOC_SINGLE_TLV("DAC Playback Volume", SUN4I_CODEC_DAC_DPC,
> +		       SUN4I_CODEC_DAC_DPC_DVOL, 0x3f, 1,
> +		       sun6i_codec_dvol_scale),
> +	SOC_SINGLE_TLV("Line Out Playback Volume",
> +		       SUN50I_H616_DAC_AC_DAC_REG,
> +		       SUN50I_H616_LINEOUT_VOL, 0x1f, 0,
> +		       sun6i_codec_lineout_vol_scale),
> +	SOC_DOUBLE("Line Out Playback Switch",
> +		   SUN50I_H616_DAC_AC_DAC_REG,
> +		   SUN50I_H616_LINEOUTL_EN,
> +		   SUN50I_H616_LINEOUTR_EN, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new sun50i_h616_codec_mixer_controls[] =
=3D {
> +	SOC_DAPM_DOUBLE("DAC Playback Switch",
> +			SUN50I_H616_DAC_AC_MIXER_REG,
> +			SUN50I_H616_LMIX_LDAC,
> +			SUN50I_H616_RMIX_RDAC, 1, 0),
> +	SOC_DAPM_DOUBLE("DAC Reversed Playback Switch",
> +			SUN50I_H616_DAC_AC_MIXER_REG,
> +			SUN50I_H616_LMIX_RDAC,
> +			SUN50I_H616_RMIX_LDAC, 1, 0),
> +};
> +
> +static SOC_ENUM_DOUBLE_DECL(sun50i_h616_codec_lineout_src_enum,
> +			    SUN50I_H616_DAC_AC_DAC_REG,
> +			    SUN50I_H616_LINEOUTL_SEL,
> +			    SUN50I_H616_LINEOUTR_SEL,
> +			    sun6i_codec_lineout_src_enum_text);
> +
> +static const struct snd_kcontrol_new sun50i_h616_codec_lineout_src[] =3D=
 {
> +		SOC_DAPM_ENUM("Line Out Source Playback Route",
> +			      sun50i_h616_codec_lineout_src_enum),
> +};
> +
> +static const struct snd_soc_dapm_widget sun50i_h616_codec_codec_widgets[=
] =3D {
> +	/* Digital parts of the DACs */
> +	SND_SOC_DAPM_SUPPLY("DAC Enable", SUN4I_CODEC_DAC_DPC,
> +			    SUN4I_CODEC_DAC_DPC_EN_DA, 0,
> +			    NULL, 0),
> +
> +	/* Analog parts of the DACs */
> +	SND_SOC_DAPM_DAC("Left DAC", "Codec Playback",
> +			 SUN50I_H616_DAC_AC_DAC_REG,
> +			 SUN50I_H616_DAC_LEN, 0),
> +	SND_SOC_DAPM_DAC("Right DAC", "Codec Playback",
> +			 SUN50I_H616_DAC_AC_DAC_REG,
> +			 SUN50I_H616_DAC_REN, 0),
> +
> +	/* Mixers */
> +	SOC_MIXER_ARRAY("Left Mixer", SUN50I_H616_DAC_AC_MIXER_REG,
> +			SUN50I_H616_LMIXEN, 0,
> +			sun50i_h616_codec_mixer_controls),
> +	SOC_MIXER_ARRAY("Right Mixer", SUN50I_H616_DAC_AC_MIXER_REG,
> +			SUN50I_H616_RMIXEN, 0,
> +			sun50i_h616_codec_mixer_controls),
> +
> +	/* Line Out path */
> +	SND_SOC_DAPM_MUX("Line Out Source Playback Route",
> +			 SND_SOC_NOPM, 0, 0, sun50i_h616_codec_lineout_src),
> +	SND_SOC_DAPM_OUT_DRV("Line Out Ramp Controller",
> +			     SUN50I_H616_DAC_AC_RAMP_REG,
> +			     SUN50I_H616_RDEN, 0, NULL, 0),
> +	SND_SOC_DAPM_OUTPUT("LINEOUT"),
> +};
> +
> +static const struct snd_soc_component_driver sun50i_h616_codec_codec =3D=
 {
> +	.controls   =3D sun50i_h616_codec_codec_controls,
> +	.num_controls   =3D ARRAY_SIZE(sun50i_h616_codec_codec_controls),
> +	.dapm_widgets   =3D sun50i_h616_codec_codec_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(sun50i_h616_codec_codec_widgets),
> +	.idle_bias_on   =3D 1,
> +	.use_pmdown_time  =3D 1,
> +	.endianness   =3D 1,
> +};
> +
> +static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D {
> +	SOC_DAPM_PIN_SWITCH("LINEOUT"),
> +};
> +
> +static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widg=
ets[] =3D {
> +	SND_SOC_DAPM_LINE("Line Out", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
> +};
> +
> +/* Connect digital side enables to analog side widgets */
> +static const struct snd_soc_dapm_route sun50i_h616_codec_card_routes[] =
=3D {
> +	/* DAC Routes */
> +	{ "Left DAC", NULL, "DAC Enable" },
> +	{ "Right DAC", NULL, "DAC Enable" },
> +
> +	/* Left Mixer Routes */
> +	{ "Left Mixer", "DAC Playback Switch", "Left DAC" },
> +	{ "Left Mixer", "DAC Reversed Playback Switch", "Right DAC" },
> +
> +	/* Right Mixer Routes */
> +	{ "Right Mixer", "DAC Playback Switch", "Right DAC" },
> +	{ "Right Mixer", "DAC Reversed Playback Switch", "Left DAC" },
> +
> +	/* Line Out Routes */
> +	{ "Line Out Source Playback Route", "Stereo", "Left Mixer" },
> +	{ "Line Out Source Playback Route", "Stereo", "Right Mixer" },
> +	{ "Line Out Source Playback Route", "Mono Differential", "Left Mixer" },
> +	{ "Line Out Source Playback Route", "Mono Differential", "Right Mixer" =
},
> +	{ "Line Out Ramp Controller", NULL, "Line Out Source Playback Route" },
> +	{ "LINEOUT", NULL, "Line Out Ramp Controller" },
> +};
> +
> +static struct snd_soc_card *sun50i_h616_codec_create_card(struct device =
*dev)
> +{
> +	struct snd_soc_card *card;
> +	int ret;
> +
> +	card =3D devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
> +	if (!card)
> +		return ERR_PTR(-ENOMEM);
> +
> +	card->dai_link =3D sun4i_codec_create_link(dev, &card->num_links);
> +	if (!card->dai_link)
> +		return ERR_PTR(-ENOMEM);
> +
> +	card->dai_link->playback_only =3D true;
> +	card->dai_link->capture_only =3D false;
> +
> +	card->dev		=3D dev;
> +	card->owner		=3D THIS_MODULE;
> +	card->name		=3D "sun4i-codec";

card->name can be a long string, and it should be a bit more
descriptive, so please keep the longer "H616 audio codec" string you
had before.
To avoid this particular error, please *additionally* set
card->driver_name to this short string here.

Cheers,
Andre

> +	card->controls		=3D sun50i_h616_card_controls;
> +	card->num_controls	=3D ARRAY_SIZE(sun50i_h616_card_controls);
> +	card->dapm_widgets	=3D sun50i_h616_codec_card_dapm_widgets;
> +	card->num_dapm_widgets	=3D ARRAY_SIZE(sun50i_h616_codec_card_dapm_widge=
ts);
> +	card->dapm_routes	=3D sun50i_h616_codec_card_routes;
> +	card->num_dapm_routes	=3D ARRAY_SIZE(sun50i_h616_codec_card_routes);
> +	card->fully_routed	=3D true;
> +
> +	ret =3D snd_soc_of_parse_audio_routing(card, "allwinner,audio-routing");
> +	if (ret)
> +		dev_warn(dev, "failed to parse audio-routing: %d\n", ret);
> +
> +	return card;
> +};
> +
>  static const struct regmap_config sun4i_codec_regmap_config =3D {
>  	.reg_bits	=3D 32,
>  	.reg_stride	=3D 4,
> @@ -1562,6 +1742,14 @@ static const struct regmap_config sun8i_v3s_codec_=
regmap_config =3D {
>  	.max_register	=3D SUN8I_H3_CODEC_ADC_DBG,
>  };
> =20
> +static const struct regmap_config sun50i_h616_codec_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.val_bits	=3D 32,
> +	.max_register	=3D SUN50I_H616_DAC_AC_RAMP_REG,
> +	.cache_type	=3D REGCACHE_NONE,
> +};
> +
>  struct sun4i_codec_quirks {
>  	const struct regmap_config *regmap_config;
>  	const struct snd_soc_component_driver *codec;
> @@ -1647,6 +1835,15 @@ static const struct sun4i_codec_quirks sun8i_v3s_c=
odec_quirks =3D {
>  	.has_reset	=3D true,
>  };
> =20
> +static const struct sun4i_codec_quirks sun50i_h616_codec_quirks =3D {
> +	.regmap_config	=3D &sun50i_h616_codec_regmap_config,
> +	.codec		=3D &sun50i_h616_codec_codec,
> +	.create_card	=3D sun50i_h616_codec_create_card,
> +	.reg_dac_fifoc	=3D REG_FIELD(SUN50I_H616_CODEC_DAC_FIFOC, 0, 31),
> +	.reg_dac_txdata	=3D SUN8I_H3_CODEC_DAC_TXDATA,
> +	.has_reset	=3D true,
> +};
> +
>  static const struct of_device_id sun4i_codec_of_match[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-codec",
> @@ -1672,6 +1869,10 @@ static const struct of_device_id sun4i_codec_of_ma=
tch[] =3D {
>  		.compatible =3D "allwinner,sun8i-v3s-codec",
>  		.data =3D &sun8i_v3s_codec_quirks,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun50i-h616-codec",
> +		.data =3D &sun50i_h616_codec_quirks,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_codec_of_match);
> @@ -1860,4 +2061,5 @@ MODULE_AUTHOR("Emilio L=C3=B3pez <emilio@elopez.com=
.ar>");
>  MODULE_AUTHOR("Jon Smirl <jonsmirl@gmail.com>");
>  MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
>  MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
> +MODULE_AUTHOR("Ryan Walklin <ryan@testtoast.com");
>  MODULE_LICENSE("GPL");

