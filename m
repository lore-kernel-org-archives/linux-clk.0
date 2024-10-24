Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CED158858;
	Thu, 24 Oct 2024 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772148; cv=none; b=e0wydcMGwodoNT09VvoHHGUnX4ap/k2hItYuBJ+8Qie0EV7Tm7xhHP+wkCd2oh3ci+xeU89rZ5+IqfVB6HF5FeJm0t4bXRD/BDvNt7b3rA5Qr7IOvxrmMDzmEvsDUcr6EaTvTPuEaquFh2AcuZC85qWIAbO+/CEv89eQathI5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772148; c=relaxed/simple;
	bh=RfdjdiQYotlIUhZ8rHFChi1FV177D7ZDIqtYjtsWyw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTwDDs4TQzeWByT35qE8ZrP4kBij0ar6qe5DQl6e6cIToFBu3JIUNU2l/ERL0evYht4AwB/V/9LzCdeFx8QzgQtxkcIbnDAYwGlnlB9LYLKRwe5FgXOU+WTzDsfXqAhVfbLV0MPa5yBfPhZJjuywSItSahHD/aeo9BBLBHrmVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGI5GtDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGI5GtDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DF1C4CEC7;
	Thu, 24 Oct 2024 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772147;
	bh=RfdjdiQYotlIUhZ8rHFChi1FV177D7ZDIqtYjtsWyw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGI5GtDdhYHB3Ie0tMKjkC4qM1M44gkbtu2iUam3ftfeLWXQIsYAlAyEbfhezwBGF
	 oSwEqq/kgAJjMioRW7ExqT0BwR7Gy3adP82hdl/AnXDyq9yY1sg2DEVJeLdx//O1Ja
	 KNYFxsJsP2KYEOloEXiDXvludUaXRLMoPwSDn4gA20cNJNL8e6QIlwDvT0yEfouvIQ
	 v0LDvwQdT0GXkus6JbiJAj/VOpu2LgK/06iPsl9gcEDiQpDOVep8omBKNmqfVHWc5O
	 w8xrkfr1wg0VTJQOLomnFfQCEpCRmrKQF78OoBErm19ekPUrADWpGOHon/AP0YBQjm
	 kO9RK3898aY3w==
Date: Thu, 24 Oct 2024 13:15:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec support
Message-ID: <8b902b84-6199-4149-ae40-725fdbc33a5b@sirena.org.uk>
References: <20241023075917.186835-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/yr4JFcgoKNigDoS"
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
X-Cookie: Real programs don't eat cache.


--/yr4JFcgoKNigDoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 08:56:56PM +1300, Ryan Walklin wrote:

> V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--/yr4JFcgoKNigDoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaOm0ACgkQJNaLcl1U
h9CjYAf+NQxORVWrFlO5dvxx0/C3SPj6ZxsrXWYL8XAnrgib9VRazo1qHMG58PP4
rqogcBGonb3iWkcRL1Nlnlme2Acw6sSYJDW3bnHtMbDT46qs+AjZlem5hOrts1RU
lLx3mRCwgYDYOaBKCKB/Rmis8Uxc3jNyC9jlz+dd9wgDSDEkdBPafRi/29hlnAYN
MnqOYuSIovdCbLSFtaTlY/O+aLeU0rA1vWkIrXiTU++hN2Z1SMtMCXSfXR20Ihem
noJVhgWBwai4QZ3tEjd+0cFHrO+OHfsvq7yw/etcOGog/1CRFQUvWeVGJ47JKTOe
DrBkGHNVC0VSG5p5PHxuzl6T565c6Q==
=ZTjS
-----END PGP SIGNATURE-----

--/yr4JFcgoKNigDoS--
