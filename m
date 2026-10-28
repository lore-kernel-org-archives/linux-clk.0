Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204454;
	b=nTcQ+p0TefCjD5iVKmPGg5QvZDOuFP037tri0+/9YgHiW15MM+/TfzrpB+v64koFYc6q
	 6CxRXHev4NuJBaxoweMQvHYntNxbVuSWkwHofxQx0MRoBVz+YNkJAU+q29D21yfG11Mzr
	 Bb1Jl0/VMPed0ClVWz8oBD3HYYEadJfleo0x+u75dLtuNrgBYfv2pvSLqzSeB2v0sM9VC
	 IOYWp/G1mAVJfADCFZD2SbkWtDWiEB0ZhdzMUEuzjbGa88OZscNpZA8JDdr+jQpjM1s+F
	 sdyaEQTfsf+6Em+q7wnrrgpVxcAMb/lSd7y6GLbmHXzNj4h70Ct7uWO8lrpG3qZQCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204454;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HLi+AFHUDMyCMFoC2gyqC6Ryd4Xwu4WFgMDpKdbYHu4=;
	b=ka0LeyOfQUtZ/Qghxkr9xY6c3JqD5J8+KusxYQ09FFEIyp7UIPQVJU5k7bXzolL4wn9O
	 cDcAuND4xwe/hSpF/NgP4wmFgbFngGCxCsAHpu6tV8knygoQ4dJsbatdn7FVUi+HIcSN6
	 NwqqpNt/XEg4P+pWrU7EytBGYgLnPG9ttBdvcbvH4KLJemAGx6uSDIN9pwDl3I4DL4J8H
	 9tZJZ/OZWDoqgKW8qgBZcIsNq0EaWLimjAf4MSk5qsuvpAda2AuOyNKrqLUJ9HN+A80ww
	 VTSsz4FAFOO8jv/071n3ynIkxQFOcQBpfdKypM3T/sC9JqDjvWmEgwiiv2cHrBM+iBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSWw6fmX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D3606A31D;
	Wed, 28 Oct 2026 16:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSWw6fmX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B571F01825;
	Wed, 28 Oct 2026 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793204453;
	bh=HLi+AFHUDMyCMFoC2gyqC6Ryd4Xwu4WFgMDpKdbYHu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSWw6fmXDkNpmYoQXmT4jsTDQT5ZkhIvNFDiO2hwjpfAQgM0fXBdq/JbI/3CetQ2v
	 3MfxDya/DhJzMm1jTUQQYTkbYO3uoD9ePzSKqsTUV/2aJ1kD23HjvdteJXqss5Q1Ec
	 tSXZkf1hHXGWkcPhSm8DwVRJ8ccXNOeHFx+12BtkPDo0jSg1pyz6BoUaxQLYT/akcr
	 Xhb3jBQ+y90WI4AJVPEs869ZmPDe1LlyxsSm1Y9V+J/YMtt2n8u1NYV+buUWh7hbTA
	 AvAJDyAgXfbqzS5HjQwDoAmm7O0KA9gTVUcjT5Wmyqi0UAsImVoREUODFVHiQzSVwe
	 T0ODdPHL0ZN9g==
Message-ID: <sashiko-outbox-188157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] firmware: tegra: bpmp: Add per-SoC EMC clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johnny Liu" <johnliu@nvidia.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028155000.1205739-4-johnliu@nvidia.com>
References: <20261028155000.1205739-1-johnliu@nvidia.com>
 <20261028155000.1205739-4-johnliu@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:20:53 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] firmware: tegra: bpmp: missing emc_clk_id for Tegra186 and Tegra=
194
--

commit cbaa54ccaf9df29aa946e309eb402aa8387ad5ef
Author: Johnny Liu <johnliu@nvidia.com>

firmware: tegra: bpmp: Add per-SoC EMC clock ID

This commit adds an emc_clk_id field to struct tegra_bpmp_soc and populates
it for Tegra234, Tegra238, and Tegra264 while leaving it unset for Tegra186
and Tegra194.

> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index beeb385870f59..06da888535dc0 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c

[ ... ]

> @@ -1158,14 +1162,17 @@ static const struct tegra_bpmp_soc tegra186_soc =
=3D {
> =20
>  static const struct tegra_bpmp_soc tegra234_soc =3D {
>  	TEGRA186_BPMP_SOC_COMMON,
> +	.emc_clk_id =3D TEGRA234_CLK_EMC,
>  };

[Severity: Medium]
The commit message states that Tegra186 and Tegra194 have no EMC clock ID
and leaves emc_clk_id unset in tegra186_soc. Is that accurate for those two
SoCs?

Both SoCs define BPMP EMC clock IDs in their device tree binding headers:

include/dt-bindings/clock/tegra186-clock.h:
    #define TEGRA186_CLK_EMC 58

include/dt-bindings/clock/tegra194-clock.h:
    #define TEGRA194_CLK_EMC			31

Their external-memory-controller device tree nodes (handled by
drivers/memory/tegra/tegra186-emc.c) also consume those clocks from the BPMP
node:

arch/arm64/boot/dts/nvidia/tegra186.dtsi:
    emc: external-memory-controller@2c60000 {
        compatible =3D "nvidia,tegra186-emc";
        ...
        clocks =3D <&bpmp TEGRA186_CLK_EMC>;

arch/arm64/boot/dts/nvidia/tegra194.dtsi:
    emc: external-memory-controller@2c60000 {
        compatible =3D "nvidia,tegra194-emc";
        ...
        clocks =3D <&bpmp TEGRA194_CLK_EMC>;

In the follow-up commit ("clk: tegra: bpmp: Do not cache the EMC clock
rate"), tegra_bpmp_clk_register() in drivers/clk/tegra/clk-bpmp.c checks
if (bpmp->soc->emc_clk_id && info->id =3D=3D bpmp->soc->emc_clk_id) before
setting CLK_GET_RATE_NOCACHE. With emc_clk_id left at 0 in tegra186_soc,
tegra_bpmp_clk_register() will skip setting CLK_GET_RATE_NOCACHE on both
Tegra186 and Tegra194.

In addition, because the BPMP node in arch/arm64/boot/dts/nvidia/tegra194.d=
tsi
uses compatible =3D "nvidia,tegra186-bpmp", Tegra186 and Tegra194 currently
share tegra186_soc even though their EMC clock IDs differ (58 vs 31). Should
Tegra186 and Tegra194 also have their EMC clock IDs configured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028155000.1205=
739-1-johnliu@nvidia.com?part=3D3
