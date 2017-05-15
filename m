Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:43812 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760367AbdEOJYa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2017 05:24:30 -0400
Date: Mon, 15 May 2017 11:24:28 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 03/13] dt-bindings: add bindings for DE2 on V3s SoC
Message-ID: <20170515092428.dby2cw62gfbfq3ry@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lcuelmmv4kxkmqfp"
In-Reply-To: <20170514163045.40366-4-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--lcuelmmv4kxkmqfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:35AM +0800, Icenowy Zheng wrote:
> Allwinner V3s SoC have a display engine which have a different pipeline
> with older SoCs.
>=20
> Add document for it (new compatibles and the new "mixer" part).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks!
maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lcuelmmv4kxkmqfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGXPMAAoJEBx+YmzsjxAg0oQP/irKJ8Zdox9T0Q3/m5qF2RAl
NRBtfNi4uknzZ5Z+FQIaG/AxvF76xGYQ8RdSAlZX5mizBK69aSicV07YyLL62TOD
w6CN1fF1oIntrlVWqXaYR1IEitOvXt1ojZFGHG3U5vpAfvYxpyjNWGQy7ORy1ryc
ZcTCdIxyZucv1uDh1q8FUzFhRo3dVLA5isB4wHDE0yHN6jyLLMWH8Wd/afulCpyo
q1bvyFWKFmMaZ8cLdG5h8BjRyk2+qS8jCKQxFsVlL6lATFx3oqN1qXzpd6Wbbrfr
CCbWQtccoWJS0avju5RKZ0FdFlYzQpi966WMQncRTQhD60m0GJeqtDMqtKn6S+D0
tZLVQMJuzEjIHntGlYEHBO9cVEsoPx93nIDrEs7Ivb3UwtI4lFIdDZPVQWXCskbI
67Nor5LSrXl+kTUBOIW9mAFZZpYhaP2cFNC7d87o8f4uxCj9v8nap411OkDO99jy
cSBGZbEvfxGDkKmfRtit5lXJ+0vjZmqcFXc15XhcasNXJL5A8dnvjvli3SpBcAcv
QIPRO6bNISbdEumiAiSHUDmXOliHlQ9mH5F+5WK0STw4tVz0LRuNBecszMYLyX9j
xP/nYxvEiv4ABTLSyrLCAvosNO2DOEi0Hl2YC+AjU2DGOT1J4zgtDsJ5/In13DVX
RnAvqs9/fn1fg1/VnSE4
=l2aA
-----END PGP SIGNATURE-----

--lcuelmmv4kxkmqfp--
