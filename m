Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5447486E72
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635792; cv=none; b=N1+5bjcz/IT436GQeW5pGl1OCiewToINQy2YXLUAX776WMEu9jqPo0HsIaBs5Y+Dj54xEaSIEOYkAVP/j7WoKt23wKW6XQBj1cpJsWOSiG1aCoTe89OGrRuzOJ3niV3393Su+8rOTOFbY9Gup2Zwx3tODGjsJBYu79eu+eDYIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635792; c=relaxed/simple;
	bh=iLCus9Low9WbpUBHjcW4JGN8XM/ZmdVEjq/ZhfoPoHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kOMkQ53ccxyUIcWUcVxHxIBRHfXZiHlQuLdTr8kDq7SJ9x+Gl+ky9svAiKCL5VuEdDhTPOVL64gnzLyhJHemb+sD5se12RjYkgDuXbyLDjOiCSGQzFlN7/n3eWxqvrNEOH2vezjj2LbA6gTNWRsg79T+WFZtdJwrwkNPtUtmEGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzB93/Ek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzB93/Ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE9E1F00A3A;
	Thu, 13 Aug 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786635791;
	bh=K08WQZHFdKInX3No5C8Je9chPVJCPo5BEFMhSfvVuIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzB93/EkyvNg+YTQpS7zTbRkyMDbsWIi8r6QyHRPr9kQbSpspz/FS2q24tdQaiX2T
	 UbxQjCJKEWSJrXYWCT2BubUMApSxRkBpUYhb6Os334Xe8eNYrXt7kEz5BK06ng1WlU
	 f1dzK8s0niM7O3jTgByXF3OdU985uyBjbeEeIJ5hftyVQ0rQL0y6iEndUeU88yGhuJ
	 QQdo44vEZ77epsUw41tjqV3XMAoT3Hog+i3IeKHb8f1e38tUUHKh8Jt61AWS9OhEI1
	 +49Ls1niyXszXxQb1iOecKmjDSjNNHWtCtWviCPqyGsOD9R9Z14ERVi2KdFw47MuEf
	 mh22IEBxH4bDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL
 flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260813153113.3952621-1-ruoyuw560@gmail.com>
References: <20260813153113.3952621-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 15:43:10 +0000
Message-Id: <20260813154311.2CE9E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Replacing MUX_GATE with MUX_GATE_FLAGS to add CLK_IS_CRITICAL acci=
dentally drops the CLK_SET_RATE_PARENT flag.

Pre-existing issues:
- [High] Pre-existing probe error paths leave registered composite clocks p=
ointing to unmapped devm MMIO memory.
--

--- Patch [1]: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL =
flag ---
commit 737e44fe2aa5421b872238fdc129088bbb8750ca
Author: Ruoyu Wang <ruoyuw560@gmail.com>

clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag

The MT7629 clock driver previously used manual clk_prepare_enable()
calls to keep essential clocks running. This patch replaces those calls
with the CLK_IS_CRITICAL flag to prevent references from leaking if
provider registration fails.

> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk=
-mt7629.c
> index e154771b1b8bb..627e8017fa642 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c

[ ... ]

> @@ -459,12 +464,12 @@ static struct mtk_composite infra_muxes[] =3D {
> =20
>  static struct mtk_composite top_muxes[] =3D {
>  	/* CLK_CFG_0 */
> -	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
> -		 0x040, 0, 3, 7),
> -	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
> -		 0x040, 8, 1, 15),
> -	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
> -		 0x040, 16, 1, 23),
> +	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
> +		       0x040, 0, 3, 7, CLK_IS_CRITICAL),

[Severity: High]
Does this unintentionally drop the CLK_SET_RATE_PARENT flag?

Looking at the macro definitions, MUX_GATE implicitly includes
CLK_SET_RATE_PARENT:

#define MUX_GATE(_id, _name, _parents, _reg, _shift, _width, _gate) \
	MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width,  \
		_gate, CLK_SET_RATE_PARENT)

By replacing MUX_GATE with MUX_GATE_FLAGS and passing only CLK_IS_CRITICAL,
the CLK_SET_RATE_PARENT flag is no longer applied. Could this prevent=20
frequency scaling requests from propagating to the parent PLLs for these=20
critical top-level buses?

> +	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
> +		       0x040, 8, 1, 15, CLK_IS_CRITICAL),
> +	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parent=
s,
> +		       0x040, 16, 1, 23, CLK_IS_CRITICAL),
>  	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
>  		 0x040, 24, 3, 31),

[ ... ]

> @@ -568,10 +573,6 @@ static int mtk_topckgen_init(struct platform_device =
*pdev)
>  				    ARRAY_SIZE(top_muxes), base,
>  				    &mt7629_clk_lock, clk_data);
> =20
> -	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
> -	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
> -	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
> -
>  	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  }

[Severity: High]
This is a pre-existing issue, but does this error path leak registered
composite clocks pointing to unmapped memory?

If of_clk_add_hw_provider() fails, mtk_topckgen_init() returns an error,
which causes driver probe to fail. The devres framework will then unmap
the IO memory (base).

However, the clocks registered via mtk_clk_register_composites() earlier in
the function are never unregistered. Will subsequent interactions with the
Common Clock Framework (like reading /sys/kernel/debug/clk/clk_summary)
access the now unmapped IO memory and cause a page fault?

This exact same pattern also appears in mtk_pericfg_init().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813153113.3952=
621-1-ruoyuw560@gmail.com?part=3D1
