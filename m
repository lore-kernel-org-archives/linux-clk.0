Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A814BCAAE
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185412; cv=none; b=CgQ1TW11F59y69xEjq9vIitSW/8pA9ZhYT1W4b8O1o1IJ8s6p+LhIxoMAfhsjuNIPTac3MTVN3GZlH5klSCJn/GuUedGmwXVFDgX5jr+Ixexhd2DbUvPrk56I45ZVUIFW0kjo+hFHssLzEui6Qt7XYhw1sgttV7j5WkzIJDVDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185412; c=relaxed/simple;
	bh=NuJr1GorLOtj/zv9sZIahEGzi+mj8xpooviDMYrMIfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQysogLXReiMZB3qQosdpnUcnwrgZaRMlxnORmf3kgh+WKyuTkgWFFXPmB1XzBAprkIZ17D2zX4fqY70Lk7W4wcn7Ul6heT9vUZRDyf6LzS7bDl3DlGcp3wFss+2zDGsPZIk5PlAWd59zGb+cdyemzVN9mx4vLBfZ1i8WsvhKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aB/Wf2C+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aB/Wf2C+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756031F00A3D;
	Mon, 31 Aug 2026 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185410;
	bh=+Ddg9Ri1S15ItN5xwN/MLnKxNOAisc+ti/WdyWjS4Z8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aB/Wf2C+VQ7gvRJ2N3DlSx1+pHmGtH5r0BPDhX8TzYmOlFPABO3aytkymqVKCRp8Z
	 XLdEaoDKs/jGagLTsk2wxZea+jyWagJuaQnpe1inyNlc4YbSP2tphUBUTn6SVeuubw
	 K+4nYG8Ar7z0tL1/WBRv9lRy/qcUZl+eH1ZzH89PAfoqxFch8gKh7Kykk8pIkZ0aV4
	 YZ4V+XLIqH1Qs7ZvHW/AcXo+OahZDKQxiu2aCuK9wDW7l6AgkRsao7nQzfq8b4DASa
	 c2u8vmJ9NvJmlBB5PvED5LuIF9Jzx8cZ7Audmih4G9SRA6v9so5+HkcWcnxXU5c9N6
	 z0Ax7NOAnQ0+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] clk: socfpga: agilex: implement
 l3_main_free_clk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260831133314.4125787-71-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-71-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:10:10 +0000
Message-Id: <20260831141010.756031F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but kzalloc failure =
in clock registration returns NULL but caller checks with IS_ERR, masking o=
ut-of-memory errors.
--

commit 22e998f769118153983e748826357fa7376dcdd9
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: agilex: implement l3_main_free_clk

This commit completes the AGILEX_L3_MAIN_FREE_CLK implementation in the
Agilex clock driver by registering it as a 1:1 derivative of noc_free_clk.

> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-a=
gilex.c
> index 8dd94f64756b9..2bdea1997b5ef 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
> @@ -259,6 +259,8 @@ static const struct stratix10_perip_cnt_clock agilex_=
main_perip_cnt_clks[] =3D {
>  	   0, 0x3C, 0, 0, 0},
>  	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(n=
oc_free_mux),
>  	  0, 0x40, 0, 0, 0},
> +	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
> +	  1, 0, 0, 1, 0, 0},

[Severity: High]
This isn't a bug introduced by this patch, but does the error handling in
agilex_clk_register_cnt_perip() properly catch memory allocation failures
when registering clocks in this array?

Looking at s10_register_cnt_periph() in drivers/clk/socfpga/clk-periph-s10.=
c,
a kzalloc() failure returns NULL:

	if (WARN_ON(!periph_clk))
		return NULL;

However, the caller agilex_clk_register_cnt_perip() in clk-agilex.c checks
for failures using IS_ERR():

	if (IS_ERR(hw_clk)) {
		pr_err("%s: failed to register clock %s\n",
		       __func__, clks[i].name);
		continue;
	}

Because IS_ERR() evaluates to false for NULL, the NULL pointer gets silently
stored in the provider array, overwriting the default ERR_PTR(-ENOENT) valu=
e.
The clock framework treats NULL as a valid dummy clock, meaning consumers
will successfully "enable" the clock without receiving an error.

Could this result in unclocked hardware being accessed later, leading to a
synchronous external abort and a kernel panic? Should
s10_register_cnt_periph() return ERR_PTR(-ENOMEM) instead of NULL, or should
the caller be updated to check for NULL as well?

>  	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(=
noc_mux), 0,
>  	  0, 4, 0x30, 1},
>  	{ AGILEX_EMAC_A_FREE_CLK, "emaca_free_clk", NULL, emaca_free_mux, ARRAY=
_SIZE(emaca_free_mux),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-71-sashal@kernel.org?part=3D1
