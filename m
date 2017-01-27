Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 22:10:29 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH v2 4/9] arm: dts: sun8i: split
 Allwinner H3 .dtsi
Message-ID: <20170127211029.k5ylfhrreqfdn2iz@lukather>
References: <20170127190239.2MQaUuKh@smtp2o.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170127190239.2MQaUuKh@smtp2o.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4491123958947843867=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4491123958947843867==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7qkvjbcap2tkdxtz"
Content-Disposition: inline


--7qkvjbcap2tkdxtz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2017 at 12:02:20AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8827=E6=97=A5 23:55=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 26, 2017 at 11:48:54PM +0800, Icenowy Zheng wrote:=20
> > > - mmc0: mmc@01c0f000 {=20
> > > + mmc@01c0f000 {=20
> >
> > There's no point in removing the labels, and you can even use the=20
> > label-based syntax to reference them, instead of using the path.=20
>=20
> I think keeping a tree structure in sub dtsi file will make it more
> pretty and easy to use :-)

We're already using that syntax for all the DTS, so it won't be less
pretty than those.

And keeping a tree structure valid is not easier to use than, well,
not having to keep it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7qkvjbcap2tkdxtz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi7dBAAoJEBx+YmzsjxAg2QUP/38ftxITIFgoKnTha63G7UyF
KWtervmBniGEWkJfekz6M97NmwQvd6Mk2xx0XCHrOpMsSprHAuBRdRIXc40JmcxI
TYg51vFnEZPKrJ9u89hLdqls99unJr4bJKl5Zjvn4c84VLBnClQNi8e/EU6wBJnc
BhvAvm3+NuoL/dK2mJos0K4rGY7Y+i6EldKQ2DqmfgRCrnOCs7d/uxpEkLfu2UK8
ltPCmAZyWXZdqa5EbqJVSMKSSZVvnIOCAQ8objjQuIb4V1k2vXiodVr/Zm/Ziv5S
kOc/KTgHy7YP2dODlybs5eYvke+oQ/QbomL3i1RxLedJEku9vRz75jnHyTonKLLy
oPTvZaoG3KNkipkPPyJVHxiA/WmTXUflqhk2gxnxjl7PSFlJelkRkTYu/l51vUwh
8B4caEI3mWsgmNOJy0NWWv7TfwkKEZ1eUrfSRWIENlrIRQE0rnAZ966h5RCNTGWq
NIGhSZ4/XlkOODGrCr0pwsA6duhT9ZecXbcHZHIAjt9tEgy1cGwdQbSjUOpFah/e
TKzO7AxHXF0OVXeCixtPg3RNMpfrPa7qmh7XF2X7RmHaNfuELnqPECCzc3vI952+
ZMGGjzZqJVckqyPiafTrv7WK+yytfN+7LEixcfcIdq8pGFeJhYxWgRx2AHKx6c5Y
pj/1bhisw8RGlDJgP3/r
=BJIC
-----END PGP SIGNATURE-----

--7qkvjbcap2tkdxtz--


--===============4491123958947843867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4491123958947843867==--
