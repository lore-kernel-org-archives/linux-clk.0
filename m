Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116EB370AD5;
	Tue,  2 Jun 2026 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442080; cv=none; b=U74ezyc5+Fa8pqmX5VXDb4Lf0XRSMs/XoT+hspsOA+At2JPPxnDaiQKPmKUkfl76apFMVsOx+DYBFLgK1SQ92Gm6OKl6l2Y/+YbW4yd5YNSm+NwuMIKIolzxbS8EJClLudxSO+nbfIuLmB7Hp40Of5An4A7vD8wuWO6Jex9+1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442080; c=relaxed/simple;
	bh=m6Mjuz44jhVXyauOhN+61cS7re30V+H///vAdi2DPkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjeM/cm1VRM/qzKEQZky2MJ8eMW+SA4QomuvlSxa/5SyXG0uSwEDKSHN2yG+zQEyX5X1D4rHzvO6JtGV/y8WAG+rwq9Cg00NTeFwZ3QaXP4VJHM9UMGneFPf2ug07U1b3gKAdxKZHmvB7pjVmYLNHGVVVtigiyzsBdfpsC8e/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL8Y+yVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL8Y+yVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2091F00893;
	Tue,  2 Jun 2026 23:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780442078;
	bh=m6Mjuz44jhVXyauOhN+61cS7re30V+H///vAdi2DPkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fL8Y+yVX9SmkbBoY+D9EPXdESehFBu0phiVB525xdhVBGSQ/T/Ylmm4OVlT7X1M7t
	 uZDXWLmoWaKR9JNVPUji+tceqM0xf9WNILK/UI3dQIzEw6Lg8Qn78Ocowa6kQpxSgM
	 s7Oh3D2O2LxQwrWAq1GPqDJpolj6DGGDPxwK7hpfWZ4fy0weNr6MfRpAgRQ7M7NcOG
	 UrMj2oFEp01AqMGA5ehd1zay++jjfq5OXvB9X+se2tMuaQLw+eLFXIee91oBqSw/u8
	 TKX22MPJGg1R0HH8eruDly/Cu4QFZvpbSpgw1V/1PIZAizgzhS/OVZoU34tr7L+8lK
	 hKgqD8Rui7Hew==
Date: Wed, 3 Jun 2026 00:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
Message-ID: <20260603-half-almanac-29c5729834cd@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
 <20260529-multiply-engraved-aab583ea4519@spud>
 <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4loMvBYm8Rw8TaVP"
Content-Disposition: inline
In-Reply-To: <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>


--4loMvBYm8Rw8TaVP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 10:09:57PM +0300, Stefan D=F6singer wrote:
> Hello Conor,
>=20
> Thanks for the review!
>=20
> > Am 29.05.2026 um 19:48 schrieb Conor Dooley <conor@kernel.org>:
> >=20
> > These are not permitted in bindings, please remove them.
> > Half the time they end up changing because people find other clocks, and
> > they never actually get used in a dts. If you need the definitions, add
> > them to the driver.
>=20
> I changed the drivers to derive the number of clocks from the clock table=
s in the driver, as seen e.g. in mediatek clocks.
>=20
> Before I resend with your suggestions and more Sashiko findings (that thi=
ng is good!): Do you have any advice on the questions I raised in my cover =
letter?

Resend whenever you get around to it, don't need to rush into it. Can
wait for others to give feedback on those questions, none of them seemed
particularly relevant to me, more of something for Stephen or Brian etc.

--4loMvBYm8Rw8TaVP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah9j2gAKCRB4tDGHoIJi
0v77AP0XojIIrfX5OHFQwKXe8wuWUvX0flFO/csA20plynl3GAEA0mMpHaQKjkSe
dtvsAzCjEcrp1w7R08y/m/rNy7m9MAk=
=ZROx
-----END PGP SIGNATURE-----

--4loMvBYm8Rw8TaVP--
