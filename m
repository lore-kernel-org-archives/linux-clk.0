Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 5 Sep 2018 09:22:05 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 09/11] dt-bindings: sun4i-drm: add HDMI VCC supply
 property for sun8i-dw-hdmi
Message-ID: <20180905072205.63qmmqr45323xllc@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-10-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rlpbalzc2vivwqzf"
In-Reply-To: <20180904044053.15425-10-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--rlpbalzc2vivwqzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:51PM +0800, Icenowy Zheng wrote:
> Allwiner SoCs with DesignWare HDMI controller all come with a "HVCC"
> pin, which is the VCC of HDMI part.
>=20
> Add a supply property to specify HVCC's regulator in the device tree.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rlpbalzc2vivwqzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPhBwACgkQ0rTAlCFN
r3SXZg/6A3RU2hgIonPIwzbtmVglv3hKt4gvJyi4jPNZ/ktv1ZaQMjVOzqs3so09
rs100I6BzKjPjiDdt6MKm9KVxZqjkhvIEVCLFPudCig/ODGCrsJOs+A5TpAByaQH
dUP8HdGDed0kS+vqnZCm8hQLXi4gERU1tx0JK3vXMvjZtggMZsNmM3Vi8np5n9PN
kiPvHwZwQcUC8tdvOiJAl/TukRmAINfpMvc15iUIGPBVyArF60FuUHz0kb8Z5O/C
LwX/Unj19pBaZIkvUBxP6Ind6ywOgy9Z/uFeVBObHQ6hMYFW1VcmnYL6K9lwWGwR
yUcy3gwV6QmUjsLGN+ao58b8zpVO5JBtNs/cqsuZFa1HBjFX40Ua8xOocOvtyJ4h
zcN4fUvxT37D8OvbFSAY+A8eb2pengRr9rLKesT4BT5B41C9PKpwnWS8SQQvr6uO
3oCse3a9GvIJFA1JUJziQNG9ckLkoBqRaW+gWuF3RRkW5UyrW8UgL6dsJWVBfzr4
S1ZwTN+ypuKhcctIBwDCa4WwXVGB2JLyOuAocC6QJ8EXaYD+Xk9XZ0YtyrjkD87G
QXo5/rUvsPB6bhiBodQyfnLokzkbAKqpCXjDr4zWbabij+PNeB6fe+7hXRkNvuT4
MlP1oOhFa5ikKsc4kHnbsl2CsRyyzq2v0mX1s+CdYBSpz3/+/pE=
=i6OQ
-----END PGP SIGNATURE-----

--rlpbalzc2vivwqzf--
