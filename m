Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:54470 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751922AbbKIQFZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 9 Nov 2015 11:05:25 -0500
Date: Sun, 8 Nov 2015 17:52:25 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Message-ID: <20151109015225.GX6114@lukather>
References: <1445964626-6484-2-git-send-email-jenskuske@gmail.com>
 <1446651896-22902-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v651vNyUqE_LXYnuYNhN0siywtg7Pt1TDQZUMxwZ3psmJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+61ZvX8xaeyevaKt"
In-Reply-To: <CAGb2v651vNyUqE_LXYnuYNhN0siywtg7Pt1TDQZUMxwZ3psmJg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--+61ZvX8xaeyevaKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Thu, Nov 05, 2015 at 10:28:00AM +0800, Chen-Yu Tsai wrote:
> On Wed, Nov 4, 2015 at 11:44 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Remove the fixed dividers from the PLL6 driver to be able to have a
> > reusable driver that can be used across several SoCs that share the same
> > controller, but don't have the same set of dividers for this clock, and=
 to
> > also be reused multiple times in the same SoC, since we're droping the
> > clock name.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> > Hi Jens,
> >
> > Here is an alternative (untested) patch to deal with the PLL6 issue you=
're
> > experiencing with the H3.
> >
> > It doesn't rely on parsing clock-output-names that turns out to be pret=
ty
> > fragile.
>=20
> A quick look through. I've no problems with changing the design, but I'd
> like to keep the original names, i.e. pll6x2 for the clock module bits,
> and pll6 for the fixed divider. It better matches the user manual.
>=20
> From the PLL6 register description:
> In the Clock Control Module, PLL(2X) output =3D PLL * 2=3D 24 MHz * N * K.
>=20
> And all places that use the "normal" output say PLL_PERIPH (that is PLL6),
> while MBUS on A23/A33 use the 2X output, and say PLL_PERIPH(2X).

Ack, I'll change this.

> On the side, do we want to get rid of all the divs clocks?

Eventually, yes. A10's PLL6 is pretty much in the same situation.

PLL5 is a different story though, since it has an extra adjustable
divider. It would probably deserve its own driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+61ZvX8xaeyevaKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWP/xZAAoJEBx+YmzsjxAgEW4QAKu16LJ3IthlMhiVih3Nb/4r
OwqBbcCG9iKWfTu+Y1OVSACI9K2gJ32SKSNrm3z4UZ7KAap6ihTKJJVDnjI70AYL
xbaje5pPjdmMDsaOhzObh02C3e/xaKXpW2TJh6xfLnmlLwKvNpjiqNa+A118ZGAy
xHtfFZe4Hcl7krPRNMEju6yFhqfw3x48XhZUdznbtA0YNGn6/KcGq6Thn3bXuREL
KgOzTIRaKA6tVcaOwsR2noo17tWStcXWOlFczxoZZf8y7ypkihSgdEFtuzsXOqCJ
A2zZBEyiGXcgqkmFRFBO0Hb3nV9ymGVHC9gCpjfYT7lp7NVG7A+MAryprHHvFSmK
/qpVWjQwkoGIF/lm/sde/fj7VQseBMmBYPSDER7kzrsjepXamxmCLYHeXz7lOG/N
d2MyMbfDCQ3ogP/QPq3XB9+SYOc3+KKB2UijDyhc3G8PugyK1Ni4erVr9Ka83j83
XL5UyVAQS6mlg8ywxjffNiUah+JjvUB3VCsUvrORvSw90b8CLXCVgki5oIeCrwQd
2S0H8v2lTm1GvGRb8/yLB0Ng8dKpySP7uTRqlNoFOxIap9klMPzot0MTyedNqgGj
et5Oe/5TRLLKUDz5pWzmhyctn5KGGhljdOxhAJk9F1Y6fXOp8RMogi9+sc0kbsc6
GRGFjLiFtJJfiZWji/JQ
=O/UY
-----END PGP SIGNATURE-----

--+61ZvX8xaeyevaKt--
