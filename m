Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:34885 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbeIELuL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Sep 2018 07:50:11 -0400
Date: Wed, 5 Sep 2018 09:21:20 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 05/11] drm/sun4i: Add support for A64 display engine
Message-ID: <20180905072120.nejhsauwvocc3nhw@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ao6drrzpdkozm76q"
In-Reply-To: <20180904044053.15425-6-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ao6drrzpdkozm76q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:47PM +0800, Icenowy Zheng wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
>=20
> Display Engine(DE2) in Allwinner A64 has two mixers and tcons.
>=20
> The routing for mixer0 is through tcon0 and connected to
> LVDS/RGB/MIPI-DSI controller.
>=20
> The routing for mixer1 is through tcon1 and connected to HDMI.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ao6drrzpdkozm76q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPg+8ACgkQ0rTAlCFN
r3RsbQ/9GN0hCIJSA0ACatLI+tMVjhjuvnbGswm8vn5wcqaUeBv+1KSoeDqHiqF6
0q0MPbXb6CT2cLPYreklb6fPJKTyoj0H1ZF0VcwkydXqlBcUIsWVP34u+2kkexWc
yefMNbDM3QLushmAnWCRaHYNXu0UtMcvOEQYcQZ1tSp/K8HuBqHFbDOp/KuUqdny
oMIOiKm8D6C1D1AhyKup5nszbC6I7ujBLdgXk7sycRfxvRF5DET1Iz/PEPcqXPIv
o0F4sNcg8gS7oG4dh9kFM+lSRm6I2C2g3zjWPK75VOlBb+jLZwYSMof+KKKlbIJw
kJ/FksWz89Q8L4md8B/2oSQU1lz0RgE1PJt/LzJn5My3Wdzxfbm5X5lgpl3UGS6M
f5JWIWCht+vgCvxRaqAHG/0qMyoMR66ZvmcSLNn7HNlu7YwDEY0Nu2YYxN6Bd7iB
/lXDWwD7WWGxFGo89Eg6h5ebCt11sI/X8Bfm8v4NvXvyu+SW6UPzpm8prOw6v07V
1n6kPQy7WcWQjeqBBUR9v1lw3f9tRQFmsdREGUj10/52x80oe6gScg8q5jPUlrka
nCUGOcPxKaR3b7/WsTYYqcEz1OIrH4+nmONJLBqwwKgJExP9KZP0q0GfvFOQzBNf
asVBi65xjwdWxjpqckeaNIQPNVzyMRmdQJOlD7EbBO1u4RqaLss=
=RzHt
-----END PGP SIGNATURE-----

--ao6drrzpdkozm76q--
