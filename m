Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:47460 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751039AbcC2Ji3 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2016 05:38:29 -0400
Date: Tue, 29 Mar 2016 11:38:27 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-ID: <20160329093827.GH30977@lukather>
References: <20160310081658.B749246B@mail.free-electrons.com>
 <20160321072546.GT30977@lukather>
 <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AhSc/rXZRY65wXU"
In-Reply-To: <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--4AhSc/rXZRY65wXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 21, 2016 at 09:25:49AM +0100, Jean-Francois Moine wrote:
> On Mon, 21 Mar 2016 08:25:46 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > -	/* find the parent that can help provide the fastest rate <=3D rate=
 */
> > > +	/* find the parent that can help provide the fastest rate */
> > >  	num_parents =3D clk_hw_get_num_parents(hw);
> > >  	for (i =3D 0; i < num_parents; i++) {
> > >  		parent =3D clk_hw_get_parent_by_index(hw, i);
> > > @@ -100,7 +100,7 @@ static int clk_factors_determine_rate(struct clk_=
hw *hw,
> > >  		child_rate =3D clk_factors_round_rate(hw, req->rate,
> > >  						    &parent_rate);
> > > =20
> > > -		if (child_rate <=3D req->rate && child_rate > best_child_rate) {
> > > +		if (child_rate > best_child_rate) {
> >=20
> > I'm not sure this would work, since you'll end up picking the fastest
> > rate without considering whether it is the closest or not.
> >=20
> > I guess what you want here is using the absolute difference between
> > the requested rate and the rate you're evaluating.
> >=20
> > That being said, we had a similar discussion for SPI around a month
> > ago where we wanted a rate strictly lower than the requested one. I
> > guess it's time to add a flag to tell how you want to round.
>=20
> You are right, I just removed half of the constraint, but I still wonder
> why does this sequence introduced by the commit 862b728387aef3a37
> (clk: sunxi: factors: automatic reparenting support) do
> 	"provide the fastest rate <=3D rate"
> instead of
> 	"provide the closest rate" ?

I guess it's a confusing wording, in this case where you try to have
the closest rate but below the requested rate, what you want is
actually the fastest rate that doesn't trip above the requested rate,
hence the comment I guess.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--4AhSc/rXZRY65wXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW+k0TAAoJEBx+YmzsjxAgYrMP/i3AvohignjA3Coy431KHGWM
FJ8YifXs6BBQ6n8NyIeMSimv1zadW61aBlmtqP8cZ1TQL5qmSwjxliXeNPZ7ao7D
wxLleImb53zKpsJTyFZUDkyJRMJ7Mumy9MiWdozVTyZioZdp4G3sugkMKDVtRKYQ
CzvxDMAb4KHFGZ8cvGa4lD+EIwtKEKfwvDTVhYNy5Mxz2HvmETpsQjo0wseHhlPR
sVzLN7BGIPo0+96XacTKQza7gGGaQ8P+6YBKihEVyroF90scDmCWMiN5rQEsUJbw
OkNugCJI4yyMt2LHyfLEd2qM3FEL/kR9yrioDNVfE5obccBzCh/LcWB5AGpF02xD
eozQmdwj8n12SaZ3KSflucjj3eI54zI/cmMr48j2zGgsMxqyNU3ns8O7gKSDed8U
wxU62WQGhr0x2WPzy3BDq43VyOU7CHtGACtTqXtvJ4ClR+FOwWvtZMJnkkKdg+0c
TPV3QFuAXKR84E0RbcADXh034pxQbgmhahwZ2i23fRG6g0ASSi1DAiSrGGvVOg1K
y1RReR0fbSSktHnnZoAj9M0mMhuW6toyNB7jhSYA0k06kOWamj1CuPrPGUPx7JPD
7gyLEvGSXeeT4tJF3zYV7SieNv9lgIzTywZRf6C8JmdcBkQ24zHQ6AE5oBuIFGUD
E2iodzGL8k5y9xyL9Lcz
=XDWy
-----END PGP SIGNATURE-----

--4AhSc/rXZRY65wXU--
