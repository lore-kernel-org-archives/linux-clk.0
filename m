Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707F472790;
	Wed,  2 Sep 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349277; cv=none; b=N3Q7cXGLBqJisTWC20bV87ojyWt+4oDs40B3px0IH6pItpWq2DZETMV6LMFGH4/rZPSrWduoXXg4rr9bGnG7/CSiVO+JIFMM2mYn7MEkOjvshaWic2ZNH5WUkJQhLchXd8xzZcCoV4fqRdFnU+w2A31bAGt0mfDUMrtCvl2bOpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349277; c=relaxed/simple;
	bh=iKR/mSreAgD7jqhs7QS1YQhmLKvPoSKdGuVOCvCT0fE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vdea6oTL57kUaGxQQRYsaXVHcr6Xti5LNmwOxuvMB8D2E2IVXaWls2/H+4eLSoZe3VwaxlGiQ58ocXgTrMN+15i5PW3mRgqqePa3ilYuZWC4If9HuHffJf4GVCRrgPudNnjQSOYutGtAD5fbbvHXO2itcK5Jrh+DPsaMlsgAp4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXwNFvFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXwNFvFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D6E1F000E9;
	Wed,  2 Sep 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349276;
	bh=eBhrjYuGWbDJgpUJfvSjAFmUuwYVamTJWbEvcrK1x58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXwNFvFuLR00OC0aoBItS7KjAzYOwoHlALrCVe96MfxlzJdj3qFpT9A3/u2ZO+El/
	 a28GJf3vohkuLBIMFhdJUqOi39Ckv+teX72VtIAS3zZgoQISflkmj29g6kSczjz8+L
	 A8J1gGgvtYvemnYOuPdOWK/TtzhGfAvTH+tB+llU0yO0Zm9w90UQT36zrBV2/uWETs
	 ybvOgTY4oqxc6rm3yLKy9q97PlatQaUz+dCCmq9gmi6oWexI8z6tS6cdulGkAXPM5M
	 y/95ShFHIo+HBlea8HY4AwxivyvFRW1HVuhZsVyylwFIVOxSlKApNiDE0+Daa0mqO3
	 q3FnriPen5YyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/12] clk: renesas: r8a78000: Add SCMI remapping
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <2a88d6c67bc8218d21f5180842354ed62c0c2aac.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <2a88d6c67bc8218d21f5180842354ed62c0c2aac.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:41:15 +0000
Message-Id: <20260902114115.B1D6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Leaked consumer `struct clk` instances and module references in `f=
ill_clk_map()`.
- [High] Dangling `clk_hw` pointer dereference (Use-After-Free) due to miss=
ing device link to the SCMI provider.
- [Medium] Device node reference for `scmi_clk_np` is leaked on all exit pa=
ths in `r8a78000_cpg_probe`.
- [Low] Invalid `IS_ERR` check on `clk_hw` pointer resulting in unreachable=
 error handling.
--

commit b6862fd9407ed1d4841735e0f963211d95acd921
Author: Geert Uytterhoeven <geert+renesas@glider.be>

clk: renesas: r8a78000: Add SCMI remapping support
   =20
Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
to remap DT clock IDs to abstractions (clocks) offered by the SCMI
firmware implementation present when running on a system with a
supported SCMI firmware implementation.

> diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a=
78000-cpg.c
> index 873d521ed3d6f..2273047315db5 100644
> --- a/drivers/clk/renesas/r8a78000-cpg.c
> +++ b/drivers/clk/renesas/r8a78000-cpg.c

[ ... ]

> @@ -120,11 +159,15 @@ static struct clk_hw **register_fixed_clks(struct d=
evice *dev)
>  }
> =20
>  static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> -					  const struct clk_map_in *map_in)
> +					  const struct clk_map_in *map_in,
> +					  struct device_node *scmi_clk_np)
>  {
> +	struct of_phandle_args scmi_spec;
>  	struct device *dev =3D priv->dev;
>  	struct clk_hw **fixed_hws;
>  	struct clk_map *map;
> +	struct clk_hw *hw;
> +	struct clk *clk;
>  	unsigned int i;
> =20
>  	fixed_hws =3D register_fixed_clks(dev);
> @@ -143,7 +186,38 @@ static const struct clk_map *fill_clk_map(struct r8a=
78000_cpg_priv *priv,
>  			break;
> =20
>  		map[i].fw_id =3D map_in[i].fw_id;
> -		map[i].hw =3D fixed_hws[map[i].fw_id];
> +		if (map[i].fw_id >=3D FIXED_CLK_OFFSET) {
> +			enum fixed_clk idx =3D map[i].fw_id - FIXED_CLK_OFFSET;
> +
> +			map[i].hw =3D fixed_hws[idx];
> +			continue;
> +		}
> +
> +		scmi_spec.np =3D scmi_clk_np;
> +		scmi_spec.args_count =3D 1;
> +		scmi_spec.args[0] =3D map[i].fw_id;
> +
> +		clk =3D of_clk_get_from_provider(&scmi_spec);
> +		if (IS_ERR(clk))
> +			return dev_err_cast_probe(dev, clk,
> +				"Failed to get SCMI clock %u\n", map[i].fw_id);
> +
> +		hw =3D __clk_get_hw(clk);
> +		if (IS_ERR(hw))

[Severity: Low]
Is this error check reachable?  `__clk_get_hw()` extracts the hardware clock
from a valid `struct clk` and returns either a `struct clk_hw *` or `NULL`,
but it never returns an `ERR_PTR`.

> +			return dev_err_cast_probe(dev, hw,
> +				"Failed to get SCMI clock hw %u\n",
> +				map[i].fw_id);
> +
> +		if (!hw) {
> +			/* CLOCK_ATTRIBUTES is not supported */
> +			dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> +			continue;
> +		}
> +
> +		dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> +			map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> +
> +		map[i].hw =3D hw;

[Severity: High]
Does this code leak the consumer `struct clk` instances and module referenc=
es?

`of_clk_get_from_provider()` dynamically allocates a consumer `struct clk` =
and
increments the SCMI provider's module reference.  This function extracts the
`clk_hw` pointer but abandons the `clk` pointer without calling `clk_put()`.

[Severity: High]
Could caching these raw `clk_hw` pointers without a device link lead to a
use-after-free?

If the SCMI provider is unbound via sysfs, it unregisters its clocks and fr=
ees
the `clk_hw` objects.  Because `renesas,scmi-firmware` is a custom property,
`fw_devlink` won't automatically establish unbind ordering.  This means a
subsequent clock request could cause the clock core to dereference a dangli=
ng
`clk_hw` pointer.

>  	}
> =20
>  	devm_kfree(dev, fixed_hws);

[ ... ]

> @@ -152,20 +226,79 @@ static const struct clk_map *fill_clk_map(struct r8=
a78000_cpg_priv *priv,
> =20
>  static int r8a78000_cpg_probe(struct platform_device *pdev)
>  {
> +	struct device_node *scmi __free(device_node) =3D NULL;
> +	struct device_node *scmi_clk_np =3D NULL;

[Severity: Medium]
Does this code leak the device node reference?

`scmi_clk_np` is later assigned the result of `scmi_find_proto()`, which
acquires a node reference, but `scmi_clk_np` lacks the `__free(device_node)`
cleanup attribute and is never manually freed before returning on both succ=
ess
and error paths.

>  	struct device *dev =3D &pdev->dev;
> +	const struct cpg_data *cpg_data;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788338320.gi=
t.geert+renesas@glider.be?part=3D9
