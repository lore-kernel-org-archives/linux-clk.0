Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 14 Apr 2016 19:28:38 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"pawel.moll@arm.com" <pawel.moll@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Reinder de Haan <patchesrdh@mveas.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 02/13] clk: sunxi: add ahb1 clock for A83T
Message-ID: <20160414172838.GS4005@lukather>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
 <1458144276-31108-3-git-send-email-vishnupatekar0510@gmail.com>
 <20160317104042.GK30977@lukather>
 <CAEzqOZvoMrvf-3=Tfi7MK9ZTm1EtJre5gsBdz=2wZ+D+hj056A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+AhoeLdLI498vdY"
In-Reply-To: <CAEzqOZvoMrvf-3=Tfi7MK9ZTm1EtJre5gsBdz=2wZ+D+hj056A@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--z+AhoeLdLI498vdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2016 at 11:07:29AM +0800, Vishnu Patekar wrote:
> Hello Maxime,
>=20
> On Thu, Mar 17, 2016 at 6:40 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Mar 17, 2016 at 12:04:25AM +0800, Vishnu Patekar wrote:
> >> AHB1 on A83T is similar to ahb1 on A31, except parents are different.
> >> clock index 0b1x is PLL6.
> >>
> >> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> >> Acked-by: Chen-Yu Tsai <wens@csie.org>
> >> Acked-by: Rob Herring <robh@kernel.org>
> >> ---
> >>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
> >>  drivers/clk/sunxi/clk-sunxi.c                     | 76 ++++++++++++++=
+++++++++
> >>  2 files changed, 77 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docum=
entation/devicetree/bindings/clock/sunxi.txt
> >> index 834436f..cba9fe55 100644
> >> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> >> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> >> @@ -30,6 +30,7 @@ Required properties:
> >>       "allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
> >>       "allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
> >>       "allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
> >> +     "allwinner,sun8i-a83t-ahb1-clk" - for the AHB1 clock on A83T
> >>       "allwinner,sun8i-h3-ahb2-clk" - for the AHB2 clock on H3
> >>       "allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
> >>       "allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
> >> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sun=
xi.c
> >> index 91de0a0..a7aab65 100644
> >> --- a/drivers/clk/sunxi/clk-sunxi.c
> >> +++ b/drivers/clk/sunxi/clk-sunxi.c
> >> @@ -344,6 +344,67 @@ static void sun6i_ahb1_recalc(struct factors_requ=
est *req)
> >>       req->rate >>=3D req->p;
> >>  }
> >>
> >> +#define SUN8I_A83T_AHB1_PARENT_PLL6  2
> >> +/**
> >> + * sun8i_a83t_get_ahb_factors() - calculates m, p factors for AHB
> >> + * AHB rate is calculated as follows
> >> + * rate =3D parent_rate >> p
> >> + *
> >> + * if parent is pll6, then
> >> + * parent_rate =3D pll6 rate / (m + 1)
> >> + */
> >> +
> >> +static void sun8i_a83t_get_ahb1_factors(struct factors_request *req)
> >> +{
> >> +     u8 div, calcp, calcm =3D 1;
> >> +
> >> +     /*
> >> +      * clock can only divide, so we will never be able to achieve
> >> +      * frequencies higher than the parent frequency
> >> +      */
> >> +     if (req->parent_rate && req->rate > req->parent_rate)
> >> +             req->rate =3D req->parent_rate;
> >> +
> >> +     div =3D DIV_ROUND_UP(req->parent_rate, req->rate);
> >> +
> >> +     /* calculate pre-divider if parent is pll6 */
> >> +     if (req->parent_index >=3D SUN8I_A83T_AHB1_PARENT_PLL6) {
> >> +             if (div < 4)
> >> +                     calcp =3D 0;
> >> +             else if (div / 2 < 4)
> >> +                     calcp =3D 1;
> >> +             else if (div / 4 < 4)
> >> +                     calcp =3D 2;
> >> +             else
> >> +                     calcp =3D 3;
> >> +
> >> +             calcm =3D DIV_ROUND_UP(div, 1 << calcp);
> >> +     } else {
> >> +             calcp =3D __roundup_pow_of_two(div);
> >> +             calcp =3D calcp > 3 ? 3 : calcp;
> >> +     }
> >> +
> >> +     req->rate =3D (req->parent_rate / calcm) >> calcp;
> >> +     req->p =3D calcp;
> >> +     req->m =3D calcm - 1;
> >> +}
> >> +
> >> +/**
> >> +* sun8i_a83t_ahb1_recalc() - calculates AHB clock rate from m, p fact=
ors and
> >> +*                     parent index
> >> +*/
> >> +static void sun8i_a83t_ahb1_recalc(struct factors_request *req)
> >> +{
> >> +     req->rate =3D req->parent_rate;
> >> +
> >> +/* apply pre-divider first if parent is pll6 */
> >
> > The comment indentation is wrong
> >
> >> +     if (req->parent_index >=3D SUN6I_AHB1_PARENT_PLL6)
> >
> > And this is not the right define you're using.
> >
> > I still believe that duplicating the same logic just because of
> > different dividers is not the way to go.
> >
> > You could solve that easily by adding a table for the muxes, and
> > associate it with parents and dividers, that you could store in
> > clk_factors.
>=20
> I've similar solution (please ignore a83 specific functions those will
> be common for a31 and a83t).
> https://github.com/vishnupatekar/linux/commit/f7de5b48d886a672b1f6db112fb=
fd5d2c9849afa
>=20
> is it aligned to what you're saying?

Yep. I'd even go a step further, and allow to have directly the core
deal with the pre-divider.

I guess in your prediv table you could have the index, and either the
offset and width of the divider (if it's a variable one), or its fixed
value.

The generic function would then be able to deal with the rate
adjustments, and you wouldn't need to be able to have anything related
to the parent index in the clock specific functions anymore.

Does that make sense?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--z+AhoeLdLI498vdY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXD9NGAAoJEBx+YmzsjxAgeywP/1MouB5Uo4NQgOXWdW66j/ZH
HwwlFEQcqNPXoxiCV29mUnGBh6BIHj17+Lu8JUi8/d7g7cKtUJJuYglXXSKOjZwA
/24iCrRf3TAL3kI62x+P+XPi61wdIIdSNZdwUBR1zVFmrTtXOqJug1Qwpb16EH/L
q7M3K0V+wWdf1u+qlnr0PyhSgbS1YBoZztExsIfabGlfT516gaAh9OzkGTAVaxwZ
Wr9qukMe9LuNoIkzM+sJ9cH9GZq4CG/43neHGgtj+qhi9eml2jkeXQXxClGbe+Nb
kTFV5qzzZbfO9aModjcrvLL3lfai3xEQZptbwUu+/ggztxiQcCwPhN+XYnjyCWPb
nffOBP7nuXAjgFtK71CDFrqOYD4ELXqUwt7+FW4kKupJy1TSoPbXn8+CwEo0xilF
rY+kKhw5TwUVFm9MZgn5dxfs+04nOYIK5V0Vhe6GTezyxLgAybDcF42aWlyFDoO6
44caRdGHr7oLnw0TVPqZyGbGJoS0796q1qZiNRD9WK0wAdus2ngMVOkh6YSju/4p
/9NYCakgYBUwDCFJUrvkTwG4GONidtdh+xr7ZIM5A1hg9VVBUsXva6DYeY8QqvOG
5XeWUYyYo0HUXqDK6hnMSYiP/88BigH+JsTctJuSYIgXvAPvG0ClKvCoEEFmsdT/
z4WOUSHefv8aJ3MGb2Is
=tgv1
-----END PGP SIGNATURE-----

--z+AhoeLdLI498vdY--
