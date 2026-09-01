Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBF64;
	Tue,  1 Sep 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278478; cv=none; b=Z4fwlloTp6SnOov9vkDobMVLE4ZnJrqqFhO3TT3NwfMfrdsf8l58EScZ52xlpGkrHyJgQk7ZoogeHsMhURcUDtoXJsPJGAgqDfFj5efH508Ws/UmqlqGLg0j/Cypjc9tZLw4atGPxtvsXT+1HoNX3Rf6wsYr88ZN+eITRHQsvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278478; c=relaxed/simple;
	bh=eaVVZLA6fjwkvfKQfZRI3lODWKLQV5QHMG3bq56d6E4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cj3V5OzbjY2qcUQv9jea5Vbm5GPczdgQ+Z8eSaGGj5+1WSQYyMJVRBBTH4AIM9eK2xIzhoYRuRRbrs7SDU0K4OUet4c0FHoXd5nnvgqzfS3I7cuN3vB1MvyxhXafWyCtfDMgfbdQgSnx1wiVFy8aa7Zm5o1u+7JURoAWIV/SM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIYUU3kC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIYUU3kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4A01F00A3A;
	Tue,  1 Sep 2026 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278477;
	bh=M1zojFeTtsp7BlJA77yO0/QRBqVG9Q3zAom6qWpnpOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kIYUU3kCJHx50vlgUA2WCpGdgZmtuk8PhHL1GbL7lu7qdNUialMs7LGjx6kKDRBhY
	 yaY9Iege20TYQCtG17VS4QSpmInGpHtT2K8+vd3R98o5qB6R5tyG4c6KWRNuy7wSLx
	 jci2GJaoY+VIptD4FBQ0lJDmX0foOnQvm/C7ZTWPtbgisV4qvzTs3Lw/xs7yRiMC6f
	 hUFcd7RfPkwqHRqKerMUAl1pa8zW1hJf8PeEwg+N/jozndRysU01YVua/tfOTXvWsX
	 /b2m30uTI9YGp+kj1HuSp2Cz6ZrZsAFsJKMbflgOlP+6R9FWpHcWrO9nXdTzcdZKy1
	 41HQ2WFaAedpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] clk: imx: pll14xx: support spread spectrum
 clock generation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: imx@lists.linux.dev, linux-clk@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260901090912.585681-3-dario.binacchi@amarulasolutions.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:01:16 +0000
Message-Id: <20260901160117.0C4A01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] SSC settings fail to apply independently of rate changes, and boot=
loader settings are not cleared.
--

commit 144aa55ef6f15acf393fd40e2f5e663ff37e0de8
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Tue Sep 1 09:05:18 2026 +0000

    clk: imx: pll14xx: support spread spectrum clock generation
   =20
    Add support for spread spectrum clock (SSC) generation to the pll14xx
    driver.
   =20
    Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index b6f1cc9f57005..0c2b812ba20c7 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c

[ ... ]

> @@ -390,6 +453,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, u=
nsigned long drate,
>  		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
>  			       pll->base + DIV_CTL1);
> =20
> +		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
> +						   rate.mdiv);
> +
>  		spin_unlock_irqrestore(&pll->lock, flags);
> =20
>  		return 0;

[Severity: High]
Is deferring the hardware application of the SSC settings to the rate change
callback sufficient?

If the requested clock rate matches the current rate, CCF optimizes out the
call to clk_pll1443x_set_rate(). This means the hardware is never updated
with the new SSC settings if the rate remains unchanged.

[ ... ]

> @@ -437,6 +505,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, =
unsigned long drate,
>  	return 0;
>  }
> =20
> +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +					    const struct clk_spread_spectrum *ss_conf)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +
> +	memcpy(&pll->ss_conf, ss_conf, sizeof(pll->ss_conf));
> +
> +	return 0;
> +}

[Severity: High]
Does this callback need to program the actual hardware instead of just
caching the settings?

When CCF configures SSC via device tree (assigned-clock-sscs), it calls
clk_pll1443x_set_spread_spectrum(). By only caching the configuration in
pll->ss_conf without writing to hardware, the SSC application becomes
entirely dependent on unrelated rate changes.

[ ... ]

> @@ -509,6 +587,7 @@ static const struct clk_ops clk_pll1443x_ops =3D {
>  	.recalc_rate	=3D clk_pll14xx_recalc_rate,
>  	.determine_rate =3D clk_pll1443x_determine_rate,
>  	.set_rate	=3D clk_pll1443x_set_rate,
> +	.set_spread_spectrum =3D clk_pll1443x_set_spread_spectrum,
>  };
> =20
>  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *na=
me,

[Severity: High]
Should imx_dev_clk_hw_pll14xx() explicitly clear the SSCG_CTRL register
during initialization?

Since the driver currently relies on clk_pll1443x_set_rate() to disable any
bootloader SSC setups, it will fail to clear them if no spread method is
configured and the clock rate is unchanged. This can leave an active
bootloader configuration running, leading to incorrect clock behavior and
potential EMI issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901090912.5856=
81-1-dario.binacchi@amarulasolutions.com?part=3D2
