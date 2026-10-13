Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D64052D8
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907856; cv=none; b=el/ONteKVSFcz6FoJRmqPpqPal6lXYuIlInzLiqOpV2xJ0tPUZhBT+ezCwxicNkDYx6Uf4QV5/NoeaZChR06j9HouDZ7m2ORm6QXISzT8MpNnOppE3+bIPre+K8JzJLU+6R0sWMa5xhWaq4Cl+WLbCgZXTT0TeqFqv/TzdpcycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907856; c=relaxed/simple;
	bh=VUAck7T6bT8Fau8Wl5SOklNOyGPyeHrPEVARSyFMuqs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cfxQ1hn3mteUGpHWHGH/1S5YfVy0XRiMz3l0JpZzwG28UCF9ScUXg3eX/EZ6TWVljbYXz6ogKWZi8wKxixpK/AAtDkRBoVjHllwW08tMuY/eTK2BzKh9BZh0M7GyK8Lru81VuOLQR2gwvh3GjEaDc5cwPgR3s+TuiaVgfocY4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZt0o5Dg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZt0o5Dg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C6E1F00898;
	Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907854;
	bh=Qlvx4AJ0Cu9op9TWT4AsBwvA/Mbh6dRxFRbbbL0NqOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZt0o5DgSRrXvj4GPXvmaF0uhAPnnYPHh7fqoOzfHDNt2u3SMyZCvTaC3nHKmxBZy
	 5aclANc1Ja6j4y6+74GqAGeUO3ZrVutTkK1D7s4qPoZr5hjWoYQRFMWp2UaZTdjs5l
	 EMo3L0zPjx1nkMHeTwiV3oVTqwJWCv/MGC8TVOGpciPGbwuCMDvkJvE6LEPi+w996L
	 Q0kriKmxMYXxUwpg+r/pAP/zwaxUYuD9+htNNKU6KEpYmoEh9D5bUH7RviLkEXCKHw
	 3CYI6LbfR/Q0cPOUta/GHVQ5oJX0lvf5ijIbyFnwTlylVtpJib0+b5ieCNly7loF7J
	 k49ZswS2bW7NQ==
Message-ID: <sashiko-outbox-170095@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/35] clk: mediatek: Add child-device population to
 probe/remove helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-15-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-15-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:10:54 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: mediatek: NULL deref in __mtk_clk_simple_remove() without id_=
table fallback
- [High] clk: mediatek: Use-after-free of clk in devm notifier release
--

commit 4b72b775dd71cd9f8aca52f2f386291f6722da4e
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: Add child-device population to probe/remove helpers
   =20
MediaTek audio clock drivers call devm_of_platform_populate() after
mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
of_platform_populate() when the new 'populate_children' flag is set,
reducing boilerplate.

> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index e06cd40d995a9..1172e76516c03 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
[ ... ]
> @@ -603,7 +604,16 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>  		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
>  							   mcd->rst_desc);
>  		if (r)
> -			goto unregister_clks;
> +			goto unregister_provider;
> +	}
> +
> +	if (mcd->populate_children) {
> +		r =3D of_platform_populate(pdev->dev.of_node, NULL, NULL,
> +					 &pdev->dev);
> +		if (r) {
> +			of_platform_depopulate(&pdev->dev);
> +			goto unregister_provider;

[Severity: High]
Does this new error path cause a use-after-free on the clk?

If __mtk_clk_simple_probe() has previously registered a rate-change
notifier on a struct clk using devm_clk_notifier_register() (via
mcd->clk_notifier_func), the notifier's lifetime is tied to the
pdev->dev devres list.

When taking this goto unregister_provider error path, the clocks are
manually unregistered via the cleanup labels, for example by calling
mtk_clk_unregister_muxes() which calls clk_hw_unregister() and then
clk_unregister().

clk_unregister() frees the struct clk pointer, but does not remove its
associated notifiers from clk_notifier_list.

Later, when the driver core invokes devres_release_all() for the device,
it calls devm_clk_notifier_release(), which invokes
clk_notifier_unregister() with the now-freed struct clk pointer, resulting
in a use-after-free.

This use-after-free also appears to occur during driver unbind in
__mtk_clk_simple_remove().

[ ... ]
> @@ -658,6 +671,9 @@ static void __mtk_clk_simple_remove(struct platform_d=
evice *pdev,
>  	struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pdev);
>  	const struct mtk_clk_desc *mcd =3D device_get_match_data(&pdev->dev);
> =20
> +	if (mcd->populate_children)

[Severity: High]
Can this dereference a NULL mcd pointer during driver removal?

Many MediaTek clock drivers register as platform drivers using an
id_table without an of_match_table. While __mtk_clk_simple_probe() handles
this by safely falling back to platform_get_device_id() when
device_get_match_data() returns NULL, __mtk_clk_simple_remove() lacks
this fallback.

When the driver is unbound, for instance via sysfs or module unload,
device_get_match_data() will return NULL, causing mcd->populate_children
to crash.

> +		of_platform_depopulate(&pdev->dev);
> +
>  	of_clk_del_provider(node);
>  	if (mcd->clks)
>  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D14
