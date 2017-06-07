Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 7 Jun 2017 10:17:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chen-Yu Tsai <wens@csie.org>, kbuild test robot <lkp@intel.com>,
	Stephen Boyd <sboyd@codeaurora.org>, kbuild-all@01.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: sunxi-ng: Move all clock types to a library
Message-ID: <20170607081708.ycruditlhebizzt2@flea.lan>
References: <20170602223006.1653-1-sboyd@codeaurora.org>
 <201706031243.qNvuUbQX%fengguang.wu@intel.com>
 <20170605144546.b6oh5sygrza22hbe@flea.lan>
 <CAK8P3a1Qvt4nvM5HeK-n87tsi2D5GBOmZo0rZv_Lp==CC=34Uw@mail.gmail.com>
 <CAGb2v66QvLdojDe4+uG9Opa7fApA-GH9pW4v0En5j6QSPf1yZw@mail.gmail.com>
 <CAK8P3a38TyiHXBgB0DQka=0iASuyJO_zMrczXqYBiJj6LEnNWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="auy7r3na45ar66fu"
In-Reply-To: <CAK8P3a38TyiHXBgB0DQka=0iASuyJO_zMrczXqYBiJj6LEnNWg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--auy7r3na45ar66fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 09:36:34AM +0200, Arnd Bergmann wrote:
> On Wed, Jun 7, 2017 at 7:45 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> > at the bottom (with a comment) would be cleaner, and
> > we wouldn't need to modify all the existing lines.
> > AFAIK about Makefiles, that should work?
>=20
> Ah, yes. That's much better.
>=20
>       Arnd

I just applied the original patch, with that addition, and a comment
as suggested by Stephen.

thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--auy7r3na45ar66fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN7aEAAoJEBx+YmzsjxAgO88QAIqqNjdqWD3dOAVeEWPoCwSj
yNkHs2O7it0F4VeDyZ99YXmRnBcQ4QlhffvdNxIKIwc9nnV/n8CNtAbZClCiiCIH
zKZfeFMD/KPL0r5zF2ECB/SA7yeVNG2z/ob03XCDRRBo7BF4vHdtn171vtp2gqZc
BfYesyu/ybKWextEH+Lnr8GVC7YgnRA0LAcnPUbuUfZJ6f7wdOAWZ/+OuLotNrB7
nc7yapngZPF/WYSk2A4nbQolfUfu6/pbwy5jjfJ30C3VrmMo99uSFV9CLtl47AbB
YMm8k1roJjbVyy6CVsJDN3krr7/F1z7IzjEErvKaGFMdSRcdYdyqVEZr3t1AliAW
ANgO2x9mmo+h09Go9dFbIrseYV8shlF7wtJ2QWemR+k55kqln/kXlUqyyD2GDnib
2W9g/yFzqExt0HWeEbLqfIcZZL1d4ENxW0dxGkYqTheb2uRQvgjuemYKqAhlap2P
5aRxDMGyD0yCbZQWkc2cGnFqh0iX6Is68XPJMyW6o9C2sRW4RYdvJjET9uH4b6q2
OsQwfSsV2oQCvIgMYCmNC6embF/z1b3KpNhzr/ANvcs5dJ5Hpzo1i1yDsmbvQVBC
VtHhXjnnDDWOJ4HTL+fbKGc1OJnoJzBo3LpKwM5NtQRz4xhR0ZfVCPE4TMXW8v3n
FkDzkfVtQGZC5dSP/b8b
=f1Mb
-----END PGP SIGNATURE-----

--auy7r3na45ar66fu--
