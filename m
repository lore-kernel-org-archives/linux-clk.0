Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559485;
	b=FOMR3UGE5PUMZDGnzJtvG0DUHb+i8D95bGbAzIglaoDP5Ed3UXzefWcrZbPeqETS5v6Q
	 ZzxM9ULQxprLxA2ClUKbzpbtffD70OK85TfRG+uD6l9j1nkKvvuakDmwzG0PsPikOI31W
	 oTOF91x/VDvfJZWoW4ODbrJ6C0aNo401mrJF2XAsblHX87Vp0svZHGmdpyc3sWdzRuPGI
	 P0R09TyN3kVF70I0ngZu17H2ePspwjHqISuar6HFdNC1jNC3F55TFs4BI9GoOgHDy9ds0
	 0YSrFoAlMY83nvbp0etKQmS7qCpj1BM3XHgLTGv9vgPEwmQZB/55G56vohlZ60gxQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559485;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yXyM6hInDsEKLWc7KcDerii+PLDeTJXkz+ckDBd2y54=;
	b=EPq2j3mDHDgL2Y+z/VI1arGKuAW6IGnRINss+FMgxXtWNDbvKp9CZ07slEnY4vW8dQWT
	 jvS2zMfvvqnW1OIOEM9Ipa/z1sD9u+R51OPFMgvCZug72FH0EQLWmtIguvmKyapzbp4Nd
	 LwYqImEBkedi5lOFgKtgd4/9VuvpTILoLqpYKD+cNEedeyv7kzb1Qx/8KKSDGbYOfnXLY
	 NtfSZKaL58dvCkhjJkQaeq4nubqUbugVJ/DXiUUr4hWz52YQzKt/k24ODu94KfAByFYAE
	 92PBTS5dWusTk28OmMjUnClL9VM0hCcXsUJ3H1eTVHmHojN2HlX71u0nqp0pxb0fTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X/LCPl55";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DD60A2604;
	Fri, 13 Nov 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/LCPl55
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03701F000C6;
	Fri, 13 Nov 2026 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559485;
	bh=yXyM6hInDsEKLWc7KcDerii+PLDeTJXkz+ckDBd2y54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/LCPl55qYD6SeFZ97GcEsZgUIkxJnRvc2a4PHzGkPZWmGaH3M2YdPhJI8nFCLr/J
	 xwYzT9UYmONMc7y4BcjJ78Ryfj7oQCwPIKricR7P0C1Eotbh+mmy1kWFdMQMMXCpat
	 hjorlMnB5+YnaTXovPQEXkGYXuaTUO/Mm2V+Iwwb5Plw0p7vV8uwaFRsEiHqwixd40
	 EwsjL1KPOvLBTJ2NKmV03gkz9FUz/Gi0Uecv7Q+git9Z5LpO3dgyTpTzn/rQvzduvk
	 NTO7VIEST6hPQPtL42ixv7cMCK+JSEvWmRKqtIYBsVGRZ4jryRQcKCJVBxGFT/wzS8
	 i9LwUVUmbHrXg==
Date: Fri, 13 Nov 2026 09:44:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock
 disable
Message-ID: <avbN-3nL6JNHozzz@lore-desk>
References: <20261112185329.1314427-1-john@phrozen.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4RPVZbwfNP5GRwu"
Content-Disposition: inline
In-Reply-To: <20261112185329.1314427-1-john@phrozen.org>

--F4RPVZbwfNP5GRwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> en7581_pci_disable() is the .disable callback of the PCIe clock gate.
> The clock core calls .disable with the enable spinlock held and
> interrupts off, but the callback sleeps with usleep_range(). Every boot
> where no consumer holds the clock reports "BUG: scheduling while atomic"
> from clk_disable_unused(), and so does the unwind of a PCIe probe that
> finds no link.
>=20
> Drop the sleep. Commit 90d4e466c9ea ("PCI: mediatek-gen3: Move reset
> delay in mtk_pcie_en7581_power_up()") already moved the wait of the
> enable side into the PCIe driver, and nothing depends on a wait after
> the disable.
>=20
> Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
> Signed-off-by: John Crispin <john@phrozen.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v2:
> - Drop "clk: en7523: add a reset operation". i2c-mt7621 now asserts
>   and deasserts the reset line instead (Philipp).
> - Link to v1: https://lore.kernel.org/r/20261111085650.632025-1-john@phro=
zen.org
>=20
>  drivers/clk/clk-en7523.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 24fdec2e6198..8f63482cbb7b 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -689,7 +689,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
>  	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> -	usleep_range(1000, 2000);
>  }
> =20
>  static void en7523_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
>=20
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> --=20
> 2.34.1
>=20

--F4RPVZbwfNP5GRwu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbN+wAKCRA6cBh0uS2t
rJtDAPwLVmxAglv0nHD3+CuXP6UA0RXL4MmaMltEsCU4oiQIsgD9FhTEPRAQ6ARI
lviULhURGR9ZX/xyrmm1dTiXdAaaVgc=
=ezYL
-----END PGP SIGNATURE-----

--F4RPVZbwfNP5GRwu--
