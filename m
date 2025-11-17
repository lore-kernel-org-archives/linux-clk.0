Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3ED2C11DF
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398784; cv=none; b=N0CGUCqGaTf+6To059z0PC7xq+qg0iOBDK+jZ3PW7zYMqW1fjWxW4QrT6vLeKWS3jTif1kNDUSvpBNG1eYmswz3Nft/9oYwMyzPOnymuXEm8E6bPYfW5PrLlmBkTMThI9cK8iUXD9wz7TwBZe8FI+FopoItz9DAvLGiULzMzdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398784; c=relaxed/simple;
	bh=YOYx0U3DIgwMBV6M9iV1WVPoF8yWWsRTNsouR/9kN50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fz2/0b+sSqidW4oLypIFpnZJwBntKNz+Pcf2LtLrPXOP+80AigU8uRVTuHN1q+iiCe/ggzdAoiXyVW7AfvwuVWFAMPItJ0MuHLr/npJJnvXn6k1w9rb4hNW3B2Opw9lkbWFhL0clODLkh5167S8KfohEVoEmPA1a7NOmEgSFru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ2hG4jD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ2hG4jD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C36EC4CEF1;
	Mon, 17 Nov 2025 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398783;
	bh=YOYx0U3DIgwMBV6M9iV1WVPoF8yWWsRTNsouR/9kN50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQ2hG4jDzBqAssRbKCPMsBPyFKyegQktDIBOrZQsI7iZqpyDSmSD1SarGFSwGUExv
	 q+XPeTU6amyk9sOBA8yUlxyyERRUk4Lz7lqicrbATYQUdleEivHGDA+Jo7Ur49HKML
	 uD8oflQj8tvxXmxqzlalmiBxANsJJBRuYPrPhssMtjQjvyB8gCRXIu9yQ0/7Kklwxo
	 gz8fGEWZmLeAla0tinNZn/Y6e0qi8ns+orP9esRMFCD3JCQcrPsrlbsMLBmTbLXMu8
	 zj8WirCV4cu2Xg8Ve3MPucy+dSkfOtUcNuCMDdEERIM1HwJ3WO429jWsZCJqWUqkdR
	 PXfjvuNfiCtqw==
Date: Mon, 17 Nov 2025 16:59:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: Re: [GIT PULL] Microchip clock updates for v6.19
Message-ID: <20251117-dentist-maimed-67b01dd4af4a@spud>
References: <20251117163747.211922-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NcBsPd3wJsQfhg8H"
Content-Disposition: inline
In-Reply-To: <20251117163747.211922-1-claudiu.beznea@tuxon.dev>


--NcBsPd3wJsQfhg8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 06:37:47PM +0200, Claudiu Beznea wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.19
>=20
> for you to fetch changes up to 781f60e45bdfe351aad692ac0fa89e36f8bf4a36:
>=20
>   reset: mpfs: add non-auxiliary bus probing (2025-11-11 16:47:24 +0000)
>=20
> ----------------------------------------------------------------
> Microchip clock updates for v6.19
>=20
> This update includes:
> - convert Microchip Polarfire clock controller driver into a MFD driver;

If anything it is really the opposite I think, as it did the MFD-type stuff
before my series, with an iomem pointer and readl()/writel() accessors. It
just does it with a regmap now instead. The other half of the change actual=
ly
makes it lose the MFD-type stuff where the reset hardware is considered part
of the clock node and so the reset driver needed the clock driver to
register it using auxdev. For new devicetrees, the clock driver only will
handle clocks, with no MFD role at all. Of course, the old MFD-type
behaviour is retained in an alternative code path to handle the old
existing devicetrees.

>   with it, the reset control driver was included as it now depends on the
>   regmap registered by the clock controller driver
> - a cleanup patch for the LAN966X driver
>=20
> ----------------------------------------------------------------
> Conor Dooley (3):
>       dt-bindings: clk: microchip: mpfs: remove first reg region
>       clk: microchip: mpfs: use regmap for clocks
>       reset: mpfs: add non-auxiliary bus probing
>=20
> Robert Marko (1):
>       clk: lan966x: remove unused dt-bindings include
>=20
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml      |  36 ++--
>  drivers/clk/clk-lan966x.c                          |   2 -
>  drivers/clk/microchip/Kconfig                      |   2 +
>  drivers/clk/microchip/clk-mpfs.c                   | 227 +++++++++++++++=
++----
>  drivers/reset/Kconfig                              |   1 +
>  drivers/reset/reset-mpfs.c                         |  91 +++++----
>  include/soc/microchip/mpfs.h                       |   3 +-
>  7 files changed, 266 insertions(+), 96 deletions(-)

--NcBsPd3wJsQfhg8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRtUfAAKCRB4tDGHoIJi
0injAP46aHRGLRpWJHv/O3D+kzP35lquJHhy/DaXkuMImN0SggEAi1zotrUDX1rJ
w4UVTQCmLjcwHQ7opGA7TcMjGjyhZgo=
=ReM8
-----END PGP SIGNATURE-----

--NcBsPd3wJsQfhg8H--
