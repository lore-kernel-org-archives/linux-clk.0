Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 24 Feb 2016 16:56:44 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>,
	=?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Reinder de Haan <patchesrdh@mveas.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
Message-ID: <20160225005644.GC4736@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
 <20160211123648.GN31506@lukather>
 <CACRpkdaGZ4-S1A9zUUaBXXEazyJf_uZ4ESiBhw-CpozXMxfDHg@mail.gmail.com>
 <20160211151246.GO31506@lukather>
 <CACRpkdb7=x2bJP1nXpF2bP3U0t+NUHiuw_aeTAhbR8OXOrHn6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
In-Reply-To: <CACRpkdb7=x2bJP1nXpF2bP3U0t+NUHiuw_aeTAhbR8OXOrHn6A@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Feb 16, 2016 at 12:23:37AM +0100, Linus Walleij wrote:
> On Thu, Feb 11, 2016 at 4:12 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Thu, Feb 11, 2016 at 02:47:57PM +0100, Linus Walleij wrote:
>=20
> >> Can you guys supply a MAINTAINERS entry for the sunxi
> >> stuff?
> >
> > We have one, and Chen-Yu is listed as co-maintainer:
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MA=
INTAINERS#n911
>=20
> Modified request:
> can you put in F: wildcards there to match the files pertaining to
> the sunxi platform, so that scripts/find-maintainer.pl finds them.

I don't really know what you mean, on my laptop, if I run it, I get
the following result:

$ ./scripts/get_maintainer.pl -f drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c
Linus Walleij <linus.walleij@linaro.org> (maintainer:PIN CONTROL SUBSYSTEM,=
commit_signer:2/2=3D100%)
Maxime Ripard <maxime.ripard@free-electrons.com> (maintainer:ARM/Allwinner =
sunXi SoC support,commit_signer:1/2=3D50%)
Chen-Yu Tsai <wens@csie.org> (maintainer:ARM/Allwinner sunXi SoC support)
Fabian Frederick <fabf@skynet.be> (commit_signer:1/2=3D50%,authored:1/2=3D5=
0%)
Vishnu Patekar <vishnupatekar0510@gmail.com> (commit_signer:1/2=3D50%,autho=
red:1/2=3D50%)
Hongzhou Yang <hongzhou.yang@mediatek.com> (commit_signer:1/2=3D50%)
linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi So=
C support)
linux-kernel@vger.kernel.org (open list)

With both Chen-Yu and I listed as maintainers.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzlFMAAoJEBx+YmzsjxAgd1oP/i/qf7UPbVX13Vne5gBEei8U
VsUUdC/1Vw1oFAMgeQMDoscuNU5FCX+JM0XfcMTZG40/ePLNld8d9hNtN/6lwDms
lwumAFAO7XwVX0CCYiX6tA2lYfBHikfBVNplgnlxSBkCYex4RNB06UPmQAY4MWhG
3EyV9JvrnbUkBmf1HSCPLWFhzurn5Z/StbIvZqSNtRI7pvyIEUE7Pcqb6uhTWZvS
xB/HWrxBAB8MuPy8XFfGcLBO+LPxu0kLN7gz9TjjdT6zNqA1llkrqIjwHbk4tFZp
8tW0w6Vc5LTQGrQUwzEwBiyhIWo73Ea+T/aYJKFLKtgwE6TB91j0j+fjb8wSTW5h
J3kaALA6VymfzNbPK5jFDhG2qr7B+cVUH7+gHqAnhZIbqnf2Ye22b0TSz/zYmbJB
xTE4FurhIOWi+wTYgvYUYy4tWA9ch/TQpKJgIQRn599nLbzcFNIkFtnHyUVR017G
LCjR92xn5/NsT3mnWt1MMW+x7hHlaLcpYUc4JFH3b04XL1PbrM7+U7QQj9wCKaf6
S0emWQL5378kn5bPLRq+RyaLRhjkJEvMCsG/p/TDQkyOFJ7dnhEiYyqLMcontkWC
TdrYnDCZROYgto++4m6QJXz4M6yFp4oyogYhaw9SWs8sOC9AZ6QNRCbLyvnrcLez
Ia1666P4OSPt4Y9sbndb
=MSii
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
