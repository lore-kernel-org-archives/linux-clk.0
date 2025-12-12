Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3726980F;
	Fri, 12 Dec 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562133; cv=none; b=fLFTht5SGZcIhjWRA8IYl4RPkGBqiPf/T/NRfsoPhHGMf5vqy/RFHV1/aGbxpHCjrJgfwnT+xISxlwlmmCtFqdvpRZuUi5HBkrVeWoUL7Jse2+kgrvcOltan/C51zk7Nw10uAYgHqPkhRBlr83PZCR7OnQvAVBigoaT6AMkT+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562133; c=relaxed/simple;
	bh=TT3BjiDXo7vLPijIYy6fIZThrWVyzGnxiLcPa/Xmfuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV5LkT1S1fqYOSYbAIZqMPipp6DPC5wt/cHoeUsRfPl3JI/ZUT5k2kI+vuhBVoGeCKubw6hlLTm/+5fLxiQ0WTKiivy+KEI86u/7/+zUWfFUiCWltJX2XotpQzT3OH093RsHAdXtBNfP0geyBQySYg95Au98c4VLsn0J0L8ZknE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAB0zwkL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAB0zwkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3004AC19421;
	Fri, 12 Dec 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765562132;
	bh=TT3BjiDXo7vLPijIYy6fIZThrWVyzGnxiLcPa/Xmfuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAB0zwkLUGYg5Vcyi7Ms2WP5CJQHFP5S+cVj3UkFnmqiNW2xTlcmzLOVdkyEPCDpJ
	 l6baQspDib/b05s84imOxcfD5oi6iPxoY2rhHFyfnvLDG632Yb5C9cpBsjEjA80X9v
	 7GoDgZQZZ3itPz62rz4J5+qGpwULDouEUKh2jsEJLdhYmi7nv98gALs61leSuqv4OS
	 A86YdE9JPCe0qNhStkxyUT/tb8i7GqRNr4LcSDcJt4bPYF279MbUPr9BwU/ioXJlA5
	 GHSSusvNAXbNgmG8JvFMfp4jvBQjQIw5jTzuhADq2TlHkU12uxVFjUFL0KnlsYTgYu
	 1dRDsSX7Lj/iw==
Date: Fri, 12 Dec 2025 17:55:26 +0000
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
Message-ID: <20251212-dazzler-agility-d45940bd27d2@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr>
 <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
 <20251208-absolute-diploma-6575729ab43f@spud>
 <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2+Dmjsrlr/kIiniW"
Content-Disposition: inline
In-Reply-To: <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>


--2+Dmjsrlr/kIiniW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 11:09:01AM +0100, Robert Marko wrote:
> On Mon, Dec 8, 2025 at 6:10=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> > > On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > > > Microchip LAN969x is a series of multi-port, multi-gigabit switch=
es based
> > > > > on ARMv8 Cortex-A53 CPU.
> > > > >
> > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > ---
> > > > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++=
++++++
> > > >
> > > > This should not be in a unique file, put it in with the other micro=
chip
> > > > arm devices please. Also, the wildcard in the compatible is not
> > > > permitted, only way it'd make sense is if these are different binni=
ngs
> > > > of the same silicon. If that's the case, you need to explain why,
> > > > because compatibles are meant to be soc-specific.
> > >
> > > Hi Conor,
> > > The issue is that there is no unique place for Microchip SoC-s,
> > > LAN966x series is in the AT91 bindings
> > > while SparX-5 has its own bindings file.
> > >
> > > What would you suggest in this case?
> >
> > Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
> > become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
> > looks pointless and can be deleted IMO.
>=20
> Ok, I merged them all in one generic microchip.yaml binding, but I notice=
d that
> arm/atmel-at91.yaml is licensed under GPL-2.0 while arm/microchip,sparx5.=
yaml
> is dual-licensed as its preferred for bindings.
>=20
> Is that going to be an issue?

I *think* everyone that contributed, other than maybe Wolfram has
already okayed any binding going to dual license. Just do it as a
standalone commit in the patchset and make sure you CC Michael Walle
and Wolfram Sang.

--2+Dmjsrlr/kIiniW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTxXCwAKCRB4tDGHoIJi
0th0AQCeGvXNFnRESx7BYMbBp8z3ebY/JmtThhaK/pvT8fDEAgEA+31CSiBsVH57
cSVa85MdpgBrlggqpPrz+t3kfd+Vhg0=
=/YvB
-----END PGP SIGNATURE-----

--2+Dmjsrlr/kIiniW--
