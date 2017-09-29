Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:45624 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdI2KTU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2017 06:19:20 -0400
Date: Fri, 29 Sep 2017 12:19:18 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 03/14] drm/sun4i: tcon: Add variant callback for TCON
 output muxing
Message-ID: <20170929101918.h7lfefk3bjj2lf74@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rnbhxdod6u7v4b3i"
In-Reply-To: <20170929082306.16193-4-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--rnbhxdod6u7v4b3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:55AM +0000, Chen-Yu Tsai wrote:
>  static const struct sun4i_tcon_quirks sun5i_a13_quirks =3D {
> -	.has_unknown_mux =3D true,
> -	.has_channel_1	=3D true,
> +	.has_unknown_mux	=3D true,
> +	.has_channel_1		=3D true,
> +	.set_mux		=3D sun5i_a13_tcon_set_mux,

I guess we could even retire has_unknown_mux now, since it provides
the same information than if set_mux is set or to NULL.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rnbhxdod6u7v4b3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzh4mAAoJEBx+YmzsjxAgwWYP/Rporx0Mcrqx2I//WLihReUe
aumbEsSpNLO7iq4NWXzbkZ2by+qRJAJNqZfQ1h6S05Judyz2ZyXs4IKzTb3VX3yn
Hs5So/H+fX8GtacxpqjpInNc/ewbQS2/fbrQwWnIFpnU91cRbtqVQcjuCbKcXFMI
tNfkDcz2WHsGaG0vPb6/DBMYhMrPnNvNP8NoWqD2WAiqeTn4u8gExO0xuVauXx3t
CbFMq0cIZP1UWnYBEyAzV6BxMwPjMuMboGTEgiE6OfwjYY42ShlLaNRVMRc8fGPC
tHZFWxXRSJTWgf9Ylf/ZiPUjofG72GfCqWKatXs5h4nsIjVkfIn/s+vTsxQb3vTU
caOUzQkV+jRlowPy1OG9A15vTVC4E/HqK4rwT+61UPsFCGH9MPRByoAneE07v1/S
Fp3L+qLxFTWftmv+ArEDCDoi0j20K6bQyz3JHFD+QDMLnbZ1UZhiB5kVXTL2bbOz
WFrMUSGXDoSQLq4Z6K2F2DiZcA8cb0cwKYxE30rmfDsbS3rSRAK8YTbReA22R2vf
DnaAvTM1jibuQ6cEycvbfLbQLEHKl7cThsfscnw/LI8gAQe5kyjGdbxEsxPltu6E
5eY5/cEJ/rigcXvxH9v/pmSkylpSf5uYlC5+5Vr0JrNgyofMeIEGziS6+tj4xsJ/
oSTYMD5Zok+kxSRAqXML
=EIN/
-----END PGP SIGNATURE-----

--rnbhxdod6u7v4b3i--
