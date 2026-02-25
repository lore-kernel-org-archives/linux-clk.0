Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11933815D1;
	Wed, 25 Feb 2026 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772061904; cv=none; b=RsRN7JJjkbJB9HU3NQyng23sfaJknASN9gyEvqKELSS4a4mTKmDwsO/lZm21oJXWn/WzKqhGOpF5dWDNxtMbCM9EXgZGzCvRCk3X7M8u1ay/Kuqh47ovtwXvgiePyzOoaGJgcWItjKQnUIjt7qXn3hUFSs8H8vPR2LiyKA6xYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772061904; c=relaxed/simple;
	bh=dqERQJmOH4aGB9pkJ5LjuWoL8pGfStP2xh05xN/ZBCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxnxZsf6zpjKfOMpSJxj2npMuxdVpq9mT8xGFJWI6BAqC5i4eLYE2jcB+i6OCz4HE2DgF4kkf95Fk8U3g+vu4UgJaMVBpvhXTENtOY45veWONkYDQtoRznRNFR8wt8CobRyWGHUajrI4ZGrWLfBiDKe7PCdxy+uWCT6RD+lRias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcPEd03M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcPEd03M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFCEC19425;
	Wed, 25 Feb 2026 23:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772061904;
	bh=dqERQJmOH4aGB9pkJ5LjuWoL8pGfStP2xh05xN/ZBCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcPEd03MbkVYOUlQQZNPs13SW+n30iH51DZYMtvyf+E5I8KUt5k4ySGhASiSJKAyF
	 KnADC64X7i58v94r9RGAZRITxR3ZDo9hh58apxvb3eCi9zWJ8KW4mymTYYMgQLJ/gd
	 5sB21nv4xcnvYKnYDwPulFGxOHYmA6LFD/LsxtNBV3k5I6IhT8xUp9V9PHZ9vZ3dbw
	 u0DPNSoAdAZiBR39iYnKxiQ/s5mk2rN93L7SSqsRxUiAk1JdM6HQmSuKHxSxH0pr1k
	 WnC/saxX7K48W0oFotpB2LfqyEtSSJ7cx0BpzxBUElBkxjOH6pWge5AQKIFtCHx4+g
	 8Vwv5uzUZepQQ==
Date: Wed, 25 Feb 2026 23:24:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access
 during output registration
Message-ID: <20260225-thrive-endless-3168e0b0f916@spud>
References: <20260224-briskly-scholar-294d13464721@wendy>
 <aZ9-NWiX4wMH3Ay6@redhat.com>
 <20260225-cache-nebulizer-2f3669074fa4@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BOZkWEMkKWK9MVwc"
Content-Disposition: inline
In-Reply-To: <20260225-cache-nebulizer-2f3669074fa4@spud>


--BOZkWEMkKWK9MVwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 11:14:47PM +0000, Conor Dooley wrote:
> On Wed, Feb 25, 2026 at 05:56:53PM -0500, Brian Masney wrote:
> > Hi Conor,
> >=20
> > On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> > > UBSAN reported an out of bounds access during registration of the last
> > > two outputs. This out of bounds access occurs because space is only
> > > allocated in the hws array for two PLLs and the four output dividers
> > > that each has, but the defined IDs contain two DLLS and their two
> > > outputs each, which are not supported by the driver. The ID order is
> > > PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output =
IDs
> > > by two while adding them to the array to avoid the problem.
> > >=20
> > > Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock =
support")
> > > CC: stable@vger.kernel.org
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > > CC: Michael Turquette <mturquette@baylibre.com>
> > > CC: Stephen Boyd <sboyd@kernel.org>
> > > CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > > CC: linux-riscv@lists.infradead.org
> > > CC: linux-clk@vger.kernel.org
> > > CC: linux-kernel@vger.kernel.org
> > > ---
> > >  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/micro=
chip/clk-mpfs-ccc.c
> > > index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> > > --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> > > +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> > > @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct devic=
e *dev, struct mpfs_ccc_out_hw_
> > >  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n=
",
> > >  					     out_hw->id);
> > > =20
> > > -		data->hw_data.hws[out_hw->id] =3D &out_hw->divider.hw;
> > > +		data->hw_data.hws[out_hw->id - 2] =3D &out_hw->divider.hw;
> >=20
> > What happens when / if the DLLs are supported by this driver in the
> > future? This seems like a trap for the future.
> >=20
> > According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
> > only 16 clock IDs. Could hws be initialized to have enough room for all
> > 16 structures, and would it be ok if it was a sparse array?
> >=20
> > At the very least, I think it would be nice to include a comment here.
>=20
> I think I'd rather add a comment, I know it's at most only 24 extra
> allocations, but just feels bad to do it.

I'll add this, maybe on application.

@@ -234,6 +234,10 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
        unsigned int num_clks;
        int ret;
=20
+       /*
+        * If DLLs get added here, mpfs_ccc_register_outputs() currently pa=
cks
+        * sparse clock IDs in the hws array
+        */
        num_clks =3D ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pl=
l0out_clks) +
                   ARRAY_SIZE(mpfs_ccc_pll1out_clks);

--BOZkWEMkKWK9MVwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ+EywAKCRB4tDGHoIJi
0momAP9uDt68utwPZDTUNSuzOABEQhqL9EIcGlxduMBsmrWjrwD/bBddyNiT/Wsy
vY/xE8cBbqIUxbHuPSsvaTLzOYpUQQw=
=HMKd
-----END PGP SIGNATURE-----

--BOZkWEMkKWK9MVwc--
