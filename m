Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3009B35E1A3
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642029; cv=none; b=eUT5uDcFPZ8yFDCsAUnb25saMvYjmbuwSFtD0Pc+ZOuc8DcQeo/5CnlRYGC77FU7mbG5wvHVbROkmCivomclH7z95s7AXj6jhseEPA3/r6ECsw9N4ZvGlNCK3nvhhOpb8qcXvo8seJzPrFsaw3q4u0MkRnPolwASzIJEeDGl7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642029; c=relaxed/simple;
	bh=zmKt1m/5z7TZpfpJVcdtiE177i7iAYqlm/YBEuYGbKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lewliny7ewZ9hr65ySwVSDx6R77rY4mu6X7t9vKi+1NKDxIRbQ0mn16oBZcWpRsTkTC+XFG7/oJb6X3ZP13TUz4HLZMk0YHY4VrB6zHWMsNvpSmd3IoilN6aB7QyiofC64e+s4Vi7sR2MX0rGDCN+ZD5w9enLl3fnzy4AoymwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RY/HrGMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RY/HrGMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91741F00A3A;
	Sat,  5 Sep 2026 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788642028;
	bh=anMkPC/e466iZFWBQxlfMSgo0f+gALOOY7Oy9IozSOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RY/HrGMImOZ8ytLYMsVCDSwQxBra+/7fSER2GXQlENmA1PuKvwIdKewe1TB9F5B8M
	 ZoS43pIqx42aDTy4H+w2jhL9NJhsY2dKcsi8+hzKWlbWQl83DY3s5vcn9BYwT4fh0C
	 gbX7fhrb1GHff+0AI5X+Q2A9rBPqc9bKQ+JjG/M+iqY801m1h5RQ5i30qvK8F4BZFB
	 js/dCeUZdeJgC3wvduDuEVU8piTLrZbc9r0Yz+qHk+twvB6T+W1ero76AXFa1GgdkG
	 kW3if10gWPY1wVEvwyoiTr6ZEjIvwXRZYWisAyTwWzUn7lta6/xf2FvRG3XJ9vrvEs
	 CoqczKkIJmBGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: tenstorrent: Assign .num before accessing .hws
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aamir Ahmed" <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 21:00:27 +0000
Message-Id: <20260905210027.D91741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing validation of the match data pointer causes a direct NULL =
pointer dereference on probe.
- [High] Shared clock gate refcount is not rolled back when hardware enable=
 fails, leading to silent hardware enablement failures.
- [High] PLL disable routine fails to close the downstream clock gate, cont=
inuing to leak a bypass clock signal.
--

commit f278096bfd5e9454d658c8bb4c16b0c59b91f633
Author: Aamir Ahmed <elb12345@hotmail.co.uk>

clk: tenstorrent: Assign .num before accessing .hws

Commit f316cdff8d67 annotated the hws member of struct clk_hw_onecell_data
with __counted_by, which informs bounds sanitizers about the number of
elements in .hws[]. This commit fixes a warning during probe by initializing
the .num member with the number of elements before the first array access
happens.

> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tensto=
rrent/atlantis-prcm.c
> index 6d4386eeb7dae..a68534a295ca1 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -796,6 +796,8 @@ static int atlantis_prcm_clocks_register(struct devic=
e *dev,
>  	if (!clk_data)
>  		return -ENOMEM;
> =20
> +	clk_data->num =3D num_clks;
> +
>  	for (i =3D 0; i < data->num; i++) {

[Severity: High]
This isn't a bug introduced by this patch, but can data be NULL here?

If the device is bound manually via sysfs without a matching device tree
node, of_device_get_match_data() can return NULL in atlantis_prcm_probe():

drivers/clk/tenstorrent/atlantis-prcm.c:atlantis_prcm_probe() {
    ...
	data =3D of_device_get_match_data(dev);

	ret =3D atlantis_prcm_clocks_register(dev, regmap, data);
    ...
}

Which is then passed into atlantis_prcm_clocks_register() and dereferenced:

drivers/clk/tenstorrent/atlantis-prcm.c:atlantis_prcm_clocks_register() {
    ...
	size_t num_clks =3D data->num;
    ...
}

Should data be validated before dereferencing it to avoid a NULL pointer
dereference?

>  		struct clk_hw *hw =3D data->hws[i];
>  		struct atlantis_clk_common *common =3D
>  			hw_to_atlantis_clk_common(hw);
>  		common->regmap =3D regmap;
> =20
>  		ret =3D devm_clk_hw_register(dev, hw);
>  		if (ret)
>  			return ret;
> =20
>  		clk_data->hws[common->clkid] =3D hw;
>  	}
> =20
> -	clk_data->num =3D num_clks;
> -
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data=
);
>  }

[Severity: High]
This is a pre-existing issue, but does this code leave the shared gate
refcount incremented if the hardware enable fails?

drivers/clk/tenstorrent/atlantis-prcm.c:atlantis_clk_gate_shared_enable() {
    ...
	if (need_enable) {
		if (!regmap_test_bits(gate->common.regmap,
				      gate->config.reg_offset,
				      gate->config.enable)) {
			pr_warn("%s: gate enable %d failed to enable\n",
				clk_hw_get_name(hw), gate->config.enable);
			return -EIO;
		}
	}
    ...
}

If regmap_test_bits() detects that the hardware bit failed to set, it
returns -EIO but leaves gate->config.share_count incremented. If the
consumer retries enabling the clock, the driver sees the refcount > 0, skips
the hardware write, and falsely returns success (0).

Should the error path re-acquire the lock and roll back the share_count?


[Severity: High]
This is also a pre-existing issue, but does the PLL disable routine fail to
close the downstream clock gate?

drivers/clk/tenstorrent/atlantis-prcm.c:atlantis_clk_pll_enable() {
    ...
	/* Enable Gate clk at PLL Output */
	return regmap_update_bits(pll->common.regmap, pll->config.cg_reg_offset,
				  pll->config.cg_reg_enable,
				  pll->config.cg_reg_enable);
}

drivers/clk/tenstorrent/atlantis-prcm.c:atlantis_clk_pll_disable() {
    ...
	/* Step 1: Switch to bypass mode before disabling */
	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
	/* Step 2: Power down PLL */
	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
			   PLL_CFG_EN_BIT, 0);
}

When a consumer calls clk_disable() on the PLL, the driver switches to
bypass and clears the enable bit, but fails to clear
pll->config.cg_reg_enable symmetrically with atlantis_clk_pll_enable().

Because disabling the PLL also switches it to bypass mode, does the raw
bypass clock continuously propagate to downstream consumers that expect the
clock to be fully stopped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/AS8P251MB00013BD9A0=
93C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM?part=3D1
