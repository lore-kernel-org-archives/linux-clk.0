Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DEB4156FB;
	Thu,  3 Sep 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421841; cv=none; b=DZT223+ILAyqFZv7vpj9Hp3VWLrDuC1Q8juHdBLDd3KHBEn/18PQ7UNGhTU2f3etRiPVYdJo5BVg3bvgPDYYB7Q7Ws3BlY/BbeV+sxBapJGU6UoM0oVoe28Q3XbJjQjjIV3+jjElZkG2nKqhU9pRxpHVsJCgPEfotvyNoEFzttI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421841; c=relaxed/simple;
	bh=blv4wdODRJoIJLSLs4PdhyTZCwXwZ/1oMYZyjK9NwJw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hVM301QMjfgruJnIaOHd531VJHpaENU6aFKtmSaEMcHGp06hWCI5s/aVe6nVFaT1Hss2ZFB38wBi03ccqFMB4OGvnvr6BfvgbCt/T5yShfJV4QB1N8511KRBVg3RwTAOJRA4YVENJj0ZDxfRzggwcaZfODOOQRUo80f3N9lSZ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 45462200571;
	Thu, 03 Sep 2026 09:50:35 +0200 (CEST)
Message-ID: <0ffb792adfafd06a0d7fc65153707e3c728fe0ac.camel@pengutronix.de>
Subject: Re: [PATCH v2 08/15] soc: starfive: Add jh7110-hdmi-subsystem driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrzej Hajda	 <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Emil Renner Berthing <kernel@esmil.dk>, Hal
 Feng <hal.feng@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley	
 <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti	
 <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Andy Yan	
 <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Maud
 Spierings	 <maudspierings@gocontroll.com>, Graham Markall
 <hello@big-grey.co.uk>
Date: Thu, 03 Sep 2026 09:50:35 +0200
In-Reply-To: <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
		<CGME20260828134828eucas1p1b4061de1538ef0d3322dc32f3db6140e@eucas1p1.samsung.com>
	 <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fr, 2026-08-28 at 15:47 +0200, Michal Wilczynski wrote:
> Add the parent driver for the monolithic JH7110 HDMI IP block.
>=20
> This driver binds to the starfive,jh7110-hdmi-subsystem node. It maps the
> shared register block, creates a regmap, and calls
> devm_of_platform_populate() to create its hdmi_phy and hdmi_controller
> child devices, which retrieve the shared regmap from this parent.
>=20
> The NoC display-bus clock and reset gate access to the whole vout registe=
r
> region, and this subsystem's PHY child is the first device there to touch
> registers. Enable the bus before populating the children; PD_VOUT is
> handled by genpd through the power-domains property.
>=20
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/soc/Kconfig                          |   1 +
>  drivers/soc/Makefile                         |   1 +
>  drivers/soc/starfive/Kconfig                 |  27 +++++++
>  drivers/soc/starfive/Makefile                |   2 +
>  drivers/soc/starfive/jh7110-hdmi-subsystem.c | 114 +++++++++++++++++++++=
++++++
>  5 files changed, 145 insertions(+)
>=20
[...]
> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/s=
tarfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d893c1c29f98b072b09d26134=
3d3317dbf4c75fe
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
> @@ -0,0 +1,114 @@
[...]
> +static int starfive_hdmi_subsys_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *bus_rst;
> +	void __iomem *regs;
> +	struct regmap *regmap;
> +	struct clk *bus_clk;
> +	int ret;
> +
> +	/*
> +	 * The NoC display-bus clock and reset gate access to the whole vout
> +	 * register region, and this subsystem's PHY child is the first device =
in
> +	 * that region to touch registers. Bring the bus up here before
> +	 * populating the children; PD_VOUT is powered on by genpd through the
> +	 * power-domains property.
> +	 */
> +	bus_clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk),
> +				     "Failed to get NoC bus clock\n");
> +
> +	ret =3D clk_prepare_enable(bus_clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable NoC bus clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, starfive_hdmi_subsys_clk_disable,=
 bus_clk);
> +	if (ret)
> +		return ret;

You can simplify this with devm_clk_get_enabled().

> +	bus_rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(bus_rst))
> +		return dev_err_probe(dev, PTR_ERR(bus_rst),
> +				     "Failed to get NoC bus reset\n");
> +
> +	ret =3D reset_control_deassert(bus_rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to deassert NoC bus reset\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, starfive_hdmi_subsys_rst_assert, =
bus_rst);
> +	if (ret)
> +		return ret;

You can simplify this with
devm_reset_control_get_exclusive_deasserted().

regards
Philipp
