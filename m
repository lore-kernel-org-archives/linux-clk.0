Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173A4A2A55;
	Fri,  4 Sep 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530278; cv=none; b=I4HkgnLvXEgcPL3dHaAnOGRG7yd4tAPM1zto4ImhdlzRCNIxCuox6j6PSA78qx1GZOJdflth2ugpmlbSM08onvM5pe7W0Q8snKAgBydMJvW4N+AldDI8iy6ZpPj0d+JexxwL1YkmgwqmVhC59yRTJZLPiqu0N44QxToc4+/BwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530278; c=relaxed/simple;
	bh=PNhGXae2FNc+A6InyXqPk3qEIFCoHRx4SHrjbiC+wbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ueLR3GnGeja0wI/ATkfLFCHDyh4Lh4QIP6g2kscflKRtnK3yhTkiQqzSbXPRyOYoeGSl1xKr14fytwkyAd7mWe8yAbl0HZpkPyxr1m+chBbLit+AaJ5pz7VngRxRpo0bifYHAoagbJxllWuC2U+itZAOCwvOGYyhMoW/8+gLKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xdxz6kd7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xdxz6kd7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F64F1F00A3D;
	Fri,  4 Sep 2026 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530276;
	bh=BLIfOnhFESYpnnCgoqCF1Sa2NILI1mIvJd+wh2AP+Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xdxz6kd7kdlGIY73xPnGEh4YN0E+3bRxfTlwW/2knslii7PmFcW0Tn/aZiqbN6KHs
	 2PJ1QptUQ8FMmpZ60J8jn5zKEWX53ZEhRHzOWZfpuKk0i8db2xN6cmR9L2N6IRmCjw
	 nPOxbIzWUa7S0qH6Fn0JchLDzdou+6Ob99TqdsSHD1dLw7Htlc3goFQDlonlsXxWkm
	 3oBV9ttotpIqw69j4ax4F3eCXPppYGA3DVfh+oo91Xv7pT3HnyqibkSH65PrzbNdCA
	 Ap0wHJpJwmBMbzRQN8pbYJbRMS08wUSN0FK1u2e/+7uE4U2kvL9DyTR5JBReiAGVON
	 Z0OvqwW06xvOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/19] phy: starfive: Add jh7110-inno-hdmi-phy driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-clk@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260904-jh7110-clean-send-v3-17-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132741eucas1p1a60fc27f22cb79ef94aeb637334124f2@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-17-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:57:55 +0000
Message-Id: <20260904135756.3F64F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unconditional register access in `clk_set_rate` and `probe` will c=
ause a CPU wedge if the HDMI system clock is gated.
- [High] `phy_power_off` unconditionally disables shared analog blocks (BIA=
S and RX), breaking the pixel clock output if `hdmi_pclk` is still running.
- [Medium] `clk_set_rate` unconditionally powers on the Pre-PLL and analog =
blocks, violating CCF semantics and leaking power.
- [Medium] Data race on state variables and unprotected register sequences =
between Clock and PHY callbacks.
--

commit 08ad435ba48340f7f566c8d19a6a67d1faa2ca9d
Author: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: phy: starfive: Add jh7110-inno-hdmi-phy driver

This commit adds the HDMI PHY driver for the StarFive JH7110. It registers=
=20
as a clock provider for the pre-PLL pixel clock and a PHY provider for the=
=20
post-PLL analog blocks.

> diff --git a/drivers/phy/starfive/phy-jh7110-inno-hdmi.c b/drivers/phy/st=
arfive/phy-jh7110-inno-hdmi.c
> index 0000000000000..2575cb5ed624a
> --- /dev/null
> +++ b/drivers/phy/starfive/phy-jh7110-inno-hdmi.c

[ ... ]

> +static int starfive_hdmi_phy_clk_set_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +					  unsigned long parent_rate)
> +{
> +	struct starfive_hdmi_phy *inno =3D to_starfive_hdmi_phy(hw);
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;

[ ... ]

> +	if (inno->pixclock =3D=3D rate && inno->tmdsclock =3D=3D cfg->tmdsclock)
> +		return 0;
> +
> +	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
> +			 STF_INNO_BIAS_ENABLE, STF_INNO_BIAS_ENABLE);
> +	inno_write(inno, STF_INNO_RX_CONTROL, STF_INNO_RX_ENABLE);

[Severity: High]
Does this register access execute blindly without checking if the clock is
prepared?=20

The commit message mentions that unclocked accesses wedge the bus hard enou=
gh
that the CPU stops taking NMIs. If clk_set_rate() is called while the clock=
 is
unprepared, could this cause the described system crash?

[Severity: Medium]
Additionally, could this unconditionally power on the shared analog blocks
and violate the Common Clock Framework semantics?=20

CCF allows clk_set_rate() to be called on an unprepared clock, which should
merely update the configuration. If the clock remains unprepared, do these
blocks remain powered on and unnecessarily leak power?

> +
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
> +	inno_hdmi_phy_pre_pll_configure(&inno->pre_pll, cfg);
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false);

[Severity: Medium]
Does this also force the Pre-PLL hardware into a powered-up and running sta=
te
without checking if the clock is prepared, potentially leaking power?

> +
> +	inno->pixclock =3D rate;
> +	inno->tmdsclock =3D cfg->tmdsclock;

[Severity: Medium]
Is it safe to modify this shared state under the CCF's prepare_lock?

The PHY framework might concurrently modify these variables under phy->mute=
x in
starfive_hdmi_phy_power_down(). Could this data race cause inconsistent
internal state, or allow the multi-register hardware configuration sequences
to dangerously interleave?

> +
> +	return 0;
> +}

[ ... ]

> +static void starfive_hdmi_phy_power_down(struct starfive_hdmi_phy *inno)
> +{
> +	inno_write(inno, STF_INNO_TMDS_CONTROL, 0x00);
> +	inno_write(inno, STF_INNO_SERIALIER_CONTROL, 0x00);
> +	inno_write(inno, STF_INNO_LDO_CONTROL, 0x00);
> +	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
> +			 STF_INNO_BIAS_ENABLE, 0x00);
> +	inno_write(inno, STF_INNO_RX_CONTROL, 0x00);

[Severity: High]
Does this unconditionally disable the shared BIAS and RX analog blocks, even
if the hdmi_pclk clock provider is still running?=20

If the PHY is powered off, but the VOUT subsystem still expects the pixel
clock to be active, will this abruptly kill the clock signal behind the clo=
ck
framework's back?

> +
> +	/* Power down Post-PLL */
> +	inno_update_bits(inno, STF_INNO_POST_PLL_DIV_1,
> +			 STF_INNO_POST_PLL_POWER_DOWN,
> +			 STF_INNO_POST_PLL_POWER_DOWN);
> +
> +	inno->tmdsclock =3D 0;
> +	inno->pixclock =3D 0;

[Severity: Medium]
This appears to be the other side of the data race mentioned above. Does
modifying this state under the PHY mutex race with the CCF reading or
writing it via clk_set_rate() or clk_recalc_rate()?

> +}

[ ... ]

> +static int starfive_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device *parent =3D dev->parent;

[ ... ]

> +	ret =3D of_clk_add_provider(dev->of_node, of_clk_src_simple_get, inno->=
phyclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to add clock provider: %d\n", ret);
> +		goto err_disable_refoclk;
> +	}
> +
> +	ret =3D clk_set_rate(inno->phyclk, 297000000);
> +	if (ret) {
> +		dev_err(dev, "Failed to set default rate: %d\n", ret);
> +		goto err_del_clk_provider;
> +	}

[Severity: High]
Does this synchronous clk_set_rate() call hit the PHY registers before the
sibling controller is guaranteed to have enabled the system clock?

Because the PHY driver can probe before the bridge driver, could this happen
while the clock is gated, triggering the system crash (CPU NMI stall)
described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D17
