Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2853445E;
	Tue, 29 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693799; cv=none; b=n2EEVl24mjFICZu4oYu9QmqbGAlcnIk62Z7lVwySIZUlwOfS6hmTIeR5/CS+nfMjOExPSyPS7mxzfB23NivZQlBcEtINd+85Dl0ZgNmfbG3f3/h2xzVAiP8S/2xJUTCdEjfslAUR7IFPJctd7Mmg7mhqVx2i3PkDZ5Ob/merEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693799; c=relaxed/simple;
	bh=rSxjdGQfZIJ8CQNdTW7TlLc0CemS2l3tzLUeBCk6EOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L3E+W+1NkJmk8rIBbzF36mhMiaPElPmaXD8lCAB5UO/i/1j6eUAYUZ1HcoPsWJ8OeMy5qlNAvBgWCJCVx7bi5UdranmAV3vgj4x40arjxFxZZix1R+ex2CSU/hTGGF/mMD70VX6Xw5mhbssniqKGLrrRINr11ZIWPzd6vKrmKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYf3Iz9t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYf3Iz9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187A21F000FF;
	Tue, 29 Sep 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790693778;
	bh=jYmPAOIdIrdYP5wdtmztG65ddRMtbNz6872YAL1mwys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jYf3Iz9tcGih/QrO5AGIcBDg8kndE2PpX+L2mEiUkiUdzj1xnCityCQbOlT1eQech
	 YrjSrPz8BpvEtVGf91S4DXbxVksG6mZIKZ/VUWl8SuaUwt81vFLX4FFERd+dMvf9TB
	 esEbcnGWkNshb6ut1w7F7+KXsLeaq6K9djZZbcSloHx7Nzu7Zfch+dGEvWwUcLbe1Y
	 k5YK4EYrcpDg3deJ2X5z8zjO07Amr9qySSDOjUYgtzFD3DoBPW/BOX6iwKY/wiiDvQ
	 lRC2AMvC/i4ezbPmvNsGDDjEZ/M0Gp53CmVlFDkFe1omEIR4JSpdsVUM+6PIh207l6
	 4Yw4H0HG/fPBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 14:56:17 +0000
Message-Id: <20260929145618.187A21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: nuvoton: missing IS_ERR check causes permanent probe deferral
- [Medium] clk: nuvoton: hardcoded parent strings cause orphaned gate clocks
--

commit 6ea21fa12153954a64270097e3f0cfbc24e8a162
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: get HXT/LXT from DT

This commit updates the driver to get the HXT and LXT crystal oscillator
inputs from the device tree using devm_clk_get_optional(). It points the
internal clock table to the discovered clk_hw instances instead of always
registering fixed rate clocks. It falls back to fixed rate clocks for
older device trees.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index ceebcbd8c18b3..81a412b1706e4 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c

[ ... ]

> @@ -240,10 +256,10 @@ static int ma35d1_clocks_probe(struct platform_devi=
ce *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
> +	hws[HXT] =3D ma35d1_clk_xtal(dev, "hxt", 24000000);

[Severity: High]
Does this code silently ignore probe deferrals?

The ma35d1_clk_xtal() function in drivers/clk/nuvoton/clk-ma35d1.c calls
devm_clk_get_optional(), which can return ERR_PTR(-EPROBE_DEFER) if the
external clock provider hasn't probed yet.

Because ma35d1_clocks_probe() assigns this directly to hws[HXT] without an
IS_ERR() check, the probe function will complete successfully and return 0
instead of deferring.

The error pointer then permanently resides in the provider's onecell data,
and downstream consumers requesting these clocks will face infinite probe
deferrals.

>  	hws[HXT_GATE] =3D ma35d1_clk_gate(dev, "hxt_gate", "hxt",
>  					clk_base + REG_CLK_PWRCTL, 0);

[Severity: Medium]
Will this hardcoded parent string lead to an orphaned gate clock?

Since the driver dynamically fetches external clocks from the DT in
ma35d1_clocks_probe(), the Common Clock Framework will resolve the string
"hxt" against the provider's global clock name.

If a device tree supplies an external clock with a different global name
such as "clk_hxt", the framework will fail to match it and the gate clock
will be orphaned.

Should this pass the resolved clk_hw_get_name(hws[HXT]) instead of relying
on exact string matches against DT nodes to ensure reliable linkage?

> -	hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
> +	hws[LXT] =3D ma35d1_clk_xtal(dev, "lxt", 32768);

[Severity: High]
Does this face the same probe deferral regression as HXT?

In ma35d1_clocks_probe(), without an IS_ERR() check, an ERR_PTR from
ma35d1_clk_xtal() allows the function to silently succeed despite missing
dependencies, permanently storing the error pointer in hws[LXT].

>  	hws[LXT_GATE] =3D ma35d1_clk_gate(dev, "lxt_gate", "lxt",
>  					clk_base + REG_CLK_PWRCTL, 1);

[Severity: Medium]
Can this string cause the same orphan regression as HXT_GATE?

Passing the literal string "lxt" to ma35d1_clk_gate() as the parent name
could fail to match if the external DT clock has a different global name.

>  	hws[HIRC] =3D ma35d1_clk_fixed("hirc", 12000000);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-perso-ma35=
d1-upstream-clk-v5-0-68533e935ee4@bootlin.com?part=3D8
