Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 29 Sep 2015 21:36:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: [PATCH 5/5] ARM: sun5i: Add C.H.I.P DTS
Message-ID: <20150929193644.GS7104@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <1442566130-3497-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64E-gQu1U_qi2fTWiCmfgMdMR4X6yLUerV21d3E1uQ1cw@mail.gmail.com>
 <20150922124708.GZ4684@lukather>
 <CAGb2v662+mhFgv1DXz5muA+xGE99R1DVKOxtVPvJmc+tRFPXzQ@mail.gmail.com>
 <56015146.2070509@redhat.com>
 <20150922140424.GA4684@lukather>
 <560165EC.4050208@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O7hm+SMpb/lu0d4d"
In-Reply-To: <560165EC.4050208@redhat.com>
List-ID: <linux-clk.vger.kernel.org>


--O7hm+SMpb/lu0d4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 04:30:04PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 22-09-15 16:04, Maxime Ripard wrote:
> >On Tue, Sep 22, 2015 at 03:01:58PM +0200, Hans de Goede wrote:
> >>>In short, this is not about "power supply" but VBUS detection. IIRC,
> >>>if no VBUS detection method is provided, the phy driver just waits a
> >>>period of time after an ID pin change and then considers VBUS invalid.
> >>
> >>Right, but that is a hack for boards with no / broken vbus detection
> >>(or vbus control), we really want to use vbus-det where available,
> >>so I agree that a TODO comment here would be good.
> >
> >What's so special in our SoCs that makes that we can't just rely on
> >the ID pin ? (which seems to be working just fine here)
>=20
> There is nothing special, AFAIK all OTG ports (also for other SoCs)
> have some sort of vbus detection mechanism. We need the hack because
> vbus-det is broken on some of our boards.
>=20
> And where it is not broken we should be using vbus-det normallu.

Ah, and most controllers embed that directly into the controller
itself and don't rely on a GPIO to do that. Understood.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O7hm+SMpb/lu0d4d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCuhMAAoJEBx+YmzsjxAghpcQAJTR4ePq0jmVxSqFJFk/x6yb
R4X5dbALdJOfNX7a6MTkPOsJtB9bdN3xaUplTXyXzU8J3jU6cvk9SQ/sWEXK8jtx
TGzz7CPSTdUHW2aeUw03OEd1V9VgU+Qrq/xbsNL/UWm94Eit135wMHGnE5ivlgj6
mk4jLiHc0AOcyDOjqlUjI3SbM0iVlDU0JX7tJcjPvId7SnGRMO4X8vvj2xo0y/hZ
++MZE3gsr+rwh/bUA6hqO9N3TOh7Lt3ZJc+tVkPQuRRunH6MYK/fGEy6lvuCTzG4
rSsISDLu/LlSEOf+1YkMw1QNv6xgou6Hk+ILqMfQyuMA/h0Wy1yAr1/hRGQYE/Ct
tLDFulOpaEMGwJg25FT6zqTimubswkgeI6une8NyFAUcALACmlx9IRC/GoYBP1Ek
cbwUZTzJ9krgzvGCOIFSjzy2qvd7CFbuYcuTrjosSTQ5Rzj6AZgNHoTAKmZpw48o
3uHTXTuMfe8qYbvCmhXqKfQo0Pn23Mm7+TT7/AxYE3Abcj4gBL8hrvxPY04RNBmo
eTgjr3obhD2+8dSODiDjwfEfzMXGeRGP3ILhRouMJyjd6VWq6P3JaTW5cKHOcM8R
8PzTGe8z/r7fay3RDDytEZxj1N2+40TeTzh7r7HcJNkWgUOHvshvOs7cSsIyJg/S
KGZL8cBswjr7xo4F/SOV
=GTy/
-----END PGP SIGNATURE-----

--O7hm+SMpb/lu0d4d--
