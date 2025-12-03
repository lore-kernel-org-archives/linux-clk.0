Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B81308F1A;
	Wed,  3 Dec 2025 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789761; cv=none; b=UKc0qcaVPG4ahLAxNy7fo4TxScNSdZLC9KBPTIAHWP9rxoe6AOIyaU1N0cDFiFxbMUb3pUTzathNCOj0pT/8C/BxM6+NsB24T1c21IpcsG/ME5LhvR7DCplT9xX+YCl5hfP+h9e8Gmw7TdAJexLwXZDILcuSwJxk9V4Mepc9Fbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789761; c=relaxed/simple;
	bh=WkqCGLI3whoa9doVwjsZqIAqwqaUeZG5Ox8nsycbuMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbmO8qOJ1vqcYcP/lHdmMDKcsDRkS1t4NhYGZ5mJ7oLCVlZDmseQNWjY25uTeukKQqKKXD/BpZ9ofPymTu2clPVZFKwN0ZsFuhJNBVKcI5QDQrOJ1Qj0iNwgwzShgO6vKrHy6Bmg3oyYpVBSn903TIaKpdUO35McUbqkeEyyMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0SgB89e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0SgB89e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4B1C4CEF5;
	Wed,  3 Dec 2025 19:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764789761;
	bh=WkqCGLI3whoa9doVwjsZqIAqwqaUeZG5Ox8nsycbuMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0SgB89euj89qgZhucbSoprGcTBlzjyQjzEq+e5HaU4B4ow/8pqfkziM5CBkQCysy
	 SsEvFYJPS8JKNtP80C2jkFTsSi0WnEtpCiywGrI12PsrUGEy0bfc1pCgEl/rPfpTJD
	 qNsMImVo2MsiHQgAMu5nJC7qVqrkOh8ph52sDQU3GdjidI79cDcZsqvNKHyjIs2Wba
	 0WGFrYhc7vO7LlevbyFV0M1TP5LmnQSEZaXjO0MapA/NDihpJm3s674FH9Qrg2waQi
	 HZUVJ0zsgjFLiL5bxTbRwrrlY6BGbdQAV5N4OR9ukYchqg6VCR83RCJX063sznVgb4
	 B+hDFHjMxvYrA==
Date: Wed, 3 Dec 2025 19:22:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 3/4] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251203-flatten-spotty-69f16d3460f0@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-3-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdqp/vLO78ga2zHb"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-3-robert.marko@sartura.hr>


--kdqp/vLO78ga2zHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:31PM +0100, Robert Marko wrote:
> Add the required LAN969x clock bindings.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  include/dt-bindings/clock/microchip,lan969x.h | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,lan969x.h

Same thing here, this should be specific. Probably 9691, because that's
what you're using the compatible of in your dts.

pw-bot: changes-requested

>=20
> diff --git a/include/dt-bindings/clock/microchip,lan969x.h b/include/dt-b=
indings/clock/microchip,lan969x.h
> new file mode 100644
> index 000000000000..5a9c8bf7824a
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,lan969x.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_CLK_LAN969X_H
> +#define _DT_BINDINGS_CLK_LAN969X_H
> +
> +#define GCK_ID_QSPI0		0
> +#define GCK_ID_QSPI2		1
> +#define GCK_ID_SDMMC0		2
> +#define GCK_ID_SDMMC1		3
> +#define GCK_ID_MCAN0		4
> +#define GCK_ID_MCAN1		5
> +#define GCK_ID_FLEXCOM0		6
> +#define GCK_ID_FLEXCOM1		7
> +#define GCK_ID_FLEXCOM2		8
> +#define GCK_ID_FLEXCOM3		9
> +#define GCK_ID_TIMER		10
> +#define GCK_ID_USB_REFCLK	11
> +
> +/* Gate clocks */
> +#define GCK_GATE_USB_DRD	12
> +#define GCK_GATE_MCRAMC		13
> +#define GCK_GATE_HMATRIX	14
> +
> +#endif
> --=20
> 2.52.0
>=20

--kdqp/vLO78ga2zHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTCN+wAKCRB4tDGHoIJi
0o53AQCDZtek8NKV0Xw9fXMT0+zQW1HLixWl5IaUrtwLtVkOmgEA8CT3i0Rp/7MV
1UDq9stZ0CrzfrbDdsDdOOPWU/2PUQg=
=9aIN
-----END PGP SIGNATURE-----

--kdqp/vLO78ga2zHb--
