Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D6143746;
	Mon, 10 Jun 2024 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037153; cv=none; b=T949qwjkKuPDxG3i/jEn3RatSeAwoLl7PEgA6KnDQ8aMQiGftyjocjzQoEZZfGo/vl2RETlvBesCNqswa+OBtQcfBxm+DY3w2XA0mXhV1Ce3rFUg4an8PY9T82+jC1wjjGIMmOBx1aSPAY6ZY7XchtsCjlBClUFdcBXHKwogDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037153; c=relaxed/simple;
	bh=t3huLbYF+iqIvyjBa2Lrl3w5SrJDDUFNPpkhxQFR8lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX37Z/jloGrTWwD234DYhMy4Visx9QE/3l1XAfcYd4pld/ot0z4QDymAsRGeYvc6xSsgpLIyyhZdNn7t6Aws4ofIlRDm+2iTmcg1qWaJ4ZWRcwvTpiwct+YJw0HnoFkPrqWvhebMtzKr3104W9c+ryPbClphSOLwfPOxUmR0G5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwa32bmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwa32bmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2D9C2BBFC;
	Mon, 10 Jun 2024 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718037153;
	bh=t3huLbYF+iqIvyjBa2Lrl3w5SrJDDUFNPpkhxQFR8lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iwa32bmP1FleUw+0UYiDwS1tt+D4BxK7bOYhNs/ktjU28WW/ryG8MQ3gjjilliHDC
	 rrcwcHYjJwE5SqfJMbNveCT4SwsMBYEFhHsZtM+sweE290C2KlhwKByytFl9aqiwxx
	 9NCgVlT+0vhqFFJhNYg6B4wVvrhGMPVBExNKmST18i82qUIQas7Ozc+QE6+U4Gd5FU
	 RJK9RLAbVz/E4S/ks6fIi8fHABIUDKpUJDoAGVV0scmUSFKLIoVHw6rI9j/AlwRri0
	 4+GR87IyfXBEN38PzAjtPUXvpsEqaPXI831o0177KxHP52BX/9V2pD2yu5KXXeoMUl
	 fZ43wlAmvr7yw==
Date: Mon, 10 Jun 2024 17:32:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33
 bindings
Message-ID: <20240610-morbidity-slum-d733494f1939@spud>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-2-ryan@testtoast.com>
 <20240607-gag-radiantly-37bc3ac76907@spud>
 <e9e7a362-c41e-41f8-b6cd-02fbbd16ce8c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p5IxoNo8buJ/UBHS"
Content-Disposition: inline
In-Reply-To: <e9e7a362-c41e-41f8-b6cd-02fbbd16ce8c@app.fastmail.com>


--p5IxoNo8buJ/UBHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024 at 03:19:55PM +1200, Ryan Walklin wrote:
> On Sat, 8 Jun 2024, at 2:23 AM, Conor Dooley wrote:

> >> +      - const: allwinner,sun50i-h616-de33-clk
> >
> > I think this is not right, as a corresponding driver change is missing.
> > Either you're missing a clock driver patch or you didn't test your dts.
>=20
> The clock driver patch with this compatible string is in patch 8/8.

Ahh, I didn't notice that " drm: sun4i: add Display Engine 3.3 (DE33)
support" had a clk driver. That needs to go into a patch of its own.

--p5IxoNo8buJ/UBHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcqmwAKCRB4tDGHoIJi
0tu7AQCo8gZn4juYCM25OwzfJQq7/23ZcuOT80PyC9J9xBK+qQEA/EVLDLvMiLow
eaJLi+JsbSGZdPTSG/nuSu8+I+D9eQc=
=1+Ai
-----END PGP SIGNATURE-----

--p5IxoNo8buJ/UBHS--
