Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 15 May 2017 10:40:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 01/13] dt-bindings: add binding for the Allwinner DE2
 CCU
Message-ID: <20170515084032.5wxj24ihwrrl3s4i@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zqsrfhm6h7fufufx"
In-Reply-To: <20170514163045.40366-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--zqsrfhm6h7fufufx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:33AM +0800, Icenowy Zheng wrote:
> Allwinner "Display Engine 2.0" contains some clock controls in it.
>=20
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
>=20
> Also add the device tree binding headers.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zqsrfhm6h7fufufx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGWmAAAoJEBx+YmzsjxAg/8EQAILtaRZxWpr9N7C0PXzhIT8N
2Wkm8PfAXYPm1Dn8YEiC2A9f44rJ3yU5qmarUbTQSVFJvx/pPdHtpZ0HvdOmfv4h
Wc7do3TyZMmjIzyp4U/MwMEqq/IeRM754O8ISoS/Rflt0yuuZZUy05HHUgts9jHQ
IXV+3pRXUApN/VIDvmK7VhQiJocQibxSiCqk2lHWdIbJYuX8oiYhXRuYBfmrYS/X
IAgmqJPIeyWSaMUJgZFCVcoNWXG8O7ScvoVrbDyn840RBsPLnLq5zMQBEQwDfLNM
Cx3XUZ1X1jut4fSrcvNsTLlUCxDxHnoGZHeUJ/nrckJ+6U8ewQc1kHHq5cHkRBc9
nGa3FMSYZs11b7gIj8uXv4fs8hRBrQtTn5E+xl0FSuR9xLZWeTH73hZ1EoVW5k0A
Nl6osyn7JaxyNFFeRgDe+uzbi7ZGfiAmeoyzFtGuaaRdHJo2P2kKQWsL28kKRBA/
yNmL4e4y3kvZSrhoRAYOTNMbUGqwx2hbnyRbRcUh4UfKDCYoWN6/1B2JSibE6vMj
cLQhgchk24Bl38r5CrDgj1OJTN9y7ARToHDa+hsJ0NRiLA3rULcqwIFHZMUVrTzH
Z3aRcf4lmTXQlRKLQq5HMn27SoxHmfbscPbZ9g5rWoCu9JA/nAcDBq6DHgRKf2oX
P9DIRsFEhksGaOy2ZXdt
=BlmG
-----END PGP SIGNATURE-----

--zqsrfhm6h7fufufx--
