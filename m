Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 Feb 2016 21:17:54 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: sunxi: Refactor A31 PLL6 so that it can be
 reused
Message-ID: <20160201201754.GI4652@lukather>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160130185714.7abcf1de9ef8108c2f48c7fe@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7SrMUQONj8Rl9QNG"
In-Reply-To: <20160130185714.7abcf1de9ef8108c2f48c7fe@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--7SrMUQONj8Rl9QNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 30, 2016 at 06:57:14PM +0100, Jean-Francois Moine wrote:
> On Thu, 28 Jan 2016 20:22:38 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Remove the fixed dividers from the PLL6 driver to be able to have a
> > reusable driver that can be used across several SoCs that share the same
> > controller, but don't have the same set of dividers for this clock, and=
 to
> > also be reused multiple times in the same SoC, since we're droping the
> > clock name.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> > Changes from v2
> >   - Rebased and converted over to the new factors refactoring. Fixed the
> >     retrieved rate
> >=20
> >  arch/arm/boot/dts/sun6i-a31.dtsi     | 36 ++++++++++++++++++----------=
--------
> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 25 +++++++++++++++++--------
> >  arch/arm/boot/dts/sun8i-a23.dtsi     |  2 +-
> >  arch/arm/boot/dts/sun8i-a33.dtsi     |  4 ++--
> >  arch/arm/boot/dts/sun8i-h3.dtsi      | 36 ++++++++++++++++++----------=
--------
> >  drivers/clk/sunxi/clk-sunxi.c        | 32 ++++++++++++++++------------=
----
> >  6 files changed, 72 insertions(+), 63 deletions(-)
>=20
> Hi Maxime,
>=20
> Do you know that the DT definitions cannot be changed when they are in
> the mainline kernel?

AFAIK, the only ARM platform that ever had such a policy was mvebu,
and they finally gave up on it. So, as far as I'm concerned, the DT
ABI simply doesn't exist.

> Also, for the H3 PLL periph1 (aka PLL8), why didn't you create a
> 'pll8x2' clock with 'pll8' as a divider?

No one seems to use it. We can always add it later in a separate
patch when someone will.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7SrMUQONj8Rl9QNG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWr71yAAoJEBx+YmzsjxAgoBYQAIJRlt2R/GpUIZHy67nimDyK
ZvS9s68mLTW3TqNrIK4cMIatLauQEXJPfN05aATMhuD+T6KkteG5NDc6+LozoFB1
Q9gQUqrP63diGK7EjTBsdMzlAZo1AzSAnIHleGnPApZOMSOuO4Lo2LP9fScmG18s
puMQm0m79owLiyN/H3FBCYWH9bxL+pGe1ZyVHnMRVBAzUDmftTul3CFqByKIynZS
EtXyGE+JxroZNQz7NMWe74wMeadLIEahG7Ema/oUbzB3XSGgVUR5UxixyskgxDYO
HMkxNmf4dx+R/TGAFWZC9DJXk+FfeF+ngFzIFeEYu7VurzfYJG8v4IRvW7GYs4cn
SJAAgU54Nfx6UmPXeSKFNzsdFttUSEceONtpBM4l0K2/si0V003E/cFwmSMD1OFT
jzEofkNPuM0qTe3JhS4hLKGyuhbjTQlZP6WkoMsbpZk/2/PmGyC6qxmd6Fv2vDYI
ncPJGcRzCtOIXh7VpGJv3E70aJ4k7rzy8SySUuIsg0XY+05hjZicZC+PjPvYfzKN
8Ka3Qbfz9C+oI0aqHtWzt2QaciVxU9e60GJlSwudrDv7/7Rri4aQw06cLL4Um972
k7Hu/OD0YQJIcCWI0tUjywUuYdacRJMAQfitlaxUZVZMZDjkL+Zn0IU0JPoZFt/V
3leDLLeRNe5Yc6ZqyZqi
=g+mK
-----END PGP SIGNATURE-----

--7SrMUQONj8Rl9QNG--
