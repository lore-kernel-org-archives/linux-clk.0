Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A016A395;
	Wed, 17 Jun 2026 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732466; cv=none; b=RHYNfJ64PenKzcwjYE1OK+Nf8rOeyUj0O1qiZtd1OUNIkyMgjfj0HTBuoykGE/qNRhqneLMgrwHRPGLpdw5V8+qr4NpE3nhZFEIt9DuEKYw8NIpu92HxTldBNtYzuy4qBEqxfLDo/wI+97Su4EktntIwwCtZzJYGtMH93Dzt0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732466; c=relaxed/simple;
	bh=9SbnhFpmXED5XONNr2fJndo55THY+VHKyyWvmEih9Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2sfFWzrZyYLnfElzY4jI9VNlJMdhhlbuUy3BlVa6AbDGdmFV4CaEiCe+5sLnwe83OOUAqctsJ/sUUlaRbyi3EcVtylGHf4pEKT4pD+s9ltdseAU5B7IvZeJIGxf2YioTLDCYIJPAvR9A5r7KEjB0tJy2Dx4ufMESmIkz2hwFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTnUtpL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTnUtpL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4B11F000E9;
	Wed, 17 Jun 2026 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781732465;
	bh=404tAE/+R1SyZUkdqbOQ+xCot/cOxhbKnrTtvvurl98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTnUtpL6Lr0x0CQQtTyI0DkN21QWM2xh3qkfbRkWOv0y85XPDJuI3a7vp8qy5dgYb
	 vH4LblkNLxC1uJOBjj2RjKsZICTavJjedU+53pdVlJl0tGzTtZT9vSFklpncd4Y3Uq
	 Jwy4EFyUamCpLp+ACc66go/TDzcg632smTIaseBWgKnA1CFR7PitKW1cUUoWdKRLVq
	 HFBXDWlQuXoWs+2AMJepj72Lzln1ApRyoJ8YKNbm7IokF++KXGBwN/ghNvLxDaAyTw
	 y+nw8zPuvdBzV2mrzSlgig1v0muqHra8Y6lAmUiZBp+DKc0HSSJVGq9QNoEpy3gFP5
	 KoSInkaXxI5zg==
Date: Wed, 17 Jun 2026 22:41:01 +0100
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
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
Message-ID: <20260617-gone-antennae-66b362e9d42c@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
 <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
 <20260617-deed-snap-4649ffae0e27@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yGnFFU5qPObdCcLm"
Content-Disposition: inline
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>


--yGnFFU5qPObdCcLm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 10:23:56PM +0100, Conor Dooley wrote:
> On Wed, Jun 17, 2026 at 08:47:53PM +0300, Stefan D=F6singer wrote:
> > Am Mittwoch, 17. Juni 2026, 19:08:02 Ostafrikanische Zeit schrieb Conor=
=20
> > Dooley:
> > > On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=F6singer wrote:
> >=20
> > > > +F:	Documentation/devicetree/zte,zx297520v3-*
> > >=20
> > > Sashiko complaint here looks valid.
> >=20
> > Yes, it is valid.
> >=20
> > It also brought up another concern in patch 12 that has an impact on th=
is=20
> > binding:
> >=20
> > Am Dienstag, 16. Juni 2026, 23:42:19 Ostafrikanische Zeit schrieb sashi=
ko-
> > bot@kernel.org:
> > > issue(s) to consider: - [Low] The `syscon-reboot` node is incorrectly
> > > defined at the root level using the explicitly deprecated `regmap`
> > > property. --
> >=20
> > And indeed "regmap" is deprecated and I missed it somehow. As far as I=
=20
> > understand, to put syscon-reboot as a child of the clock, I need to add=
 the=20
> > simple-mfd .compatible:
> >=20
> > Either
> >=20
> > topclk: clock-controller@13b000 {
> > 	compatible =3D "zte,zx297520v3-topclk", "syscon", "simple-mfd";
> > 	reg =3D <0x0013b000 0x400>;
> > 	...
> > 	syscon-reboot {
> > 		compatible =3D "syscon-reboot";
> > 		regmap =3D <&topclk>;
> > 		offset =3D <0x0>;
> > 		mask =3D <0x1>;
> > 	};
> > };
> >=20
> > --- or ---
> >=20
> > something@13b000 {
> > 	compatible =3D "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
> > 	reg =3D <0x0013b000 0x400>;
> > 	ranges;
> >=20
> > 	topclk: clock-controller@0 {
> > 		compatible =3D "zte,zx297520v3-topclk";
> > 		...
> > 	}
> >=20
> > 	syscon-reboot {
> > 		compatible =3D "syscon-reboot";
> > 		offset =3D <0x0>;
> > 		mask =3D <0x1>;
> > 	};
> > };
> >=20
> > I see both ways in existing DTS files (e.g. imx6sl.dtsi for the fomer,=
=20
> > uniphier-pro4.dtsi for the latter). Is there a preferred way? I have a =
mild=20
> > preference for the first, as it would keep all 3 clocks in the same way=
=2E If I=20
> > go for the second, the clock driver would have to query its own node an=
d the=20
> > parent node for the regmap.
>=20
> The first one is more natural...
>=20
> > AFAIU unrelated to syscon-reboot option 2 would give me the opportunity=
 to=20
> > have separate clock and reset nodes and bindings and skip the aux bus, =
but=20
> > this would not be a correct representation of how the hardware works.
>=20
> ...for this reason!
> Do you actually need an aux bus here though? Since you have to add
> simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can y=
ou
> set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> instead?

Although, the /naming/ is more natural in the second case. "topcrm"
sounds like the actual name of this register region. And syscon@ for the
node name.

--yGnFFU5qPObdCcLm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajMUbQAKCRB4tDGHoIJi
0r2hAPwNW7XtiqbIzMgNxrNCvFns+PFFwkEpnFNspkst36LvJwD/UrRB3kPmZ4Bk
W7Wu8WXjAqQnoDnptstn15CHqLXgtwk=
=IZMg
-----END PGP SIGNATURE-----

--yGnFFU5qPObdCcLm--
