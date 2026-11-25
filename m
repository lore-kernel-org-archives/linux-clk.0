Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641806;
	b=PJwtanbdE29jaZ6sX2+6ckVhpEdx64K8akBqk/r4G5dFYVp4fbpIMOpECnDZtM++T6vS
	 wWaIg1MwtrI2GrqOOf/i9EXvRCtGBpxDmvFVQlTD22794B7k02AJUWpzX1Hc16Btaw75A
	 RuJpWKycRRrxxGe4NVOg4zCctIKJM04JICKnh8M+4by7nh00OFLviFj9B8MRZ9ZwYPdpB
	 e8d2Wg+mf9PhntNctXdAzZC6BIusnTy01p6NdGdJdhEdgEEH/VhiI06/dLAYPR/XUWahV
	 Qjyvg8Pt9VUrk1QmMO5cvfwdc/QHKFvnZY3DKTxPsbCrEZHxJ4VnHsUcQiWo2Stf4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QlfNUILNv6TP0JZo74JrtV3YqeuYtpN4SOjTVKFO6Gc=;
	b=4UqitEOlSo5lCT0pnuMwW3f1xwdlXSDR7IY7U/lINkwU3ttOUiGx3UdwaOWdbe6jC0ok
	 cy+s78/rTrpD4PJyxVuo4N+SI9x6K0CUMYwrvHy6fPiE1LoXzvTBJMspczAZ7+8ZJuaA4
	 B4V/YYqmNUYEPzeVK0vdYI4S+KOKbEv00HwLG9ld/OsNz2542xw8ogH5inIaoyEvKwEAr
	 QEwdnsiCdlMai02uz9sCRmTq7BhIlxw4vIeYpZrwtTS0HaWbfRiOv/cWVbCMlRQcokk3f
	 radeZ+5iSgQqFLA1gujAfYEo/PNsj37ZE2dofnIUBbdllFwKz7x71K9TU38EFVrhDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0Wc0+C7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F1E606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0Wc0+C7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBFA1F000D0;
	Wed, 25 Nov 2026 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641805;
	bh=QlfNUILNv6TP0JZo74JrtV3YqeuYtpN4SOjTVKFO6Gc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0Wc0+C7/PJd4AvvcfQu1Ps9Z9Y1LGhZjBkoR/flztfY60DPUAxovGPdF0lZCSUJF
	 Eus3jhkJUrS3jfp+4nr2yc5FQjevDea+kkxqII1XQ8sJYNrG/mWVcwCMFYP/QYjw9S
	 2tMdvFL7NZAtISXDRuOZuoHOacyY/p2aeIaqyXCr8Qux9ze64bHzh7/gmDJ9PeQK74
	 rq3hK4MLWdyvVqfo49spmY/fCMmc0vxdPq2aTrn8h6EiWHdRiu+YC6uRVec0fVaCYn
	 y9HYlgdMvAddIADB/8ZvdXKCzJjjCUY1DzMbjxrGPK8Gple5KmlA1SHsrnzKj7pQl6
	 +3PP3/IpJILVA==
Message-ID: <sashiko-outbox-234171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Configure SC8280XP Lucid 5LPE PLLs
 properly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261125211315.1437946-2-vladimir.zapolskiy@linaro.org>
References: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
 <20261125211315.1437946-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:23:24 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clk: qcom: undeclared CLK_ALPHA_PLL_TYPE_LUCID_5LPE breaks
  SC8280XP build
--

commit af2d395c3773da56bbaeccf0423c38dba914bc64
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

clk: qcom: Configure SC8280XP Lucid 5LPE PLLs properly

This commit switches the SC8280XP camera, display, and GPU clock
controllers to configure their Lucid 5LPE PLLs with
clk_lucid_5lpe_pll_configure() and use CLK_ALPHA_PLL_TYPE_LUCID_5LPE for
their register offsets.

> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-s=
c8280xp.c
> index b0f1d40d1df5e..d14cb46a19af9 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -70,7 +70,7 @@ static struct clk_alpha_pll camcc_pll0 =3D {
>  	.offset =3D 0x0,
>  	.vco_table =3D lucid_vco,
>  	.num_vco =3D ARRAY_SIZE(lucid_vco),
> -	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
>  	.clkr =3D {
>  		.hw.init =3D &(struct clk_init_data){
>  			.name =3D "camcc_pll0",

[Severity: High]
Does this fail to build because CLK_ALPHA_PLL_TYPE_LUCID_5LPE is not
defined in drivers/clk/qcom/clk-alpha-pll.h?

The Alpha PLL type enum defines CLK_ALPHA_PLL_TYPE_LUCID (aliased to
CLK_ALPHA_PLL_TYPE_TRION), CLK_ALPHA_PLL_TYPE_LUCID_EVO, and
CLK_ALPHA_PLL_TYPE_LUCID_OLE, but not CLK_ALPHA_PLL_TYPE_LUCID_5LPE.
Replacing CLK_ALPHA_PLL_TYPE_LUCID here and in the remaining PLL and
post-divider definitions across camcc-sc8280xp.c, dispcc-sc8280xp.c, and
gpucc-sc8280xp.c breaks compilation of all three drivers with an
undeclared identifier error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125211315.1437=
946-1-vladimir.zapolskiy@linaro.org?part=3D1
