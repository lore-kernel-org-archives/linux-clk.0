Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:41305 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754478AbeFMH0v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Jun 2018 03:26:51 -0400
Date: Wed, 13 Jun 2018 09:26:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] Allwinner clock changes for 4.18
Message-ID: <20180613072649.dzbusalsfqlgymew@flea>
References: <20180521115947.wqrnv2hczate65lz@flea>
 <CAK7LNASgetmPKKS8AhYXqSSEFCi+q0ASZ68M0SECJT5EbAU4XQ@mail.gmail.com>
 <CAGb2v67DOgnW=gesPxgmxZJWieZkzjPJm5mt7eW15HgUP3_SZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3252dj2fdjvd3pij"
In-Reply-To: <CAGb2v67DOgnW=gesPxgmxZJWieZkzjPJm5mt7eW15HgUP3_SZg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--3252dj2fdjvd3pij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 03:53:41PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, Jun 11, 2018 at 10:00 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > Hi Maxime,
> >
> >
> > 2018-05-21 20:59 GMT+09:00 Maxime Ripard <maxime.ripard@bootlin.com>:
> >> Hi Mike, Stephen,
> >>
> >> Please merge the following changes for the next merge window, thanks!
> >>
> >> Maxime
> >>
> >> The following changes since commit 60cc43fc888428bb2f18f08997432d426a2=
43338:
> >>
> >>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags=
/sunxi-clk-for-4.18
> >>
> >> for you to fetch changes up to 17de4c857b1f74b90967f7e7fd5ff81be61dc04=
4:
> >>
> >>   clk: sunxi-ng: r40: export a regmap to access the GMAC register (201=
8-05-17 14:02:07 +0800)
> >>
> >> ----------------------------------------------------------------
> >> Allwinner clock changes for 4.18
> >>
> >> Not a lot of changes for this release, but two quite important features
> >> were added: the H6 PRCM clock support, and the needed changes to the R=
40
> >> clock driver to allow for the EMAC to operate.
> >>
> >> ----------------------------------------------------------------
> >> Icenowy Zheng (3):
> >>       clk: sunxi-ng: add support for H6 PRCM CCU
> >>       clk: sunxi-ng: r40: rewrite init code to a platform driver
> >>       clk: sunxi-ng: r40: export a regmap to access the GMAC register
> >>
> >
> >
> >
> > Why was my patch "clk: sunxi-ng: replace lib-y with obj-y"
> > not included in the pull request?
> >
> >
> > You said "I've picked it up"
> > https://patchwork.kernel.org/patch/10348031/
>=20
> It looks like it was accidentally dropped after a rebase.
> Not quite sure what happened there. Maxime?

I'm not quite sure what happened, sorry, but this should have
definitely been part of that PR :/

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--3252dj2fdjvd3pij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsgxzgACgkQ0rTAlCFN
r3R09w//XjFWXIoi6LpYnsFVg9jsX2X0t+vK+Js1xVWP8Ojhp6F8lMaz/wD0d9KW
nrHEPX+NqkXsQtPVXU+cTsDteVxv1sHL6CnsPYaIR+lp1qFgBevBcK2kxO9+uido
O5qUyBdUZqt7SjoC/uTasXle/XDzM0KOBA2dr6Yu2oVtmVIFLoV97tVN0uUC5YZi
yXANgioe6YDYncNXQiCFpGrCyzHPmH87OAMNN94RwewaqIQxA3jvqmj0q6c79hcu
AL+7POrlX35fvwiSuk7Hqj7+LHgaAw3r2tAZ8m0eMeCwUiEwIJDX85zKtQohELFd
jviTWjp9ovH0d3QE8QROLmzSaV3BnXJKBTcm3VO4/HSmIEm/t7wsxljbKxTLqN0b
0ReYyZpQbwCMx3vEXZIaQWVBD6Sji2ThrisoA4fFI0Z/X7CJi8jnLR4ywumkkWPR
63E2kVrh81l3xRw05QlQzX/B3wv0Ia9OPYNSCTvAfL78iES8lm4N/TmMg6vu/yNr
mXZbM2sqRzggkOvtmc1SoxwQCn9HMWxhsQGX4/WsJGVSRJof1kAKkfdBL6pjotpO
mtfd79iZMeyEvROQYsGdrsMFyLalC+fb8jKf45dmmAOWoqkEycCoI2SIQrD2bnPH
ZwVlG+8d8zH3UhvManRZlskx837JmoK6znWzLlgEFw/kck/62j4=
=n5DE
-----END PGP SIGNATURE-----

--3252dj2fdjvd3pij--
