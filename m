Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 20 Aug 2015 17:11:43 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150820151143.GC30520@lukather>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
 <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1>
 <20150811170904.2416.43354@quantum>
 <20150811183317.GT18282@x1>
 <20150811185827.31346.68194@quantum>
 <20150818155203.GJ2547@lukather>
 <20150818163356.31346.15075@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mZSo2Zk6iB5ZAp9g"
In-Reply-To: <20150818163356.31346.15075@quantum>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--mZSo2Zk6iB5ZAp9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 09:33:56AM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-08-18 08:52:03)
> > On Tue, Aug 11, 2015 at 11:58:27AM -0700, Michael Turquette wrote:
> > > For example the whole big messy fuss over the DT bindings for the
> > > simple-fb driver could have been avoided if this feature had existed
> > > then.
> >=20
> > Not really, there was additional issues that would have prevented to
> > use that in simplefb too. For example the fact that you wouldn't care
> > about the clock at all if simplefb was not enabled in the kernel. Or
> > that you would like to protect the pixel clock (or its parent) from
> > having its rate changed.
>=20
> You're right, there may be more issues involved here. But as I recall
> there was interest in using simplefb to "hand-off" to a loadable module
> later on, and that was really what I was referring to.
>=20
> In that case we could "skip" simplefb having to claim and enable clocks.
> The loadable module that is the "rich" driver could just claim them as
> usual and the reference counts would be handed over at that time.

Yep, but the issue would be broader but just the clocks, but yeah,
you're right :)

> But I don't mean to dig up past flamebait ;-)

Yep, it's probably better not to :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mZSo2Zk6iB5ZAp9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1e4vAAoJEBx+YmzsjxAg7LMP/1GOp/YKlzCEBSG8ksJH9CFY
2oFUxAPKL25gQdYwneWRt/bNP4IegYeDIAKgqd25pHIu97FD+JYy5F0XBs4dcvmC
OxI2+GfCdKFU7FU8efQv9ufwl49eKfnp1j1WhRMwH+BXwBPjDOt9VVjaa5qzg6Fo
VpJXnoGRFBNaZuHUU2tXdXqvRLkKw8KDOQdfgCdTfVQ3w+JODmqINBMpiEIXKGjH
pkpnPDrrsjncyqMrE715EGO1Qv0MO9Bd/YjKVmGf8K71CMdr+j8skBZdPxN3WaAc
j8WgrMdg/TN2QSEznx/8vLkEXEjqyMc29qOETq1Ix8VFodLiKfH34omXLJ0cFzVB
c+LEL7H1MhYwauYm9m7OBzcoqEt/0D0ZDs5fboNRrGmnv62Xz7RHhsNJMnJOGLzj
eWVuEqJPRkwAp/rsxJaCqO1RbyMNAqQrtujsGDWerWAn/b7J4ZZGi9fVSYd+xqj3
Lh1DytGxTUdqzWLKxf0IZlsXVb0581Av/82or4VcsbC9iJl9Uuj1dLcRwYhyE4WZ
NgfIBi+nfiRStt2JqdbfjhOev2y6z/EiX6zqSOOsXj2mKg9UWoc4Y2RHwzBCNbUQ
cTneBwdV76AbemNU1hqX9fIpigSHMqQ+PIbqu/Qv3XwIpnvEh6/AXPW31cZ12Uru
+ox69cMUhfUNxwzXxz5+
=W4jt
-----END PGP SIGNATURE-----

--mZSo2Zk6iB5ZAp9g--
