Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197519;
	b=bKUh9L81MKzjP2AT0SkEL0KRy3cQYLWKEjgRr7z7VVniZCZ1sYjTQKI/Kgj7my16f98p
	 8KaJ4wUtAr4GYhHbqDb1vbT4ZC+AopZUFnXHA3G8uRT816a0KhTymu9iiY5FWbxJT+c/d
	 4bAlwenP9vDpfsUhkCPKI752XgIJLxFkuKmbDkDZC0ROX2/fK2MlaWEV/SyuqhmOdSQHC
	 gj2cUHgEL9oagokBqhlaqG5aMg7kLNGztlvLiSAb+59SY/PGNXWxkYDMvFRODwjvJd8y1
	 ws3WR1WpanJ8vDiIqCzrw6tyGdRw0B7A243AJa5UvNOkwSRzmkGieJ+zMZ1UZnEyWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sox7amMXycRbrAsCltoWwm5OLlq3yEZVuhVhsbcinpM=;
	b=4Ql+u0yXPYTejSxGLDRoM6RsGF1d/n3TOVmGKC0Yv2VUL2UI+AgxfNBkwwTDylmiuytI
	 z/Rg9hg8T3t6MgxlE7JiHu3ALWGJqiZKYw8czdBIN6PRkhEL5G51vWUt/7H5F24FVzANF
	 5gtqjCNe8JOyCWrjPV2lSG1Sl4OmRd63o5QxK8DElTwqYyMwdPHaiaTwbIr8FbXD3Y4JW
	 sxbcFDRc09SWD3av3kCB4GfBCAhDhG/RqMABH8L4UgsCJ34+kxJaUPvM9jSMVq2TJ8CRI
	 umYnVELBLGx2cH3qv0u88rEv8l+yelVM3AFl4Bx2vsqi9hP0SPVpFS8alQjrBoF7ljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bneqPubr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD6606A32C;
	Fri, 20 Nov 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bneqPubr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4089D1F000C6;
	Fri, 20 Nov 2026 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197518;
	bh=Sox7amMXycRbrAsCltoWwm5OLlq3yEZVuhVhsbcinpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bneqPubr97hlowVFBb56KWgJnmeuHwscHWfHvlQUdo8UEB6oE6cxTK0pCREp24coz
	 4KozW/d2cdc9sbImeZGTSScOXPOv2m/AjN9QqL2BPRM6y7EEGXlAK0FehGH0deqncz
	 xN6hHDQG3TmP00vJLJW4K5NwLq+RRdIo/K3PZw8L4dg6Sb46Yehi66pNiVc4uNx2HV
	 DGBT3k3dV+zIPB3hdYZgIP+R0Pli78nw4gsQw0/CHxHotDv/2u5IfkHCJr/hLD3KRU
	 s4eKTePTVP3gHjsxPJpTeEfWOno6YKOgv7slu93+7z/eGfAGIDj4wmJQUEWjULJtPj
	 oJ5f5UGG2kwag==
Message-ID: <sashiko-outbox-225759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:58:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] clk: renesas: r9a06g032: missing rcdev member in struct
  r9a06g032_priv
- [High] clk: renesas: r9a06g032: 0-based r9a06g032_resets[] mismatches
  1-based DT IDs
- [High] clk: renesas: r9a06g032: inverted reset polarity in
  r9a06g032_reset()
- [Medium] clk: renesas: r9a06g032: inverted return value in
  r9a06g032_reset_status()
- [Medium] clk: renesas: r9a06g032: dangling sysctrl_priv on reset
  registration error
- [Low] clk: renesas: r9a06g032: unused func parameter in
  r9a06g032_reset_set()
--

commit c1ea072ef200e955b9711c8cf6fa8c5c06a195de
Author: Kyle Hendry <khendry@reliablecontrols.com>

clk: renesas: r9a06g032: Add reset controller

This commit registers a reset controller in the r9a06g032 clock driver to
control the RSTN_CLK25 and RSTN_ETH active-low reset bits in the
PWRCTRL_SWITCHCTRL register.

> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 3df3f2b2c6de7..547e8d82f1cf1 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
[ ... ]
> @@ -675,6 +676,11 @@ static const struct r9a06g032_clkdesc r9a06g032_cloc=
ks[] =3D {
>  		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
>  };
> =20
> +static const struct regbit r9a06g032_resets[] =3D {
> +	RB(0x188, 3),
> +	RB(0x188, 4),
> +};

[Severity: High]
Does the 0-based indexing of r9a06g032_resets[] mismatch the 1-based DT
binding definitions?

include/dt-bindings/clock/r9a06g032-sysctrl.h defines R9A06G032_RST_TS as
1 and R9A06G032_RST_MIIC as 2.  With clocks->rcdev.nr_resets set to
ARRAY_SIZE(r9a06g032_resets) (2) and the default
fwnode_reset_simple_xlate(), requesting R9A06G032_RST_MIIC (2) fails with
-EINVAL, and requesting R9A06G032_RST_TS (1) indexes r9a06g032_resets[1]
(bit 4, RSTN_ETH) instead of bit 3 (RSTN_CLK25).

> +
>  struct r9a06g032_priv {
>  	struct clk_onecell_data data;
>  	spinlock_t lock; /* protects concurrent access to gates */
> @@ -1307,6 +1313,56 @@ static void __init r9a06g032_init_h2mode(struct r9=
a06g032_priv *clocks)
>  	writel(usb, clocks->reg + R9A06G032_SYSCTRL_USB);
>  }
> =20
> +
> +#define rcdev_to_priv(x)	container_of(x, struct r9a06g032_priv, rcdev)

[Severity: High]
Is struct r9a06g032_priv missing the struct reset_controller_dev rcdev
member?  Without it, rcdev_to_priv() and clocks->rcdev in
r9a06g032_clocks_probe() fail to compile when CONFIG_CLK_R9A06G032 is
enabled.

> +
> +static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
> +				  const char *func, bool set, unsigned long id)
> +{
> +	struct r9a06g032_priv *priv =3D rcdev_to_priv(rcdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	clk_rdesc_set(priv, r9a06g032_resets[id], set);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}

[Severity: Low]
The func parameter in r9a06g032_reset_set() is unused and triggers a
-Wunused-parameter warning under W=3D1 builds.

> +
> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	r9a06g032_reset_set(rcdev, "reset", true, id);
> +	udelay(5);
> +	return r9a06g032_reset_set(rcdev, NULL, false, id);
> +}
> +
> +static int r9a06g032_reset_assert(struct reset_controller_dev *rcdev, un=
signed long id)
> +{
> +	return r9a06g032_reset_set(rcdev, "assert", false, id);
> +}
> +
> +static int r9a06g032_reset_deassert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	return r9a06g032_reset_set(rcdev, "deassert", true, id);
> +}

[Severity: High]
Is the reset polarity in r9a06g032_reset() inverted?

Because these resets are active-low (false asserts and true deasserts, as
in r9a06g032_reset_assert() and r9a06g032_reset_deassert()), passing true
before udelay(5) and false afterward deasserts the line and then leaves
the hardware held in reset.

> +
> +static int r9a06g032_reset_status(struct reset_controller_dev *rcdev,
> +			   unsigned long id)
> +{
> +	struct r9a06g032_priv *priv =3D rcdev_to_priv(rcdev);
> +
> +	return clk_rdesc_get(priv, r9a06g032_resets[id]);
> +}

[Severity: Medium]
Should r9a06g032_reset_status() invert the return value of
clk_rdesc_get()?

reset_control_ops.status must return a positive value when the reset is
asserted and 0 when deasserted, whereas clk_rdesc_get() on these
active-low bits returns 0 when asserted and 1 when deasserted.

[ ... ]

> @@ -1404,6 +1460,14 @@ static int __init r9a06g032_clocks_probe(struct pl=
atform_device *pdev)
>  	if (error)
>  		dev_err(dev, "Failed to populate children (%d)\n", error);
> =20
> +	clocks->rcdev.ops =3D &r9a06g032_reset_ops;
> +	clocks->rcdev.of_node =3D np;
> +	clocks->rcdev.of_reset_n_cells =3D 1;
> +	clocks->rcdev.nr_resets =3D ARRAY_SIZE(r9a06g032_resets);
> +	error =3D  devm_reset_controller_register(dev, &clocks->rcdev);
> +	if (error)
> +		return error;

[Severity: Medium]
If devm_reset_controller_register() fails here, does returning an error
leave sysctrl_priv dangling after devres frees clocks?

Earlier in r9a06g032_clocks_probe(), r9a06g032_add_clk_domain(dev)
registers an unmanaged genpd provider, sysctrl_priv is set to clocks, and
of_platform_populate() creates child devices.  If
devm_reset_controller_register() fails afterward, devres frees clocks and
unmaps clocks->reg while sysctrl_priv remains non-NULL, causing a
use-after-free in r9a06g032_sysctrl_set_dmamux(), and child devices
probed during of_platform_populate() cannot look up the reset controller
yet.  Registering the reset controller before r9a06g032_add_clk_domain(),
sysctrl_priv =3D clocks, and of_platform_populate() avoids both problems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-rzn1-miic-=
resets-v1-0-feee2bb28bb4@reliablecontrols.com?part=3D2
