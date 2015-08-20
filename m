Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Aug 2015 17:15:10 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, lee.jones@linaro.org, s.hauer@pengutronix.de,
	geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150820151510.GD30520@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nDtE8k2pYjsRXajv"
In-Reply-To: <20150818164356.31346.80341@quantum>
List-ID: <linux-clk.vger.kernel.org>


--nDtE8k2pYjsRXajv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-08-18 08:45:52)
> > Hi Mike,
> >=20
> > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > > All of the other kitchen sink stuff (DT binding, passing the flag back
> > > to the framework when the clock consumer driver calls clk_put) was le=
ft
> > > out because I do not see a real use case for it. If one can demonstra=
te
> > > a real use case (and not a hypothetical one) then this patch series c=
an
> > > be expanded further.
> >=20
> > I think there is a very trivial use case for passing back the
> > reference to the framework, if during the probed, we have something
> > like:
> >=20
> > clk =3D clk_get()
> > clk_prepare_enable(clk)
> > foo_framework_register()
> >=20
> > if foo_framework_register fails, the sensible thing to do would be to
> > call clk_disable_unprepare. If the clock was a critical clock, you
> > just gated it.
>=20
> Hmm, a good point. Creating the "pass the reference back" call is not
> hard technically. But how to keep from abusing it? E.g. I do not want
> that call to become an alternative to correct use of clk_enable.
>=20
> Maybe I'll need a Coccinelle script or just some regular sed to
> occasionally search for new users of this api and audit them?
>=20
> I was hoping to not add any new consumer api at all :-/

I don't think there's any abuse that can be done with the current API,
nor do I think you need to have new functions either.

If the clock is critical, when the customer calls
clk_unprepare_disable on it, simply take back the reference you gave
in the framework, and you're done. Or am I missing something?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nDtE8k2pYjsRXajv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1e7+AAoJEBx+YmzsjxAg7TkP/RWto4dY8J2TwWmo67jIWz7J
v/TdVwSoYKew7WZjZULfHKEb/tdp6+TSOvYMud9NvtDgKpsnDczqDer6Quy4knv3
uZOozexqcdrazKdTh3oaGmq0mj3PAsVoXUSYhbUeQweiEdVCEDze3ZrGnnTxOT2W
pvNxWxcSu2dklSaU4QHbChFTue/8sCf6oTLa8DcqcdkFbVlgfV2fGn5CZ+Nf8hJn
6rikIbMEY4qlRt09/LKEuyxxYwGko6W9GLJd3ifISb+o2v/mjc3k3AYjyDaIsBBB
HTpglFI3et/Uo8kxBqHZ+NB1kSc2YkN2zDIWUOILfUiHCb2EHJa/waFVW18F6RhC
5a8+h0HC0U9AIMfV1Ov9M8gKsZD4EWjPxGFo/ZFO0e0HBfsMBoyrGh6U3PTOoOPS
gGcoXnATmPmlWhPR8ZhgYenIRvFtuX3plwk/7TQjZ6127YeGZxhc86KkRyWcf+Qb
5LSOd9HGkM/7ruR1Oi531C6MOr6M4ilUsqsxT61jDzzbMk12KUEbzEoMqrBcb7U9
VdW/yFMuwCuEJIJlFzAnaWnPpa5d0KV/SxT02iofaE9PB4e5YAIP7auw3AXHwsZN
/V73tonsdsQbpzRxPhKkTeXlIPSVlefN8bWhqflbcM6jjk7MrDzNPIS+ShM+l7rA
I6CIGZqXDJNd7weF0PBG
=8CmC
-----END PGP SIGNATURE-----

--nDtE8k2pYjsRXajv--
