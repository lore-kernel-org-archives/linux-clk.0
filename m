Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A423F1ACE;
	Mon, 29 Jun 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748154; cv=none; b=iJKy/IzeMCh04gCeM5gNllRpXbf6WY22BfdYshoG54n1RdTMw+JpCLlmqOhG6aNdXy0PJ+/ZC5c5EW1NtFsGnZDAtsGLZzIMKkjaacAsq+QVkpFMfQ8VAY+iTlLmpGVbZ9nPA8MvZ0hSR+x3KMyz42LdUJNc3ZI/VlSYImFz5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748154; c=relaxed/simple;
	bh=3oRZ5aQ5DodvAzXjFA5ki97FOVUhhZpKpXU5ywaAli4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itZysmUZAyKAH7KH8xxPxwuoke4R9dy1cWwUq8dF1nNofwndqW+kAZc1mgpKK9DgNH+j4SWf833qakcnVKT4Im4wNQKXB6acRfMEqRS9Yal9afmvC/tSL9VJ7OiAmQSmpX6i5UlNj6wG4HbuxQA0oWtIY9MrfK7MHsudg7V0DXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfd9Rbvb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfd9Rbvb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5851F000E9;
	Mon, 29 Jun 2026 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748152;
	bh=3oRZ5aQ5DodvAzXjFA5ki97FOVUhhZpKpXU5ywaAli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gfd9RbvbPXsLSqP0lUEsOp3xB2xlqWLZjP7NWREY79ckJqrMOope4VRt3d6Ix8J94
	 OdJ+JASzEoNcySOm+QD+V1ZVT5fLuuDmehE+mDfnTdNX5G1H2pr4nf5eIYvop2I9p+
	 tKVADe4UloR6Y3ice8H54orWM72mkyELoQMe49FvP3rD+joXCGOcF5hqosPJsE7Xic
	 qk3qkj0HQnPbKk9p0XFQKrD8rzZJthZ81ElpDeBglmpqj4RRcBfs7vrpcBdfE0XqUF
	 ZUh1l5LkFsLS/ZVqqhJWxfevuJVkKWdox7zERSnrHG6vOddshoXaa+CPsHfy533gXY
	 xZJD+YOBqS4MQ==
Date: Mon, 29 Jun 2026 16:49:08 +0100
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
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Message-ID: <20260629-unwelcome-raking-3df3d8ff0422@spud>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5wSEKtGIjQONlWl"
Content-Disposition: inline
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>

--O5wSEKtGIjQONlWl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 10:58:55PM +0300, Stefan D=F6singer wrote:
> Hi,
>=20
> I am sending version 5 of my zx297520v3 clock patch. The major change is=
=20
> using regmaps rather than raw mmio to access the clocks and moving reset=
=20
> handling into its own mfd/aux bus driver.
>=20
> I think the list of clocks in my driver is fairly complete; It is=20
> certainly a lot better than what the downstream ZTE drivers have. I=20
> deduced a lot of it by trial and error. I am sure there are some clocks=
=20
> missing that will need to be added to the binding later. Afaiu adding=20
> clocks is not an issue, but removing or reordering them is an ABI break.

Correct, you can add whatever you want as long as the existing defines
do not change.

> Signed-off-by: Stefan D=F6singer <stefandoesinger@gmail.com>
> ---
> Changes in v5:
> *) Use MFD instead of aux bus for top and matrix clocks
> *) Move top and matrix bindings to soc/zte
> *) Give USB PHY its own resets
> *) Other localized changes are noted in the individual patches
> - Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9=
d@gmail.com

Bindings seem fine to me, I'll be happy to give you some r-b tags when
you go non-RFC. To be frank, I think you should drop them as you've got
no significant questions here I think and you'll be taken a bt more
seriously.

--O5wSEKtGIjQONlWl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKT9AAKCRB4tDGHoIJi
0j1nAQC8UKToEPcgGe2lQI+bacVo1EY2NlTAV7wfcqqKDpoI9gD/XHc3WrLY3p5V
8g0f/QWBENwoSU7VMsipqaDQhqljhAQ=
=Nih3
-----END PGP SIGNATURE-----

--O5wSEKtGIjQONlWl--
