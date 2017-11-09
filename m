Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39560 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753612AbdKIMPb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Nov 2017 07:15:31 -0500
Date: Thu, 9 Nov 2017 13:15:28 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chris Obbard <obbardc@gmail.com>
Cc: daniel@ffwll.ch, Icenowy Zheng <icenowy@aosc.io>,
        devicetree@vger.kernel.org,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [linux-sunxi] Re: [PATCH v2 00/10] Allwinner H3/H5/A64(DE2)
 SimpleFB support
Message-ID: <20171109121528.zqilrabirceyaj5h@flea.lan>
References: <20171027150658.18509-1-icenowy@aosc.io>
 <9bca10cc95d04f87a1122bc582402310@aosc.io>
 <20171102154447.b5qo3rvu5djxupay@flea>
 <20171106084043.2vv56w2dmrutz4gn@phenom.ffwll.local>
 <CAP03XerMhdOYL08ED7=rt99BZ=RpXLhz_EySUhrJ4HbjYTX93g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tmyvcrwy4hbx5jzz"
In-Reply-To: <CAP03XerMhdOYL08ED7=rt99BZ=RpXLhz_EySUhrJ4HbjYTX93g@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--tmyvcrwy4hbx5jzz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2017 at 11:17:03AM +0000, Chris Obbard wrote:
> Hi Everyone,
>=20
> What's the status of HDMI/SimpleFB driver for H5?
>=20
> I don't see anything related to HDMI in linux-next dts files:
>=20
> arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts=A0 (example boar=
d)
> arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> arch/arm/boot/dts/sunxi-h3-h5.dtsi

It will be part of 4.16 and are not in linux-next (yet).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tmyvcrwy4hbx5jzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaBEbgAAoJEBx+YmzsjxAgaP0P/3wh3yZtiBp0CAFjAyedsfvi
JDNH18pb4HsxvHwwASKU5MS/OTP88wlmAi1VUNSBRyYv8lcOjY/jqiBh50YgSWN7
Q+qk0rOhlGiHVliAWj3OODAum5H2fpzX2Afu2cE1awvQsEhnzOmW9XYCfdBdeHNM
V4NIV7i6BuP3KRg5w7UrW/mmuVw/k0sVHT/uSlJlzP1HfMOSU2zB1v86x72dX28B
CXk4OmY+rVc2pS/z348XWGS5nJkAJyQXVipRRP/fs5YKKp/HouDjCsHKikHMUd0U
j6DtuDI4YtTu3YxSE5Ns+STlQ1xkt9ssf75WM95OS386Kc40WAulPDMtu128zs0K
aSi9HMctMNnDYqJaiqwk+Myn5VnT0DXTgUmnZIqQcUt6qmtpCkFIWEQKVYnkbwEM
ufsFkXr72jnT3hmPLmisIH+GqB1vonjknZKjK34bSbiBi0wGSBxElRIpA/b2A/EK
Cap/LbnSRRVU1Bk0m9SS/hQvYEoY1sMGltNB/NyFSjpOO6jccqI9m6z6+kW8nbXs
oe7lfIOz64Ug8U5MOUl9lXlFHH0vQNZKSp9uDt7ZKCEtZWP6aVXP/0mzyCHHYLma
b7ejTn3XRNQZWzCBXWOh2/LuEcCMLye5ETu0GDuYJcClHqCx/AX1nKUW0GrkaO23
heTHVL+ew0A34kL1G3PK
=pMBk
-----END PGP SIGNATURE-----

--tmyvcrwy4hbx5jzz--
