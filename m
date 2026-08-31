Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC537F315;
	Mon, 31 Aug 2026 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202137; cv=none; b=IPmzJ6RtDXrzXO0jVWZO6AuYid5j4NsuVjqgpKC9tJATZRXc+jxIKxyFA1rZe3W4dTYqD2zI6e8+8t+yLL487sasmpyl8QEfnWOTqkLkw29i9OGXPG4dvtCbYMNimJipIxeIP2IY0G0AD3YCYdXmzBU4QaS4E3ZAxI93cibBLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202137; c=relaxed/simple;
	bh=pCUqWkqCpAo1kbQstbnKqQOO2cfvERuDun1o+DvD2PI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WV0aAmuPl3S4KJg906Y3yDN2qrCSQoHgds2DX/QWFHJlZTeJgm16j8tqo91rFeJnbbzH8BD7N8eBMG7fxaBk0bB8URzuU3pE5jpVTBM8YNNKjybci4S8qUKReGjxi4I59BxtD9jawtAEq8Y1MD5VveI3VEJYrvpoX59fEBTJ5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVOmkQps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVOmkQps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5241F000E9;
	Mon, 31 Aug 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202135;
	bh=ERqenx5myDBJRV2d0fLRAHzSyACgToMoRs3RJ8bX2j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVOmkQpsHF9+25wnkdxmgnLxji4f2/Z9Q7xTeR+494RobPuK3Jal+UpbWcCLSlV7j
	 A2F7QZOPW4tRL5egkT/9YW/+OhDdXkARJYXfAo1aUoTcdmeG2f9ZvKRQUX212BHB/I
	 PFu9vc/KUzsdT2+lzPFS1ZiaqiuC5dT+BOJ0MvMPQtss9r0uZqN90MGz1qCDqB5wgR
	 m88Xrkhuo1CrYggqMWjGxSWpwTR12M+c2IzZeIPdone3hohbv5KDEyaE/J/4KSS6Mv
	 uKtAWtmxYItEcEBoMI0h0JxAQKlh0d2jkt9Oy0E+z83OejHtT4AO9UKMj4dGyl1C+a
	 kGEE5Wj8cuCeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/1] clk: imx: pll14xx: support spread spectrum
 clock generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: Frank.Li@kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
References: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
 <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:48:54 +0000
Message-Id: <20260831184855.3E5241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing validation of spread spectrum parameters leads to division=
 by zero panics.
- [High] Spread spectrum cannot be disabled and fails to clear stale hardwa=
re state.
- [Medium] Integer overflow in spread spectrum rate calculation (`mrr`).
- [Low] Missing clock infrastructure causes fatal compilation errors.
--

commit ab4effb250732b499e28c0bd53e1f0ee8a868e4c
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

    clk: imx: pll14xx: support spread spectrum clock generation
   =20
    Add support for spread spectrum clock (SSC) generation to the pll14xx
    driver.
   =20
    Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
   =20
    Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index b6f1cc9f57005..27a637847f570 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -5,6 +5,7 @@
> =20
>  #define pr_fmt(fmt) "pll14xx: " fmt
> =20
> +#include <dt-bindings/clock/clock.h>

[Severity: Low]
Does this file build cleanly? It appears <dt-bindings/clock/clock.h> does
not exist. Additionally, struct clk_spread_spectrum added to struct
clk_pll14xx, and .set_spread_spectrum assigned in clk_pll1443x_ops are
undefined, which will cause fatal compilation errors.

[ ... ]

> @@ -366,6 +377,37 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, =
unsigned long drate,
>  	return 0;
>  }
> =20
> +static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +					       unsigned long parent_rate,
> +					       unsigned int pdiv,
> +					       unsigned int mdiv)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +	struct clk_spread_spectrum *conf =3D &pll->ss_conf;
> +	u32 sscg_ctrl, mfr, mrr, sel_pf;
> +
> +	if (conf->method =3D=3D CLK_SSC_CENTER_SPREAD)
> +		sel_pf =3D SEL_PF_CENTER_SPREAD;
> +	else if (conf->method =3D=3D CLK_SSC_UP_SPREAD)
> +		sel_pf =3D SEL_PF_UP_SPREAD;
> +	else if (conf->method =3D=3D CLK_SSC_DOWN_SPREAD)
> +		sel_pf =3D SEL_PF_DOWN_SPREAD;
> +	else
> +		return;

[Severity: High]
Does this early return prevent spread spectrum from being disabled? If the
modulation method is unconfigured or set to disable, this path bypasses
clearing the SSCG_ENABLE bit.

If a bootloader had previously enabled spread spectrum, or if it is
dynamically disabled at runtime, the hardware may continue modulating using
stale configuration parameters alongside newly set PLL dividers.

> +
> +	sscg_ctrl =3D readl_relaxed(pll->base + SSCG_CTRL);
> +	sscg_ctrl &=3D ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_=
MASK);
> +
> +	mfr =3D parent_rate / (conf->modfreq_hz * pdiv * BIT(5));

[Severity: High]
Can this calculation result in a division by zero panic? If
conf->modfreq_hz is uninitialized (0), this will cause a direct division
by zero.

Furthermore, if parent_rate < conf->modfreq_hz * pdiv * 32 (which is
possible with large pdiv values and a standard 32kHz modfreq), integer
division truncates mfr to 0. This will subsequently cause a division by
zero panic during the mrr calculation while clock subsystem locks are held,
permanently deadlocking the system.

> +	mrr =3D (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);

[Severity: Medium]
Does the calculation 10000 * mfr risk a 32-bit integer overflow? Since
mfr is a 32-bit unsigned integer and 10000 is a 32-bit signed literal, the
multiplication is performed using 32-bit arithmetic.

If an anomalous device tree input causes mfr to exceed 429,496, the
multiplication will silently overflow the 32-bit boundary, producing a
truncated denominator and an invalid mrr value being pushed to the
hardware.

> +
> +	sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
> +		FIELD_PREP(MRAT_CTL_MASK, mrr) |
> +		FIELD_PREP(SEL_PF_MASK, sel_pf);
> +
> +	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831154752.1540=
1-2-dario.binacchi@amarulasolutions.com?part=3D1
