Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:36300 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbeIEMUG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Sep 2018 08:20:06 -0400
Date: Wed, 5 Sep 2018 09:50:56 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 08/11] arm64: dts: allwinner: a64: Add display pipeline
Message-ID: <20180905075056.tob7itg3judccooe@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-9-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yi7cc75vsj32ybox"
In-Reply-To: <20180904044053.15425-9-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--yi7cc75vsj32ybox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:50PM +0800, Icenowy Zheng wrote:
> +		hdmi_phy: hdmi-phy@1ef0000 {
> +			compatible =3D "allwinner,sun8i-h3-hdmi-phy";
> +			reg =3D <0x01ef0000 0x10000>;
> +			clocks =3D <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
> +				 <&ccu 7>;
> +			clock-names =3D "bus", "mod", "pll-0";
> +			resets =3D <&ccu RST_BUS_HDMI0>;
> +			reset-names =3D "phy";
> +			#phy-cells =3D <0>;
> +		};

This needs to use the bindings we have for that phy.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--yi7cc75vsj32ybox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPit8ACgkQ0rTAlCFN
r3Tkig/+Jo/8vVNhqY7l0BzMPT7gMyQvnhZ73ScDV5wOcFsGh5j+A0hlGsRc/iAf
PErPax5Of44I6XzJSRn9GuiaQsO4YlkkkhCwpDZuHlxOHtzQ1k9SVibm2YSpCFv/
cO/oXRecrhqKeRdwwMrtZu2N/zV211kF9Xi1YQWYPUr9ELbrzMkqCbtRZp3YX77B
i7Iqqeh+/smahMqmPvDNOJu9WlWcOIWfG+CeVaAbWrjxaxVTSA+gJu9Q9Qi9espF
lTIc59fdgeQb2ZNWr6P88PKG+7Mf9oHXfnnEnowP3pdJ0+RLkHuqTsrnRB9rKP64
RWV/DY+/rf1EH90DyJCf91Qa8U9kJM0Vksv2arNzf77UCRKKBkpleOPEMs3Eiiyo
tkXQ9EWRdan1liaIaHnaRVTVNuFlqDOrt5i27aSeiX9YvgAnhcBACvsCA88BlsFy
B2bSh6X7sF02QKrvgpIBx9QmbxeQNesvF1y/1WrAu73I1I0TgDNkmV/aTd6gy7aY
VnTeajhkVv6Y3VgYVkRyyzqt5EeqOvP2epqt/pgjtlusYqEuCpbM8k3nczc0k02o
CT+XurKq4zlbW4q5mwdboLhEfWRyO6cRJFI/kxDKRyrvHNhpQbeAus0746d/8bNS
duYbPlnENPf5aN01S/1tGb3IeZlXcygXGmPBhRTFNmaQwdWc830=
=JnHv
-----END PGP SIGNATURE-----

--yi7cc75vsj32ybox--
