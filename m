Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8A13C3C07;
	Mon, 17 Aug 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963033; cv=none; b=HRffFtOj74kQbI2oQh4OQXVNB3eMSKP9pePiRGxh/Oi/elOBgkwNvwCRvHSi0o+aEiK+oCj0uEJSLtpFCffovTOb9HF4AipWMh8D9n70yuiohSMIlZjGb3ttNgq5RQYZ6EKXncCu9xtLH3YanDkN1Hy7uCMN4xWdx7gaXfHDReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963033; c=relaxed/simple;
	bh=zbM4CPPd67pGM0y65qpZihfEffw+EIuSqHKs9JCxwT0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c3e4iHGInP3hCvI8lh4ptdhZvZtqEtS3wmroc+jXEMjOsVmTyT48m3co1Eg7K9ymbOF5U/pcDntaSlsWM4CkObpiPj5c0D7zO+6CmL063xDnNGvwW1exCI1curd6FyrOAej0Z+4DCYWnj9bek3mTFhjfMAAHNEkO94x0cl1jKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuWYatru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuWYatru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943D81F000E9;
	Mon, 17 Aug 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963031;
	bh=d8Mb8/JbidvvMhvqd8j3liKZ8Iu5OhT4F8l2lpVp31U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HuWYatruE3dS6rrpZp1hDOoXSje1FlasuyHVOK/IIryijjPBlh1ou4OouKN2NIjuy
	 0oiIVFBkvYIXzaXht+ty3vAAgTwbDJaPl8KDEWcfQXuLpT1pOGX+Wzfh0zUIZqsw1a
	 NRCbbIMzhrktbwtIJnD2g43VdTFpNx71hoTYfS6GgQiOJVHEPNk2cnne7oXy+ZBukJ
	 Sl2N2KiT4iPeBzVfce5RcbMeGWyeLDmHjHM38igqT0vFnH3gyIjcRZXUTqe0t7RZEC
	 4Gw/B97PwW4+AO0WqAWgMWzNnio/FcOvAfERdoccCHnpAbCvbOENGkcQkhpGh/BgPa
	 UBiKe7bt4XKdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org>
 <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:37:11 +0000
Message-Id: <20260817103711.943D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Logic Error / Out-of-bounds Read when rate_table is empty
- [Medium] Single-Responsibility Violation: Undocumented architectural refa=
ctoring
--

--- Patch [2]: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309 -=
--
commit d62df56ff2e6bf73437e6e25e1335b3fb4571268
Author: Aiden Isik <aidenisik@member.fsf.org>

clk: samsung: clk-pll: Add support for pll_309

This commit adds support for the pll_309 used in the Exynos5515 SoC, defini=
ng
the PLL characteristics which are handled similarly to pll_531x.

> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index e74552846ba34..8b1474aeaf0c8 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1593,32 +1593,35 @@ static void __init _samsung_clk_register_pll(stru=
ct samsung_clk_provider *ctx,
>  {
>  	struct samsung_clk_pll *pll;
>  	struct clk_init_data init;
> -	unsigned int len =3D 0;
> -	int ret;
> +	int ret, len;
> =20
> -	if (pll_clk->rate_table) {
> -		/* find count of rates in rate_table */
> -		while (pll_clk->rate_table[len].rate !=3D 0)
> -			len++;
> -	}
> -
> -	pll =3D kzalloc_flex(*pll, rate_table, len);
> +	pll =3D kzalloc_obj(*pll);

[Severity: Medium]
This isn't a bug, but the commit message only mentions adding support for t=
he
new pll_309 type, while this code changes the allocation semantics of the
rate_table across the entire driver, switching from a flexible array member
to a separate pointer allocation.=20

Could this architectural refactoring be split into a separate patch or
documented in the commit message?

[ ... ]

> @@ -1637,7 +1640,7 @@ static void __init _samsung_clk_register_pll(struct=
 samsung_clk_provider *ctx,
>  	case pll_a9fracm:
>  		pll->enable_offs =3D PLL35XX_ENABLE_SHIFT;
>  		pll->lock_offs =3D PLL35XX_LOCK_STAT_SHIFT;
> -		if (!pll->rate_count)
> +		if (!pll->rate_table)

[Severity: High]
If a clock is registered with an empty rate table containing only the zero
terminator, kmemdup_array() is called with a count of 0 earlier in this
function and returns ZERO_SIZE_PTR rather than NULL.

Since ZERO_SIZE_PTR is not NULL, this check evaluates to false, which
incorrectly assigns the full operations instead of the safe min_ops fallbac=
k.

If samsung_pll_determine_rate() is subsequently called, it skips its loop
because rate_count is 0, and attempts to access rate_table[-1]:

samsung_pll_determine_rate() {
    ...
    req->rate =3D rate_table[i - 1].rate;
}

Since rate_table is ZERO_SIZE_PTR, will this result in an out-of-bounds
memory read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next-l=
ucky7-clock-v1-0-032e4b229c76@member.fsf.org?part=3D2
