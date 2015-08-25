Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:51490 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565AbbHYAbl (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 24 Aug 2015 20:31:41 -0400
From: Eric Anholt <eric@anholt.net>
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] clk: bcm2835: Add binding docs for the Raspberry Pi clock provider
In-Reply-To: <1439507142-2965-2-git-send-email-eric@anholt.net>
References: <1439507142-2965-1-git-send-email-eric@anholt.net> <1439507142-2965-2-git-send-email-eric@anholt.net>
Date: Mon, 24 Aug 2015 17:31:38 -0700
Message-ID: <87vbc4us2d.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> The hardware clocks are not controllable by the ARM, so we have to
> make requests to the firmware to do so from the VPU side.  This will
> let us replace fixed clocks in our DT with actual clock control (and
> correct frequency information).

Gordon from the Raspberry Pi Foundation just asked me "what do you mean,
you can't access the clocks from the ARM?"  I'd been assured I couldn't
by another developer (who was originally going to write a Linux driver
for this), and my own testing had also indicated I couldn't, but after a
new round of hacking together some tests, I see things that look a lot
like clockman registers.

Looks like we're going to get a native driver, instead.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV27dqAAoJELXWKTbR/J7o7VsQALY59uxzOW5gYQJjog9oPwyO
r8KMrsWen3hdhgbvzwSVnmMAJn/OFfPDE8t9x9YhTF1qVDMaSw5lQmmsWDLlidIk
JeymNirtPw8H7nrvzoZXF5k4JgU+Zt5QaRhM+D1nifKb2puRoKJ9QDPYWwVVFCdd
K+zTSCGGPWmHCduiMSQpEpjxYeZa6n6St1w4L8xbj73we845AK03JHzkj5kXQUZ9
iFcK1Gj1antCDzjkqpgel1Ih0Pn4FnLtLcsMtZ0vSwDHb1Ej2tVzlwrfWOG2C1I/
LvvGyv/2WLmgVh9g9k5OZUHeFZhyRxOz80NM8D85IIkoNn/4qpDzri3N/047wZ++
zTn46uu5wV7a7O3ywc3nDYbwwnsiioE1JkyJAXxWFJblRahraS7KFdOcpLrQ5jK+
jVUJysmA+T0WH//fAvtf0u+htqukxbnxRMUOVdOzifW2trDtsdnXDa6yfmNyd7Hh
BleMYFZJKDM45i4dl0zi5OICud14ahB0MN9TuczKdglQzl3wjUuHq6zLunMBv9yl
DqNN1ukSfdZsxoli8XQ85Zzb23cbcEQjWox/JkKNQGSCxSWHLebA8y+kY3e7QY1U
mfQkV07BpCEEjIhR/I2TEnaXjdmPoXzol/ApEiNiUhtDtGcwpY7m/2Tl+1Lc5A1p
OTfI0WyhcDb0DwehRvFQ
=FyqC
-----END PGP SIGNATURE-----
--=-=-=--
