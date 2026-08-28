Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8645FFA2;
	Fri, 28 Aug 2026 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925561; cv=none; b=n67TVbuuPWkZ9/E9uwa8WyjA0VH7Q00UgKaehS0mCkuoqeaNY6N5OxR22VKU5SHeoHvPSdDu9eronxcwIdlsfk+SK8+YFxyKsfB9rR46akFhVQzdJ0UVowwgfk784pE9p3X7F34eIUc04gGPNixLuJpJPTKuD5s6/X9LzN2xu28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925561; c=relaxed/simple;
	bh=JYQYXZwCQjXKyjqNbVzdEdY2oNoW3mlTFi8sYb875hY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IzX9058r23XxkYFTagOEQtPYbEloByen6X7jiMfzQ7ujYKknxM1fDP9ky/TurCndNKzR8ebxHOdOFtn08Efpm8hJGzIz1guGq14+iAJU7nA2yY21lHJT8EHZpeBcQ4ypj2ctNc7qKjiB9ak2rr8AQCgtk5xu04EMbddIyhK58OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afYFjGOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afYFjGOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DF21F000E9;
	Fri, 28 Aug 2026 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925559;
	bh=TeannOBMhF9U7sNgKBJqR/xJ1ffND4mBh4aWV6lhAeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afYFjGOKlE/BC+vf1tYFAc1ttChsRVSd/U625uUoMiQwZm5Agn9nrfloLdE7zmXDC
	 JxSFYmazNdXodTzvX0dSiJ/P76hBgMpQopksbVpk8hWpVzSkn3o2J+nCA6rsxjr7Wc
	 1x9O+uY4lZc5tTgNuyy0kdZP2FHbNZGxTddZ8iryveowh14mHZ7iMSnorZIlpoUhwI
	 V6z1JX7jQpU337CiGdbjzMJpVQWYepY6ScGjlNVhQKI3IFHukETGQaLEGzGwVmki3K
	 dXk2H3nD8baUGybgAMfV6uHBiNnciMXnY8aQj3VMIkwhYTy0y1JJPyBoyewi66+ZgR
	 0sJy7RMZlhNTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/15] drm/bridge: starfive: Add JH7110 HDMI
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, robh@kernel.org, linux-clk@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260828-jh7110-clean-send-v2-10-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134832eucas1p28eb7a61379525744cce7edfc0d579d8e@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-10-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:59:18 +0000
Message-Id: <20260828135918.D4DF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Naming collision for 'pclk' causes the generic driver to permanent=
ly enable the pixel clock and breaks I2C/EDID reads.
- [High] Manual teardown of clocks and reset in remove() and probe error pa=
ths violates devres ordering, risking a kernel panic.
- [Medium] PHY power state and pixel clock reference counts are leaked if t=
he driver is unbound while active.
--

commit c6a610527cc7d181c41335780cfb8a12665b7239
Author: Michal Wilczynski <m.wilczynski@samsung.com>
drm/bridge: starfive: Add JH7110 HDMI controller driver

This commit adds the HDMI controller bridge driver for the StarFive JH7110,
acting as a glue layer between the JH7110 HDMI subsystem and the generic
Innosilicon HDMI bridge driver. It handles shared regmaps, manages clock
hierarchies from voutcrg, and configures the PHY's pixel clock rate dynamic=
ally.

> diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/=
bridge/jh7110-inno-hdmi.c
> new file mode 100644
> index 0000000000000..be865aa39e33f
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c

[ ... ]

> +static int starfive_inno_hdmi_controller_probe(struct platform_device *p=
dev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device *parent =3D dev->parent;
> +	struct stf_inno_hdmi_controller *ctrl;
> +	const struct inno_hdmi_plat_data *plat_data;
> +	struct regmap *regmap;
> +	struct inno_hdmi *inno;
> +	int ret;
> +
> +	ctrl =3D devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	ctrl->dev =3D dev;
> +	platform_set_drvdata(pdev, ctrl);
> +
> +	/* Get the shared regmap from the parent */
> +	regmap =3D dev_get_regmap(parent, NULL);
> +	if (!regmap) {
> +		dev_err(dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	ctrl->phy =3D devm_phy_get(dev, "hdmi-phy");
> +	if (IS_ERR(ctrl->phy))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->phy), "Failed to get PHY\n");
> +
> +	ctrl->tx_rst =3D devm_reset_control_get_exclusive(dev, "hdmi_tx");
> +	if (IS_ERR(ctrl->tx_rst))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx res=
et\n");
> +
> +	/* Populate the clock names this controller *consumes* */
> +	ctrl->clks[CLK_SYS].id =3D "sys";
> +	ctrl->clks[CLK_M].id =3D "mclk";
> +	ctrl->clks[CLK_B].id =3D "bclk";
> +	ctrl->clks[CLK_PCLK].id =3D "pclk"; /* Pixel clock *from* PHY */

[Severity: High]
Does this naming collision for 'pclk' cause the generic driver to permanent=
ly
enable the pixel clock and break I2C/EDID reads?

The wrapper driver maps the 'pclk' string ID to the dynamically-managed pix=
el
clock from the PHY. However, the generic driver inno_hdmi_probe() in
drivers/gpu/drm/bridge/inno-hdmi.c expects 'pclk' to be the APB/peripheral
clock and grabs it unconditionally:

inno-hdmi.c:inno_hdmi_probe() {
    ...
    hdmi->pclk =3D devm_clk_get_enabled(hdmi->dev, "pclk");
    ...
}

Because both query the same device tree node, the generic driver grabs the
pixel clock and permanently enables it at probe time.

Furthermore, inno_hdmi_init_hw() uses clk_get_rate(hdmi->pclk) at probe time
to calculate the DDC I2C clock divider. Since the pixel clock rate isn't set
until the .enable callback is invoked during modesetting, it will return 0 =
or
a default rate. This results in a 0 Hz DDC bus frequency, causing I2C timeo=
uts
and breaking EDID reading.

> +
> +	ret =3D devm_clk_bulk_get(dev, CLK_CTRL_NUM, ctrl->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to get controller clocks\n");
> +
> +	/* pclk is enabled on demand during modeset */
> +	ret =3D clk_bulk_prepare_enable(CLK_CTRL_NUM - 1, ctrl->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(ctrl->tx_rst);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
> +		return ret;
> +	}
> +
> +	plat_data =3D of_device_get_match_data(dev);
> +
> +	/* Hand off to the generic library to create the bridge. */
> +	inno =3D inno_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(inno)) {
> +		reset_control_assert(ctrl->tx_rst);
> +		clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);

[Severity: High]
Can this manual teardown of clocks and reset violate devres ordering and ri=
sk
a kernel panic?

The driver manually enables bus clocks and deasserts reset in probe before
calling inno_hdmi_probe(). The generic inno_hdmi_probe() registers a shared
interrupt handler (inno_hdmi_hardirq) via devm_request_threaded_irq().

In the probe error path here, and in starfive_inno_hdmi_controller_remove()
below, the driver manually disables the clocks and asserts the reset. Becau=
se
the IRQ is managed by devres, it is not freed until after the probe error
path finishes or the remove function returns.

If a shared interrupt fires in the window between the manual clock disable
and devres tearing down the IRQ, inno_hdmi_hardirq() will attempt to read
the HDMI_STATUS register. Accessing registers with the APB clock disabled
causes a bus hang.

The driver should use devm_add_action_or_reset() to manage the clocks and
reset safely.

> +		return PTR_ERR(inno);
> +	}
> +
> +	return 0;
> +}
> +
> +static void starfive_inno_hdmi_controller_remove(struct platform_device =
*pdev)
> +{
> +	struct stf_inno_hdmi_controller *ctrl =3D platform_get_drvdata(pdev);
> +
> +	reset_control_assert(ctrl->tx_rst);
> +	clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
> +}

[Severity: Medium]
Will this remove function leak the PHY power state and pixel clock reference
counts if the driver is unbound while active?

During modesetting, inno_hdmi_starfive_enable() dynamically prepares and
enables the pclk and calls phy_power_on(), recording this in ctrl->enabled.
If the driver is unbound while the display pipeline is active, this remove
function executes but does not check ctrl->enabled.

It omits the required phy_power_off() and clk_disable_unprepare() calls.
While devres unwinds and drops the clock and PHY pointers, it does not
reverse the dynamic power state or decrement the prepare/enable counts,
leaving the hardware permanently on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D10
