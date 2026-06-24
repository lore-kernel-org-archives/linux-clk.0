Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60793B6C0E;
	Wed, 24 Jun 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308609; cv=pass; b=ibU/KH7opSYp65pFoeiPQnweyjLu8ALRpzhy6ZktFAYLXgrodkR/ZuoyKk99dkfM36GFd4jnAOLPtA9hxsN0rSEzKiBxFMAha6oYx4lmcqEy9vyAnc/8SHGRZnTNEw+uUxg7bC16W2OE26WMNAqylLIWgitDZaLwFqJJ8BN0M0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308609; c=relaxed/simple;
	bh=DN0TeMfcuzbB+2UmuhRo67E8wb8yTNi3EFqYrFbXMHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErGtxjuH+Cod7VZvouO//hjdoSm9Yt5bXUyCUY1Rb+H1nzkaQ4Q3vigD2N903bryrOp5+w0794DIdR5qCbm77TFpYGG9a29zQpEUwFX4tvWceQfrVVBrRs1jNczlEexMOb9++DjMeqQLRkfeHb0Hqm6cQXOlF4znkGD02GPMlek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=HeWGkJn2; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="HeWGkJn2"
ARC-Seal: i=1; a=rsa-sha256; t=1782308536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WrQLUK/YJKOSJ0BdKeN+Tce2MZXKpnujf//KyoVZmqYK4Vl2eBZBTbVqynvF1h625SO/PH8h/N9ezfd60sCrstn8xgk+CG9oH/YMrq7YRdiFpyS/a3SwzTNfTro4cDmQENYayVvijHSnMDedPfGgsgCk7iSfmsMWbmWuEZ+73VI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782308536; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n53M//DS/P0zhRXsUivv8G8josVwScB/U+TEaJl62BQ=; 
	b=Gi+fWgrd1ezqTFXee1dbGwylrcx/B7mrh5IdShyCBK8geaC0uJLXq37dbGo728/PDUw9Vy74kG+/0f/7GM69U/FOLF8p62IioxSa32xjEREuDB/5O/W69vXwO5ZLWMbLYcsUdsn6Qo8DalceOLDDi6SazBN98a3/kb9uXI8oOOI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782308536;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=n53M//DS/P0zhRXsUivv8G8josVwScB/U+TEaJl62BQ=;
	b=HeWGkJn2agsdiGMHJL/FCZF54beLAWZnH6mnvO+RCnARlAMOpmgmVZaDGdGLhwYI
	XlTmuClBeezXtNNtudZxKr3UjL5u3g78PQhvZfrWRR8Vrhz7Z5+3aCJ68BRCwiAPuOb
	uPO1k3tZRy5DSxxe1oxgzZCK0t2L6fFcVQFnhTog=
Received: by mx.zohomail.com with SMTPS id 1782308533796211.70892318542622;
	Wed, 24 Jun 2026 06:42:13 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C6277182F3B; Wed, 24 Jun 2026 15:42:09 +0200 (CEST)
Date: Wed, 24 Jun 2026 15:42:09 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Daniele Briguglio <hello@superkali.me>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Diederik de Haas <diederik@cknow-tech.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
Message-ID: <ajvekEXnm7oezaNm@venus>
References: <20260624123914.1767374-1-hello@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apjjfijnkn7l6ncu"
Content-Disposition: inline
In-Reply-To: <20260624123914.1767374-1-hello@superkali.me>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/282.293.17
X-ZohoMailClient: External


--apjjfijnkn7l6ncu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
MIME-Version: 1.0

Hi,

On Wed, Jun 24, 2026 at 02:39:14PM +0200, Daniele Briguglio wrote:
> No in-tree board references these gates yet. Boards drive the codec
> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> managed clocks, clk_disable_unused() turns them off at boot. On a board
> that relied on firmware leaving the output enabled, that cuts the MCLK
> and analog audio stops working.
>=20
> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> state firmware left. A board that wants the kernel to own the gate can
> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
>=20
> Fixes: 02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S =
MCLK output to IO")
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ=
@cknow-tech.com/
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 2ba9976654c..86953f9ffee 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -895,7 +895,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
>  	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mc=
lkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
> =20
>  	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
>  			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
> @@ -912,7 +912,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
>  	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mc=
lkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
>  	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(7), 11, GFLAGS),
>  	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
> @@ -942,7 +942,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
>  	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mc=
lkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
> =20
>  	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(9), 6, GFLAGS),
> @@ -2229,7 +2229,7 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>  	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
>  	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mc=
lkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
>  	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
>  			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
>  	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNU=
SED,
>=20
> base-commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8
> --=20
> 2.47.3
>=20
>=20

--apjjfijnkn7l6ncu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmo73q0ACgkQ2O7X88g7
+ppZFw//eAKxmL99/7n8rhF+/8Q3hfEevwO/yceZBpyjmzPG/Dd8ONVBvqkK1L2g
1P8XnkAKc67+meKCr8gS9hGOL6g94U+r5/qDg4LEYatIlBSHqV7bWDQmkMHREB2j
QGf4L0+iN3By0nyEJP4aRppcRwCqxIlcJA5vxnLnDnlgnC75PLpTag0Zi/IsW54t
GmKJ803cqn8/UZLez9xYrJk4noIy5If0PHFir5iX+chIa0LpiTSa0BxDL2pVy/5L
KUApzbUFO/hhqc8vnhuxtrmAZrCYklhIthyW5U4NtKjU3TawdSS5dUNJp6Dcax9F
aGkFABP8kdF4qtGa3YIyIX5MTkQWLQZPK1gk5XlK8voisAYysygZD0CpxWLRCeSN
0lKBEpay315/uVlbJgfkYPyAHJ42eiapdIpIpiNdhVxeIK0qlSEuOtSPBQ4FHU5D
+L7cduJL6LX4JJ/QWS+efoQWyVHQX669BCEZwasjDIyVWRcT+b0F3Ah5YbQ4jsJJ
bw1h/cNDi7JVxlC4UwGELR5OwIC0ZEPVTCwc7p6j4Ts8jmfppJZxZvOY12EVTbXl
gIkf2DMyv/d+r8dgNAnvU/sManiUPR8H0dUtir8heOtDui5G3WuVCHGVeDESGsAW
7zhM/mDRoj/bkilVQv1rhlNeL2kT9+T0TE9icB1ygFWXdQoh5Js=
=dTbo
-----END PGP SIGNATURE-----

--apjjfijnkn7l6ncu--
