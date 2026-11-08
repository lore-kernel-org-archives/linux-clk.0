Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794179833;
	b=1TzZiPL1a3lXKiAkI5Uqx6PnwJCayuEBh/0ez5jUYcJZIjR0bv/LwudShj3jgBqwgCqC
	 tNmcahtROL5eGkBr6Bc6Ih8lHaJCGDva91+VTl9apRKKkj1ELXg5ifhw8ENeEc6g00h0f
	 LpSZmn+0/BMhqAB5Vtf51Hcpm81MyMTbdnT99QqWNK6VEXYUeOWkMl0fTMKltJZP7fGvV
	 0rgrVRbOgV1TbBFKmoIfCKnICoxh5X9Wutbeq8ed/fQsJk2js8D/70jpMbJCZcEmpngVY
	 c+EfjHVjmyV/f8DIbENzAumTzSdHF0xqK89ndx1Qqm91sVjI1djXdTMvkFdTeSeAceQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794179833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C2reihoSd8+x5X3GrAOxEQiq3mx4R4XS9zazh7fb3Us=;
	b=iKjVfM/fO1m1z3hgJTNXSaD8i2UT8rqYQDCz05zIYJ2g22Gszsx8zCQARBVEuWaBWkW5
	 kEyaLq/UxuX23tiLYQRGBz7CaXJv/rGqXWSRMdKEqeTcU3jD3gh+UIe8jNGCiHAeRNWYP
	 +zPpeMLCp6fv8ApV0p0H10d063PXvKTCwlPDrSlMJ1/0lrMcxmZ+L3AIjaSZgX+ijXUGQ
	 WCejvaSzkj75Xel/KcYDN+y/KJ/Wc40BP+ZuGrbN/uODF9/3bAAw7XEZjppHHA+6q9c70
	 UwefYwOdyadkEWchRVFkIEnr6QXj0q+OFnAzCstfsRuBXLXrf2oaFgxHd20VuSCU50g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpGUSey5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17F606A31C;
	Sun,  8 Nov 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpGUSey5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3A21F0089F;
	Sun,  8 Nov 2026 23:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179833;
	bh=C2reihoSd8+x5X3GrAOxEQiq3mx4R4XS9zazh7fb3Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jpGUSey5vvxY92S+HSf4OjpfJZrKayxou0qil8Xw8HI0KUYAGMdJ8qvI5skRIcVqJ
	 V5OeCHHEYJ3Vf7jlLwQ00IKnbUyWU+PCNZ5C14m/P6TfbC4CerkGeqUBMWvt/9CSU3
	 vOzZ1fPI7/x4s7fTfR07RFmFucr1tUU/gKar+9Xx92BCNdmPpYjJV2UMvcEC5enA99
	 Jx1lPLuRKGwGKwbC2/W88g1DCeh6wsi5yzGUV/QN8NRyP61gx6Tuvw15s+PLAYb0jk
	 qoWrt82mORcGdsnMmq+Iuo9quSFeAd3RLRtXGLGwClBr0T9S2hIDA3ZcbAEC6UE+kw
	 AHaXbFVtg0DeA==
Date: Sun, 8 Nov 2026 23:17:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <20261108-resurrect-mumbo-10daa7ac0cf0@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
 <au5RoF6BooP14xhY@macbook>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSqhUowhvI7bmoOF"
Content-Disposition: inline
In-Reply-To: <au5RoF6BooP14xhY@macbook>

--hSqhUowhvI7bmoOF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:27:38PM +0100, Carlo Caione wrote:
> On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> > On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > >=20
> > > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > > +
> > > > > +    soc {
> > > > > +        #address-cells =3D <2>;
> > > > > +        #size-cells =3D <2>;
> > > > > +
> > > > > +        clock-controller@0 {
> > > > > +            compatible =3D "amlogic,s7-peripherals-clkc";
> > > > > +            reg =3D <0x0 0x0 0x0 0x49c>;
> > > >=20
> > > > What's with the weird numbers in this example?
> > > >=20
> > > > Examples don't have to be real, but when it looks like this the
> > > > immediate thought is that the modelling of the device might be
> > > > incorrec.t
> > >=20
> > > The numbers are actually real, but the example simply lost their cont=
ext
> > > because I copied the node from the S7 dtsi (not yet submitted), where
> > > the controller sits under the APB bus node (bus@fe000000) and the bus
> > > ranges make the addresses relative to it.
> > >=20
> > > 		apb: bus@fe000000 {
> > > 			compatible =3D "simple-bus";
> > > 			reg =3D <0x0 0xfe000000 0x0 0x480000>;
> > > 			#address-cells =3D <2>;
> > > 			#size-cells =3D <2>;
> > > 			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > >=20
> > > 			clkc_periphs: clock-controller@0 {
> > > 				compatible =3D "amlogic,s7-peripherals-clkc";
> > > 				reg =3D <0x0 0x0 0x0 0x49c>;
> > > 				#clock-cells =3D <1>;
> > > 				...
> > >=20
> > > In V2 I'll use an absolute address for the sake of clarity (PLL has t=
he
> > > same issue).
> >=20
> > Before you do that, can you please share with me the s7 dtsi? Cos surely
> > you've got it in some git repo online somewhere.
>=20
> The S7 dtsi is already upstream at [0], the peripheral clock controller
> and PLL will be enabled in that DTSI with a following series after the
> bindings and the drivers in this set are acked, following the diffs that
> will be submitted:

Right. The device does seem to have nodes of odd sizes and start
addresses, so this at least is not making anything worse.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hSqhUowhvI7bmoOF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavEC8wAKCRB4tDGHoIJi
0kSzAP9D+07DueUyQidEmOTviYikdTVwB4OjYhIW3eDHUkvnNAEAw27P7rZuFiZP
JlFXjpIzLkFe/xvXdJ5/TibIL+soSAc=
=F15I
-----END PGP SIGNATURE-----

--hSqhUowhvI7bmoOF--
