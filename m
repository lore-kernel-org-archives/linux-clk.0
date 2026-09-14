Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066D45517F
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389031; cv=none; b=V+zT2EuCR0cwOwlQXxoLjQU9IiQ9zKz1Vez9p0KxkuTht1+3XUGBzHrdHAvF7i/YGDljUtajV14wUXaEk7S1bY6Lfv/ndlMwKiD9iAavYFCxdvedcltJwCtUr4AxGTIvR0939n8FnCuOXnfltOfSF6xMksvEuR9sLevacEPv/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389031; c=relaxed/simple;
	bh=zBzdr+ofnZblKoRucR+ZJO4+e/8qBNP5N90CpSZucxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eEH9mjG6rWZv3TOGEXwkmxBli7ff+6cSxO+UD2zSZgiV5XoZRUHf0mF96JoiT1+YC3+9YVuKQXkPq28OLUtyMVVyJmxqWxtUWGzbxNf2kOnPK4lLc8zDIzFfxjScZC7bqvCq/xuglr1MqI4zAms1n4+4Z6GGWinHcmSSh+UmB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLs4ImzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLs4ImzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2041F000FF;
	Mon, 14 Sep 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789389029;
	bh=SXNFPshYjQanxJRPaRv9PKkqEKwGCjtQVkv+ZIIrfsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLs4ImzBGPMUF9EwUv9efoAEzeS9L0Rt/a2zkwZuzP0jLp6fDz1ppzdrZdmfwuuTF
	 ruYGx+Mgr7u+qVLM0du4oYp5MqvCKChEMkiXI9irL37RaDMZ+Vwn6yKWQx4AEmPEkC
	 0JLgIUJrG4oeV2N7+FSdSXB0WrqbIHPR2TD271pk4P4Bf+5clfjAdLZyygMZcZ/Tqg
	 INsAgUXqy3aQeMd9Pz0Nh6H0VYnLohS1xURlykJpcYCvLyu8hO5VxtG9ZR0AwGAGwf
	 V2xT6psE9c5YzJVnIiPWKh0u1//t8pOAUqpzNlRFvjVMioD3ZehaA7v2a2I7nuNkJ8
	 HDUIiypIuXGyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] clk: eyeq: Use devm_platform_ioremap_resource()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
 <20260914-clk-eyeq-res-v2-1-687e5de3aba7@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:30:28 +0000
Message-Id: <20260914123029.4D2041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Switching to devm_platform_ioremap_resource causes the MMIO region=
 to be unmapped on probe failure, leaving dangling pointers in registered c=
locks.
--

commit d16beda6863fd4b206a647746c109b76b72334fa
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Use devm_platform_ioremap_resource()

Convert eqc_probe() from the open-coded platform_get_resource() +
ioremap() sequence to devm_platform_ioremap_resource(). Besides less
code, this requests the memory region so the OLB registers are properly
reserved in the iomem_resource tree.

Move devm_platform_ioremap_resource() before checking for device match
data, so OLBs bound without match data also get their memory region
mapped and reserved.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734f..3662e6990bf7f 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
>  	const struct eqc_match_data *data;
>  	struct clk_hw_onecell_data *cells;
>  	unsigned int i, clk_count;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
> =20
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +

[Severity: High]
Does this change introduce a regression if of_clk_add_hw_provider() fails
later in eqc_probe()?

If the provider registration fails, the probe function aborts and triggers
devres cleanup, which unmaps this base memory region.

However, the clocks are registered earlier in eqc_probe() using non-devm
functions:

drivers/clk/clk-eyeq.c:eqc_probe() {
    ...
    for (i =3D 0; i < data->clk_count; i++) {
        ...
        ret =3D clk->probe(dev, NULL, clk, base, cells);
        ...
    }
    return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
}

drivers/clk/clk-eyeq.c:eqc_probe_divider() {
    ...
    hw =3D clk_hw_register_divider_table_parent_data(dev, ...,
                                                   base + clk->div.reg, ...=
);
    ...
}

Because the clocks are registered with non-devm functions, they remain in
the clock framework on probe failure. Since base is now managed by devres,
the clock framework will hold dangling pointers to the unmapped base memory.

Prior to this change, the manual ioremap() was not unmapped on failure,
which avoided a use-after-free.

Would it be safer to convert the clock registrations to their devm
equivalents, or explicitly unregister them on probe failure to prevent
these dangling pointers?

>  	data =3D device_get_match_data(dev);
>  	if (!data)
> -		return 0; /* No clocks nor auxdevs, we are done. */
> -
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	base =3D ioremap(res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> +		return 0; /* No clocks nor auxdevs, stop here but keep resource reserv=
ed */
> =20
>  	/* Init optional auxiliary devices. */
>  	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-clk-eyeq-r=
es-v2-0-687e5de3aba7@bootlin.com?part=3D1
