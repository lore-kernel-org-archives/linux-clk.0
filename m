Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 09:01:09 +0100
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
Subject: Re: [PATCH 04/14] clk: sunxi: add ahb1 clock for A83T
Message-ID: <20160204080109.GA4270@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-5-git-send-email-vishnupatekar0510@gmail.com>
 <20160202131725.GQ4652@lukather>
 <CAEzqOZuBz2jexvZvvtkvjbE8UtzUMKL9nT5JJ9JcvMPmzEKTcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
In-Reply-To: <CAEzqOZuBz2jexvZvvtkvjbE8UtzUMKL9nT5JJ9JcvMPmzEKTcQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 02:06:45PM +0800, Vishnu Patekar wrote:
> Hello Maxime,
>=20
>=20
> On Tue, Feb 2, 2016 at 9:17 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Sun, Jan 31, 2016 at 09:20:56AM +0800, Vishnu Patekar wrote:
> >> AHB1 on A83T is similar to ahb1 on A31, except parents are different.
> >> clock index 0b1x is PLL6.
> >>
> >> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> >
> > If the clock is the same but the parents are different, then we don't
> > need to duplicate all the logic. Simply add the number of parents to
> > mux_data, and you're all set.
>=20
> Problem here is: parent 0b10 for A31 ahb1 is AXI, 0b11 is pll6/pre_div.
> 0b10 and 0b11 is pll6/pre_div.
> So, just adding number of parents to mux_data will not solve problem.

Is anyone using 0b11 ? Can't we just ignore it?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWswVFAAoJEBx+YmzsjxAgzyQQAKF0SzkwT8zLiJK4ZzCThSFj
8JdhhulHi4AhSSmPfZCaW8RWnJl10GA6s+ZY1zNH8Hg83UD9CQuTEbeF14UGm1vK
5exWnk22uRozmuT9xfjiAlSl3NqsB6x65XjRlp8XmIQobnO4hyAYNg2MzTiykK2l
CJqYnzCsuwIHfcq+gUSLQSaSFspC3r130FWnQwjVlAWB29t8UHUKnU4MKBytgV15
kfwI3dhUkv84NOJ+mXxTL7zJzppuYtAmWHOGzKjS7VN+p8Yq3Eu7KJIg+zXQd8rQ
sK1zbf8KwF/T5VM+08BeQZanwfkGijC19tK7ymPVPmKXvDwYy3cPOeuaZ5dVkyxv
2itgmXJ18Kg9rEJI4OtUlhGR/XIV4yyp7kdn/OpyDy798FDfLSQ1GsWmChcVnCeM
wBXdnLcysl9ISU52ZXzdrYKgQU0WFfz6jeNaiMUHxvs5Unwa/uCBbV3gULWAoTx3
xyGPJTUMWW9drTJqwdZmAN+s4eVCE+vQNNEzRiNiCdOeZkET2GpQRcm+sLp6Y0tF
TGIsnuMzeAQ6vW7Sn/Bs6WsU9a32UUFMgdri+pHbB/8veT6nGknTIrRwlB+OK2VS
YWKLRaPXuvUuVIqS/KWEIKATYven5supg70uu8cPR+FpH7xNUiep7FxPdc7uN4+l
bvYDfpIX3Y6/LPS+26pt
=r74m
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
