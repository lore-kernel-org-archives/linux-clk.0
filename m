Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D733509B
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787083; cv=none; b=lAt4hP+Ny5fvrKdlya8WRVgNCSvy/1iplOPqRTm6NtOCj1B85f/b8EAkxgo+vbAcsACRsZQxdWnlejBwO89UXhQYrV5L2mcpO3R6umkRG7xQ06X7v1J8/TiStnDJy2Pj1gRaMY6jlHEc8G6GV02bd0pnsXfdqe4OTyUsdzo3nTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787083; c=relaxed/simple;
	bh=EKDxQsLJX4V/QEuiuV599OIZpT28g5WCECmuckUkKao=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fdIB4zvlP9rc5fS4pBn5z3T2dolTa18so4uaU3399KOWs+CS6qGUC2149qDEgsupMw6ZZipU0AAvcDNZXTrAUcsuBG1Ekyorh4Z5paIISE/x78/oNEWMvZ+rF38syXHlugCgTVpMgpiU7UbqMQxVl0mzNx/+q+1k+YeDPDdaQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr6KB7Aw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr6KB7Aw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE1A1F0089B;
	Mon, 12 Oct 2026 06:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787081;
	bh=lDHpVGYrnJVXt5af1rZQYqnnlr6ZbuqIHgFOpgXkwi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cr6KB7AwG7QnWI1wQ9Y9+Fm/Mvx7zR6SXC1UihQCrID1eMgxaXRDXNo1so2VHcKyC
	 gCDB5OcFaefYofCsRRCqeHOkJebC3btc16t5frVaDtwg8haAuK37JpnbanOg8mZGpL
	 94HDDToACR8kJ4dojjk+EhTGHdbR/HjSfNnq9O4WcHsY2jWtkdwVuLlUblIlTqAE3D
	 G5voImF+EoySrPcJFqGF+oqvRaKbzp2jCK7mZnAfw1bwVKNSReyd7xWBFMLdsGXObi
	 wYinJe68Z6lHuqt+XnVNSdf8yGIowd8l6tSqXSSqwT392ReEGi3KJEtdvB2HEEGFoL
	 QZOcvKLrpbRvA==
Message-ID: <sashiko-outbox-167746@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] clk: nuvoton: ma35d1: use the generic divider for
 the ADC clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261012063020.3331443-3-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
 <20261012063020.3331443-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:38:01 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: core: underflow and incorrect rounding for CLK_DIVIDER_EVEN_I=
NTEGERS without a table
--

commit c5f5b7cbd52c161c065e9dedca522e878812d14a
Author: Joey Lu <a0987203069@gmail.com>

clk: nuvoton: ma35d1: use the generic divider for the ADC clock

This patch migrates the ADC clock divider in the Nuvoton MA35D1 driver to u=
se
the generic divider with CLK_DIVIDER_EVEN_INTEGERS and
CLK_DIVIDER_ROUND_CLOSEST. It replaces a custom implementation and drops an
out-of-range bitmask that was previously OR'd into the register.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 3102c65bfe9a0..94a3e904202b2 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -1017,10 +1017,11 @@ static int ma35d1_clocks_probe(struct platform_de=
vice *pdev)
>  	hws[QEI2_GATE] =3D ma35d1_clk_gate(dev, "qei2_gate", "pclk1",
>  					 clk_base + REG_CLK_APBCLK2, 14);
> =20
> -	hws[ADC_DIV] =3D ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
> -					     &ma35d1_lock, 0,
> -					     clk_base + REG_CLK_CLKDIV4,
> -					     4, 17, 0x1ffff);
> +	hws[ADC_DIV] =3D devm_clk_hw_register_divider_parent_hw(dev, "adc_div",=
 hws[PCLK0], 0,
> +							      clk_base + REG_CLK_CLKDIV4, 4, 17,
> +							      CLK_DIVIDER_EVEN_INTEGERS |
> +							      CLK_DIVIDER_ROUND_CLOSEST,
> +							      &ma35d1_lock);

[Severity: High]
Does migrating to the table-less generic CLK_DIVIDER_EVEN_INTEGERS expose t=
his
clock to an underflow bug?

If the clock framework computes an odd divisor (for example, if a requested
rate yields div=3D1 or div=3D3), the generic _get_val function in
drivers/clk/clk-divider.c evaluates this as:

    if (flags & CLK_DIVIDER_EVEN_INTEGERS)
        return (div >> 1) - 1;

If div is 1, this results in (1 >> 1) - 1 =3D -1. Because this is evaluated=
 as an
unsigned integer, it underflows to the maximum possible value, programming =
the
hardware to its maximum division instead of the desired rate. If div is 3, =
it
computes 0, configuring the hardware for /2 instead of /4.

Could this lead to a misconfiguration of the ADC clock? Would it be safer to
explicitly provide a clk_div_table to restrict the valid even divisors and
prevent this framework math issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012063020.3331=
443-1-a0987203069@gmail.com?part=3D2
