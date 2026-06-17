Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB527FD4B;
	Wed, 17 Jun 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731441; cv=none; b=PSpfLat5q30EvnblJkPhcrKtncGBl8IOIUIbHgkVGoJdtgLk3T1ju/8tzTP/+erhxylrmLW5b22l2vG6c0lPpeII4vjB4umLTiqZ+4JqWIwuduIgvN6K7v/ktghveK1G8qbZqwPPDWIRuhis+Prd+Q51bin5JoC3oP0JYCth2z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731441; c=relaxed/simple;
	bh=AyXQRojzaAxfBcqMNAS22dtQzF1CPfQn8pgCiDYFOKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHNp1NW8GyeJQhmjHJSG6/GOKgwJiPijOim4RksoxlKJg7JBpMcVKEmq5Don3QplmQsg46IglkId+vycCftt/Ji5+PA4ELyY6KRBtib7mZiYnLx4PjsYABX9T96k396u307k8jSlJsE/orKMQBJ2vGisWPNfWhrUz4o3WdDRp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3HdAWjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3HdAWjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EF11F000E9;
	Wed, 17 Jun 2026 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781731440;
	bh=beNpfuk/6VLfvMcqWyijbHRYY4nZbi8qSQddBym6GBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3HdAWjJv7yEtzUHOcQNvSG0ujaiA74CmoR4PyzgxZa5PjqBHOHH0h0rCq/dkrLNc
	 QNCWO1I52sgewS043ZwduF3iZz4HDhNv+Qgv+fY4MoKnSsXXoUt9fBRKVAIB6CWNGi
	 39O+Gxcqk23ge9fI9ca3LxL9QMPnUh1LxBKLe3BAMRmoJD/vu/Qx/WJXwPSZhWprl2
	 6N1ZUH8sRFNUj3/Q2qmzgUvrzaj+gacjV69Rob7XXntCij7VbZxAZ9ySCpkEySecjA
	 i7YbjGEK8Pftnsb+oxP/K6EZRAStw5se4GbUavclmhL8MKUscg2sMxosd2rWNW6F3o
	 TBn2wRF3QSV7A==
Date: Wed, 17 Jun 2026 22:23:56 +0100
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
Message-ID: <20260617-deed-snap-4649ffae0e27@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
 <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aXpZeYmC7TLQbH+H"
Content-Disposition: inline
In-Reply-To: <-l2OM6P0RNSYRQfOSObOyw@gmail.com>


--aXpZeYmC7TLQbH+H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 08:47:53PM +0300, Stefan D=F6singer wrote:
> Am Mittwoch, 17. Juni 2026, 19:08:02 Ostafrikanische Zeit schrieb Conor=
=20
> Dooley:
> > On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=F6singer wrote:
>=20
> > > +F:	Documentation/devicetree/zte,zx297520v3-*
> >=20
> > Sashiko complaint here looks valid.
>=20
> Yes, it is valid.
>=20
> It also brought up another concern in patch 12 that has an impact on this=
=20
> binding:
>=20
> Am Dienstag, 16. Juni 2026, 23:42:19 Ostafrikanische Zeit schrieb sashiko-
> bot@kernel.org:
> > issue(s) to consider: - [Low] The `syscon-reboot` node is incorrectly
> > defined at the root level using the explicitly deprecated `regmap`
> > property. --
>=20
> And indeed "regmap" is deprecated and I missed it somehow. As far as I=20
> understand, to put syscon-reboot as a child of the clock, I need to add t=
he=20
> simple-mfd .compatible:
>=20
> Either
>=20
> topclk: clock-controller@13b000 {
> 	compatible =3D "zte,zx297520v3-topclk", "syscon", "simple-mfd";
> 	reg =3D <0x0013b000 0x400>;
> 	...
> 	syscon-reboot {
> 		compatible =3D "syscon-reboot";
> 		regmap =3D <&topclk>;
> 		offset =3D <0x0>;
> 		mask =3D <0x1>;
> 	};
> };
>=20
> --- or ---
>=20
> something@13b000 {
> 	compatible =3D "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
> 	reg =3D <0x0013b000 0x400>;
> 	ranges;
>=20
> 	topclk: clock-controller@0 {
> 		compatible =3D "zte,zx297520v3-topclk";
> 		...
> 	}
>=20
> 	syscon-reboot {
> 		compatible =3D "syscon-reboot";
> 		offset =3D <0x0>;
> 		mask =3D <0x1>;
> 	};
> };
>=20
> I see both ways in existing DTS files (e.g. imx6sl.dtsi for the fomer,=20
> uniphier-pro4.dtsi for the latter). Is there a preferred way? I have a mi=
ld=20
> preference for the first, as it would keep all 3 clocks in the same way. =
If I=20
> go for the second, the clock driver would have to query its own node and =
the=20
> parent node for the regmap.

The first one is more natural...

> AFAIU unrelated to syscon-reboot option 2 would give me the opportunity t=
o=20
> have separate clock and reset nodes and bindings and skip the aux bus, bu=
t=20
> this would not be a correct representation of how the hardware works.

=2E..for this reason!
Do you actually need an aux bus here though? Since you have to add
simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can you
set the reset controller up with an mfd_cell + devm_mfd_add_devices()
instead?

--aXpZeYmC7TLQbH+H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajMQawAKCRB4tDGHoIJi
0i1ZAQChkntDCaVz6at1gTETpGDuYDaGrt/c9Ih6y89+zogSggD/QNSAz1aKjTsZ
eA1aiNiWJJUe0WjPlwBo8QPgGL6g4Qc=
=eiAi
-----END PGP SIGNATURE-----

--aXpZeYmC7TLQbH+H--
