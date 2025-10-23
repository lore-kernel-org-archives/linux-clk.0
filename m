Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9234277CBD;
	Thu, 23 Oct 2025 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214565; cv=none; b=iHQtDQD6bL+2lsOQOUzUz3RS7zbUB7XyiAwVg/UBq2wSsZ5HADPujx+17darORuddM6NbFApCWkJeMGX7E8XTY54ObAKzGrvMlIVtjViVHWYG2oKrDURDjx1tbtyyt+B/TqPYo5elRmujUZGOHCTmXfNqxBCTADRTW8G0vpnK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214565; c=relaxed/simple;
	bh=Qoq11BGqvkxVwMNEuM/bZS1B2O08L278ut2rS1S1fgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbi6iUF0Em3eWVmlKiLBfOn3LVVKsyH7XPHhovKmOINxg7ADtdzdMx6REoknU9KCaVEJqxIeugFKhQz5UbTvoAhDNcBDrwCIWw6OfDxKaPEVuGJczmm0s/RV/ssBy0ac+5PzgEc1YFZtxdRkyngynsTmgX6qz0eaf981vEUE+s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3FIR+EA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3FIR+EA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D21C4CEE7;
	Thu, 23 Oct 2025 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761214563;
	bh=Qoq11BGqvkxVwMNEuM/bZS1B2O08L278ut2rS1S1fgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3FIR+EAQzLA9WMfD2hf8OIGX5DcFSBTy3HmkSFIw1cx+H2bG8i84ILlXPYujN3zX
	 GiMglKaOuxphgeI04VKuBvb8pYqp33ovmKkMzn+2zRH9jJH/sE84YZad5kVcVi11Q+
	 9q0Ee0YfADxwWXwo1XSNovV4DTmc80xN0bzgWTk4K5jOIk1RFQ8sTZUf0xkkfpBRLd
	 IrwBqEzi+v6S8Sq8UztXuwwvq9ISIsu0QnBUyZVVCV2Y7khdrNFgQLbFcy22lWkrx0
	 XP72QjzJJsEILrHGtZVepBzxXjUCdFv9AfrF07+t8Ur8Ux7bnjyRVZCIrxjx5m/Zhr
	 nvYQz8frZoFKw==
Date: Thu, 23 Oct 2025 11:15:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] soc: microchip: add mfd drivers for two syscon
 regions on PolarFire SoC
Message-ID: <20251023-nearest-degraded-3251be49a9f3@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-patient-matrimony-6162c8f92e2e@spud>
 <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0UXaLwXf/3vG+/ZL"
Content-Disposition: inline
In-Reply-To: <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>


--0UXaLwXf/3vG+/ZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 07:04:33AM +0300, Claudiu Beznea wrote:
> On 10/13/25 20:45, Conor Dooley wrote:
> > +++ b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/array_size.h>
>=20
> Looks like this one can be dropped or maybe you want to use
> ARRAY_SIZE(mpfs_mss_top_sysreg_devs) as 4th argument of mfd_add_devices()
>=20
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
>=20
> Unused?
>=20
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of_platform.h>
>=20
> Unused?

This one is where devm_of_platform_populate comes from.

>=20
> > +#include <linux/platform_device.h>
> > +
> > +static const struct mfd_cell mpfs_mss_top_sysreg_devs[] =3D {
> > +	{ .name =3D "mpfs-reset", },
>=20
> MFD_CELL_NAME() ?
>=20
> > +};
> > +
> > +static int mpfs_mss_top_sysreg_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	int ret;
> > +
> > +	ret =3D mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_mss_top_sysreg=
_devs,
> > +			      1, NULL, 0, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (devm_of_platform_populate(dev))
> > +		dev_err(dev, "Error populating children\n");
>=20
> Is it OK return 0 above if there are failures here?

I think my rationale was that the mfd devices would be able to keep
working, but I think ultimately it doesn't matter much and I'll change
it.

--0UXaLwXf/3vG+/ZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPoAXQAKCRB4tDGHoIJi
0goxAQC+usQ0fI+QSsuzOsbPEYH8G0hqmNdvhMt5bJHkfhlrogD/bWGwXivOIj5O
KNK25WPStVbjDr7irJm+5ukdrJVMlA4=
=8/Q9
-----END PGP SIGNATURE-----

--0UXaLwXf/3vG+/ZL--
