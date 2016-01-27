Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 21:38:16 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>,
	mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: sunxi: delay protected clocks until arch
 initcall
Message-ID: <20160127203816.GU4317@lukather>
References: <1453385439-10154-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1453385439-10154-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20160127153722.GC4317@lukather>
 <7334994.mKnQpNNMP2@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tbn31orTZdSAVHoc"
In-Reply-To: <7334994.mKnQpNNMP2@diego>
List-ID: <linux-clk.vger.kernel.org>


--tbn31orTZdSAVHoc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 27, 2016 at 05:14:17PM +0100, Heiko St=FCbner wrote:
> Hi,
>=20
> Am Mittwoch, 27. Januar 2016, 16:37:22 schrieb Maxime Ripard:
> > I thought the patches were simply dropped and the
> > rockchip people just took another approach.
>=20
> nope still on track ... especially as it was Stephen's believe that orpha=
ns=20
> shouldn't even be usable to general clock users :-).
>=20
> I just remember that the proposed general solution was based on Mike's=20
> upcoming generic critical clock handling (the handoff thingy), which woul=
d=20
> move critical clock handling out of architecture-specific code, so I've b=
een=20
> prodding Mike mainly.
>=20
> Another option might be to allow clock-controllers to handle orphans and =
only=20
> deny orphan usage to outside clock users, maybe expanding on what I did w=
ith=20
> the clock-conf part in patch2.

I'm not sure that would solve anything in our case. All our clocks
drivers are different ones, so I'm not sure how we could handle that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tbn31orTZdSAVHoc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqSq4AAoJEBx+YmzsjxAgznAP/0myL+n1jum+3RbNL1J0VU3B
YHpNdXO7AaRoT+MFD8TfvsoESiLeYy2Z5VSAqxT8UIE9ng33gaCcKHYfgUxk3rQm
J8ROWFgXAiaah3sxYjGncGCfixL+cRvYon+hLBYzfZ+FhE/oUqyzhdfyYu4FPXw3
CLOsSLOWwTwaQXbDh/lqDAlMCRo5XgWAdfTtBsexUuEBHhys2iXdePvcIVJRJ7t6
3VT6KWq83VhFlWcDwvwOZ/3K38H+Cyz5YapDq8hS0dCboZ0J5z7/AFc7WMKykeLk
xr/CJY6xySDalDEYdM7hfDxn/9HruXeOV1+boPLT6I2W7K52JY7VQfIbyQHggBpS
524R7FkUS0NXHh6kSmbSYjNXqF7nJXT7n0JP+OPK4w7awuKHD0turf1C5TCdNQxU
UzayF0QwFPSM9N8suzV+PZIeMnWfgBONS692I4jtpJUGUHhMth61sm5Umi3j7k15
TZAJNUSFeKwGd+7h/5R1qtoyb3Us0ILfoTyx5/y58wswYz6L1tLgahmm4KtsrZN4
ZgtEvafW3UJJwsHxoGsH62LMOObea6P+usoQS6zxM83V+CFbsue7uTnsnQK5YGkG
e7grmYj3gAZ6N+RDVEazqpWQ+irVNjHW3V4TEplE7wH3DMngfC9eMusOkCd6x7r/
v4r8fhIdoVzDBZCusnLk
=v2+w
-----END PGP SIGNATURE-----

--tbn31orTZdSAVHoc--
