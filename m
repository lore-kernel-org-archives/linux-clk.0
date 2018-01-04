Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46266 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752688AbeADNjt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jan 2018 08:39:49 -0500
From: maxime.ripard@free-electrons.com
Date: Thu, 4 Jan 2018 14:39:47 +0100
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 05/11] ARM: sun8i: h3/h5: add DE2 CCU device node for
 H3
Message-ID: <20180104133947.slerf6m52suarmym@flea.lan>
References: <20171222122243.25735-1-icenowy@aosc.io>
 <20171222122243.25735-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zk2cvzwthowfwzah"
In-Reply-To: <20171222122243.25735-6-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--zk2cvzwthowfwzah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 08:22:37PM +0800, Icenowy Zheng wrote:
> The DE2 in H3/H5 has a clock control unit in it, and the behavior is
> slightly different between H3 and H5.
>=20
> Add the common parts in H3/H5 DTSI, and add the compatible string in H3
> DTSI.
>=20
> The compatible string of H5 DE2 CCU will be added in a separated patch.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Use H3 DE2 CCU compatible as it's discovered that H3 and A83T DE2 CCU a=
re
>   not equal.
>=20
>  arch/arm/boot/dts/sun8i-h3.dtsi    |  4 ++++
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 14 ++++++++++++++

Could you split that patch in half, with the common part in one patch,
and the H3 part in a second one?

This is a nightmare to merge otherwise.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zk2cvzwthowfwzah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOLqIACgkQ0rTAlCFN
r3QD1g//ePPYcmkRIkvrM/CYO4ihi7Iw3MMqGYhYsN9M+KHZxYHyQgUf6LfPFSnR
zCTUkXCuc7jWeEapIaiAsNC2GqeZuiza9WxvKuVVdkVeod1lOGWPuVTZr52QK0ge
QJw8Ai3+g1PKm8gI1xr2gTgxhzZgjE5wgnBeWJ1oehxGdBeznh/X2FI208XVakwE
njgWQy04yy//nYNoErcpUhSRXadkd4ljxKxMAvOBqvgOiT3WgdAv18Crb3bXs8HD
4BB/T/mbzM3/zyVMDLkvwcOIrjOKPkVLCg2aahFfDarvXoFeqRZSkJ9GnUcNF2ri
Q1zt7AgX7e4uZNRx7yDb7AxszUvIi1NKg3ZNF16a5V0knwsM/oQ7IGKneARSpJ/3
KlqtLq+VlYAFpRu3O451RaSEStOiVoo6mc2OutioFlewRg2h041WtmF2IIol4YtW
VIVXVwqQNzdYrgZTSxH1lu2dnBGO3cmJ24HiUtKDN6alxqQHZGGNWCDQU5Yi3Odz
4vhok/iDT9yV1w/yp1t9tnvXUNtTa0EBFv3cXm33aewaOMOSsaZnDe7SkuBcHXTC
KbCZApUIcQJ6h/7+yxdrNtrpKeh3iDm94/viex3Bp8BLBpJPMFCT0rcRvlPP/5Hp
AhIu3C5uJpMfG4upaA0vS/xoD19SvDnn1TO3lOyQcSvY7CFSjw0=
=c6Na
-----END PGP SIGNATURE-----

--zk2cvzwthowfwzah--
