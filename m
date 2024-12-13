Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433D79F5;
	Fri, 13 Dec 2024 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087492; cv=none; b=irFUMHI5sTOBo+pqdSA5XT7TbXTYHzzS/QKGQddKITpN6VPS8SyPzZlfK3cXy6VCG4AjhI2LE4Zr5WqXd/1iX20W9PUX6FUTN7oH3VocfAO8mfoyvzWlrA5z89OicYr+6Zt4vUGbkEcqqalj3OBtmfF7PL64lO8pu4qmv91pZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087492; c=relaxed/simple;
	bh=VqWJe5Eh99rvaeapsfqh4V97X3xsoMHaftKpsVrx+Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZnrheWSO9ct6RUzaDIdN2Z3TPXXIlnuN15rnu5r1De1chvCMk05eR1h0aP4oqZC04JJlgy6RFnitim45LZBkfkEqFgHnb9Q70Cj1SfhGpgHvZnxyFcSGRTkQxvfogwDP2Jf7tQ9Y1m4CZHjB6oNTX9eMEVMEVHJhGLRzIj20hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv+9IWN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv+9IWN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABC1C4CED0;
	Fri, 13 Dec 2024 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734087490;
	bh=VqWJe5Eh99rvaeapsfqh4V97X3xsoMHaftKpsVrx+Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uv+9IWN2DUvC8640Hw1SqeF4hg+INj3ksnKROHICsPlE9mSaPDNQYUjVPRpEeZdA0
	 lm9nf0ZctwYJHyUmo0Bg1L8TyPzsG0y8BkbLKGTO5AS/xy1syE5ZAFmPYf/tIDMdBx
	 mS0EOR4V2S3ODHf2MYdrtvBl3G/aQyokuVuPoA1v/mPV07anaAmjOYyAY5dF6eWREf
	 dfsCmvuph4cvXvutbLP+RrG8HDyfemrm0fmYSA2yUlolYUjUoXz53wdqTAQMoBXmZk
	 gLGOOZlgkSmUn3Dg0ZWxUyHzOSvmv4atf9tmFESJAOFheRDP98TM+34FHDF//TeTTK
	 BllS7Q9KRMXRw==
Date: Fri, 13 Dec 2024 11:58:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <gjkknwwxvzdkljonsfyl42vamr6kjngytf2mbbhbfxkmwmhnyt@rry6pqzxmnsi>
References: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
 <20241211003236.2523604-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211003236.2523604-3-paulha@opensource.cirrus.com>

On Tue, Dec 10, 2024 at 06:32:36PM -0600, Paul Handrigan wrote:
> Add support for the CS2600 Fractional-N Clock Synthesizer
> and Multiplier driver.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---
>  drivers/clk/Kconfig      |    9 +
>  drivers/clk/Makefile     |    1 +
>  drivers/clk/clk-cs2600.c | 1152 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/clk-cs2600.h |  176 ++++++
>  4 files changed, 1338 insertions(+)
>  create mode 100644 drivers/clk/clk-cs2600.c
>  create mode 100644 drivers/clk/clk-cs2600.h
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..6b279ebf9c80 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -209,6 +209,15 @@ config COMMON_CLK_CS2000_CP
>  	help
>  	  If you say yes here you get support for the CS2000 clock multiplier.
>  
> +config COMMON_CLK_CS2600
> +	tristate "Clock driver for CS2600 Fractional-N Clock Synthesizer & Clock Multiplier"
> +	depends on I2C
> +	depends on OF
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the CS2600 clock synthesizer
> +	  and multiplier.
> +
>  config COMMON_CLK_EN7523
>  	bool "Clock driver for Airoha EN7523 SoC system clocks"
>  	depends on OF
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..5d5264432613 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
>  obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
>  obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
>  obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
> +obj-$(CONFIG_COMMON_CLK_CS2600)		+= clk-cs2600.o
>  obj-$(CONFIG_COMMON_CLK_EP93XX)		+= clk-ep93xx.o
>  obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
>  obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
> diff --git a/drivers/clk/clk-cs2600.c b/drivers/clk/clk-cs2600.c
> new file mode 100644
> index 000000000000..694736bbbff0
> --- /dev/null
> +++ b/drivers/clk/clk-cs2600.c
> @@ -0,0 +1,1152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS2600  --  CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
> +//
> +// Copyright (C) 2024 Cirrus Logic, Inc. and
> +//                    Cirrus Logic International Semiconductor Ltd.
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-cs2600.h"

You do not include here even the bindings, so clearly
CS2600_AUX_OUTPUT_FREQ_UNLOCK and others are not bindings.

...

> +static int cs2600_check_device_id(struct cs2600 *cs2600)
> +{
> +	struct device *dev = cs2600->dev;
> +	unsigned int dev_id, rev;
> +	int ret;
> +
> +	ret = regmap_read(cs2600->regmap, CS2600_DEVICE_ID1, &dev_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can't read device ID\n");
> +
> +	if (dev_id != CS2600_DEVICE_ID_VALUE)
> +		return dev_err_probe(dev, -ENODEV, "Invalid device id 0x%x\n",
> +				     dev_id);
> +
> +	ret = regmap_read(cs2600->regmap, CS2600_DEVICE_ID2, &rev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can't read device revision\n");
> +
> +	dev_dbg(dev, "Device ID %x Rev %x", dev_id, rev);
> +
> +	return 0;
> +}
> +
> +static int cs2600_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct cs2600 *cs2600;
> +	int ret;
> +
> +	cs2600 = devm_kzalloc(dev, sizeof(*cs2600), GFP_KERNEL);
> +	if (!cs2600)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Error with vdd supply\n");
> +
> +	cs2600->dev = dev;
> +	i2c_set_clientdata(client, cs2600);
> +
> +	cs2600->regmap = devm_regmap_init_i2c(client, &cs2600_regmap_config);
> +	if (IS_ERR(cs2600->regmap))
> +		return dev_err_probe(dev, PTR_ERR(cs2600->regmap),
> +				     "Regmap not created\n");
> +
> +	/* Required to wait at least 20ms after vdd is enabled */
> +	usleep_range(20000, 21000);
> +	ret = cs2600_check_device_id(cs2600);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(cs2600->regmap, CS2600_SW_RESET, CS2600_SW_RST_VAL);
> +	if (ret)
> +		return ret;
> +
> +	/* Required to wait at least 5ms after software reset */
> +	usleep_range(5000, 6000);
> +	ret = cs2600_clk_get(cs2600);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Invalid parent clocks\n");
> +
> +	/* Set output clocks to HiZ */
> +	cs2600_set_freeze(cs2600);
> +	regmap_set_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
> +	regmap_set_bits(cs2600->regmap, CS2600_OUTPUT_CFG1,
> +			CS2600_BCLK_OUT_DIS | CS2600_FSYNC_OUT_DIS);
> +	cs2600_clear_freeze(cs2600);
> +
> +	ret = cs2600_parse_dt_params(cs2600);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot parse dt params\n");
> +
> +	ret = cs2600_clk_register(cs2600);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register clocks\n");
> +
> +	if (cs2600->ref_clk) {
> +		cs2600->refclk_rate = clk_get_rate(cs2600->ref_clk);
> +		regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
> +				   CS2600_SYSCLK_SRC_MASK,
> +				   CS2600_SYSCLK_SRC_REFCLK);
> +	} else {
> +		cs2600->refclk_rate = CS2600_INTERNAL_OSC_RATE;
> +		regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
> +				   CS2600_SYSCLK_SRC_MASK,
> +				   CS2600_SYSCLK_SRC_OSC);
> +	}
> +
> +	if (cs2600->refclk_rate < 8000000 || cs2600->refclk_rate > 75000000)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid REFCLK Frequency %lu\n",
> +				     cs2600->refclk_rate);
> +
> +	return 0;
> +}
> +

ID table definition goes here or somewhere around the probe.

> +static struct i2c_driver cs2600_driver = {
> +	.driver = {
> +		.name = "cs2600",
> +		.of_match_table = cs2600_of_match,
> +	},
> +	.probe		= cs2600_i2c_probe,
> +	.id_table	= cs2600_id,
> +};
> +
> +module_i2c_driver(cs2600_driver);
> +
> +MODULE_DESCRIPTION("CS2600 clock driver");
> +MODULE_AUTHOR("Paul Handrigan <paulha@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

