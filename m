Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 12 Jan 2017 18:41:23 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Message-ID: <20170112174122.iqzrcyytfefqspwq@lukather>
References: <20170112203149.VhtuR9dM@smtp3j.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170112203149.VhtuR9dM@smtp3j.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 "	linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "	linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Chen-Yu Tsai <wens@csie.org>,
 "	linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "	linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============3964573673452123646=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3964573673452123646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ooietzld5dnpkws3"
Content-Disposition: inline


--ooietzld5dnpkws3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 01:31:41AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8813=E6=97=A5 01:19=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 12, 2017 at 03:44:53AM +0800, Icenowy Zheng wrote:=20
> > >=20
> > >=20
> > > 12.01.2017, 03:40, "Icenowy Zheng" <icenowy@aosc.xyz>:=20
> > > > 11.01.2017, 02:10, "Maxime Ripard" <maxime.ripard@free-electrons.co=
m>:=20
> > > >> =C2=A0On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrot=
e:=20
> > > >>> =C2=A0=C2=A0V3s has a similar but cut-down CCU to H3.=20
> > > >>>=20
> > > >>> =C2=A0=C2=A0Add support for it.=20
> > > >>>=20
> > > >>> =C2=A0=C2=A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> > > >>=20
> > > >> =C2=A0It looks like there's nothing different but the clocks that =
you=20
> > > >> =C2=A0register with the H3, please just use the H3 driver.=20
> > > >=20
> > > > Nope.=20
> > > >=20
> > > > It has a different PLL (PLL_ISP) at different address, and some=20
> > > > different muxes.=20
> > >=20
> > > Forgot to mention the missing of PLL_DE and related misses.=20
> >
> > Those are not conflicting, it's just a slightly different set of=20
> > clocks.=20
>=20
> If saying so, we can have only one ccu driver, and make every ccu
> register different set ;-)
>=20
> V3s itself is a totally different SoC with H3.
>=20
> The relationship of V3s and H3 can be farther than the relationship
> of A33 and H3=F0=9F=98=83

A33 and H3 are an entirely different story. The H3 and A33 have
conflicting clocks (ie same clocks with different parameters). This is
not your case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ooietzld5dnpkws3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7/CAAoJEBx+YmzsjxAgGKsQAIOUNUi+25hpeYhZ7qWqu7sH
wDqIin/+WvYcyvYnCO8qvtsHzU8f83joDDvU2duNzwuQOewZAsTz9lhJJzP4pzgy
n5iON29JACv2nXKvdMy2m6eT5DQDIXuIBsaA7oc/Ap2eqTXSGx5Gsck3N24CQ2TO
D/0yut3zjCObgnApLi28yg5VQK5MdQYLvhvGgXcQbvv/ymALLJHXDTxTXunAxRi0
/9fjUiCJopiXTGZQHQTepe6qoRveJvO480Bq9E0cIXd3De7flV7h+HrCx67xmHMk
3ZqfoQHdqzy4lBQfvWVQjWeAQWFJLrlzBfN+cuM4FxPBODiK0vuEijWcTOgjKhXf
dZnniwtpQ/k1mKvBeH2nEVMeq8RhupEW6AL9iDbqynDvTckD2XqBgU3GZc6t+Jpu
au58LG7Ro0fCZ6HHzgxpO/zZja4FSifs0O2cImc7LmYU4p9h9hlNh24aoyjx0i1t
ceDNQ5Q6L/MuFkm36N5/ssN3BZ4l5XmhIJWqka9erWa5T6fY6xCQl+yVaT1NzvQG
OCCJg9tCv+g4X+vvxU0fJtUXDBIw3aRiDOop6dOj7YRF5vwpJqasSdZSCVyUUxWX
7tbiWGBHXxqSkBXclrOnb9SbnO3EG6OK3T3QnQGV4qZ+bojVNFl6YaQcEZ24LPLK
WZOUA08ycYuPV76e2uEv
=PovE
-----END PGP SIGNATURE-----

--ooietzld5dnpkws3--


--===============3964573673452123646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3964573673452123646==--
