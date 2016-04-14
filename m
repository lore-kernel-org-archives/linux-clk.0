Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:58551 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755967AbcDNRYM (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2016 13:24:12 -0400
Date: Thu, 14 Apr 2016 19:24:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Cc: Jean-Francois Moine <moinejf@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-ID: <20160414172400.GR4005@lukather>
References: <20160310081658.B749246B@mail.free-electrons.com>
 <20160321072546.GT30977@lukather>
 <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
 <56FC3BEB.8030106@elopez.com.ar>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DvifzEOEABd5jzbd"
In-Reply-To: <56FC3BEB.8030106@elopez.com.ar>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--DvifzEOEABd5jzbd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 05:49:47PM -0300, Emilio L=F3pez wrote:
> [Sorry for the delay, I meant to reply to this post a while back but I
> forgot]
>=20
> El 21/03/16 a las 05:25, Jean-Francois Moine escribi=F3:
> > On Mon, 21 Mar 2016 08:25:46 +0100
> > Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> >=20
> >>> -	/* find the parent that can help provide the fastest rate <=3D rate=
 */
> >>> +	/* find the parent that can help provide the fastest rate */
> >>>  	num_parents =3D clk_hw_get_num_parents(hw);
> >>>  	for (i =3D 0; i < num_parents; i++) {
> >>>  		parent =3D clk_hw_get_parent_by_index(hw, i);
> >>> @@ -100,7 +100,7 @@ static int clk_factors_determine_rate(struct clk_=
hw *hw,
> >>>  		child_rate =3D clk_factors_round_rate(hw, req->rate,
> >>>  						    &parent_rate);
> >>> =20
> >>> -		if (child_rate <=3D req->rate && child_rate > best_child_rate) {
> >>> +		if (child_rate > best_child_rate) {
> >>
> >> I'm not sure this would work, since you'll end up picking the fastest
> >> rate without considering whether it is the closest or not.
> >>
> >> I guess what you want here is using the absolute difference between
> >> the requested rate and the rate you're evaluating.
> >>
> >> That being said, we had a similar discussion for SPI around a month
> >> ago where we wanted a rate strictly lower than the requested one. I
> >> guess it's time to add a flag to tell how you want to round.
> >=20
> > You are right, I just removed half of the constraint, but I still wonder
> > why does this sequence introduced by the commit 862b728387aef3a37
> > (clk: sunxi: factors: automatic reparenting support) do
> > 	"provide the fastest rate <=3D rate"
> > instead of
> > 	"provide the closest rate" ?
> >=20
> > Emilio?
>=20
> Overclocking components is usually not a good default in my opinion. I
> don't recall at the moment if there was some other justification apart
> from playing it safe.

Yeah, I'd agree, it should be the exception rather than the norm. In
some cases that are very timings sensitive (audio or video), we
probably want to enforce something as close as possible to the
expected rate, even if it trips above the rate.

For all the other, I'd prefer to keep the current behaviour.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DvifzEOEABd5jzbd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXD9IwAAoJEBx+YmzsjxAgHeIP/jMZzpTa+xKCFHEHYLiiMtZ9
XIpk7sX6tWBH3QxonJU6iIgAUWZcHkegdbMWnXu069Kz9cHT4GtB7rEMnwtm8d6l
uxGfOaJJzfUMi/vIgROTlIAEVC0yfvPIlkyfiCJ9IUuf8VtXEnT+1cqqtZ9KoZQM
PFogiSOQ4PYa7kei3MeFcs7qC7Gr+IrQ3/gAthhueGIMBnwmoMCqNj5pWhtWjXn7
GxtQhFLQFU0nYgurHEgpLR0EXLwYpMyl50qgneJLGydhe7mFvnH/JNUwbriuLssU
tqERKg6cGDRGwyoNzVyBu3+Yd83bTMkLN0OF1oJWUTOh74QUPUjIN3sNcze14EfS
RQlwGPcwA/u31fVrm9GkCCsa/D8a5FRFfnZd77OdoM3H/8SrUQylR2S7sYTT63Cv
YeEwkwZM4VjjrI88nzyV0rZv0iWR9eNsgZpMqI7WoUaP1CwCz/SXYrOg9sul61Gf
6uxyc83xvIMkB/fHAFnvgWmHN657vq3KSO3bdI9kNxIQCF8zDr10EA2hZ7tUfAHr
5sEdqjyEqZ9/JyE3QC4tCkIPj1VwOMsjwnWaHY1FE+dS5KJ3GG4JpzLV7y9rfUhl
jhe85mGi/NQ1Tslx+PdQ6v1TKhi6qzF5bxJsTyR8GMPNRV3VG3Z2kRmXmw2d21Fb
vqmUK2qszpXxJHzalgzS
=/q01
-----END PGP SIGNATURE-----

--DvifzEOEABd5jzbd--
