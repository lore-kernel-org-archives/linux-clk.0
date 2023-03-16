Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F962C6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 01:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjCPB2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 21:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjCPB2Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 21:28:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABD774337
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 18:28:20 -0700 (PDT)
Received: from mercury (unknown [185.254.75.29])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F87E6602FA0;
        Thu, 16 Mar 2023 01:28:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678930097;
        bh=q8ebdQK9oGoecy54qsL+DNA2tnZv5JdVd2XF1eBumpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ke4NDwyQ51eLka3fORbCDjaBx1LIx6XVt3EClp0VHKUcZxbDxtU9VT2oycOyNkyoO
         k1JaG72vSnvAv6Zc+8rNrh6eKNPqn9oF6ExI9aufRwDozr6BDNAEmmQCxVRRwlpPKY
         GWD0hx9n7GVs7rqsgQL4rVCwIzC5Iotc1t29fSBd3ib7fw1pHjT2bn44FT6Ctb3DJ8
         tYFg8HJjhwPJhZorSKMNrbc4mqDTvNk/R+RORKrfbAql9MnFdp1NuDBRq3fpWFGwmN
         LR42argxZaNqjQQD6Ky1Dhh05iuJr/TVclq8YH2jkTbBSTvLAVNsuS2Ci/Bq8yWc4l
         WPnkcVNxmMvKA==
Received: by mercury (Postfix, from userid 1000)
        id E5FC310609DC; Thu, 16 Mar 2023 02:28:14 +0100 (CET)
Date:   Thu, 16 Mar 2023 02:28:14 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Lee Jones <lee@kernel.org>
Subject: Re: [PATCHv7 01/11] clk: RK808: reduce 'struct rk808' usage
Message-ID: <20230316012814.fijsxfuw7a5mfjmn@mercury.elektranox.org>
References: <20230307153617.643260-1-sebastian.reichel@collabora.com>
 <20230307153617.643260-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lgvrpfucjneu4wzk"
Content-Disposition: inline
In-Reply-To: <20230307153617.643260-2-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--lgvrpfucjneu4wzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael and Stephen,

On Tue, Mar 07, 2023 at 04:36:07PM +0100, Sebastian Reichel wrote:
> Reduce usage of 'struct rk808' (driver data of the parent MFD), so
> that only the chip variant field is still being accessed directly.
> This allows restructuring the MFD driver to support SPI based
> PMICs.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Can you Ack this please? (patch needs to go through mfd tree)

-- Sebastian

>  drivers/clk/clk-rk808.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
> index 32f833d732ed..f7412b137e5e 100644
> --- a/drivers/clk/clk-rk808.c
> +++ b/drivers/clk/clk-rk808.c
> @@ -12,10 +12,9 @@
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/rk808.h>
> -#include <linux/i2c.h>
> =20
>  struct rk808_clkout {
> -	struct rk808 *rk808;
> +	struct regmap		*regmap;
>  	struct clk_hw		clkout1_hw;
>  	struct clk_hw		clkout2_hw;
>  };
> @@ -31,9 +30,8 @@ static int rk808_clkout2_enable(struct clk_hw *hw, bool=
 enable)
>  	struct rk808_clkout *rk808_clkout =3D container_of(hw,
>  							 struct rk808_clkout,
>  							 clkout2_hw);
> -	struct rk808 *rk808 =3D rk808_clkout->rk808;
> =20
> -	return regmap_update_bits(rk808->regmap, RK808_CLK32OUT_REG,
> +	return regmap_update_bits(rk808_clkout->regmap, RK808_CLK32OUT_REG,
>  				  CLK32KOUT2_EN, enable ? CLK32KOUT2_EN : 0);
>  }
> =20
> @@ -52,10 +50,9 @@ static int rk808_clkout2_is_prepared(struct clk_hw *hw)
>  	struct rk808_clkout *rk808_clkout =3D container_of(hw,
>  							 struct rk808_clkout,
>  							 clkout2_hw);
> -	struct rk808 *rk808 =3D rk808_clkout->rk808;
>  	uint32_t val;
> =20
> -	int ret =3D regmap_read(rk808->regmap, RK808_CLK32OUT_REG, &val);
> +	int ret =3D regmap_read(rk808_clkout->regmap, RK808_CLK32OUT_REG, &val);
> =20
>  	if (ret < 0)
>  		return ret;
> @@ -93,9 +90,8 @@ static int rk817_clkout2_enable(struct clk_hw *hw, bool=
 enable)
>  	struct rk808_clkout *rk808_clkout =3D container_of(hw,
>  							 struct rk808_clkout,
>  							 clkout2_hw);
> -	struct rk808 *rk808 =3D rk808_clkout->rk808;
> =20
> -	return regmap_update_bits(rk808->regmap, RK817_SYS_CFG(1),
> +	return regmap_update_bits(rk808_clkout->regmap, RK817_SYS_CFG(1),
>  				  RK817_CLK32KOUT2_EN,
>  				  enable ? RK817_CLK32KOUT2_EN : 0);
>  }
> @@ -115,10 +111,9 @@ static int rk817_clkout2_is_prepared(struct clk_hw *=
hw)
>  	struct rk808_clkout *rk808_clkout =3D container_of(hw,
>  							 struct rk808_clkout,
>  							 clkout2_hw);
> -	struct rk808 *rk808 =3D rk808_clkout->rk808;
>  	unsigned int val;
> =20
> -	int ret =3D regmap_read(rk808->regmap, RK817_SYS_CFG(1), &val);
> +	int ret =3D regmap_read(rk808_clkout->regmap, RK817_SYS_CFG(1), &val);
> =20
>  	if (ret < 0)
>  		return 0;
> @@ -153,18 +148,21 @@ static const struct clk_ops *rkpmic_get_ops(long va=
riant)
>  static int rk808_clkout_probe(struct platform_device *pdev)
>  {
>  	struct rk808 *rk808 =3D dev_get_drvdata(pdev->dev.parent);
> -	struct i2c_client *client =3D rk808->i2c;
> -	struct device_node *node =3D client->dev.of_node;
> +	struct device *dev =3D &pdev->dev;
>  	struct clk_init_data init =3D {};
>  	struct rk808_clkout *rk808_clkout;
>  	int ret;
> =20
> -	rk808_clkout =3D devm_kzalloc(&client->dev,
> +	dev->of_node =3D pdev->dev.parent->of_node;
> +
> +	rk808_clkout =3D devm_kzalloc(dev,
>  				    sizeof(*rk808_clkout), GFP_KERNEL);
>  	if (!rk808_clkout)
>  		return -ENOMEM;
> =20
> -	rk808_clkout->rk808 =3D rk808;
> +	rk808_clkout->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!rk808_clkout->regmap)
> +		return -ENODEV;
> =20
>  	init.parent_names =3D NULL;
>  	init.num_parents =3D 0;
> @@ -173,10 +171,10 @@ static int rk808_clkout_probe(struct platform_devic=
e *pdev)
>  	rk808_clkout->clkout1_hw.init =3D &init;
> =20
>  	/* optional override of the clockname */
> -	of_property_read_string_index(node, "clock-output-names",
> +	of_property_read_string_index(dev->of_node, "clock-output-names",
>  				      0, &init.name);
> =20
> -	ret =3D devm_clk_hw_register(&client->dev, &rk808_clkout->clkout1_hw);
> +	ret =3D devm_clk_hw_register(dev, &rk808_clkout->clkout1_hw);
>  	if (ret)
>  		return ret;
> =20
> @@ -185,10 +183,10 @@ static int rk808_clkout_probe(struct platform_devic=
e *pdev)
>  	rk808_clkout->clkout2_hw.init =3D &init;
> =20
>  	/* optional override of the clockname */
> -	of_property_read_string_index(node, "clock-output-names",
> +	of_property_read_string_index(dev->of_node, "clock-output-names",
>  				      1, &init.name);
> =20
> -	ret =3D devm_clk_hw_register(&client->dev, &rk808_clkout->clkout2_hw);
> +	ret =3D devm_clk_hw_register(dev, &rk808_clkout->clkout2_hw);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.39.2
>=20
>=20
> --=20
> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

--lgvrpfucjneu4wzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmQScKsACgkQ2O7X88g7
+pqOaA//TmRWRC8cYxPTrmdEpzhneu7duDPKUX5+yWMbJo+UASHAxyJ83gVEPYAl
MAqKH75tNcccG20vkUHImDSgxw012NURuzth7AGBnYD7i+CggSBZp3uusI7AkT2r
Zb66H1Cx1otZMyl9kQR5XtV3k4CYFwlfPyluXT5CgR4YHnpYNm7IWDPAQiyvsxD2
deh2ETCSHZy8igxn8+7qhm/qEwCjNMPr2ttiSb+uSw/4IcRwpou0adjtIWygTuuB
GkXWQrzN7Ai2VNeUtCqCTGVU0xH7FIMric5LjGGwaUtdCe5XBZAMPdkEDhTuko/r
HZc6M9CYFrRT6Lvr8C5cC4gG1OC/lLPMHGtgdviODn0nZ7KwkPIS9ehUzYz1GGAY
/IMBq15q7p+gFSGB+R83Qe3mD1s2Vqco8igBei28c+xSQ8lVihgUJDp3iUnYcD9h
eN4g5rl7kb4Y853OczOxLeaU0St/dO21fF6Ra/fnPmKErO1dljw2ijFG/LRCNEk1
/h42CW1i/M8Xv3BnNHlkUrV8oWiwJGXgFBYTXiz968F8/jmvmdUPQ7owNTVQHp5p
5HFMqVG9eO3AB8IJmwan1RvVXONaetl44ayO3+sCUv/a6R8c+ElJlQr3Lj/84zi0
LnADlwMlTQFHnQ+XJjnKqA4oT+zFTXAtxfjC1kUwz5b5Nx3XTPw=
=5Xxi
-----END PGP SIGNATURE-----

--lgvrpfucjneu4wzk--
