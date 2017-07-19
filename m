Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 19 Jul 2017 13:28:56 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 05/11] mmc: sunxi: Support controllers that can use both
 old and new timings
Message-ID: <20170719112856.7vjcsel5cj6f5s5h@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-6-wens@csie.org>
 <20170717091747.kcrlifbp7meihszm@flea>
 <CAGb2v67VmdfrMNLFH=6hhbGAHr15e0q4toDUbJ17d3exS3maFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bd2jix6f475lfyof"
In-Reply-To: <CAGb2v67VmdfrMNLFH=6hhbGAHr15e0q4toDUbJ17d3exS3maFw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--bd2jix6f475lfyof
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 04:59:23PM +0800, Chen-Yu Tsai wrote:
> On Mon, Jul 17, 2017 at 5:17 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Fri, Jul 14, 2017 at 02:42:56PM +0800, Chen-Yu Tsai wrote:
> >> On the SoCs that introduced the new timing mode for MMC controllers,
> >> both the old (where the clock delays are set in the CCU) and new
> >> (where the clock delays are set in the MMC controller) timing modes
> >> are available, and we have to support them both. However there are
> >> two bits that control which mode is active. One is in the CCU, the
> >> other is in the MMC controller. The settings on both sides must be
> >> the same, or nothing will work.
> >>
> >> The CCU's get/set_phase callbacks return -ENOTSUPP when the new
> >> timing mode is active. This provides a way to know which mode is
> >> active on that side, and we can set the bit on the MMC controller
> >> side accordingly.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  drivers/mmc/host/sunxi-mmc.c | 34 ++++++++++++++++++++++++++++++----
> >>  1 file changed, 30 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc=
=2Ec
> >> index 0fb4e4c119e1..56e45c65b52d 100644
> >> --- a/drivers/mmc/host/sunxi-mmc.c
> >> +++ b/drivers/mmc/host/sunxi-mmc.c
> >> @@ -22,6 +22,7 @@
> >>  #include <linux/err.h>
> >>
> >>  #include <linux/clk.h>
> >> +#include <linux/clk/sunxi-ng.h>
> >>  #include <linux/gpio.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/spinlock.h>
> >> @@ -259,7 +260,7 @@ struct sunxi_mmc_cfg {
> >>       /* Does DATA0 needs to be masked while the clock is updated */
> >>       bool mask_data0;
> >>
> >> -     bool needs_new_timings;
> >> +     bool has_new_timings;
> >
> > I think we should have both, it's a bit different. Newer SoCs like the
> > A64 can only operate using new timings, while the older ones can
> > operate in both modes.
> >
> > In one case, we're forced to use it, in the other one it's a
> > policy. We should differentiate both cases.
>=20
> For the A64's case, the limit is implied by not having any clk_delays.

FWIW, I'm really not a big fan of that either :)

Explicit is better than implicit.=A9

> But yes, I'll keep "needs_new_timings", and rename the new option to
> "has_timing_switch" to make things clearer.

Great, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bd2jix6f475lfyof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZb0J4AAoJEBx+YmzsjxAglo8QALargjCFyEB5hU3tIpW6Ra7E
c0XfzP2gdl60I5JiNl/iEuI+maNS6rwON70hmq0JW58rmCc1pGDf5WoLfT8U8tKi
GwXhMqHpCHBpX5y+x5YDdEgOTEiKAVNotmtEgZkaIEnolsxUvYiMD8iTmoYUW6PD
OKSt1HLXCmpsdx0vpYNiHAi0JpEpwBa+WTuzdas6+g4FF4WLx6fhqG03FvwIQ74d
gainmHvUhWMzir8XXq9tSsV9aslCYCn8WmCQT6YWEMdmlxWDUHXxAI1lytd9GosE
kuR4Y//zRk9M9KZuaNeGxy9Pp5+dK0ReX48GkcXTNz0L9hdk7qr1YYW6Xe046i0L
Fliu7OZMw4mAOM0rqHZO5UIONTQ8ltl5N0/ZjsI1T9+A73Zi/+cpHWj9V6Gx8Uj9
aZV8b+mYwptJQOACR74EYWVdTn/EPFFT1MDuBfppE88BMPJaBf4LnZw6Aid/8Q/G
gpULc33RIAmu4sQHJvo4FOOAQ/3uWj0FZQYgkPHFsMXrdswHFbzRvzU0LSCjbuRn
mDUM/aKdJFBPPfhT++5nvCt55sGvczf6i8FVYBg5bigzFoeNUiXNFQ2KAEcAx27q
Z5Yko/t0O6QCSrifvbr206TkIuYnHCRIrcTpzTGq49QRizbz/nAwBrI1Bg8MZQgO
lbb/OtQWwY9RjweQIgqa
=D0Fp
-----END PGP SIGNATURE-----

--bd2jix6f475lfyof--
