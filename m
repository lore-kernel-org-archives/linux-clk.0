Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E65383CA;
	Wed, 30 Sep 2026 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790041; cv=none; b=Gfe45piUW48BfxW+QmRkgNOdy2BzYnqHA6PtX6YezVtXhu8zdSP8J63Rjqjskb/SmKx30sT3GSvOntqRGBIeuCMdsT2LjiQP38vPK87iBC4vwulr6ND7J+amY81MRQ48AsJwrJ5dyrj9c4pl8m40GgPZl+PbWrnC/uearf4f1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790041; c=relaxed/simple;
	bh=+ZYIgOiWRJZv5s1qmlkWom3Tv0z1ZdVAJWXE59ffd3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tcct4DkRQbPaHVmg9t9OGK0NxP2fZuET8Te2q59MQrUZs8IHu/SfokkZre8BxosHnwQ3I4pFMBdxd8iSgH/DMqenQ3PZw6QGHaQwxPTSnOKF3pN2pPtRtHpF0IZQm4fM0zjGdzHqqnagujfi0Qcw+Stg2NDzbw0rwBXUFM81m1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9FD1aSq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9FD1aSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB581F0089A;
	Wed, 30 Sep 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790790039;
	bh=WNHSqYHlDsImex2MfzWYf/RgZuqHZz4Ka+QVBGQrUcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9FD1aSqVDeVycbaWLOz+N3UzYxFJK2adfPJLOJYCtoId9AyLFxk5zkTymR/KHjCG
	 qqI+7BOoc3wMip6Wcm3sWYUeLUe9YG6Y9nktf/Yb50s1v6pwdQnokis/mBRukg0Yte
	 42ZMollccymXV9OG8/xNVgh6Bvp4WVLozFQp/U8BmHyWHGRmG46kuTLBqisdiFVyC2
	 bjHW5KB4Do4OfXxR7CRxQDVKLOW4TF1NEaI/XYntXL2Ztl92sWmObxrTMDqgKTbhNv
	 9TOjQJB2u3/V+ZNYAmXuwmYaooWjH4Ilhy6NoFBe4va+3hULTeO9eJ0fp0akNvpcvj
	 79CDb35mNxOpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/12] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 17:40:38 +0000
Message-Id: <20260930174039.5DB581F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: missing IS_ERR check in ma35d1_clk_gate_parent() causes CCF c=
rash
--

commit 7dc0319906dcefbcabf738c0cfa86cd02109de8b
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT

HXT and LXT are crystal oscillator inputs of the clock controller, they
are described in the DT, so retrieve them, in order, and store them in
their respective HXT/LXT hw table entries.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index ceebcbd8c18b3..d955d79abdd2d 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c

[ ... ]

> @@ -191,6 +192,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device =
*dev, const char *name, cons
>  				    reg, shift, 0, &ma35d1_lock);
>  }
> =20
> +static struct clk_hw *ma35d1_clk_gate_parent(struct device *dev, const c=
har *name,
> +					     struct clk_hw *parent,
> +					     void __iomem *reg, u8 shift)
> +{
> +	return devm_clk_hw_register_gate_parent_hw(dev, name, parent,
> +						   CLK_SET_RATE_PARENT,
> +						   reg, shift, 0, &ma35d1_lock);
> +}
> +

[Severity: High]
Does this wrapper need to check if the parent clock is valid before passing
it to the core clock framework?

Looking at ma35d1_clocks_probe() below, if the fallback clock creation via
ma35d1_clk_fixed() fails, it returns an ERR_PTR which is stored in hws[LXT].

[ ... ]

> @@ -240,12 +252,27 @@ static int ma35d1_clocks_probe(struct platform_devi=
ce *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
> -	hws[HXT_GATE] =3D ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] =3D ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks =3D devm_clk_bulk_get_all(dev, &clks);
> +	if (num_clks < 0)
> +		return num_clks;
> +
> +	if (!num_clks) {
> +		dev_err(dev, "missing crystal input clocks\n");
> +		return -ENODEV;
> +	}
> +
> +	hws[HXT] =3D __clk_get_hw(clks[0].clk);
> +
> +	if (num_clks > 1)
> +		hws[LXT] =3D __clk_get_hw(clks[1].clk);
> +	else
> +		/* Old DTs do not describe the low-speed crystal */
> +		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
> +
> +	hws[HXT_GATE] =3D ma35d1_clk_gate_parent(dev, "hxt_gate", hws[HXT],
> +					       clk_base + REG_CLK_PWRCTL, 0);
> +	hws[LXT_GATE] =3D ma35d1_clk_gate_parent(dev, "lxt_gate", hws[LXT],
> +					       clk_base + REG_CLK_PWRCTL, 1);

When hws[LXT] containing an ERR_PTR is passed to ma35d1_clk_gate_parent(),
it gets sent directly to devm_clk_hw_register_gate_parent_hw().

Because the Common Clock Framework does not validate parent arrays for error
pointers, this will cause a kernel panic when the core later resolves the
parent map and dereferences the invalid memory.

Could we add an IS_ERR() check either around the fixed clock allocation
or inside ma35d1_clk_gate_parent()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-perso-ma35=
d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com?part=3D8
