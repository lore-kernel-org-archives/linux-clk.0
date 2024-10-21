Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCE1C6889;
	Mon, 21 Oct 2024 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525622; cv=none; b=FxUOL0nqZ59RzJB5SO2OemrRXUbDHrMY7vSTIGOlWiK5vCYYfsQSWNLZNo1LMgEoUdRw2ZT9VVXgb6iHURICjR2gcrr53ukgCIGUCITss8BqSHjPB77gBvyv6D6rWCEWmg7IC2XNXcM7hZ4jHY3GMN04kaBOtRxJcnnC8nAIYEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525622; c=relaxed/simple;
	bh=LAekGIeCxqFBsfXtUjXPbf5aYbs1uWx/zlGBbN3G9Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REiFtr6JS66qS7yPQO7G9U7HDhczmLsVyXq8li8uoZQbgtEoz3qc8UFeSp9aB4mBy1g84whT5mONISC06zslScX6AJzUWe2xZioAsZrmPumY+gK4bylJ7QhJU+lpGAqiWx6SwGuqmUr6v/IExOIZMBYQR3AZ8i3naz7Vb6WWFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqQCmwU3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqQCmwU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03F9C4CEC3;
	Mon, 21 Oct 2024 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729525621;
	bh=LAekGIeCxqFBsfXtUjXPbf5aYbs1uWx/zlGBbN3G9Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqQCmwU3+/gWn1qqzEb4l76p8QXlJvgci8TveEK/G2/WXlYpi6FUsvZb3vHURlWdA
	 wDoABcDPZPMWGR3gpxGYmvlvAHy0V86BR1VT5dmf11cvtJUaSvrIUe6gDFgUEvMdCK
	 j0Zvk3fYUDl/cCCuskoNBe0J9U+DXgV7VaQM7K/ZsD6X4LvqEo+DFNpGUA4768iTH7
	 hGByRsu9vKpnNg+kYDPZ58/FlI43Lds1NCoteZSuSYior3j7G7L14P9GCNXoXWSQ29
	 XretChBeBwT1RBLW8S9e1o31Ks1TdqY4sIksOKLW6hI8s+r1pCcM/9rcES8qzuceIB
	 yw0kdKk+onW7g==
Date: Mon, 21 Oct 2024 16:46:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/7] ASoC: sun4i-codec: support allwinner H616 codec
Message-ID: <182fcf58-26d9-4485-bf0e-89e4def8b5e7@sirena.org.uk>
References: <20241020083124.174724-1-ryan@testtoast.com>
 <20241020083124.174724-6-ryan@testtoast.com>
 <20241020125948.44c27e9e@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y4z+P7MYMG3OWZjq"
Content-Disposition: inline
In-Reply-To: <20241020125948.44c27e9e@minigeek.lan>
X-Cookie: Most people prefer certainty to truth.


--Y4z+P7MYMG3OWZjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 12:59:48PM +0100, Andre Przywara wrote:
> On Sun, 20 Oct 2024 21:30:55 +1300
> Ryan Walklin <ryan@testtoast.com> wrote:
>=20
> Hi,
>=20
> > The H616 SoC codec is playback-only with a single line-out route, and
> > has some register differences from prior codecs.
> >=20
> > Add the required compatible string, registers, quirks, DAPM widgets,
> > codec controls and routes, based on existing devices and the H616
> > datasheet.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Y4z+P7MYMG3OWZjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcWd28ACgkQJNaLcl1U
h9CM/Af+OFrlR9Haa99Zf7HxdpvfXDEmc4YfB8qZBbVTA/kxkcj58a8iCZq6sy/S
r3+j6jUo4Qj/sPIesZvXN4S6bhUyHdWeB+0IQaYFqPv29uiJK0tNGxLAqMXcMUZZ
Wb9IqpnEdSf8LDxIwY0/+o6CYKPll+q8F3+pCpYy/8PHoknKeLsf+42CdqNTdMCt
qbR8H1d8thnSiaserfL/sKDo835LQtNM6QA7wEXRWFo3sGcHfgK6ugAY7VgJS4Fg
nPX2sP29QpCJezci0IFIX+Wzo7ARw9L3zrog1WtrHWYxjIl/lFnBtJTuVYO3T0kI
hatpFUKO8OKllTibWCpQMnTzLxCz4g==
=lwft
-----END PGP SIGNATURE-----

--Y4z+P7MYMG3OWZjq--
