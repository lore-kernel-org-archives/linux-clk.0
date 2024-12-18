Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572E91FC0FD;
	Wed, 18 Dec 2024 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543934; cv=none; b=QrZ3lhhv6ZtjGOiGFh+UHWeMgNU8/LNfRhXOn0n+cdYDPJTn1+gIEgXodlUmoCn3VStd/0kGpUMxKlCC78p/2tjYBdDaBItshfH8KDAOhTLEE1nGcVSUlI43wI43jeAAsw6y7C3J7ES+AUOZp3xENd0QUqfFdg3bv1oy+rtyrJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543934; c=relaxed/simple;
	bh=J54mRCc4TA8Z4VciDzr3Ksuq/v73u4HvAr9RSsexGr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y61lKaLj6UeB5U+bY9wY2V+AoRyI+39Oz1emaV/RqG/r2eTnqO++T7XgxfYkCyb28HdYBCPE+PdVHXln3oCOqHYaBN8SbQFz7VzIW5ILMvxEZ9PkMQEIVHCQ8Q+/MA+mm0J+9huBkd0uXTZyDC6KoDWEWPr4IH2CRz18bxHLL0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcxaDu+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcxaDu+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E048CC4CEDC;
	Wed, 18 Dec 2024 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734543933;
	bh=J54mRCc4TA8Z4VciDzr3Ksuq/v73u4HvAr9RSsexGr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcxaDu+uoAsY5MlHCbhemgZPrkhaH9taYJKpE3cNfs55hmzYdFJAiYPRr5S1yeEDB
	 QydPSuk37ltYyIHmEi68TjJm4aXUdedrC/Lzo8rNDVrjyzs1aKYoogf94T2y8LDTHf
	 /yOEsMWV2q/faJ+aLU6oM+XdDcT+0BgvmFLofBINBmVNhNdFp1G57dYcq6fBxZSnbB
	 /ZAjX3hOw3TUeScQMNIiYdmKwZDoFYEhrvpwI8GYtUYDkQCyzlVx+YbzkJKCCtmdiT
	 Vm3ULERUdr0HOD2YeDIwF5h2XNQYW0Qn3Gc8mqEUvl8sus29GjPUTcUKpOCnd3KxbD
	 h7sZNmK4jQIlg==
Date: Wed, 18 Dec 2024 17:45:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add ID for eMMC for EN7581
Message-ID: <20241218-untimely-step-fe3e4048f7f8@spud>
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
 <20241218-shimmer-defog-97f86d6ebe98@spud>
 <6763045f.df0a0220.10df6b.5428@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v61rXNvGvaOJ70v6"
Content-Disposition: inline
In-Reply-To: <6763045f.df0a0220.10df6b.5428@mx.google.com>


--v61rXNvGvaOJ70v6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 06:20:27PM +0100, Christian Marangi wrote:
> On Wed, Dec 18, 2024 at 05:04:03PM +0000, Conor Dooley wrote:
> > On Wed, Dec 18, 2024 at 10:11:33AM +0100, Christian Marangi wrote:
> > > Add ID for eMMC for EN7581. This is to control clock selection of eMMC
> > > between 200MHz and 150MHz.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > > Changes v2:
> > > - Drop additional define for EN7581_NUM_CLOCKS
> > >=20
> > >  include/dt-bindings/clock/en7523-clk.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bind=
ings/clock/en7523-clk.h
> > > index 717d23a5e5ae..c4f8a161b981 100644
> > > --- a/include/dt-bindings/clock/en7523-clk.h
> > > +++ b/include/dt-bindings/clock/en7523-clk.h
> > > @@ -12,6 +12,8 @@
> > >  #define EN7523_CLK_CRYPTO	6
> > >  #define EN7523_CLK_PCIE		7
> > > =20
> >=20
> > Why the gap?
> >
>=20
> It's only present in en7523 so maybe it's a good idea to have the gap to
> make that more clear?
>=20
> > > +#define EN7581_CLK_EMMC		8
> > > +
> > >  #define EN7523_NUM_CLOCKS	8
> >=20
> > Can you delete this please? Your changelog appears to suggest you did,
> > but I see it still.
>=20
> Yes sure didn't want to change this too much to cause regression
> downstream if anyone was using it. Will drop in a dedicated patch when I
> will post v3 tomorrow.


Oh, I'm dumb. I didn't notice 1 instead of 3, sorry.

--v61rXNvGvaOJ70v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MKOQAKCRB4tDGHoIJi
0uiKAQD9TRIHxNEEM6wzcPXTFdjEXbDeHGgdM1q3BQZqyi5jiAD/VmFQ5m5TTQeN
NzBU+KoeTFulHXvW//ZTprC6SjBfNwc=
=WFLJ
-----END PGP SIGNATURE-----

--v61rXNvGvaOJ70v6--
