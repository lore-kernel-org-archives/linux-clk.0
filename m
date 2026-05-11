Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A4421F0F;
	Mon, 11 May 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515387; cv=none; b=rBuaXq+dNUmUjn9n8GeR5BURlySqcULs5FPeievGorx/GOABjSKb/j0wx5HTbVsCstfb+Pfk1/I9n+cX8BoSf0lTQ6HX+iYMRJFuvvqQpUR1uS1nVr4jSG3qo3tGLNEx9t7u6tAAnz+C38YcMIxfjxQ7XTIuTOhOGRWsMSxO7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515387; c=relaxed/simple;
	bh=BsBc4RLCe0pZ1tapkSrfPmLjK+4hJx4ENCrw3f1tS0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRbRX9q9GPQRWtgiIMRjKCixSFEyw7MmGNXuhFDeb2X0oiv5DJNFsR1qxvpnS8dBN/VVbN9TTR95i3AovOzkZ14okgOQYgQ1wtWb5nq1Flu+sYR8FqwsIinKsYgMueWXK11MHhLS5qUR41F4l5AcuGieDhWsYfyhA7/IHO+XfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsxFeY8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsxFeY8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC24C2BCB0;
	Mon, 11 May 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515387;
	bh=BsBc4RLCe0pZ1tapkSrfPmLjK+4hJx4ENCrw3f1tS0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsxFeY8qOVENKd9VBkUy21SWWd+nV1JIZyGjBjdjlgsdXF7e9O3m8/FIGBEsoQULg
	 oYMUjXGECrAqMtYEDJJ0qC1bx28UTAUE7NMqIQ0GA7fyDsrM4un/ucOIOL4wDRr4aM
	 HkjUCKqiU6kxl7Jgo/xAc8Ag8qKQEtG5MJYUb++kyFnyBJ4WVbO78KcPGti+lAgZsd
	 3QvzvjWhQOpBvoNk258KWofRduwjd0mjxUSdq0DpxRwnQS2RhTh1cHJKmP3qgADdZE
	 OFgpEQd76uc/K3t+t3yle06sKVUsR7bbh5/pxnhGqtRgR0/9mItaWEK5Evh35kXA7g
	 o7u08YbyJBwPA==
Date: Mon, 11 May 2026 17:03:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: spacemit: k3: Fix PCIe clock register offset
Message-ID: <20260511-emperor-washtub-15fba36bad60@spud>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
 <20260511-06-pci-clk-fix-v2-2-c9a5e563bab3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fWRW5TuUHiA2tmNM"
Content-Disposition: inline
In-Reply-To: <20260511-06-pci-clk-fix-v2-2-c9a5e563bab3@kernel.org>


--fWRW5TuUHiA2tmNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:59:10AM +0000, Yixun Lan wrote:
> The offset of PCIe Clock CTRL register for port B and C controller was
> wrongly swapped, correct it here.
>=20
> Fixes: 091d19cc2401 ("clk: spacemit: k3: extract common header")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>  include/soc/spacemit/k3-syscon.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-s=
yscon.h
> index 0299bea065a0..a68255dd641f 100644
> --- a/include/soc/spacemit/k3-syscon.h
> +++ b/include/soc/spacemit/k3-syscon.h
> @@ -168,8 +168,8 @@
>  #define APMU_CPU_C2_CLK_CTRL		0x394
>  #define APMU_CPU_C3_CLK_CTRL		0x208
>  #define APMU_PCIE_CLK_RES_CTRL_A	0x1f0
> -#define APMU_PCIE_CLK_RES_CTRL_B	0x1c8
> -#define APMU_PCIE_CLK_RES_CTRL_C	0x1d0
> +#define APMU_PCIE_CLK_RES_CTRL_B	0x1d0
> +#define APMU_PCIE_CLK_RES_CTRL_C	0x1c8
>  #define APMU_PCIE_CLK_RES_CTRL_D	0x1e0
>  #define APMU_PCIE_CLK_RES_CTRL_E	0x1e8
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>=20
> --=20
> 2.54.0
>=20

--fWRW5TuUHiA2tmNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH9tgAKCRB4tDGHoIJi
0vaQAP48Kryv4oiIIywKTZrtlJBoXWha9X2EIyDK9bNcucrjQAEA6h0D6DGM7ZQH
rRGPLGzFqFWbZnchRVV2n43wt3IX3gA=
=zt8J
-----END PGP SIGNATURE-----

--fWRW5TuUHiA2tmNM--
