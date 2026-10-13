Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5885172D8
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909561; cv=none; b=U4LXnZl6u0exkR2tYMVzyO39sMZIS1FsxEvtGBdmZ2gWmg5Qz6ECY/1EZMZdVZCjrCJP9mwjzfrgbCp+oXT7KDsb3p81eMI/9CoAIQZDcjbGCIO9lxQEDTk6u1l4eBqdclHQ5U3CLCjDgCXARUov2ETiHP5lUOV2l5cJ0l/vNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909561; c=relaxed/simple;
	bh=RRnjUOzWnnOfa/JqAwgE/Ic5mAYeNKdCAMj3NFakCjI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fMGgqBNMDPmOoQL+LeRErioEzz29KLbLXv7kF5RAw7IY2o3jzW7SmXXFn7d0hL9QHyGDBL73LuCcnn/XbWrp7i85poUSpCiIqm0/cnldakUcCNsXB0VtpyKuig2I2dCFAjYz+Y91QTHnefPtTI6Gq2St1iDrmtc77Thxqk4i1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evVaaC+L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evVaaC+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7E31F00893;
	Tue, 13 Oct 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909560;
	bh=Snj7jTHxYhNuJu1DohMKvGyZ40wQIwGzSGeW+kvjANU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=evVaaC+LQRqO+7BMuB8UxUBp+wp52WX8JYJsgJwbg0r4iD3ZFyXaBhnPv4UkNF1XK
	 StFHxxt2ome3AcrajkSuksQGFHE/1W7BdTnBtg8n+/04ER1TnxWroTkqpq1ohEXvdk
	 ztaz9hjApmOhQtTWBVDf5HiGZO9Avn8XaZk9n7GkNzkVyTdOfVVAxiMYOwunTgXcZj
	 uL0IxIPWjk3hxq1l9ZiXVTefWVSNRUBARQsat1clhHi0eYchZpL2Q4IUIye+uN2ldG
	 wEubwOqs5cixM5mcAcebYXMN6EeTG56kHSnvB7Tyqx1Ealr1Yzm4qf1abQQiDRC0Fc
	 Wy0Bmlp2yc8KQ==
Message-ID: <sashiko-outbox-170129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/35] clk: mediatek: mt6797: Switch to common
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-22-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-22-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:39:19 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: mediatek: mt6797: heap OOB write in apmixedsys probe
--

commit 28b566b97c81bb9b4e1fed4aa54cc098337a524e
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: mt6797: Switch to common probe/remove helpers

The MT6797 topckgen and infracfg drivers use clock types already
supported by the common helpers. The apmixedsys driver can also use
them now that PLL registration and unregistration are supported.

> diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk=
-mt6797.c
> index ebf850ac57f54..1934420375e88 100644
> --- a/drivers/clk/mediatek/clk-mt6797.c
> +++ b/drivers/clk/mediatek/clk-mt6797.c

[ ... ]

> -static int mtk_apmixedsys_init(struct platform_device *pdev)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	struct device_node *node =3D pdev->dev.of_node;
> -
> -	clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
> -
> -	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -}
> +static const struct mtk_clk_desc apmixedsys_desc =3D {
> +	.plls =3D plls,
> +	.num_plls =3D ARRAY_SIZE(plls),

[Severity: High]
Does this cause an out-of-bounds write during probe?

Before this patch, mtk_alloc_clk_data(CLK_APMIXED_NR) was used to allocate
enough elements to cover the maximum clock ID. The maximum clock ID for
these PLLs is CLK_APMIXED_APLL2 (10).

With the new common probe, __mtk_clk_simple_probe() allocates the array
dynamically based strictly on the count of provided elements, which is
ARRAY_SIZE(plls) (10).

When mtk_clk_register_plls() processes CLK_APMIXED_APLL2, it stores the clo=
ck
pointer at index 10:

drivers/clk/mediatek/clk-pll.c:mtk_clk_register_plls() {
    ...
    clk_data->hws[pll->id] =3D hw;
    ...
}

Since the array is only allocated for 10 elements (indices 0-9), could
writing to index 10 corrupt memory?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D21
