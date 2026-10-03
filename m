Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39B233924;
	Sat,  3 Oct 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037343; cv=none; b=obGDEtw5bdHszD723+UZY3c/m/BDM1kLDWvMi/Q8FneDUyLFNuhCnCXJr8+ulkabCWT6X9Y8Cm0TmbZQ8nbLYx014guIzW9NJJITkK7BMjE4Za2Vo4ZmkhK0suhznWB97HcW1Qe2422DkN/NSCUvOPrVUaBHQ22PoR4MSl25KBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037343; c=relaxed/simple;
	bh=OZqH9xFumm5503yehfbEr+/pg6CXnmXcbwKTmOKAL/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnfRUYXJ3rKavFaZYBAWhA3HvkGbUb3JekE3gzEN3iGzZRVG+k3Nf5T45+QXHVVlQu6Gml8TtvpiekSlO8vBTi05rhg82SIf1Z+jzDaG00xBfrAfIw7f2szL0sFzyYPJ4r9afVRNTM0CFdaHNq+vUATOdyCn0iYE4xaMDWl1SDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HupJsVVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HupJsVVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444FD1F0089B;
	Sat,  3 Oct 2026 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791037342;
	bh=wU5rDB+VrDABQDIH5NSBgXFhWETxK1QagBiSzme5jbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HupJsVVBF1dHKykTQ4kDj6W1v0bhCqz3zdZNM5z8Ua2I8J6c937ttT5WgloXKLeE8
	 vxqbwr6qEMHwnyXZ9IVNbXssGaaTYPFsjcVYcOOqEnOoAzOqNLYN0gl1rRtc2e51IK
	 S5XS0v6dBZWkMEru1s6uq63ih7+LVa840i2CC2Fhhnq6GhoXw/YY4jVaC9YY86Giz5
	 iFADACWg+h+gBa/4m9pvN04TpYbQWis4MhKNIv1hgvP+f17JDQDLIxtRjSnyA6jY8u
	 oKkGSZUp6GjuXpcahihgrxXGzVsYSV4PsQvWfDV9Iqk1YvncaLW5D6Is8IWrY2wytJ
	 rkQdqjWQ524dQ==
Date: Sat, 3 Oct 2026 16:22:18 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 16/20] phy: Add common Innosilicon HDMI PHY helpers
Message-ID: <asEPmpQTwXYADwTk@parshuram>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>

On 15-09-26, 17:32, Michal Wilczynski wrote:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
> 
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
> 
> No driver uses it yet; the users are converted separately.

Is there anything in phy patches here that has dependency with rest? If
not consider splitting it up...

> +static u8 inno_read(const struct inno_hdmi_phy_pre_pll *pll, unsigned int reg)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(pll->regmap, inno_reg(pll, reg), &val);
> +	if (ret)
> +		return 0;
> +
> +	return val;

why not just return regmap_read()

There is no logic here, nothing. This is really not ideal.
Also why add a wrapper and not use regmap directly?

> +/**
> + * inno_hdmi_phy_pre_pll_determine_rate - clk_ops.determine_rate helper
> + * @pll: pre-PLL instance
> + * @req: rate request, updated with the rate the PHY would produce
> + *
> + * The PHY can only generate the pixel clocks described by its table, so a
> + * request that does not appear there is rejected rather than rounded.
> + *
> + * Return: 0 on success, -EINVAL if the rate is not supported.
> + */
> +int inno_hdmi_phy_pre_pll_determine_rate(const struct inno_hdmi_phy_pre_pll *pll,
> +					 struct clk_rate_request *req)
> +{
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
> +	unsigned long rate = rounddown(req->rate, 1000);
> +
> +	for (cfg = pll->table; cfg->pixclock != 0; cfg++) {

Is there a chance of null/garbage if we reach end of table? You dont
know the size of table, and incrementing pointer without bounds does not
look good to me.


-- 
~Vinod
