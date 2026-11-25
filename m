Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641698;
	b=tJo+zsmy9ugLKtg4p6xsaJ8fvNuDmrMsh4buH/L3eBv2O3jFxL6QDmGp2BZnzn47yBfW
	 Gx8nK8PTfGAJD0S43cvReI3Yc2ibSiHF9YpTh5vU2FgyG3uD4BG5ylA4XAiIKIXiwTUo1
	 yCQsSNBCURtB+7o5X83LvkdcoAvdm3Eu7Lv0IpeRhmzcO1jV2LxOjOPxqLb2Jx+xW05Y3
	 RCGMC4UUzY66NZT9kf5u4Tc9RCkMHSBE+aQaRSi+5r8OL3JGH9KP2rvAYYRGomcPQBwbH
	 PHXZYZFRvdA/jwwGzD74s81S2x59SFxwBtaKAR8SYhC0t0TCuavNdXGr6nTXt/NIRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641698;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5pw/O89v9w4w8Si/z+vkiQQ6knhVVDMmjG+vvyc6RRo=;
	b=BhKOLz0keEloVKNk1upMwq1yBRJKpCdYm9JL0n8dzN3FREJEgxjDHqV1dbcfWSEYTWxL
	 58mj+DBQy5Fgrem2PEhv3OgRtQrf88ArGETlj1GtMU4spNiSnOtXwSWazI/+XJEAFJ4eK
	 UTalMpKt8SxtqFIaYvFYAl8ecfVES8JGgDZu3/yTalsyC9T6eGhma3/UEjSTazBeplCyh
	 Dr/+5EQfGGNQh6x3XbDFlAGhXIAWOOYp+kbU3f0BqRtq4X3QJGxzxltyheRCi7wIpCadj
	 AmUUfpbvlrKHFSNnI7lkwFgBpOTv1p8T0Mq2UpIKSOZ6qeF2REqczGZcSoIt19pHTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBPRff+5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE8606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBPRff+5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F0A1F000CA;
	Wed, 25 Nov 2026 21:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641697;
	bh=5pw/O89v9w4w8Si/z+vkiQQ6knhVVDMmjG+vvyc6RRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBPRff+5V85/+jO1DPjuzhnm78oW6JCIsOE07mQk0nOut+imZca1PzydM7J+FrxNF
	 oOjbms+kcW4jnakknnA1Zn7AH0cBnSqMujFT31U/ZpHD0kkWiZ8wYnGqdZ7txroiHf
	 ufRboUPNI1KEJlOlzvsozsLyoPPf/Rw3TMAb1GJ4Y9xUmSuv0BVJRDKBmJsJttBZYx
	 7BoFJajXeoA10+LSeXsIDwKAzHEN8pPD/1VG3H+WujqyEoREDYLjQ6NgdtoFv+IzXi
	 /HrZq+U+nUBnMRVcszmOW5D2XjVsm9fQqPgx4NNBZ+H1PpFSnNQ+THaja6HMY/XGyB
	 ZmyuwAZXHUl+A==
Message-ID: <sashiko-outbox-234166@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Configure SM8350 Lucid 5LPE PLLs
 properly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261125211315.1437946-3-vladimir.zapolskiy@linaro.org>
References: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
 <20261125211315.1437946-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:21:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] clk: qcom: undeclared CLK_ALPHA_PLL_TYPE_LUCID_5LPE breaks
  SM8350 build
- [Low] clk: qcom: missing Fixes trailers for SM8350 Lucid 5LPE PLL fix
--

commit 20f1cd267c5f5623fcc9ac8ef42bbac4939843b4
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

> clk: qcom: Configure SM8350 Lucid 5LPE PLLs properly
>
> The SM8350 GPU and video clock controller Lucid 5LPE PLLs are configured
> as Lucid PLLs, however clk_lucid_pll_configure() is a macro for
> clk_trion_pll_configure(), which sets PLL_UPDATE_BYPASS bit, while
> clk_lucid_5lpe_pll_configure() does not do it. Configure the PLLs by
> the Lucid 5LPE specific function and describe the PLLs by the Lucid
> 5LPE PLL type expectedly.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

[Severity: Low]
Since this fixes the Lucid 5LPE PLL configuration for SM8350 GPUCC and
VIDEOCC, should it include Fixes tags for the commits that introduced them?

  Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
  Fixes: fd0b5b106fca ("clk: qcom: Introduce SM8350 VIDEOCC")

> diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8=
350.c
> index 6d2660bdd8254..b80f41361de72 100644
> --- a/drivers/clk/qcom/gpucc-sm8350.c
> +++ b/drivers/clk/qcom/gpucc-sm8350.c
> @@ -59,7 +59,7 @@ static struct clk_alpha_pll gpu_cc_pll0 =3D {
>  	.offset =3D 0x0,
>  	.vco_table =3D lucid_5lpe_vco,
>  	.num_vco =3D ARRAY_SIZE(lucid_5lpe_vco),
> -	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],

[Severity: High]
Does this break the build for gpucc-sm8350.c and videocc-sm8350.c?
CLK_ALPHA_PLL_TYPE_LUCID_5LPE is not declared in
drivers/clk/qcom/clk-alpha-pll.h (which only defines
CLK_ALPHA_PLL_TYPE_LUCID, CLK_ALPHA_PLL_TYPE_LUCID_EVO, and
CLK_ALPHA_PLL_TYPE_LUCID_OLE).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125211315.1437=
946-1-vladimir.zapolskiy@linaro.org?part=3D2
