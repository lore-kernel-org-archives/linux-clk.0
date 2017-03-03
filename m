Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 3 Mar 2017 15:51:01 +0100
From: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 2/3] clk: sunxi-ng: add support for
 PRCM CCUs
Message-ID: <20170303145101.ynv6vmmy4fyrgezw@lukather>
References: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
 <20170302140931.tq3vpncln6giyjpr@lukather>
 <2899221488467633@web38j.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <2899221488467633@web38j.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============8481198633377493145=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8481198633377493145==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4gigtnz6xr37pscm"
Content-Disposition: inline


--4gigtnz6xr37pscm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 11:13:53PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 02.03.2017, 22:09, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Wed, Mar 01, 2017 at 08:22:13PM +0800, Icenowy Zheng wrote:
> >> =A0> I'm a bit worried by that to be honest. You claim to support the =
A31,
> >> =A0> yet jugdging by the current state of that code you never actually
> >> =A0> tested it on that SoC.
> >> =A0>
> >> =A0> What makes you say that the PRCM clocks are the same for the H3 a=
nd
> >> =A0> A64? We have to be sure, otherwise we might not be able to get th=
e DT
> >> =A0> binding right from the very beginning, and we might not be able t=
o fix
> >> =A0> it later.
> >>
> >> =A0In fact, if we worry about this, we shouldn't make r-ccu, as
> >> =A0dedicated clocks are more easy to fix.
> >>
> >> =A0For newer SoCs' PRCM, we never have enough documents, and Allwinner
> >> =A0have said that they cannot provide it. (I asked them for this.)
> >>
> >> =A0The best solution is to implement mature enough dedicated clocks
> >> =A0before we convert to ccu.
> >
> > What do you mean by dedicated clocks?
>=20
> The legacy form of clocks.

Which itself creates another form of issues. What happens if we get
something wrong on those clocks (as it is likely to happen)?

We potentially can't fix it at all, that's what happens.

And that's leaving aside the DT and clocks maintainers regular
complaints that we should get away from those.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4gigtnz6xr37pscm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuYLUAAoJEBx+YmzsjxAg2boP/jRp+PhB10cbAfLy3OfaTsp+
/6G/n20IVUiEi3ldTj15PHnj/QSm6TI+WO63iVkGGprdsf6CPgF+05IkhDSdWqCk
hn8cy2yJYM74RWBdXh7kwwTI5uXWNXX1NEwN0nAZV9ctrPmeCjbRcF6V5w9f1b4F
PJc1u67/Q9nU7rqnlCEntujraj+AWB2PN8RCzlWl8LkF4SdBesgsB8Oth7u7xf01
K13BqJIzFo4H7nO8Av3MMFeg5Z2ErbCAV1s9q6VhZlDHyc+TRfLLW9ppsGyAY384
FQLNOO9vh1E8/d6vp9MGSGIQf6By6ZkD3kze+0gMrxzTNv9Ee7uKX02p6FAZCedJ
kSWaWH94KKYKhh0T/i3vXryoG7BdLxz6jPgakQoANMFO6EHKD0ngnznHFsS7MGs3
4BBry+6Ufmks1SbwMr3jHZas5v5w38v8SMonBT6hZUjf6yQYBPM6MKGXSFK4gONp
y68x9sAowJ4zKaRA/LF0y5vR5gWjPgCiWaN/ILsGRsIEs2ojln2aCzm6E+PU52DP
MMvVKH9ughA4AaxHzcF383D1q6OYCTuRpfrWp3frsbigQJxa3bfN9bl54c7OStwg
sV4B1qEFmCU4/C+YcVWqQ1SgjEHOuESz2yhggWqHS1C7bCo2zfx9R4j4Zsx0TD+B
1Gn9mHgOVNYomaG/Zbox
=3D9K
-----END PGP SIGNATURE-----

--4gigtnz6xr37pscm--


--===============8481198633377493145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8481198633377493145==--
