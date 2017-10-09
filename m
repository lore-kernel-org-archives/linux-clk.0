Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46253 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751588AbdJIHUD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2017 03:20:03 -0400
Date: Mon, 9 Oct 2017 09:18:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/2] Add a regmap to Allwinner R40 CCU to export GMAC
 register
Message-ID: <20171009071809.jte47cd2mt4iv6y7@flea.lan>
References: <20171006063333.12345-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ua2gcv3fsvd5brqe"
In-Reply-To: <20171006063333.12345-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ua2gcv3fsvd5brqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2017 at 06:33:31AM +0000, Icenowy Zheng wrote:
> In the CCU of the Allwinner R40 SoC, there's a GMAC configuration registe=
r,
> which is intended to be accessed by the dwmac-sun8i driver. On SoCs alrea=
dy
> supported by the driver the register is placed in the syscon rather than
> the CCU.
>=20
> As CCU is a critical part of the SoC, so write to it should be strictly
> limited. A regmap with restricted write permission is created by the R40
> CCU driver, and can be get with dev_get_regmap. In order to tie the regmap
> to the CCU device, the R40 CCU is now a platform driver, so a platform
> device is created for it (and then tied with the regmap).
>=20
> The first patch does the conversion of the driver to a platform driver,
> and the second patch adds the regmap.

I'd like to see first what you want to do with it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ua2gcv3fsvd5brqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ2yKxAAoJEBx+YmzsjxAggY8QAJTxfteH2Eu2EC43Tpb92512
cNZXeh9xkg+1GkmxoBbFhHudH7Je629DawbT8ReYckMbDxFnSvIwirtqGT01kt9p
j3Kjf1Qt42PAtd1l12nydeX+Zi3ZQ/kzad4hwvjDq6xoS6tW00LWRG2yBg8V4EXY
QZnQ+RaiQT4XGK7QVo6ROKAo+AQRVkorV9HKsqFYObx13Hf/7aTcGdhrZuJBzz4H
wWs69ryfdUK6fng7nrAjVsDyKSQFWttcpze8dCDceDrEeXfbyLQq/vcQV1/u5xDj
XLzZy5k8Z9iy1kYMlv99/TohBCVzfZH1TFAEKVpLQA7KGjiWyjhRZ6y5Rv1idLe4
he9+3O6uSAvIIL74eLQ3ST9GekGWloKQFjryNIke9IXzxVQ/9yWflZRmY4782eqv
Oh2K/j4sQA2Tc8QkwqwizCRMHUinBvgQ8CSJsb7buPdXZC2HHoeEe5y94rOhIIrV
5NUu2xnxV3Bdq2jGsOiav/nbyuLxZhEYU9Vf+xOPeiBQKM3CTmiQeAkyBv5yUqf8
3zre7tv0MxM272lUOCnCxzlydlWNAiJqWdbMW8Dw1z5LUhYgT9jxnhyE2easeVxV
s3mdvucHmSsfzF3JHvLM40/k8aVij/bEEsO0cdnqwIyYEsPTR1flGBHjlsqcHDSf
fbu05AZ+BJylGARRmIeP
=UHcK
-----END PGP SIGNATURE-----

--ua2gcv3fsvd5brqe--
