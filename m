Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 7 Mar 2017 15:58:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Add driver for A83T CCU
Message-ID: <20170307145834.kalpo76jbwll6z5s@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-5-wens@csie.org>
 <20170214095819.utsftcvti5zdmlmi@lukather>
 <CAGb2v66PxbhUdqSwFc5iFN2wDVQbOsibDkckXpFsxXW1WJNe3w@mail.gmail.com>
 <20170215094954.h3wyaxlqkeb342yu@lukather>
 <20170301191705.GS25384@codeaurora.org>
 <20170303095333.hgxoli2h7clailvo@lukather>
 <20170303235639.GW25384@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k77rx2pute73dhtx"
In-Reply-To: <20170303235639.GW25384@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--k77rx2pute73dhtx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Mar 03, 2017 at 03:56:39PM -0800, Stephen Boyd wrote:
> On 03/03, Maxime Ripard wrote:
> > On Wed, Mar 01, 2017 at 11:17:05AM -0800, Stephen Boyd wrote:
> >=20
> > > Can someone explain what the issue is? Could something like
> > > clk_get_phase() + clk_get_rate() tell us if we're in one mode
> > > vs. the other?
> >=20
> > So we have two modes of operation for that clock, old vs new (I know,
> > I didn't pick the names).
> >=20
> > The old mode is what we support right now. It has a combination of a
> > linear multiplier and divider, plus some phase controls.
> >=20
> > The new mode however disables the phase controls and adds post-divider
> > of 2 on the rate.
> >=20
> > We cannot really rely on the rate itself, since there's a huge overlap
> > between the rates we can obtain in the old and new modes. Same thing
> > for the phase, having a 0 deg phase is achieved both in the old and
> > new modes.
> >=20
> > To make things worse, the new mode is only available on one out of
> > three MMC controllers (and associated clocks), and that MMC controller
> > needs to set a bit as well to switch to the new mode if needed. So we
> > definitely needs some synchronisation there, and also to be able to
> > retrieve if the mode switching is available, and if we're already
> > using that mode.
> >=20
> > Mike agreed that the easiest way forward was to use a custom function.
>=20
> Ok. Is there any need to change the mode dynamically at runtime?
> Or could it be decided once at clk driver probe time/boot time
> and detected via set_phase() failing when we're in the new mode?

One thing I forgot to mention is that we also still have to support
the old DTs that use our old clock drivers, that will probably never
get to see this new mode. So the first thing we need is being able to
tell whether that mode is supported and if it's already enabled.

And if it's supported, and not enabled, enable it, both in the clock
and MMC drivers.

> At least, it sounds like set_phase() should bail out there
> because it doesn't exist, although it could be argued that
> setting the phase to something it already is set to is valid and
> shouldn't return an error.

Yep, once the new mode is set (disregarding how we do it), we should
prevent any clk_set_phase !=3D 0. We'll also need to adjust the reported
clock rate.

> I'm not saying I'm opposed to the custom function, just thinking
> of alternatives if MMC maintainers don't agree with the custom
> function.

Ok, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--k77rx2pute73dhtx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYvsqWAAoJEBx+YmzsjxAgvnkP/3ABHq/R/hRwyXACOIDdD0dD
WooLBTFsJvkKG2PNS1arwIz7VyueVoSxXd2O4jkBJ1O61pxCATHtV7KJgvPrh1Ux
0r8GRJll4HW15W8JIeYoVKpBvruJNJSclEQOwn5gt9UKN8jOpgLOYd3U8xq/TNCR
RUOKKFYgI7OaUFk0MWgfMHxHDjQkOFfLdfJ5Dy1jwizvX4VBPvzNO6YVbDho5+8C
qD7CO+4krgPlDzsifT2cUguQmBt/wUTN2L9hlSHZem6VcryP4pcGfV3W7ynEbhX6
8gTUnx9UuAGnRHYkpUYk3Wpgp9DG/g9p/m8n40tqooLYarcObThiWMHxuHJ9zMzv
fxagDdtLmvVC9uEyHtMno0rwHkZHs4Y7RWtjaoEDYMgQbmxOlQcTzpeYaKwi2Tx3
YwEtTgw7gXbbahvoKkqPgOWHT90Agx4FUuirgS6Y1FO2JFYUjfPbhUvwr80vxEwd
u65AkjR2dSRf9JIsV4kpcdah1TwDzWJSmkX7DKM1uwN+RhdP5V48iGwysPTa7nEO
jPe/zn9BeRO2OB5+wM9IyvPf79jCUwiOCMpiipLo07VVNqJLE0ui5ztD6wGhQiYs
fwc8p3LPjLrPaWxbLvCeW6A79rCbLAdwTYAVXaTduruMlNOhJjmrssAQQUTIST8D
uv8eaI0mxRSUvggTyrdA
=31Ph
-----END PGP SIGNATURE-----

--k77rx2pute73dhtx--
