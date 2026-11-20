Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795168845;
	b=2FnBWn+XZvgrxA09YHUEtF3nZUjQWiwpdUreeq3xUKE3t3YYjI4uFYfatfr+UUZc2AXx
	 hR/aembrSZMYS5bw3iC18IKjMsmh1n/c6qb4x2aCR+7TSfaxIaReD25vpzCNOnw93e/sJ
	 wfQDid8q0TTEj8gHwrQhUXWVvbNKiXBluayReMDzIMrGQKalDkIUeUyO9VNcdFZ13kJST
	 NhrzUOnLJ4G/xjxBnWzTOG2hJIhAtpJOw5jkvGf/JUzNmaptyGgDaK9WnapD6OH5pnr0E
	 sr8P8huDHuH5AFPxGXCQgjgt1r2ySmW3eVv6S1FcwJje5+nnE1Vk86w4NDp/EToOfdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168845;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Q+4Bel0/0Td/LHufY+LdhNApw47lN/ZWvaYrdGVnaYQ=;
	b=mbEph+2GLtKI5VxHn74YSW3RR91RbwYFVclam6B/sbnwjKPOJg3f+0hcEgSBrzQWzDCf
	 42byKzJkP1rEn8rKJGySpilOgcWKVKLGxPCL0A2gsqKz5iB9opt+0Uv5mqyMKTI3GGwx3
	 yVl6alIrKx6bCoOBiVwdI1rSu+CXGlYkaJ6hcPzF4yOevkjS3VX1ntSS+LFDAi3WIO5y8
	 5tWfnjAyH2MkprDwNIvUsphjOUooYzunkRopCK7V7E1qtpEx775ias0H4/TSsrNTfdZaC
	 NtxMlhp0lJKMJfWW2JJWAlbKOPulpSgAZcu+M/uLXQbChzudgifyG1Wu7VKM7qs0sCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=c4BlSOkl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A0606A320;
	Fri, 20 Nov 2026 10:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=c4BlSOkl
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8B140200EDB;
	Fri, 20 Nov 2026 11:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795168842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+4Bel0/0Td/LHufY+LdhNApw47lN/ZWvaYrdGVnaYQ=;
	b=c4BlSOklF59hL1pYawmhsU7RqzPUnfiS/I+4hUpR1d5qbSH0pLMOiaqWq4WVymDk3zKY1G
	96gwtfGlD29ilXfUKD4W41cJvC6SxystFjfzEei2hARgS9+7Mdeqgj+NSivCha9X/L0it7
	eKd1Jnb63zeFF4UPnz94GNBTL4RgDR2Vfl4qpKMigcVJzy2m+1WF32OvqZ7G7fugS2sO6s
	8oKA20OvCvUohEIr+0poIlmahZfghRCFx/EOy6QXINpiVS1R3lrD7pgnr+h9jt8aAgSul1
	yashgq64uaiNprTc3TXc+NHmippMvGm2ZQbnHn+KfbWYkIMlBTQrOKVcfCZqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795168842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+4Bel0/0Td/LHufY+LdhNApw47lN/ZWvaYrdGVnaYQ=;
	b=M3g3EI2eNuur12IFwUgc0ShD6XG5EXLIMVp+p+PU7yBkVYn78wqAmQkh/S/aC77sYDu3kq
	0mZtqm+3WMMwRXdTqtXBYlOK02kxIN0yXzT8Akd3Ach9dBdNHp6H+4iS+lpKSkXaqPFJEv
	SA98JSi9yCXTDNpy7pJu343eUyMAVgayq1Y5sTGKpZuA/MHS2YSnCCr6Rc6WAvoWP8vRhx
	KHxaBmYpUdEUGMcni2T5rZcc+VaiJ7ut4ou56ydvF3otGcYG0q6Yb16d0kTwvF5NxwIjjF
	FoTz/XosH5wwoK2EIgZ/G5vY/6L8WcZ6JfSPlWEZIEf8AF1ygecllmcqojsHrQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795168842; a=rsa-sha256;
	cv=none;
	b=GbgTki+Fmq8ov7IxA7lwbvK71uCkMFhYXPXGNmsbsDu2KybFR5A6vosczLGDqG15odxBym
	DqOB6bXprMXeFwgazb3MV5Z/gsQyazNWyh9uSLAvKTtrHje6wXZ+LzNo2mdsjI0WIoMbgV
	ocA24tEUBgQVn3RC9V+vgiIoiSDP4v0K6dbGYC3eoWF2Iq7WDaSBe5TTDs2+3SOS6vKsva
	KCocofKI7IemlPZFUAdg5+rOxMt06HnE9mbhyIObP9NJPyGuZ7ty2UiDp6msBVq6fMkPND
	l9DzVGDrEaRAaYwT5zWp9zTK+ZKq+mPJ+nF9XB+XyxH0IFWiA4MEETg+OkSqXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <3ef39f9c3698da4a8021ded56d8fca9ae9ccfb05.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: khendry@reliablecontrols.com, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm	 <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?=	 <clement.leger@bootlin.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn	 <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King	
 <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Fri, 20 Nov 2026 11:00:42 +0100
In-Reply-To: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
References: 
	<20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
	 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-19 at 09:57 -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> The rzn1 system controller has two resets that need to be cleared for the
> mii converter to work. They are not directly associated with any clocks
> so they need a reset controller to set them.
>=20
> They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:
>=20
> Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
> Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).
>=20
> Add a reset controller and add resets for those bits.
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 64 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 3df3f2b2c6de..547e8d82f1cf 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -21,6 +21,7 @@
>  #include <linux/pm_clock.h>
>  #include <linux/pm_domain.h>
>  #include <linux/reboot.h>
> +#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include <linux/soc/renesas/r9a06g032-sysctrl.h>
>  #include <linux/spinlock.h>
> @@ -675,6 +676,11 @@ static const struct r9a06g032_clkdesc r9a06g032_cloc=
ks[] =3D {
>  		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
>  };
> =20
> +static const struct regbit r9a06g032_resets[] =3D {
> +	RB(0x188, 3),
> +	RB(0x188, 4),

I suggest to use designated initializers:

	[R9A06G032_RST_TS] =3D RB(0x188, 3),
	[R9A06G032_RST_MIIC] =3D RB(0x188, 4),

to document the association and make sure there are no off-by-one
errors.

> +};
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

I'd use a static inline function for this.

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
> +
> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	r9a06g032_reset_set(rcdev, "reset", true, id);
> +	udelay(5);
> +	return r9a06g032_reset_set(rcdev, NULL, false, id);
> +}

Please don't implement the reset op unless really needed for
compatibility with actual, self-clearing reset controllers.

If it is needed, please explain why. If so, is this delay enough for
both resets? Is it enough for any other resets this reset controller
driver may support in the future?

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
> +
> +static int r9a06g032_reset_status(struct reset_controller_dev *rcdev,
> +			   unsigned long id)
> +{
> +	struct r9a06g032_priv *priv =3D rcdev_to_priv(rcdev);
> +
> +	return clk_rdesc_get(priv, r9a06g032_resets[id]);
> +}
> +
> +static const struct reset_control_ops r9a06g032_reset_ops =3D {
> +	.reset =3D r9a06g032_reset,
> +	.assert =3D r9a06g032_reset_assert,
> +	.deassert =3D r9a06g032_reset_deassert,
> +	.status =3D r9a06g032_reset_status,
> +};
> +
>  static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -1404,6 +1460,14 @@ static int __init r9a06g032_clocks_probe(struct pl=
atform_device *pdev)
>  	if (error)
>  		dev_err(dev, "Failed to populate children (%d)\n", error);
> =20
> +	clocks->rcdev.ops =3D &r9a06g032_reset_ops;
> +	clocks->rcdev.of_node =3D np;
> +	clocks->rcdev.of_reset_n_cells =3D 1;

Don't set of_reset_n_cells, as of_xlate isn't set either.

fwnode_reset_n_cells will be set to 1 by default in
reset_controller_register().

> +	clocks->rcdev.nr_resets =3D ARRAY_SIZE(r9a06g032_resets);
> +	error =3D  devm_reset_controller_register(dev, &clocks->rcdev);
                ^
Superfluous whitespace.

> +	if (error)
> +		return error;
> +
>  	return 0;

Could be simplified to just:

	return devm_reset_controller_register(dev, &clocks->rcdev);


regards
Philipp
