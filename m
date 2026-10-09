Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44B435523;
	Fri,  9 Oct 2026 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571582; cv=none; b=GBvgdjwReuFZ0eF5XSL8XmcCF42xkRb6PFhFMNF8oQ0li1cMxgcSKyjQFBnKvPE7CWUzaQZIb3vQYvLM/25WI4Wtb5BXlasbtwQL12idypDepo+5fZv8uc4a5wbuUoj/u4OWpBpUFCMUzq0hRo/GGOq7gJhSFxGVuXY1s43+JDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571582; c=relaxed/simple;
	bh=dBVJHBnSjpblWHttUEpKV/Gla9dxr+ZGqyjY8WLu+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJsqqVR7awlY3aAYTvkbYTQpJ7IxKk+yCl4/XzgYPC6F2veO3A7nVXwWnbUZd8jLDrkNzK/z22HBXX2FrauQ0ki+EvTc2gBhW+PyrxXjKZA+LpLYbKSVVfZjXorooqYVtk3by1LWKDW/Y/QYpoJTqiptEwL/vsleSrp4jPen5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erOEblbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erOEblbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266D71F000FF;
	Fri,  9 Oct 2026 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791571581;
	bh=dBVJHBnSjpblWHttUEpKV/Gla9dxr+ZGqyjY8WLu+Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=erOEblbHGRMD+4jrGI5a6S7ey6al2e0ViAa1SaW52cvuBtAUKIGjRKR7uhIHwOKe1
	 +e4Sl5ca9skE498BKj1398WgQCGJbUIX+ABj3gEpMlqmwlCXQkPGAXzgawu9TXGr1K
	 PcffrsX5bjq8Kw8/kD17uTd1kwpxuxKXw9U5qKqgLs6brcKX8BNfuJAL3F9+JiEE7b
	 sUuqbSIu58Ta8u+3ApN6r5o+rVrzHDR5SwcaHIlZNYJQ8ef0arnCmsJu6JBOIzh33E
	 Eu6DmevKVSsHZY1fQId4qwBUX8VZMDdau7x5I4rV0uhj6VacF5armrrzQrdHkq62xC
	 zeYxot/VWjNeQ==
Date: Fri, 9 Oct 2026 19:46:13 +0100
From: Conor Dooley <conor@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Message-ID: <20261009-0f838c3bfc48bd3a79f6d013@squawk>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
 <20261009070725.13196-2-ansuelsmth@gmail.com>
 <20261009-b41aedc4c5583a8a94926925@squawk>
 <CA+_ehUxMyx-aejgcve4+naou=LQ8-OOSTPMHvSNVhCEiEiw3Vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iPrU6NC3mE2h2aw8"
Content-Disposition: inline
In-Reply-To: <CA+_ehUxMyx-aejgcve4+naou=LQ8-OOSTPMHvSNVhCEiEiw3Vw@mail.gmail.com>

--iPrU6NC3mE2h2aw8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 07:23:19PM +0200, Christian Marangi (Ansuel) wrote:
> Il giorno ven 9 ott 2026 alle ore 17:12 Conor Dooley
> <conor@kernel.org> ha scritto:
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Just for my own info, what is the meaning of not-applicable in this conte=
xt?

It's for the bot running against the dt patchwork, so that it removes
the patch from our queue. I guess "not applicable to Rob's tree"? The
alternate options are handled elsewhere which is applied to drivers by
us, changes requested which means you need a new revision :)

--iPrU6NC3mE2h2aw8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCask2dQAKCRB4tDGHoIJi
0rBHAP9aC5phLRdhUdQMCupjcnEI5SBaRrlnoPWRrq8WkxT/8gEAsBdjt5lTUcGz
m0yqWBt7dZGO3qLJj0oFcA8G9Spy+w8=
=tSeO
-----END PGP SIGNATURE-----

--iPrU6NC3mE2h2aw8--
