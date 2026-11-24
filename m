Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496284;
	b=Z40DWN7CT06hgUV5KUH50fcAfymfcXGIhLyI9hF8rFYwDYtZjYuD4GTKZiZTyot42Pn5
	 lP+I1ONK3ozm9RWCA8biZ8TVmu/iFfjq9q07y9Oc1rWdNXJYue+E/VW/nihvr3B+YKcFC
	 ybEUSS0v2/aZfU+U4bgcKDW58vPLX+pq6GesOYHuBkqRGRohB9ZuM3XfqEgSeKiZCuCdc
	 h1SnMmn2b984iooPJrINlBP7wZzlKhdzaueV5XPdAFLO9pIZZNAJHXNKP8TpbPKNPR0bY
	 gxNv9TlXo6/jm+b5Wvw4UbU5ASf1Qk2w01+ffI8oNVWX2d81boFBGQrqLszntKx+btQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496284;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kA6UbIS07ItcGWE42HPyzRVwC8ngtxMZtR/wbCOP8gU=;
	b=rm665ekn4pF69ys4DY8we2YY6IOGpR3uNr5UINcMophoOhywlwLrbN/AaGCP/Y38QXcJ
	 AYEYQqUJUhsFJFRcM3owshyKSujgDMGFXixNl7ujKjTD2a3eTkwTCRJVD10A7qrAXdkv3
	 08iBPBFe9vSqyu+VnDsvy3gWWucyyYzvHdKH/weONVdGNuJ0yNP8HqLeWQmX5saIL1/p4
	 GN+V9tnMMl8QvzDl+j3S3OfX467msaXx/tUBPiwCJZJ2tkAgUK7qTtV1YNv+XufcHVNYB
	 l42PVUhqCB+X1ATMFJh+OFdKcwQpZfS+j/e0PN38Gc7dARAG9FHF2m/sLiiIp8kxnfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fd2fhLOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F58606A321;
	Tue, 24 Nov 2026 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fd2fhLOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6FB1F000D1;
	Tue, 24 Nov 2026 04:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795496283;
	bh=kA6UbIS07ItcGWE42HPyzRVwC8ngtxMZtR/wbCOP8gU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fd2fhLORdPeA3P5ctUw850YgVfE83EF3+7miiPmnsSKC/02QEPH4QiDX/9mebmZdT
	 zPqaFFVGd0Xfss5ulVa2dmp/nV5QZcJCDMT38P3PCAvE7KEw9SzAVnucCh7V3H2uK0
	 LZfirg74uUlEIxTqGFKwfwswy2aFe2y/8TYCcCK5kVEVt31l9OVJCuXz2kLSR3yAKZ
	 C08ScxkDrNEUXAgsFf6g+uBr0++TlplOg2XapGvf+1Gr52RgclIusH6cwvHEqbDwpM
	 cTkfzCxbMa7zXVoVSFUPDZRhJKtasISk9EkscluT6NMbxVzmET4qVd/6YKOurYbM1I
	 ez6XMdErMTbiw==
Message-ID: <sashiko-outbox-230534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] clk: siflower: Add SF19A2890 clock manager
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
 <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:58:02 +0000
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
- [Medium] clk: siflower: broken late clock publication and defaults in
  sf19a2890
--

commit 99941c15178fb0fa3ccc19a6c27f477a30815152
Author: Joseph Telaak <joseph@telaak.dev>

clk: siflower: Add SF19A2890 clock manager driver

This commit adds a clock driver for the Siflower SF19A2890 SoC, registering
the CPU clock and its parent PLLs early via CLK_OF_DECLARE_DRIVER and the
remaining mux/divider clocks from a platform driver.

Link: https://github.com/981213/linux/commit/0466d6303c25

> diff --git a/drivers/clk/siflower/clk-sf19a2890.c b/drivers/clk/siflower/=
clk-sf19a2890.c
> new file mode 100644
> index 0000000000000..3ccb768331ad3
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890.c

[ ... ]

> +static void __init sf19a2890_clk_early_init(struct device_node *node)
> +{
> +	struct clk_hw_onecell_data *data;
> +	void __iomem *base;
> +	unsigned int i;
> +	int ret;
> +
> +	data =3D kzalloc_flex(*data, hws, CLK_SF19A2890_NR_CLKS);
> +	if (!data)
> +		return;
> +
> +	data->num =3D CLK_SF19A2890_NR_CLKS;
> +	/* The clocks registered at probe defer until then */
> +	for (i =3D 0; i < data->num; i++)
> +		data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> +
> +	base =3D of_iomap(node, 0);
> +	if (!base) {
> +		pr_err("failed to map the registers\n");
> +		goto err_free;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sf19a2890_early_clks); i++) {
> +		unsigned int id =3D sf19a2890_early_clks[i];
> +		struct clk_hw *hw =3D sf19a2890_hws[id];
> +
> +		hw_to_sf_clk_common(hw)->base =3D base;
> +		ret =3D of_clk_hw_register(node, hw);
> +		if (ret) {
> +			pr_err("failed to register clock %u: %d\n", id, ret);
> +			goto err_unregister;
> +		}
> +		data->hws[id] =3D hw;
> +	}
> +
> +	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
> +	if (ret) {
> +		pr_err("failed to add the clock provider: %d\n", ret);
> +		goto err_unregister;
> +	}
> +
> +	sf19a2890_clk_data =3D data;
> +	sf19a2890_clk_base =3D base;
> +	return;
> +
> +err_unregister:
> +	while (i--)
> +		clk_hw_unregister(data->hws[sf19a2890_early_clks[i]]);
> +	iounmap(base);
> +err_free:
> +	kfree(data);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(sf19a2890_clk, "siflower,sf19a2890-clk", sf19a2890=
_clk_early_init);
> +
> +static void sf19a2890_clk_unpublish(void *data)
> +{
> +	struct clk_hw **hw =3D data;
> +
> +	*hw =3D ERR_PTR(-EPROBE_DEFER);
> +}
> +
> +static int sf19a2890_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data =3D sf19a2890_clk_data;
> +	struct device *dev =3D &pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data)
> +		return -ENODEV;
> +
> +	for (i =3D 0; i < data->num; i++) {
> +		struct clk_hw *hw =3D sf19a2890_hws[i];
> +
> +		/* Registered early */
> +		if (!IS_ERR(data->hws[i]))
> +			continue;
> +
> +		hw_to_sf_clk_common(hw)->base =3D sf19a2890_clk_base;
> +		ret =3D devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register clock %u\n", i);
> +
> +		data->hws[i] =3D hw;

[Severity: Medium]
As reported by Brian Masney on v4 [1], can setting data->hws[i] =3D hw after
devm_clk_hw_register() and registering the OF provider while late clocks
are still ERR_PTR(-EPROBE_DEFER) break orphan reparenting and
assigned-clocks defaults?

devm_clk_hw_register() runs clk_core_reparent_orphans_nolock() before
returning.  Because data->hws[i] is still ERR_PTR(-EPROBE_DEFER) during
that call, any already-registered orphan clock parented by the last clock
(CLK_MUXDIV_NPU_PE) cannot resolve its parent via the OF provider and
remains orphaned.

In addition, of_clk_add_hw_provider() in sf19a2890_clk_early_init() calls
of_clk_set_defaults(node, true) while the 17 late clocks are still
ERR_PTR(-EPROBE_DEFER).  If the clock controller DT node specifies
assigned-clocks for any late clock, of_clk_add_hw_provider() fails with
-EPROBE_DEFER and tears down all early clocks including the CPU clock;
even when early init succeeds, sf19a2890_clk_probe() never re-runs
of_clk_set_defaults() after registering the late clocks.

[1] https://lore.kernel.org/r/179545199778.209212.13754058672210050271.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sf19a2890-=
sysm-v5-0-4ba44a0db17d@telaak.dev?part=3D3
