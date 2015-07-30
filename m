Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Jul 2015 12:12:42 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 6/7] ARM: sun9i: Add clock indices
Message-ID: <20150730101242.GK2564@lukather>
References: <1437945270-32014-1-git-send-email-maxime.ripard@free-electrons.com>
 <1437945270-32014-7-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65o8wh50u4pWuArspq+Bi=33JGp0TDF_N+hWZqHcRn4qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I2DZnI03i1DS0lOz"
In-Reply-To: <CAGb2v65o8wh50u4pWuArspq+Bi=33JGp0TDF_N+hWZqHcRn4qQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--I2DZnI03i1DS0lOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 03:44:59PM +0800, Chen-Yu Tsai wrote:
> On Mon, Jul 27, 2015 at 5:14 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A80 gates have a non continuous set of clock IDs that are valid. Add
> > the clock-indices property to the DT to express this.
>=20
> The commit message does not match the patch, which is just a reformatting=
 of
> existing clock-indices properties.

Indeed... That's what happens when you automate too much things.. :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--I2DZnI03i1DS0lOz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVufiaAAoJEBx+YmzsjxAgrocP/3dpa+iGMf1yU/Tw4s9hCzTu
Vn9mz/+LjtGsQqrlM0ZenkZf/Tiro4gW5Ak9kM3o9euB3/Im6sx3LvNh4CU+jC6p
yQzR/Y2/+dvc81WO4+xDdsSO9LCL7EzB3T9qGnQFUnYUPjMWa/2b81EfQQNV5rhe
hcxYcFegTnzPMzKM4JGAzzdOuQ+0KepsK4lnBGGYaSuwknSJwD0QrsVKHqKW/UdY
cKX9iMfW+SKm7h5UiAPUowzNxx5OI7ML3HV1rO46aM0PsJ7XJ1b1n/FEWv9PMtnC
L3w4JR4wVHvZx7y5Nl+Irao/IudUsqY7fdas7TvwiAeM4AXDmU0xqxbX6EawTBgd
2nY2UlQG1bXjQYN8/NSvQCH3CiaHrEi9c/WMug9s9e4Ets/Ao9Uc5SDwGRSPjq5S
jj5CPqMsNf5zJkuoKp/M03UoBDWiV17Qrst5OQvs7IPil/fzWm4a1v+w2YDMQwEC
hP/jWlB3iJOEebS1qCxaYLZA1AWirWaVDAnz17b+sOIciHMSB2OgO2IH0ga2GTq2
GEqgSFP69/fdi5k3X+4RHfgDzHql83a0u+qTg4RovmbQNVcPfNTnxPNmF7to8DiE
dpYIUZ3Fqj4eeq5qC23L6B38ruypNlCzSthd8drZvvR+6IfWxUm8OXRdUc/5tmK8
ixu+FtYJWEPy1DDSlyls
=EyBb
-----END PGP SIGNATURE-----

--I2DZnI03i1DS0lOz--
