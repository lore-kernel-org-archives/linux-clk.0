Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:50940 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbdDJHFG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2017 03:05:06 -0400
Date: Mon, 10 Apr 2017 09:04:54 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/2] clk: sunxi-ng: fix PRCM CCU CLK_NUMBER value
Message-ID: <20170410070454.6sm2qowqtlxdafws@lukather>
References: <20170407161904.32624-1-icenowy@aosc.io>
 <20170407161904.32624-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vzowxdrev7auwi73"
In-Reply-To: <20170407161904.32624-2-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--vzowxdrev7auwi73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 08, 2017 at 12:19:04AM +0800, Icenowy Zheng wrote:
> The CLK_NUMBER value of PRCM CCU is wrongly set to (CLK_APB0_PWD + 1),
> which prevented the IR mod clock from being set up.
>=20
> Change it to (CLK_IR + 1) in order to correctly get IR mod set up.

Applied both, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vzowxdrev7auwi73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY6y6SAAoJEBx+YmzsjxAgWo0QAJRfQg/rQD4GAJxxqO3O3YC6
zEYjGgtKcDlcgbS7jCdS7Xhc8Yhm75eD0/qw5imVXF47FsgzKvDh+nmYhVJ/MoWN
1e/dz5t/Wp/mQlUkY0/tTam6OWeak3YD2o+3sV7Ov0huaaTLcUIPUzqzM1rUniTO
sd5hTkm4fblUMjy054aLZrZYS4rk1Cfqy1R5lhfmGS9a1kLxVrkjdl9/gBxAPoUO
l6HVrz2x8iU57coH5+dOjXeTdbrsx2ocL4D6l5WLbKxJzd664Y+bu072HMeZOBr4
oOxGmXpgZUoYDSD/uzb7zhJGck167lQKpWuIKcQzO2AVUpF02NBH8nYUV52Qm0km
pTEW91/DiB93oLl7YhKTqipju3t97A/7clll6wZcsiQjWg3C50kyeTvP/eVAPLyp
8+nx1FLGMj2KRsVCFk7oDWzvk6UcGzv3ruaaDKWEuSYClRZ2Eprejf8viZgsQ/I8
ufLzRfaZFB/P1KwvBtrAufyvqD5zD9TFf/1hJjpiiWxS3G3BF+JUtxhjw3/X/Gkw
niwomTAm1FZRzyBHblmIuIrfbLg7dpB2xm5iKv/Jz0ylKB6Bbp8XG/87bbKGkbWQ
F3rwpd6/h62/sQVQrB03K9EzClG+XnKOVDOaSVGx39MOfAcNLFmcxSlOTXALpLpT
PUtfqKIQJiQ5iIS4A26c
=J+Ft
-----END PGP SIGNATURE-----

--vzowxdrev7auwi73--
