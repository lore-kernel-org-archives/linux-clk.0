Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A17463B8C
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188570; cv=none; b=APTJR71AB9xb7ZH1XAmna67RJaICG72NzjKhBdmPeQaroFXVvLAaMaBxFy0HNbipE8O1W5z62sgq9cfPXVmJtt0NgBCOUfVDr5UtsVetFtb9CAF/gA/jxFvqYA2upaMbVOPPkwBVDT4yqVS/5vRNXlGjujsqVwy94W91frbq9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188570; c=relaxed/simple;
	bh=Hh8LRee+Jl+X6/MTGt47GzF+xojbjRbVq5ypeBx6aBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJdy24yfQDsDFfBG7GbSVthYfij4nXzUhumSbBwmxH2+K6evWVVMhiwKBgUuY/1mjlh5afeuxJp5OsjAUv0OGG+jBXz5fUS4BNQ2HkuCqbHhJtjIQ2PsumaWtVob1GXNeWH74+FDQZMNIIChVEPFBq2dwjsxm5xS5MGY8OOqemA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFr4sy02; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFr4sy02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061611F000E9;
	Mon, 31 Aug 2026 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188569;
	bh=huWCzO3qs1vrXJ1Yy79TQsub1vaV2eBQXJIqUCuOVqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFr4sy02Ok3RTwMwJgZZc3d7U+KcuTO54EkjL0sSLU7q+CRe37pCK83rRmmpM9vRq
	 7sBvBx+ahWP4VIHiB2la7PXG+NaWekpJj89UTctqn+d92GQ7iL1I6OJZK8ksXAMRie
	 /JjM3QVQbDfWbVo1F2liJL4Mr38PJxhHVbUtDtR/xhXb5rVtkWqkLbmIujE6nKBEt7
	 3f/U61tSWn6NHnCutFNT4J7FpsLKArzGlbPEowvGagQYjkruPduuUzjuqDncqjcENb
	 vMlsQwfcm64QZMkzl02Y9WjkSK6Sg7DUINk9Xj1Rzpyz/VHIKxICyb96XOJCBmSchJ
	 OeMro1Z6Ir9sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] clk: clk-axi-clkgen: Add support versal
 timings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260831133314.4125787-224-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-224-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:02:48 +0000
Message-Id: <20260831150249.061611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential division by zero when calculating clock parameters if pa=
rent_rate or requested rate is below 1000 Hz.
--

commit 0b1a53196b2b85f8a1c0c11b49ab42f0ef80e28c
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

clk: clk-axi-clkgen: Add support versal timings

Add proper VCO and PFD limits for versal based platforms by introducing
new Technology and Speed grade defines.

> diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
> index fa5ccef73e60d..26f76a6db8202 100644
> --- a/drivers/clk/clk-axi-clkgen.c
> +++ b/drivers/clk/clk-axi-clkgen.c
[ ... ]
> @@ -546,6 +546,9 @@ static int axi_clkgen_setup_limits(struct axi_clkgen =
*axi_clkgen,
>  	if (tech =3D=3D ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS) {
>  		axi_clkgen->limits.fvco_max =3D 1600000;
>  		axi_clkgen->limits.fvco_min =3D 800000;
> +	} else if (tech =3D=3D ADI_AXI_FPGA_TECH_VERSAL) {
> +		axi_clkgen->limits.fvco_max =3D 4320000;
> +		axi_clkgen->limits.fvco_min =3D 2160000;
>  	}
> =20
>  	return 0;

[Severity: High]
This isn't a bug introduced by this patch, but can we hit a division by zero
kernel oops in axi_clkgen_calc_params() if a requested rate or parent_rate =
is
less than 1000 Hz?

In drivers/clk/clk-axi-clkgen.c:axi_clkgen_calc_params(), the code calculat=
es
fin and fout by dividing the rates by 1000:

	fin =3D parent_rate / 1000;
	fout =3D rate / 1000;

If a client driver or device tree properties (such as assigned-clock-rates)
request a rate or parent_rate below 1000 Hz, fin or fout would become 0.
This appears to lead to a division by zero later in the same function when
calculating parameters:

	m_min =3D max(DIV_ROUND_UP(fvco_min_fract, fin) * d_min, 1);
	m_max =3D min(fvco_max_fract * d_max / fin, 64 << fract_shift);
	...
	dout =3D DIV_ROUND_CLOSEST(fvco, fout);

Are there constraints that prevent clk_set_rate() or clk_determine_rate()
from reaching this path with frequencies below 1000 Hz?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-224-sashal@kernel.org?part=3D1
