Return-Path: <maxime.ripard@bootlin.com>
Date: Wed, 13 Jun 2018 11:11:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] Allwinner clock changes for 4.18
Message-ID: <20180613091109.pu66on7v7ga3bmqf@flea>
References: <20180521115947.wqrnv2hczate65lz@flea>
 <CAK7LNASgetmPKKS8AhYXqSSEFCi+q0ASZ68M0SECJT5EbAU4XQ@mail.gmail.com>
 <CAGb2v67DOgnW=gesPxgmxZJWieZkzjPJm5mt7eW15HgUP3_SZg@mail.gmail.com>
 <20180613072649.dzbusalsfqlgymew@flea>
 <CAK7LNAR0TZEp9JfJAf3gmE1v6ig04TZ-NCiXm5_zYdpsQwhuRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m7amzhixil55ixut"
In-Reply-To: <CAK7LNAR0TZEp9JfJAf3gmE1v6ig04TZ-NCiXm5_zYdpsQwhuRw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--m7amzhixil55ixut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 05:16:30PM +0900, Masahiro Yamada wrote:
> Hi.
>=20
> 2018-06-13 16:26 GMT+09:00 Maxime Ripard <maxime.ripard@bootlin.com>:
> > On Mon, Jun 11, 2018 at 03:53:41PM +0800, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> On Mon, Jun 11, 2018 at 10:00 AM, Masahiro Yamada
> >> <yamada.masahiro@socionext.com> wrote:
> >> > Hi Maxime,
> >> >
> >> >
> >> > 2018-05-21 20:59 GMT+09:00 Maxime Ripard <maxime.ripard@bootlin.com>:
> >> >> Hi Mike, Stephen,
> >> >>
> >> >> Please merge the following changes for the next merge window, thank=
s!
> >> >>
> >> >> Maxime
> >> >>
> >> >> The following changes since commit 60cc43fc888428bb2f18f08997432d42=
6a243338:
> >> >>
> >> >>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> >> >>
> >> >> are available in the Git repository at:
> >> >>
> >> >>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git t=
ags/sunxi-clk-for-4.18
> >> >>
> >> >> for you to fetch changes up to 17de4c857b1f74b90967f7e7fd5ff81be61d=
c044:
> >> >>
> >> >>   clk: sunxi-ng: r40: export a regmap to access the GMAC register (=
2018-05-17 14:02:07 +0800)
> >> >>
> >> >> ----------------------------------------------------------------
> >> >> Allwinner clock changes for 4.18
> >> >>
> >> >> Not a lot of changes for this release, but two quite important feat=
ures
> >> >> were added: the H6 PRCM clock support, and the needed changes to th=
e R40
> >> >> clock driver to allow for the EMAC to operate.
> >> >>
> >> >> ----------------------------------------------------------------
> >> >> Icenowy Zheng (3):
> >> >>       clk: sunxi-ng: add support for H6 PRCM CCU
> >> >>       clk: sunxi-ng: r40: rewrite init code to a platform driver
> >> >>       clk: sunxi-ng: r40: export a regmap to access the GMAC regist=
er
> >> >>
> >> >
> >> >
> >> >
> >> > Why was my patch "clk: sunxi-ng: replace lib-y with obj-y"
> >> > not included in the pull request?
> >> >
> >> >
> >> > You said "I've picked it up"
> >> > https://patchwork.kernel.org/patch/10348031/
> >>
> >> It looks like it was accidentally dropped after a rebase.
> >> Not quite sure what happened there. Maxime?
> >
> > I'm not quite sure what happened, sorry, but this should have
> > definitely been part of that PR :/
> >
>=20
> Stephen offered to pick it up directly for -rc2.
> Is that OK with you?
>=20
> I am fine if it is well-organized between you and Stephen.

Yep, that definitely works for me.
Sorry again,
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--m7amzhixil55ixut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsg36wACgkQ0rTAlCFN
r3SPRw//YcclKsD4CZFVfRyF+lfbLt8sScLmsc+7qJ/z6uq2pIBtvy+s37s8kcMk
dHzDjmMNFA7NdOO02BPw+6/ffTdORwv/mipB+q8uAmQEdtCeDV9xo3wWTMw6Nqfy
pgg3uwWCTWpDzbAfmE8UcmyYfVoWSaa6qSJQRDyxbE4mzXB+AcQbOyFZIXInNPzK
ieZ2d4Ief53gH7XgOWHbrhAjdx9Fw2r3e7C1LCsqwNbKRrWtoghvPe0OV6cq3geC
Vsc7cIkrScRp3E5tslbfh+/oaEX5ItRjChOfM4wg3B83m+SDJkkNlHLYa3MY1H/v
vm5RpFbvpndmkLLJe0Emzm7U6sVfjBYXnWdTyn8peFGUtSh7Ru7IzGUhBOo+vTJL
fzKYddPdNlmwanNTdKgvWHJi6Qpujnr3WH2s6aysX548xrcnOvoZLDubBwBQdXWE
XnmzAdtPE21CLFvqLlHNvkkrIcp91/8n2RwrpfzQQhLyBkvCS831PysPUDJtefvH
nNWjVB9wwBjKFZmukhIEVfsDOSe2Figo1bSn/HTV3VLXM0S4vIT1Pj3Q/8HEcJDm
FA1UiExRYhid4IYXB5sRxJc7B2OACwjJd9Ev2nSM3CscuHMLs2OhbagAmSFU0Q6Y
43Xot6SXgCK3ucsYQED6AY0zHJKYGK6ZCaRDDuysJlvX3ISTZxI=
=CWFV
-----END PGP SIGNATURE-----

--m7amzhixil55ixut--
