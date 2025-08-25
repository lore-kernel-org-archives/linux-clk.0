Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC672D0298
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756114966; cv=none; b=buHgSInBgJUZknQOAZ5OStZPOqTwIeR2rq3OQVbi3f7bdMF4AOeVwL1ng1lzpYC6IsQqiwvvCKADJmyKxMQnL5KrXZ7p9WyoQhb6jGC07F39CC9o/bFf6S8Aq+8hviWUeMAxB9iJpZ4TNHlrAipWmgMedP1lfXeHzuEZ+GzHZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756114966; c=relaxed/simple;
	bh=3+/JTEg9+GBOONNinTNtovlxE5BUHOyMnR9VshLWROY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MUlAOxxeJ7v+6zdwKiD4Ao20GA7kQSJGLkg7SlQLo0Tnkaf7VtHqC61k5w2dva91EtNCI9Wb2a8D1+U21hs+c46tSOBYpYOGVEJ1MbtExIh3S29wr9VCDfZc6hNp5+F2k3tWoNOoDue6A8CwyggUD162ds4uuJtNff1Ru0x3/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiU-0002bt-GY; Mon, 25 Aug 2025 11:42:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiS-0022ru-2W;
	Mon, 25 Aug 2025 11:42:16 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiS-000J5K-2C;
	Mon, 25 Aug 2025 11:42:16 +0200
Message-ID: <0501e21d1b6c99d18fe7e660f38b9bfafc76de53.camel@pengutronix.de>
Subject: Re: [PATCH 4/7] phy: allwinner: a523: add USB3/PCIe PHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Date: Mon, 25 Aug 2025 11:42:16 +0200
In-Reply-To: <20250816084700.569524-5-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
	 <20250816084700.569524-5-iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Sa, 2025-08-16 at 16:46 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>=20
> The A523 family of processors features a combophy for USB 3.0 and PCIe,
> developed by Innosilicon. Simultaneous operation of both interfaces is
> not supported by design.
> Currently, the driver only adds support for USB 3.0. PCIe support is
> currently unavailable and will be added later.
> All data on phy configuration is taken from the manufacturer's BSP driver=
.
>=20
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/phy/allwinner/Kconfig                |   9 +
>  drivers/phy/allwinner/Makefile               |   1 +
>  drivers/phy/allwinner/phy-sun55i-usb3-pcie.c | 267 +++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
>=20
> diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfi=
g
> index fb584518b..af2a82e51 100644
> --- a/drivers/phy/allwinner/Kconfig
> +++ b/drivers/phy/allwinner/Kconfig
> @@ -57,3 +57,12 @@ config PHY_SUN50I_USB3
>  	  part of Allwinner H6 SoC.
> =20
>  	  This driver controls each individual USB 2+3 host PHY combo.
> +
> +config PHY_SUN55I_USB3_PCIE
> +	tristate "Allwinner A523 Innosilicon USB3/PCIe Combophy Driver"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on RESET_CONTROLLER

This dependency is not necessary. The reset controller API is stubbed
out in case  RESET_CONTROLLER is disabled.

ARCH_SUNXI selects ARCH_HAS_RESET_CONTROLLER, which default-enables
RESET_CONTROLLER.

> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the Allwinner PCIe/USB3.0 combo PHY
> +	  with Innosilicon IP block founded in A523/A527/H728/T527 SOC
> diff --git a/drivers/phy/allwinner/Makefile b/drivers/phy/allwinner/Makef=
ile
> index bd74901a1..5948a27ef 100644
> --- a/drivers/phy/allwinner/Makefile
> +++ b/drivers/phy/allwinner/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_PHY_SUN4I_USB)		+=3D phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+=3D phy-sun6i-mipi-dphy.o
>  obj-$(CONFIG_PHY_SUN9I_USB)		+=3D phy-sun9i-usb.o
>  obj-$(CONFIG_PHY_SUN50I_USB3)		+=3D phy-sun50i-usb3.o
> +obj-$(CONFIG_PHY_SUN55I_USB3_PCIE)		+=3D phy-sun55i-usb3-pcie.o
> diff --git a/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c b/drivers/phy/a=
llwinner/phy-sun55i-usb3-pcie.c
> new file mode 100644
> index 000000000..905c54a67
> --- /dev/null
> +++ b/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
> @@ -0,0 +1,267 @@
[...]
> +static int sun55i_usb3_pcie_phy_init(struct phy *_phy)
> +{
> +	struct sun55i_usb3_pcie_phy *phy =3D phy_get_drvdata(_phy);
> +
> +	sun55i_usb3_phy_open(phy);

Given that sun55i_usb3_pcie_phy_exit() asserts the reset and disables
the clock, why isn't the clock enabled and the reset deasserted here?

As is, it looks like the code in sun55i_usb3_phy_open() could be just
folded into sun55i_usb3_pcie_phy_init().

> +	return 0;
> +}
[...]
> +static int sun55i_usb3_pcie_phy_probe(struct platform_device *pdev)
> +{
> +	struct sun55i_usb3_pcie_phy *phy;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	int ret;
> +
> +	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->dev =3D dev;
> +	phy->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy->clk)) {
> +		if (PTR_ERR(phy->clk) !=3D -EPROBE_DEFER)
> +			dev_err(dev, "failed to get phy clock\n");
> +		return PTR_ERR(phy->clk);
> +	}
> +
> +	phy->reset =3D devm_reset_control_get(dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR(phy->reset)) {
> +		dev_err(dev, "failed to get reset control\n");

Consider using dev_err_probe().

regards
Philipp
