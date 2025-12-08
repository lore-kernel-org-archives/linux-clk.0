Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C9C2C0274;
	Mon,  8 Dec 2025 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765213840; cv=none; b=FOEJLt08h5opMT3ySiJSUEck4jqzF9Ahik6MvSNjXHEEdmdlnl2TQr4jHxvIlbzZb1BZLkbPawPF85VshvhL6QXEYt2NCqBoLpciuv4oAMdNX8v1PRmDME7WNaLKT3wuuPuilwcyYW+0TLCJ8rLwFNZKQWFH7TCNZqVfb2YaxKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765213840; c=relaxed/simple;
	bh=HUczN0JOy5c/9Nhyo4/4Hy2U/dsetbWKARZVVXVoP9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnOkP8TJwVVEiVFyZhic76rUWy0RNHDFinx+03Y9EDk9Gxw1M/7p7qIje/tY5qA7n66LSc84KwT1CUHEZAKkYYHGX4a/tJ6JRHy2V0kLAOZBdHU+12rKGdlD+/lEshemkjQHKXkRK/l8+OgF3RzFZ5EAcXFdSY3Es/B704XHGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IomiSZG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IomiSZG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3945AC4CEF1;
	Mon,  8 Dec 2025 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765213839;
	bh=HUczN0JOy5c/9Nhyo4/4Hy2U/dsetbWKARZVVXVoP9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IomiSZG43h+0wzBvViLmonXggdL1L8miPSoGm147yGhfQYDIp64e1fJGYbESJXiy8
	 NqnE82zKagCuYc7xpcswOpSlliIJEg0He+IwQY++G7PcYLdtKJhoBW3Evg2tjAvV8x
	 XAegUd63IVJ2e29Jh++NR/1f6koztv2A0KCs4TQW5Gf7i139Ysep8ATNbDgSdRDJ7n
	 SpTRfbcamtXduMd1gLBdBMZ55NNPcnsQ4cQ2/i0NTitZyBp2sZ/lwz44rPSulZQhgH
	 x4P8xHfiIK3N6cY5PY775Q0edhoVWQ4cdMQKCwk7KUfUIsIMjLZbTTC7ok5Wu/M18M
	 h6ZG/jgxbklPA==
Date: Mon, 8 Dec 2025 17:10:33 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Message-ID: <20251208-absolute-diploma-6575729ab43f@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr>
 <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f/ANzMaVIMozCDGI"
Content-Disposition: inline
In-Reply-To: <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>


--f/ANzMaVIMozCDGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > Microchip LAN969x is a series of multi-port, multi-gigabit switches b=
ased
> > > on ARMv8 Cortex-A53 CPU.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++=
++
> >
> > This should not be in a unique file, put it in with the other microchip
> > arm devices please. Also, the wildcard in the compatible is not
> > permitted, only way it'd make sense is if these are different binnings
> > of the same silicon. If that's the case, you need to explain why,
> > because compatibles are meant to be soc-specific.
>=20
> Hi Conor,
> The issue is that there is no unique place for Microchip SoC-s,
> LAN966x series is in the AT91 bindings
> while SparX-5 has its own bindings file.
>=20
> What would you suggest in this case?

Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
looks pointless and can be deleted IMO.


--f/ANzMaVIMozCDGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcGiQAKCRB4tDGHoIJi
0hJgAQDZXZvEtWbFycCBtjtvAkegJzipsK18lKX3sa/WHe6VoQEAzIrZMT4k0/6l
bcJKf5xlAsTcmcBNT0hxrPSamMF+sA8=
=rUuT
-----END PGP SIGNATURE-----

--f/ANzMaVIMozCDGI--
