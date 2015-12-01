Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 1 Dec 2015 14:07:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 3/5] clk: sunxi: Add sun9i A80 cpus (cpu special)
 clock support
Message-ID: <20151201130712.GI29263@lukather>
References: <1448766190-11345-1-git-send-email-wens@csie.org>
 <1448766190-11345-4-git-send-email-wens@csie.org>
 <20151130171325.GA9287@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lqaZmxkhekPBfBzr"
In-Reply-To: <20151130171325.GA9287@rob-hp-laptop>
List-ID: <linux-clk.vger.kernel.org>


--lqaZmxkhekPBfBzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2015 at 11:13:25AM -0600, Rob Herring wrote:
> On Sun, Nov 29, 2015 at 11:03:08AM +0800, Chen-Yu Tsai wrote:
> > The "cpus" clock is the clock for the embedded processor in the A80.
> > It is also part of the PRCM clock tree. This clock includes a pre-
> > divider on one of its inputs. For now we are using a custom clock
> > driver for it. In the future we may want to develop a generalized
> > driver for these types of clocks, which also includes the AHB clock
> > driver on sun[5678]i.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
>=20
> For the binding:
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lqaZmxkhekPBfBzr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXZuAAAoJEBx+YmzsjxAg+VYP/2J/9xy4QkYU5WczTo81dN+M
6+pTNR/UO+krJnbe6eVmyyqcqRNyyC2klzDTLveaAWC9bDPqwIKvr9Z94bYwoxKl
PizsR/3LfXJL8V77A3Gq3USmSK/RuCzAa+QgYkD6L7FdjwweGZbCOTGg2DynKFp/
3nDOgg98oRuW+bftg+Fluxl5RP8eQpLYoxcMjBzn5zh+DcO5ZGaMF0nQssRPdGcR
fe7jq0YROYm0V4k+QHjOqkL4E0qr6nsAbY7mkRajMbtxMt9dMD/XdW4GyyN21P8T
ig3/UwaHLUs9Gz5CTpiLpDIDuZCwW3bPowbrd8tDI7KgwE6rwdzU/Mrp/nLj0YoF
MWdppvTNE3yNO33R6yJEDzofWvLeJR11CsP6nGEtRiwB6E0NW/qbfPmU27qozLjL
w667numTGFjwHBrqvLFmVbwEE2GDctnt5oHSpaXVOPCZG3K/KML8qE9k/1NnLSgQ
APDUMAkV3Ot+dNy3YOzIfSNfZOy+4QlwgjaJ6XJWmIJrLzgx1CA/cOvOO14DWm3u
FL0X+Ttu90RljJf5+NMy+g5lGq1U8SsFr+cobrFd5dlYJNQe0PwJtOclPjmo0Hdg
5SaxOebz1VkEEvfZgld46KC84wzDmUDkOXvsSFDvG8FUpznyd3f3jbAwxMifL6Sf
DGbSaG7qRooLps1wOFzX
=0v0j
-----END PGP SIGNATURE-----

--lqaZmxkhekPBfBzr--
