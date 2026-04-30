Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4617B50A;
	Thu, 30 Apr 2026 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777575325; cv=none; b=JBA2eKDCsV6KieJ1JWLZas9APOBzrEWGVvGikPg4FJr0ynCYCO5OHr/Fd6Tq4/XPFtw/TDcNbX7VAIUW6ZrZA2tBQW2OUzIXvmbMt2UzfS8kkTxIuq+QJsnVrYoawZLsIXHFzmoEjBpiiZsUbRKXFipo5EdRmGT2p7nfRzLM8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777575325; c=relaxed/simple;
	bh=lWE9HkFpXw9rtE0Jo05d+/92L9aR9NU3+uP7biB7kcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ/mQUEckLpHxASUmy5Jg3j+C0UBauyO0HohclsNDXBSxf3cGEc4nF2k3ZJtWlRUtRP0NsuHPr+fZdXRKqWgbPMJyD5tLx7Ro9MX5dcimsAp2uIyJdwGkQRIkK6VXP75fzmeCqSWessxVQf5cs3XLG3+e+uuBYy6J4AgdAvvIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSdYbXN6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSdYbXN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA858C2BCB3;
	Thu, 30 Apr 2026 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575325;
	bh=lWE9HkFpXw9rtE0Jo05d+/92L9aR9NU3+uP7biB7kcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSdYbXN686KVP7jsq/GKLBRNM8X4srR9OWumOvVV1zxNc7J8KENy7WTw1x1A3yO23
	 iStgzBIpGM0Gnaw/tmJWkdb7xHTfQSShZIEn0I8CiuCLM01kqk6xrHgiwbx2119Cbl
	 Caj+/XrDYXlwvzu/yX4Up2KojwD/1gnLpeA85kCjgBwwjLIl85qQx5r8o0qdyxcTUs
	 FxMj2gOnKUTRkTzz15MXhWP0lsrhE5/ZzJCzCXfDPyHCWlHkOyXqC4/fuevWQexU2d
	 IPVfnJukukpc6C3GWHISN7BhC0+8+iBuQ9kjkDeQsK1gj6MtGYytgK7xiK4GjE9s3L
	 dPWrCGJkqYQDg==
Date: Thu, 30 Apr 2026 19:55:20 +0100
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260430-plug-bolt-8ff9137717fa@spud>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyWW5ut6GEwR4kZa"
Content-Disposition: inline
In-Reply-To: <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>


--ZyWW5ut6GEwR4kZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> Add clock IDs of PCIe DBI (Data Bus Interface) clock.
>=20
> Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")

Why is this a fix? As-is, this looks like you're abusing the Fixes tag
so that this gets backported alongside things that are a fix that depend
on it.

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  include/dt-bindings/clock/spacemit,k3-clocks.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-=
bindings/clock/spacemit,k3-clocks.h
> index b22336f3ae40..dfae52547cda 100644
> --- a/include/dt-bindings/clock/spacemit,k3-clocks.h
> +++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
> @@ -380,6 +380,11 @@
>  #define CLK_APMU_ISIM_VCLK1      86
>  #define CLK_APMU_ISIM_VCLK2      87
>  #define CLK_APMU_ISIM_VCLK3      88
> +#define CLK_APMU_PCIE_PORTA_DBI  89
> +#define CLK_APMU_PCIE_PORTB_DBI  90
> +#define CLK_APMU_PCIE_PORTC_DBI  91
> +#define CLK_APMU_PCIE_PORTD_DBI  92
> +#define CLK_APMU_PCIE_PORTE_DBI  93
> =20
>  /* DCIU clocks */
>  #define CLK_DCIU_HDMA            0
>=20
> --=20
> 2.53.0
>=20

--ZyWW5ut6GEwR4kZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafOlmAAKCRB4tDGHoIJi
0n1rAQCxrTCw7Jgkx0a5N4zQWIUC4Gs8go2JtYFp2UB241sx0gD+NuCdQwdKHF6L
RzmcK+MGhvdUc6DScyb0unK+KofNrwY=
=3o1x
-----END PGP SIGNATURE-----

--ZyWW5ut6GEwR4kZa--
