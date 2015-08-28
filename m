Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 28 Aug 2015 14:58:51 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, Emilio Lopez <emilio@elopez.com.ar>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/5] clk: sunxi: Fix module autoload for OF platform
 driver
Message-ID: <20150828125851.GO29389@lukather>
References: <20150828124222.GA24923@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ickEXl+ukcSQ/3E"
In-Reply-To: <20150828124222.GA24923@goodgumbo.baconseed.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--4ickEXl+ukcSQ/3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 02:42:22PM +0200, Luis de Bethencourt wrote:
> Hello,
>=20
> This series add the missing MODULE_DEVICE_TABLE() for OF to eport
> that information so modules have the correct aliases built-in
> and autoloading works correctly.
>=20
> A longer explanation by Javier Canillas can be found here:
> https://lkml.org/lkml/2015/7/30/519

On the whole serie,
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Mike, Stephen, can you apply them directly as fixes for 4.3 ?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--4ickEXl+ukcSQ/3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV4FsLAAoJEBx+YmzsjxAgqD4QAIW714f2JIjT6rJsiHY6/6jw
LPJfM4OxXeqSg9BtWz68UTByCY2zM5Oi6sYby2Vw8ZAR724zFVEhUngCQVLPMTJ3
3XeDRO7pPTR/HN6g0WjKbAy0E+x32Pkp623QhAHNCI5+BuBRGWKwIHRxBV5jFOjs
+vFV/Y+52e9sCoL7Kt6PHy1KnEyfux5Dw4DpQfbr42Nr1HBZ802YQkkPRdhmIgVp
4K0x5gHT7FICER8ke4Te1ix6gIvQuMAXcU0rBLd4v60cLo4jGsS4KNt9VhHE+h0Z
uLvkM1OkIdjsZILLuzOCk5FNZqbkSZGlghxaSwz3RKVyTW/lzuRRgDTWQ+TWkjOZ
6+YOSq5s4MtexEK9zK6TQLDkbD0W7euBmolv8UOg8IzYH1CBVAsJXgFxr0Z75jCl
q6BdLvKtDVFQnOOtqBkixJgPyJALtHu0ES7/4wXEyQgUK05q1HZhUBMm/tdN0S2u
I8dS95jGCHMpO3ZbGEeOE2u7ehTy17WZDEVfQ5LtnlLj4Z3ssX19kwm7Ur7ltx14
XgVYFlTfm0DpZzjxq7oCDZctVLrNZzvbvyoFgIrDWbclGS8PwgoYcRKYUkfueaXE
E6wUHOK3WhQDRYR11Ex+njmz8VLeAZhpGm6cxLYvSv81+lv+KQSl/Ad+W99/Idh1
9kFo+WnyN9Fa695cMPL2
=mcmZ
-----END PGP SIGNATURE-----

--4ickEXl+ukcSQ/3E--
