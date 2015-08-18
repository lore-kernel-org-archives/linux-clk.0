Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 18 Aug 2015 17:52:03 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150818155203.GJ2547@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
 <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1>
 <20150811170904.2416.43354@quantum>
 <20150811183317.GT18282@x1>
 <20150811185827.31346.68194@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
In-Reply-To: <20150811185827.31346.68194@quantum>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 11:58:27AM -0700, Michael Turquette wrote:
> For example the whole big messy fuss over the DT bindings for the
> simple-fb driver could have been avoided if this feature had existed
> then.

Not really, there was additional issues that would have prevented to
use that in simplefb too. For example the fact that you wouldn't care
about the clock at all if simplefb was not enabled in the kernel. Or
that you would like to protect the pixel clock (or its parent) from
having its rate changed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--I/5syFLg1Ed7r+1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV01SjAAoJEBx+YmzsjxAgc4MQAJpvZunNAMH71XJmBz7mksgN
Q+8bDy6d2RDRCY5txGtzylb5xWbqaOBecJTlrgo5iIPkZAXzozN8t96CgNY0+eGR
25MJNolOIzInKAsWwXu5iL/yYEv/dhgu66EW3YyUaL9dfaBxpfGOpBUWNEAXcb9H
Ie5504SgBczaCzJmY0eUHErmF/gZny8ZyDvsKM5P4il7BYutV7O+NRKxtN62XP6I
VzeDsGPE0LcC2+uH0/PawGKXuCpXSLVpk4irC3RD9bGNpL5cpjvhsyOBECPenH6H
hEz0u5E4IjUk+Tfx9MeCZOhaMDdxfnvoIPs+lZSlaQAqjd8a85/2yRto+cuVESFC
BJo7VyBje+XMgnpLSMNy6Lbft9oHMeFlvXSANxMrPxm/+g6A8oJgtrzuzkoubtiE
vwKlasA9YACvEDiqngCpQ35a2u3R3LsrtSFiFYfB3W0OjIwwhVBLEFF1qCxYAPng
Y6CQ9yVcbRijpW5DQRBPiBfsP90mh58iR1xnXGptdLB0jy39yYtY6lAdpyvggRNa
B+m5v8Q1ly7ugp3yA9e7+ZoKK7Cb1peUjvoA2IZ5Z6cMptbCMnvLqWyCdkY6+xI3
Kvuj7mklDDSZ0/bDEA6WnGH9lDmQnWiVsn/oi0PZ9e+BrrkONfClIH8uWkJWL0+8
GIqvqkOJiNbUbQL1S90X
=8GkP
-----END PGP SIGNATURE-----

--I/5syFLg1Ed7r+1G--
