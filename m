Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:35429 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750868AbcDNTbf (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2016 15:31:35 -0400
Date: Thu, 14 Apr 2016 21:31:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-ID: <20160414193132.GT4005@lukather>
References: <20160310081658.B749246B@mail.free-electrons.com>
 <20160321072546.GT30977@lukather>
 <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
 <56FC3BEB.8030106@elopez.com.ar>
 <20160414172400.GR4005@lukather>
 <20160414201428.0c89d3b943db543c3ab08740@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="finhkSr2yyrWw3ow"
In-Reply-To: <20160414201428.0c89d3b943db543c3ab08740@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--finhkSr2yyrWw3ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 14, 2016 at 08:14:28PM +0200, Jean-Francois Moine wrote:
> On Thu, 14 Apr 2016 19:24:00 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > >> That being said, we had a similar discussion for SPI around a month
> > > >> ago where we wanted a rate strictly lower than the requested one. I
> > > >> guess it's time to add a flag to tell how you want to round.
> > > >=20
> > > > You are right, I just removed half of the constraint, but I still w=
onder
> > > > why does this sequence introduced by the commit 862b728387aef3a37
> > > > (clk: sunxi: factors: automatic reparenting support) do
> > > > 	"provide the fastest rate <=3D rate"
> > > > instead of
> > > > 	"provide the closest rate" ?
> > > >=20
> > > > Emilio?
> > >=20
> > > Overclocking components is usually not a good default in my opinion. I
> > > don't recall at the moment if there was some other justification apart
> > > from playing it safe.
> >=20
> > Yeah, I'd agree, it should be the exception rather than the norm. In
> > some cases that are very timings sensitive (audio or video), we
> > probably want to enforce something as close as possible to the
> > expected rate, even if it trips above the rate.
> >=20
> > For all the other, I'd prefer to keep the current behaviour.
>=20
> OK, then, as I have no solution for this clock, there will be no audio
> 44.1KHz from the H3...

You have not read me. I already suggested in the quote above to add a
flag to tell how we should round the clock rate, the default remaining
to round it down.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--finhkSr2yyrWw3ow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXD/AUAAoJEBx+YmzsjxAgYVQP/3HrGp5HM5Z9E7B4SQ5sddWq
ux2fsSv7O5jZpJPrEwDMP5U0uAcrfxyXOVPbqvL6iMRvLQOLgSz30167XOkfOBAU
OAGVYQ2iG8TQ9vmBlazjAhAs+4vZrMRu/YHqm2ks+MgFpAXWhZHxbUmLPJ05i8ox
BQriEL8VQbsIyD/vgcD2/EOIKphVZbB610FagZW68NIg2tiMOkrSiEqwKI85Fs8H
gA58L4tGJ46mVO03judDOR+c62GxRYD9FGWmLH5HkqrcWM+OIJXUFE3h/jOzm+QS
bLI8sXubm05HuVEmONHNKO/LmkTIsdk+DLe4OYlM3uSfmcuIZjhB59mpW5wdnC47
3dv0lJPl0eFr3hUadVrxELr3puyHjH2sciJGgUcujnvLw08iz85fiqpeos51NIri
oxy6Wpq2cCB5iwUKUFc2s2TvPrLpEqoKPa2VQVTei6T/KBo6e32iOeGMVAWgmRbc
IVbd27KSgZNSRrPgPPqBct7XOUqmUfNEY5op3/TZ0zoSk3NGPb1/p85E3cXEu39s
ekhZvmAV5mbR79A1Wzst9zEv8I/VOlmXYIOHcIEyuLMljeKU9Wzn7630wBMAMYED
n+wmkzyJxE7kTLeMm8uEHY4XipdAZJvmgLAwRUUtdDvCBxQkjEI4qPgJCX4JEz6p
M8EtnmwHXB/A5XAVvpdY
=6F6h
-----END PGP SIGNATURE-----

--finhkSr2yyrWw3ow--
