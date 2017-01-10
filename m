Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 10 Jan 2017 20:10:02 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 3/6] clk: sunxi-ng: Add H5 clocks
Message-ID: <20170110191002.tpdzjlf2eeck4fv6@lukather>
References: <20170109161500.Ep9GCmIb@smtp2p.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170109161500.Ep9GCmIb@smtp2p.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2701126830734791149=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2701126830734791149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3hvn6fukr4dve4o3"
Content-Disposition: inline


--3hvn6fukr4dve4o3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 09:13:12PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=889=E6=97=A5 =E4=B8=8B=E5=8D=887:01=E4=BA=8E Maxime =
Ripard <maxime.ripard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Jan 06, 2017 at 06:48:31AM +0800, Icenowy Zheng wrote:=20
> > >=20
> > > 2017=E5=B9=B41=E6=9C=886=E6=97=A5 06:04=E4=BA=8E Maxime Ripard <maxim=
e.ripard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A=20
> > > >=20
> > > > On Tue, Dec 27, 2016 at 12:25:15AM +0800, Icenowy Zheng wrote:=20
> > > > > Add the H5 CCU clocks set based on the H3 one.=20
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> > > >=20
> > > > Is there any difference with H3's?=20
> > >=20
> > > One more Transport Stream controller, so one more bus gate and bus=20
> > > reset for it.=20
> >
> > There's no need to duplicate more than 1000 lines of code just for=20
> > that then. Just add a new compatible and reuse the clocks already=20
> > defined.=20
>=20
> How can I do this? Add them in ccu-sun8i-h3.c ?

Yes, you can have a look at how I did it for sun5i for example if you
want.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3hvn6fukr4dve4o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdTGKAAoJEBx+YmzsjxAge5IQALivA2EeJJ0z/3DRp+lkcvjW
MvWJ2BX3jMEKXKKYdleo46nAgvboW0wP4JjYqZdee/JdFNu686Ts3d3TPzY+mZJn
dLGNB26Vdhsb9gm0Yp6mkrRkflvhahrwKYhcHP8jJ6vkdrvieGwxTTTAhb6pNmt4
iCSUhVtd/ofYujZOwT1YNzVwbut6pub2WJh5h+lG3K43noyxcGIDJF2VDI9yaZcG
avmLzQcRpYGOeOJ4kUs32yexYwmTpLcmIwsQX+qoP12FhpW6tgZGa+LgIj4P2htt
f82FC2sGaWyRZQ8rp+DVdD0tSzSHf9JW2b6qQItTeV8olod1Ud2D41I6+DgvqbHh
Osob6/sTE4zBSQX+3pN7Hjc0K/PffGTpy0NU5/TjPR/da3VcT1C0iPbLWLufWUur
5gQyA1Ktv6zO/o9nU+SuIrrJqWj2V39aiOMOIGUOpn58jpRJeHe+UtDsbzJyOszV
3Fx1tnyEqgRpazmeYj402YGAJ4iGhiiFOY/tbPnYMPNvpw59HCwEY/q1Ll7WScOf
nbxkFxKln5ZgG2qzruFsCSGNa/Nvqarah0y9KFxCjHGZKhArWsuoGAGsQk8u4MHf
h7BwDa1ZuLAhA0KmJ8hB17hqM7Lg5vV+n3kCaF3rgWejIC/HQs4b3jiCIR/LtiJx
wyYZlPSK2IHQCvBx8+Eg
=0c+x
-----END PGP SIGNATURE-----

--3hvn6fukr4dve4o3--


--===============2701126830734791149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2701126830734791149==--
