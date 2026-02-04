Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D236A03D
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 06:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770185235; cv=none; b=UzArWKDCGIn5GcfbOKl7EnQPmEY5AscbiXdS2/JqG3QGh86cL2CeMMyfGD8WoeYKGz2Y1YL6mzdPIT9BFQefa66VwDJ078WMoJnhecGA3XtE/qHgN0k9P3kswjmwn98r1OWgLMzt13mjfBLZFUnDSx89L4uE/6IBObLsyWucTWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770185235; c=relaxed/simple;
	bh=aJWFc9Dqymm3VCSpJw46JFL8oAYP6bkNgx8ERpPNyIE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I7N4IrC6/L3dmUcTvdmWifehZsWW3cLrcMAPiHXkGWWNY51kRVLV8N8qPr5ORynvxC18i+7tNzEgs2NuFGzXTVL73mFpeMG1HA9y/mRzEKXxEOKszX9pO5h4liO+1LTtGdFvpYvRLCUawWkt7yU03+dQhybY4mVO2Jl8UlsfMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHtPedoh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHtPedoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39F8C4CEF7;
	Wed,  4 Feb 2026 06:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770185235;
	bh=aJWFc9Dqymm3VCSpJw46JFL8oAYP6bkNgx8ERpPNyIE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CHtPedohSwzXQZNRzulFbPUrT6JR+jeTJyNGeaSHObt4bq2lywsPimhak98rDAX26
	 MGT0s6pSr6HFL1GCt5Aiv0zHPzg5zpzuDLFMoDijR8zpuTj20eC6TVV95wEL8j8OLA
	 Oz0PWffS+V310yYVh7MexYbV4k4osbRxv+s+f+Ifromb1GmMxMC1J3yikLWUTKcl1T
	 wErVupao1h6kzxZpy40MlH97z8fQ4/rESdGSa4pPcqr9FQaAHCUwCNZgQ8NeiD0fxe
	 MEiahN4ni9tpnP/Hs4MOWQgMMYTn3edI/H2GWFL2DkaaJ5pATzoT940U1cs2IeOCKx
	 8yWB43/YbaGGw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260129201003.288605-1-miquel.raynal@bootlin.com>
References: <20260129201003.288605-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] clk: Add support for clock nexus dt bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 03 Feb 2026 22:07:13 -0800
Message-ID: <177018523310.4027.8972043365074024904@lazor>
User-Agent: alot/0.11

Quoting Miquel Raynal (2026-01-29 12:10:03)
> From: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
>=20
> A nexus node is some kind of parent device abstracting the outer
> connexions. They are particularly useful for describing connectors-like

connections?

> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
>=20
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
>=20
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/sour=
ce/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
>=20
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
>=20
> * Nexus OF support:
> bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus=
 node")

Throwback!

> * GPIO adoption:
> c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
>=20
> Expected Nexus properties supported:
> - clock-map: maps inner clocks to inlet clocks,
> - clock-map-mask: specifier cell(s) which will be remapped,
> - clock-map-pass-thru: specifier cell(s) not used for remapping,
>   forwarded as-is.
>=20
> In my own usage I had to deal with controllers where clock-map-mask and
> clock-map-pass-thru were not relevant, but here is a made up example
> showing how all these properties could go together:
>=20
> Example:
>     soc_clk: clock-controller {
>         #clock-cells =3D <2>;
>     };
>=20
>     container: container {
>         #clock-cells =3D <2>;
>         clock-map =3D <0 0 &soc_clk 2 0>,
>                     <1 0 &soc_clk 6 0>;
>         clock-map-mask =3D <0xffffffff 0x0>;
>         clock-map-pass-thru =3D <0x0 0xffffffff>;
>=20
>         child_device {

child-device

>             clocks =3D <&container 1 0>;
>             /* This is equivalent to <&soc_clk 6 0> */
>         };
>     };
>=20
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
>=20
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.=
com>
> ---
>  drivers/clk/clk.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..bb52837a9f76 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5213,13 +5213,13 @@ static int of_parse_clkspec(const struct device_n=
ode *np, int index,
>                 /*
>                  * For named clocks, first look up the name in the
>                  * "clock-names" property.  If it cannot be found, then i=
ndex
> -                * will be an error code and of_parse_phandle_with_args()=
 will
> +                * will be an error code and of_parse_phandle_with_args_m=
ap() will
>                  * return -EINVAL.
>                  */
>                 if (name)
>                         index =3D of_property_match_string(np, "clock-nam=
es", name);
> -               ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-=
cells",
> -                                                index, out_args);
> +               ret =3D of_parse_phandle_with_args_map(np, "clocks", "clo=
ck",
> +                                                    index, out_args);

Looks simple enough. Please add KUnit tests for this though. Should be
doable with something like of_clk_get_hw() assuming it is exported as a
symbol.

>                 if (!ret)
>                         break;
>                 if (name && index >=3D 0)
> @@ -5286,7 +5286,7 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *=
clkspec)
>   *
>   * This function looks up a struct clk from the registered list of clock
>   * providers, an input is a clock specifier data structure as returned
> - * from the of_parse_phandle_with_args() function call.
> + * from the of_parse_phandle_with_args_map() function call.

The comment is bad if it needs to be updated for this. Can you rewrite
it to be more generic and not use specific function names?

>   */
>  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
>  {
> @@ -5374,8 +5374,8 @@ const char *of_clk_get_parent_name(const struct dev=
ice_node *np, int index)
>         int count;
>         struct clk *clk;
> =20
> -       rc =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells", i=
ndex,
> -                                       &clkspec);
> +       rc =3D of_parse_phandle_with_args_map(np, "clocks", "clock", inde=
x,
> +                                           &clkspec);

And this shows that we do this in two places. We probably want a better
wrapper here to parse a clk specifier. Are we missing parsing
"clock-ranges" for of_clk_get_parent_name()? Maybe this should just be
of_parse_clkspec() with a NULL name argument. Similarly we can get tests
for this function too.
