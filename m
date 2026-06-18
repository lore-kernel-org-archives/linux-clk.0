Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6A30E827;
	Thu, 18 Jun 2026 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812498; cv=none; b=Ehta8mXl/sLorHfqIov1Ew+7OpsLL0WG5V6MpPcyvqQrSmZqVeTqldSRgMWVUg+l1otCrig19U4Eml0qI3WkPv8OgRtUTONBcRrJ/jBQlU8i2ooAwcTAMM751F1TkFLFm04W+9TJ+nSJvPLjZvbYVrsjYbdbh1Wu71OpC382XIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812498; c=relaxed/simple;
	bh=ChaR+L+O0umhnKyuHBEkEzYpuHpr3EdQEGRs/zVdoBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDJgD0JcoBCWMkpEUizm+KNvxjKQGs36Bm2At7SqQUNgKQDhPtXLe8s9CRoL6tTEwgYngDhOnmTC/E8QQTJCZGGe56dO437Q9Rnv+S8xVxbTJj7X6VKeYsDUdfUJrr17Qz4AN3uaVzpqnK+NkJV4rRGSV0MihqN3REjBq2hOFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT4lqhEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT4lqhEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3FA1F000E9;
	Thu, 18 Jun 2026 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781812497;
	bh=ChaR+L+O0umhnKyuHBEkEzYpuHpr3EdQEGRs/zVdoBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iT4lqhEZBafq/H7aa0u623hrpML7qIWjcWt/HcDXEqgusgZjGUp+VgecJq+NeqHDA
	 NEeO6RfCOqRZ2BEc0NygLjUdW+3d5Glkq4iSo+iNnCHfUxayrQX3Z4V6Hl+vqzvoaO
	 zbWP0RQaYgnZXAx6G9VVH1rJRvp/zK65RT90VMuyoSf0gbMzpOsdLTX1GyuYkwUSfk
	 qttZm7kzqUoBZtF5h3hpq2AI0AWGp2TFbAti/fOOzHUU0J/jPJCCPvU7rpGGfjwUWB
	 ZMJGXCQEFlzMgTVf68MJ/aZw5k2npCWf+cRO5qhsrcg7gNyoohJbYy7XHyKShAd3SP
	 SKsVhx96BMEUQ==
Date: Thu, 18 Jun 2026 20:54:53 +0100
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
Message-ID: <20260618-fantasy-estimate-6c52edbc6890@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
 <20260617-deed-snap-4649ffae0e27@spud>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajFBN5mr9y54BNeo"
Content-Disposition: inline
In-Reply-To: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>


--ajFBN5mr9y54BNeo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 09:59:00PM +0300, Stefan D=F6singer wrote:
> Am Donnerstag, 18. Juni 2026, 00:23:56 Ostafrikanische Zeit schrieben Sie:
>=20
> > Do you actually need an aux bus here though? Since you have to add
> > simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can=
 you
> > set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> > instead?
>=20
> I'll have to read up on devm_mfd_add_devices; The aux bus was the suggest=
ion=20
> of Philipp Zabel. At first sight it sounds to me like they do fairly simi=
lar=20
> things. I don't see any precedence for [devm_]mfd_add_devices in drivers/=
clk/.

I think you don't see it because the driver calling mfd_add_devices()
probably isn't in drivers/clk and probably also uses an mfd_cell for the
clock.
There's some in drivers/soc and some in drivers/mfd (I'll be honest and
admit to not knowing what actually drives the placement of the mfd
driver).

I think aux bus makes perfect sense when you have a clock/reset
controller, but once you start expanding past that and you have reboot
or hwmon or hwspinlock then mfd starts to make sense.

>=20
> Whatever way I go I'd like to use the same for all 3 clock/reset controll=
ers.=20
> So far I only made topclk a simple-mfd. I recently stumbled upon spinlock=
=20
> registers in matrixclk, so I guess I can justify a simple-mfd there too. =
For=20

Just to note, simple-mfd is used when you have child nodes. You don't
need simple-mfd if a device fills multiple roles but doesn't have
children.
Your hwspinlock may not require a child node at all, you can just put
#hwlock-cells into the main node and use mfd_add_devices().

You'd then have topclock that is a syscon + simple-mfd, matrixclk that is
a syscon and lsp that's using the aux bus. The topclock and matrixclock
would have dedicated and trivial drivers somewhere that have the mfd_cells
and call mfd_add_devices(). The fact that topclock would be a simple-mfd
has basically no impact - I think the difference is that topclock will
call of_platform_populate() where matrixclk will not.

Probably the compatibles you've chosen start to make less sense at this
point though, but probably "topclk" and "matrixclk" are not what the
documentation for this device calls these register regions?

> lspclk all I can see is clocks and resets and I ran out of unknown regist=
ers=20
> in there.

I think the priority is having something that reflects the hardware
accurately, I wouldn't compromise on that just to have the same design
for all three drivers.

I guess the problem you have is that the reset driver is shared? You can
always have more than one way to probe a driver. Because I messed up
stuff in the past, reset-mpfs.c has both aux bus and mfd probing in it,
which could serve as an example for how to have both in one file.

--ajFBN5mr9y54BNeo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajRNDAAKCRB4tDGHoIJi
0p7PAP9ZceOwH+gLo8A2ejco8rW2JkGu3DEB1FMmEaUVRfVCJgD9GgBrmaQwHzJj
M6a0Db0Bq9oduGTS1qxc4gkCxlmKrQE=
=P+Eg
-----END PGP SIGNATURE-----

--ajFBN5mr9y54BNeo--
