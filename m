Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594E4390CA9;
	Thu, 12 Mar 2026 17:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337963; cv=none; b=OWkRNTr8Q7w+RqdICsOShrBTvegXocCuizsqd1oAa02MeK2R7KXE3/jv+Kj8KcQBDiEIpju1F76NYgVs/5KcqKe6esyWcnAa/UJTH5dTRpslmHxWO94utNK3LT7Q+tlGxYzbkNVkBnCiuHF0gIvsRUo4a1rrkQpFZGQ85XNwWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337963; c=relaxed/simple;
	bh=juOBK+JARNjtYHa7J953QFJ72MkXtnPKnRQL0PoJjKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTby3fVfY0FMllLMh9QXavDQez8TW+hTq1pwgfrd6JpbI1C9DckCKhKrIehqlPCA3RvNczwTlbDWo86gm0SAq4wFvHkfInnUUe5ZWzXohDBWVZY3DQaySpHJdCG1KkABD0R2WxlhT2Er4XiHefK9EZ3CG6DasSLgXOzrtnIFFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPJz/bB6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPJz/bB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5449C4CEF7;
	Thu, 12 Mar 2026 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337963;
	bh=juOBK+JARNjtYHa7J953QFJ72MkXtnPKnRQL0PoJjKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPJz/bB6+glHH73SLx8hGVkx0l9tUzG4IFNHUsdfn+5UCoebZ+uR4mv6v1CnqPIoz
	 +B2pxRgvYNrsL/0J23iTIW9Zlr/htHthdACzdZAMooiqtbicFqzZ4X7jx18CuwAiWs
	 Tug1XH6nyPGz4KBj+gWi0FbyZQPHv21fOSan6TYRqPC7GU0x7JzvkvVKeaxCn6ghqi
	 4+I9gEJ6s9YY0QNQ4BiOZA1smBIBW7wcRDmbXcHHny97X3nIEHKHPP+VPFTmxZVLSs
	 SaPwreBDXUS2iGNaCuxJnS0FhCu7ATagW8j7ocQLb+M73YP28zMsfhf9OgAVce+iYa
	 b1C4M1bG1AQmQ==
Date: Thu, 12 Mar 2026 17:52:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	ardb@kernel.org, ebiggers@google.com, martin.petersen@oracle.com,
	tytso@mit.edu, cristian.birsan@microchip.com,
	jarkko.nikula@linux.intel.com, kees@kernel.org, npitre@baylibre.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Message-ID: <20260312-ricotta-unusable-44c25a03eff8@spud>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-4-manikandan.m@microchip.com>
 <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aXc9ewpzkSl2ifoe"
Content-Disposition: inline
In-Reply-To: <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>


--aXc9ewpzkSl2ifoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:29:25AM +0200, Adrian Hunter wrote:
> On 12/03/2026 06:20, Manikandan Muralidharan wrote:
> > Add support for microchip sama7d65 SoC I3C HCI master only IP
> > with additional clock support to enable bulk clock acquisition
> > for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
> > Introduce MCHP_I3C_CLK_IDX to define the maximum peripheral
> > clock index
> >=20
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > ---
> > Changes in v3:
> > - Make use of existing HCI_QUIRK_* code base
> > - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Periphe=
ral
> > and system generic clk in bulk
> >=20
> > Changes in v2:
> > - Platform specific changes are integrated in the existing mipi-i3c-hci
> > driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
> > specific quirk files
> >=20
> > ---
> >  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
> >  drivers/i3c/master/mipi-i3c-hci/hci.h  |  4 ++++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/maste=
r/mipi-i3c-hci/core.c
> > index 5879bba78164..6b7716bd517e 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > @@ -8,6 +8,7 @@
> >   */
> > =20
> >  #include <linux/bitfield.h>
> > +#include <linux/clk.h>
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/i3c/master.h>
> > @@ -918,6 +919,7 @@ static int i3c_hci_probe(struct platform_device *pd=
ev)
> >  {
> >  	const struct mipi_i3c_hci_platform_data *pdata =3D pdev->dev.platform=
_data;
> >  	struct i3c_hci *hci;
> > +	struct clk_bulk_data *clks;
> >  	int irq, ret;
> > =20
> >  	hci =3D devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
> > @@ -946,6 +948,13 @@ static int i3c_hci_probe(struct platform_device *p=
dev)
> >  	if (!hci->quirks && platform_get_device_id(pdev))
> >  		hci->quirks =3D platform_get_device_id(pdev)->driver_data;
> > =20
> > +	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
> > +		ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> > +		if (ret < MCHP_I3C_CLK_IDX)
>=20
> Is MCHP_I3C_CLK_IDX really needed?  Why not just:
>=20
> 		if (ret <=3D 0)
>=20
> i.e. don't you anyway have to assume DT has the clocks defined
> correctly.

Ye, I think this is kinda silly. Trust dtbs_check to have the correct
number for your platform set, and let this be specific.

--aXc9ewpzkSl2ifoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL9ZAAKCRB4tDGHoIJi
0mFzAQD8sb5isGyPPaQE3kYoakuj+6ep/IS3t3IZhJUaZ7Z3dAD/Vw8LKqh45H8H
HpMjIeSZSkof2M251PwPTxeNv7o5Bwk=
=LkO0
-----END PGP SIGNATURE-----

--aXc9ewpzkSl2ifoe--
