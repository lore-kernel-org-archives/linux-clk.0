Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:40846 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S965138AbcBDMQO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2016 07:16:14 -0500
Date: Thu, 4 Feb 2016 13:04:07 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"pawel.moll@arm.com" <pawel.moll@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Reinder de Haan <patchesrdh@mveas.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i-a83t: Correct low speed oscillator
 clocks
Message-ID: <20160204120407.GB4270@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
 <20160202131947.GS4652@lukather>
 <CAEzqOZvcy58T_uxvymGxuQXh_Goj3yHmgkmL4VL+x2_bycMgNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
In-Reply-To: <CAEzqOZvcy58T_uxvymGxuQXh_Goj3yHmgkmL4VL+x2_bycMgNg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 04:51:06PM +0800, Vishnu Patekar wrote:
> Hello Maxime,
>=20
>=20
> On Tue, Feb 2, 2016 at 9:19 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Sun, Jan 31, 2016 at 09:20:58AM +0800, Vishnu Patekar wrote:
> >> From: Chen-Yu Tsai <wens@csie.org>
> >>
> >> The A83T does not have a 32.768 kHz low speed oscillator, either as
> >> an external crystal or input. It has a 16 MHz RC-based (inaccurate)
> >> internal oscillator, which is then divided by 512 for a clock close
> >> to 32 kHz.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >
> > You should have your SoB here.
> >
> > Is it ok to add it?
> Yes, please add.

Done, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsz43AAoJEBx+YmzsjxAgnikP/3WHZXCsPJzeRgm9/M4W9KGF
hHERuDu+TboNFltk3/WeHgtv4Q8nno9G8tq3m5AfXyeolMYrtg8crifDQTYhj54v
lAMKzFdpzS2GhEZm/XvBTfKMoW/zHTs86HcjKQ26OTml6frtQD2CPa/yITbr32Vl
EU5Q7k0mOOPq0o39P/lPExGo9HVUy9uq8D7j0KeTEyGtb2XIxu7WNoGykhGXYkIl
zAFyDUruRW3Yw90u7BgaQV10wzZl/XfnyJ0TZbis2sOc1YLGOs5Qfe4ukGuaw5gP
KUQ9gKvTCitJvJGyqnuhe/fnFmJV2IEZW6Dcw9dHNmy2m659YpXS6Re0A5qd8JKS
t2tdWQYLGKNdbR/kmbyKH82yRm8GhS8/yaO4bW4/ZKBVgfp01WzlZ9wwDfWTt7Pn
rFDFhvd1LbawzoCrLRbRqe8CHl/rio879Lis7mBp6UhQ9DJH7Uo6pQyfbzeulWG4
PZ1Kw0VXpkpp4XOHzbHQvSpLppKjYNnhRnQKuRM3wSQQcwbia+lhodZNmQrAKwI9
2WMT9m5VNkwItDfpoHh29dSqsjzuP1bSdmiIb487akVs1dH/jsDXPowGH2vQ4nJI
zNcr4h6N5Wdo9x2BaXIB3jwn2wB8KeACUvFYrZNIQBBERlvk/FRAE+Cism8aOfZu
kbi58n7EBFdNzAMMwoqq
=yNGb
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
