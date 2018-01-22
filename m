Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:51787 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbeAVN1D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jan 2018 08:27:03 -0500
Date: Mon, 22 Jan 2018 14:26:51 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: remove select on obsolete SUNXI_CCU_X
 kconfig name
Message-ID: <20180122132651.fuhkwwa43ewrzqzq@flea.lan>
References: <20180119141906.7339-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r7ekjhkf6lbz3u4x"
In-Reply-To: <20180119141906.7339-1-clabbe.montjoie@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--r7ekjhkf6lbz3u4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2018 at 03:19:06PM +0100, Corentin Labbe wrote:
> The following symbols:
> SUNXI_CCU_DIV
> SUNXI_CCU_MULT
> SUNXI_CCU_NK
> SUNXI_CCU_NKM
> SUNXI_CCU_NM
> SUNXI_CCU_MP
> SUNXI_CCU_PHASE
> were removed with the commit 06e226c7fb23 ("clk: sunxi-ng: Move all clock=
 types to a library")
> So selecting them is useless.
>=20
> Fixes: c84f5683f6e9 ("clk: sunxi-ng: Add sun4i/sun7i CCU driver")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Queued for 4.17, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r7ekjhkf6lbz3u4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpl5poACgkQ0rTAlCFN
r3ROEg/+KPitLFM0RqlST8mND1Ed01aMe6LYtwhMfIkOGyqzaqPKqrHWjSfRiivo
5iXacrcDB9SeOeIngLFvV+3xkecIGhNlpGqPWbvqYdhMFNNJC3HAdUYVuIJXHFgR
ndSYDaoQ99t6yoZejG41VnS3KGYv7Iw7/35M352Ys2grB9SPM3Qoe3ZDiB/cZIA+
HNcm6gpHhZ7brPKypfnN+ex+6WsgX2JAfr6gaRRG8yM/hh5kNNvPVELfPxs3gvon
7P8KYZns8wxTenBvw6raZvJOF81Qu1y17+hjyzb7UEUgmlgmLTJY4yZ/LWfgWskp
HmOGknDKe1hWZp5y33T35iHkS9p3AmNtWpIrJf3YtdwlTFKg8NBWuWQlGzO6vUZn
iJr1LYYNsvyOOlYW4hmIJedgHMtUr/bY0dy1NzBYlqPBf+RL0CvLpuNnv3cmmGr1
vC68mx4OxjlHgy5DcrstZhm8SK0fG14U2FMy7HFLCqHg6KPkGo/+yd2yPptNjkyX
LSNb5hIZQvRdt4Zp1FrJDxAy97lFAEBz6THnYoGp+p5Gg0yheUzXiASFBZ2YI8Tp
cMqt8yY+lTjAUoIPkh18BOAro5h6TgoRIbktV41iad6SFi9Kp1gqoEfBrUkGM0TB
NLaTYDQmXLMWutPxr+GFMDzLJlXSSR5NqBLEn5DJdjb1A2xGejo=
=cMF4
-----END PGP SIGNATURE-----

--r7ekjhkf6lbz3u4x--
