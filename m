Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7E246774
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910366; cv=none; b=kiTk7nFgEr1h5ByrEoHD7pu/1D3UCNJ28S+aYXRV5WfLiqm2rM7J/NBRRHT5Odx6Gz/6dvxDInPO/ICtV13JFZd98jp+XTqfR4MXF/W42WwtL52ycm4Q+/XpM2sk6WXOjwFlppHxONp92eM1Z+m98++zA5nLakNPEDKjUVNMIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910366; c=relaxed/simple;
	bh=z67caY4tucYP/b7OGoBj//5s1ekQa+oSGQoFaFHOFdU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iMwgnTSiPFt9oNEpSvuwBDugNa3P5HQ2wEy95E5jxVnsE5Kq99V7G6tJcsECi/qy68eSBqDWENqBUNN/bF9rvh/e0L69zLNU8kb+DMxPL3IBSpXfEv1V2GnCAphYimr3uF2AIqwLQVuWmJIeWfwd9m4u5nqtMQD/CBoACYWayWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgUvULUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgUvULUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069FD1F00893;
	Tue, 13 Oct 2026 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910365;
	bh=spukiG6k2wS4FfNw6LJiZPCnLPdbzs2wSnRxF/8WfIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EgUvULUCKwntXRQHHrXkzJ8PQYI3F5Hvp3fHZjqb4JNAWPYW6bmb05JQ6s6BtCan8
	 tHb2W5qo5i3qSSdEvJihvzW9yWYexp01LiGwsSyYpeMIjfUbtyMRQeroSIHMxQjGvt
	 JigF1iRp+fWlQcEJHois09F91z2+4hHKYDTIH0ov4y9nHKFu02ucB8WvsH9kI3uyTq
	 +DiQncFlsQr3GUAcYAOoPuVwYhLU+Z0xFdhTqdXtGuC5vNzk72CM9g1Xe2BTcWbzAQ
	 HwOuOfU4syfT0xi4Mn9uL0qQjB1SYQ6507ablzIB1HCspxs2gFcRMMaG5eezrLDDP2
	 sCS4U+9lB9jog==
Message-ID: <sashiko-outbox-170166@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 25/35] clk: mediatek: mt7988-apmixed: Switch to
 common probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-26-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-26-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:52:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: mtk: out-of-bounds array write in mtk_clk_register functions
--

commit 9e2f22353c17eb582f6f6eadd7b30d78eb6c4de2
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers

The MT7988 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers, the driver can use mtk_clk_simple_probe()
and mtk_clk_simple_remove().

> diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/medi=
atek/clk-mt7988-apmixed.c
> index 24f4e7b87a312..f7bb00e7d17a1 100644
> --- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
> +++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
[ ... ]
> -free_apmixed_data:
> -	mtk_free_clk_data(clk_data);
> -	return r;
> -}
> -
>  static struct platform_driver clk_mt7988_apmixed_drv =3D {
> -	.probe =3D clk_mt7988_apmixed_probe,
> +	.probe =3D mtk_clk_simple_probe,
> +	.remove =3D mtk_clk_simple_remove,

[Severity: High]
While this is not a regression for mt7988-apmixedsys because its IDs are
densely packed (0..11), does migrating to mtk_clk_simple_probe cause an
out-of-bounds array write for other drivers migrated in this series?

Looking at __mtk_clk_simple_probe() in clk-mtk.c, it allocates clk_data bas=
ed
on the total count of clock elements:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
	...
	num_clks =3D mcd->num_clks + mcd->num_composite_clks;
	num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
	num_clks +=3D mcd->num_mux_clks + mcd->num_divider_clks;
	num_clks +=3D mcd->num_cpumuxes + mcd->num_plls;

	clk_data =3D mtk_alloc_clk_data(num_clks);
	...
}

For drivers with sparse clock IDs like mt2701 topckgen, the total element
count (149) is smaller than the maximum ID (CLK_TOP_AXISEL_D4 is 158).
When mtk_clk_register_factors() processes this, will it write out-of-bounds
into adjacent slab memory?

drivers/clk/mediatek/clk-mtk.c:mtk_clk_register_factors() {
	...
		clk_data->hws[ff->id] =3D hw;
	...
}

Could this cause a kernel panic during boot when loading other Mediatek clo=
ck
drivers with sparse IDs (like mt2701 and mt6779) migrated in this series?

>  	.driver =3D {
>  		.name =3D "clk-mt7988-apmixed",
>  		.of_match_table =3D of_match_clk_mt7988_apmixed,
>  	},
>  };
> -builtin_platform_driver(clk_mt7988_apmixed_drv);
> +module_platform_driver(clk_mt7988_apmixed_drv);
> =20
>  MODULE_DESCRIPTION("MediaTek MT7988 apmixedsys clocks driver");
>  MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D25
