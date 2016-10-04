Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 14:40:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@free-electrons.com>
Cc: vinod.koul@intel.com, maxime.ripard@free-electrons.com, wens@csie.org,
 mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
 mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 alexandre.belloni@free-electrons.com
Subject: Re: [PATCH 06/14] ASoC: Add sun8i digital audio codec
Message-ID: <20161004144008.0d07d18c@free-electrons.com>
In-Reply-To: <85cbd9926e52d0aa03f6bbfd8794373d8db491e0.1475571575.git.mylene.josserand@free-electrons.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	<85cbd9926e52d0aa03f6bbfd8794373d8db491e0.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Tue,  4 Oct 2016 11:46:19 +0200, Myl=C3=A8ne Josserand wrote:
> Add the digital sun8i audio codec which handles the base register
> (without DAI).

I'm not sure what you mean by "which handles the base register".

> diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
> index 7aee95a..9e287b0 100644
> --- a/sound/soc/sunxi/Kconfig
> +++ b/sound/soc/sunxi/Kconfig
> @@ -27,6 +27,15 @@ config SND_SUN4I_SPDIF
>  	  Say Y or M to add support for the S/PDIF audio block in the Allwinner
>  	  A10 and affiliated SoCs.
> =20
> +config SND_SUN8I_CODEC
> +	tristate "Allwinner SUN8I audio codec"
> +	select REGMAP_MMIO
> +        help

Indentation issue here, it should be intended with one tab, not spaces.

You probably also want a "depends on OF" here.

> +/* CODEC_OFFSET represents the offset of the codec registers
> + * and not all the DAI registers
> + */

This is not the proper comment style I believe for audio code, it
should be:

/*
 * ...
 */

> +#define CODEC_OFFSET				0x200

Do you really need this CODEC_OFFSET macro? Why not simply use directly
the right offsets? I.e instead of:

  #define SUN8I_SYSCLK_CTL			(0x20c - CODEC_OFFSET)

use:

  #define SUN8I_SYSCLK_CTL			0xc

> +#define CODEC_BASSADDRESS			0x01c22c00

This define is not used anywhere.

> +#define SUN8I_SYSCLK_CTL			(0x20c - CODEC_OFFSET)
> +#define SUN8I_SYSCLK_CTL_AIF1CLK_ENA		(11)
> +#define SUN8I_SYSCLK_CTL_SYSCLK_ENA		(3)
> +#define SUN8I_SYSCLK_CTL_SYSCLK_SRC		(0)

Parenthesis around single values are not really useful.

> +#define SUN8I_MOD_CLK_ENA			(0x210 - CODEC_OFFSET)
> +#define SUN8I_MOD_CLK_ENA_AIF1			(15)
> +#define SUN8I_MOD_CLK_ENA_DAC			(2)
> +#define SUN8I_MOD_RST_CTL			(0x214 - CODEC_OFFSET)
> +#define SUN8I_MOD_RST_CTL_AIF1			(15)
> +#define SUN8I_MOD_RST_CTL_DAC			(2)
> +#define SUN8I_SYS_SR_CTRL			(0x218 - CODEC_OFFSET)
> +#define SUN8I_SYS_SR_CTRL_AIF1_FS		(12)
> +#define SUN8I_SYS_SR_CTRL_AIF2_FS		(8)
> +#define SUN8I_AIF1CLK_CTRL			(0x240 - CODEC_OFFSET)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_MSTR_MOD	(15)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV	(14)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV	(13)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV	(9)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV	(6)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ	(4)
> +#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT	(2)
> +#define SUN8I_AIF1_DACDAT_CTRL			(0x248 - CODEC_OFFSET)
> +#define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA	(15)
> +#define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA	(14)
> +#define SUN8I_DAC_DIG_CTRL			(0x320 - CODEC_OFFSET)
> +#define SUN8I_DAC_DIG_CTRL_ENDA		(15)
> +#define SUN8I_DAC_MXR_SRC			(0x330 - CODEC_OFFSET)
> +#define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA0L (15)
> +#define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF1DA1L (14)
> +#define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_AIF2DACL (13)
> +#define SUN8I_DAC_MXR_SRC_DACL_MXR_SRC_ADCL	(12)
> +#define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA0R (11)
> +#define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF1DA1R (10)
> +#define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_AIF2DACR (9)
> +#define SUN8I_DAC_MXR_SRC_DACR_MXR_SRC_ADCR	(8)

Indentation of the value is not very clean for those last defines.

> +static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct sun8i_codec *scodec =3D snd_soc_codec_get_drvdata(dai->codec);
> +	unsigned long value;

I'm not sure "unsigned long" is a very good choice here, it's going to
be a 64 bits integer on 64 bits platform. I'd suggest to use "u32",
which also seems to be what's used in _set_fmt() function of the
sun4i-i2s.c driver.


> +static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	int rs_value  =3D 0;

Two spaces before the =3D sign, not needed. Is the initialization to 0
really needed? Also, this should be a u32.

> +	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> +			   0x3 << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ,

Maybe a #define value to replace the hardcoded 0x3 ?

> +			   rs_value << SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ);
> +
> +	/* calculate bclk_lrck_div Ratio */
> +	bclk_lrck_div =3D sample_resolution * 2;
> +	switch (bclk_lrck_div) {
> +	case 16:
> +		bclk_lrck_div =3D 0;
> +		break;
> +	case 32:
> +		bclk_lrck_div =3D 1;
> +		break;
> +	case 64:
> +		bclk_lrck_div =3D 2;
> +		break;
> +	case 128:
> +		bclk_lrck_div =3D 3;
> +		break;
> +	case 256:
> +		bclk_lrck_div =3D 4;
> +		break;

This could quite easily be replaced by a formula, if you don't care
about error checking:

	bclk_lrck_div =3D log2(bclk_lrck_div) - 4;

Of course, if you care about error checking, this switch is nicer.

> +	default:

So there's no error checking if the value is not supported?

> +		break;
> +	}
> +	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
> +			   0x7 << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV,

#define to replace the hard-coded 0x7 ?

> +			   bclk_lrck_div << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
> +
> +	sample_rate =3D sun8i_codec_get_hw_rate(params);
> +	if (sample_rate < 0)
> +		return sample_rate;
> +
> +	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
> +			   0xf << SUN8I_SYS_SR_CTRL_AIF1_FS,

Ditto 0xf

> +			   sample_rate << SUN8I_SYS_SR_CTRL_AIF1_FS);
> +	regmap_update_bits(scodec->regmap, SUN8I_SYS_SR_CTRL,
> +			   0xf << SUN8I_SYS_SR_CTRL_AIF2_FS,

Ditto 0xf.


> +static struct snd_soc_dai_driver sun8i_codec_dai =3D {
> +	.name =3D "sun8i",
> +	/* playback capabilities */
> +	.playback =3D {
> +		.stream_name =3D "Playback",
> +		.channels_min =3D 1,
> +		.channels_max =3D 2,
> +		.rates =3D SNDRV_PCM_RATE_8000_192000 |
> +			SNDRV_PCM_RATE_KNOT,
> +		.formats =3D SNDRV_PCM_FMTBIT_S8 |
> +			SNDRV_PCM_FMTBIT_S16_LE |
> +			SNDRV_PCM_FMTBIT_S18_3LE |
> +			SNDRV_PCM_FMTBIT_S20_3LE |
> +			SNDRV_PCM_FMTBIT_S24_LE |
> +			SNDRV_PCM_FMTBIT_S32_LE,
> +	},
> +	/* pcm operations */
> +	.ops =3D &sun8i_codec_dai_ops,
> +};
> +EXPORT_SYMBOL(sun8i_codec_dai);

This EXPORT_SYMBOL looks wrong. First because it doesn't seem to be
used outside of this module. And second because using EXPORT_SYMBOL on
a function defined as static doesn't make much sense, as the "static"
qualifier limits the visibility of the symbol to the current
compilation unit.

> +
> +static int sun8i_soc_probe(struct snd_soc_codec *codec)
> +{
> +	return 0;
> +}
> +
> +/* power down chip */
> +static int sun8i_soc_remove(struct snd_soc_codec *codec)
> +{
> +	return 0;
> +}

I believe you can remove those stub functions.

> +
> +static struct snd_soc_codec_driver sun8i_soc_codec =3D {
> +	.probe			=3D sun8i_soc_probe,
> +	.remove		=3D sun8i_soc_remove,

And remove these.

> +	.component_driver =3D {
> +		.dapm_widgets		=3D sun8i_codec_dapm_widgets,
> +		.num_dapm_widgets	=3D ARRAY_SIZE(sun8i_codec_dapm_widgets),
> +		.dapm_routes		=3D sun8i_codec_dapm_routes,
> +		.num_dapm_routes	=3D ARRAY_SIZE(sun8i_codec_dapm_routes),

I'm probably missing something, but in the sun4i-codec.c driver, those
fields are initialized directly in the snd_soc_codec_driver structure,
not in the .component_driver sub-structure.


> +static int sun8i_codec_probe(struct platform_device *pdev)
> +{
> +	struct resource *res_base;
> +	struct sun8i_codec *scodec;
> +	void __iomem *base;
> +
> +	scodec =3D devm_kzalloc(&pdev->dev, sizeof(*scodec), GFP_KERNEL);
> +	if (!scodec)
> +		return -ENOMEM;
> +
> +	scodec->dev =3D &pdev->dev;
> +
> +	/* Get the clocks from the DT */
> +	scodec->clk_module =3D devm_clk_get(&pdev->dev, "codec");
> +	if (IS_ERR(scodec->clk_module)) {
> +		dev_err(&pdev->dev, "Failed to get the module clock\n");
> +		return PTR_ERR(scodec->clk_module);
> +	}
> +	if (clk_prepare_enable(scodec->clk_module))
> +		pr_err("err:open failed;\n");

Grr, pr_err, not good. Plus you want to return with an error from the
probe() function.

> +
> +	scodec->clk_apb =3D devm_clk_get(&pdev->dev, "apb");
> +	if (IS_ERR(scodec->clk_apb)) {
> +		dev_err(&pdev->dev, "Failed to get the apb clock\n");
> +		return PTR_ERR(scodec->clk_apb);
> +	}
> +	if (clk_prepare_enable(scodec->clk_apb))
> +		pr_err("err:open failed;\n");

Ditto. + unprepare/disable the previous clock.

> +
> +	/* Get base resources, registers and regmap */
> +	res_base =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "audio"=
);
> +	base =3D devm_ioremap_resource(&pdev->dev, res_base);
> +	if (IS_ERR(base)) {
> +		dev_err(&pdev->dev, "Failed to map the registers\n");
> +		return PTR_ERR(base);
> +	}
> +
> +	scodec->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					       &sun8i_codec_regmap_config);
> +	if (IS_ERR(scodec->regmap)) {
> +		dev_err(&pdev->dev, "Failed to create our regmap\n");
> +		return PTR_ERR(scodec->regmap);
> +	}
> +
> +	/* Set the codec data as driver data */
> +	dev_set_drvdata(&pdev->dev, scodec);

Use:

	platform_set_drvdata(pdev, scodec)

> +
> +	snd_soc_register_codec(&pdev->dev, &sun8i_soc_codec, &sun8i_codec_dai,
> +			       1);

That's a matter of taste, but I find the "1" alone on its own line a
bit weird. Maybe move &sun8i_codec_dai on the second line as well. But
again, it's mainly a matter of taste, so Mark might disagree here.

> +
> +	return 0;
> +}
> +
> +static int sun8i_codec_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> +	struct sun8i_codec *scodec =3D snd_soc_card_get_drvdata(card);
> +
> +	snd_soc_unregister_codec(&pdev->dev);
> +	clk_disable_unprepare(scodec->clk_module);
> +	clk_disable_unprepare(scodec->clk_apb);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun8i_codec_of_match[] =3D {
> +	{ .compatible =3D "allwinner,sun8i-a33-codec" },
> +	{ .compatible =3D "allwinner,sun8i-a23-codec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sun8i_codec_of_match);
> +
> +static struct platform_driver sun8i_codec_driver =3D {
> +	.driver =3D {
> +		.name =3D "sun8i-codec",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D sun8i_codec_of_match,
> +	},
> +	.probe =3D sun8i_codec_probe,
> +	.remove =3D sun8i_codec_remove,
> +};
> +module_platform_driver(sun8i_codec_driver);
> +
> +MODULE_DESCRIPTION("Allwinner A33 (sun8i) codec driver");
> +MODULE_AUTHOR("huanxin<huanxin@reuuimllatech.com>");

Space between the name and the e-mail address.

> +MODULE_AUTHOR("Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.co=
m>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:sun8i-codec");

Thanks,

Thomas
--=20
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
