Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 14:25:07 +0200
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
Subject: Re: [PATCH 07/14] ASoC: Add sun8i audio card
Message-ID: <20161004142507.56a6fab6@free-electrons.com>
In-Reply-To: <33d641ff43f0c0349cdfa2cdbbfdcdde66205596.1475571575.git.mylene.josserand@free-electrons.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	<33d641ff43f0c0349cdfa2cdbbfdcdde66205596.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Tue,  4 Oct 2016 11:46:20 +0200, Myl=C3=A8ne Josserand wrote:

> +config SND_SUN8I
> +	tristate "Allwinner SUN6I/SUN8I audio card support"
> +	select SND_SUN8I_CODEC
> +	select SND_SUN4I_I2S
> +	select SND_SUN8I_CODEC_ANALOG
> +	select REGMAP_MMIO

I believe you need a:

	depends on OF

since you're unconditionally using some DT-related functionality in the
driver code.

> +#include <linux/firmware.h>

Do you really need this header file? I don't see anything
firmware-loading related in the driver.

> +static int sun8i_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_dai_link *link =3D &sun8i_dai_link;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	int ret;
> +
> +	/* register the soc card */
> +	sun8i_card.dev =3D &pdev->dev;
> +
> +	/* Retrieve the audio-codec from DT */
> +	link->codec_of_node =3D of_parse_phandle(np, "allwinner,audio-codec", 0=
);

Whenever you're using of_parse_phandle(), you must have a corresponding
of_node_put() to release the reference to the Device Tree node. So I
guess this should be done 1/ in the error path of ->probe(), and 2/
during the ->remove() hook.

Best regards,

Thomas
--=20
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
