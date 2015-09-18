Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 18 Sep 2015 15:55:38 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, ulf.hansson@linaro.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] ARM: sunxi: Introduce CHIP support
Message-ID: <20150918135538.GS4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <2353279.QTDzFUHVnF@wuerfel>
 <20150918121905.GO4684@lukather>
 <13485899.XsimukeSAF@wuerfel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fh5LqGQwq8YwuKb/"
In-Reply-To: <13485899.XsimukeSAF@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--Fh5LqGQwq8YwuKb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 03:18:57PM +0200, Arnd Bergmann wrote:
> On Friday 18 September 2015 14:19:05 Maxime Ripard wrote:
> >=20
> > There's actually two issues that are pretty orthogonal:
> >=20
> >   * the fact that the regulator to power the wifi chip needs to be
> >     enabled before it enumerates and the driver is probed. The MMC
> >     pwrseq stuff seems to fix that, even if it doesn't really fit in
> >     the usual DT model.
>=20
> Ok. If there is anything missing in the pwrseq implementation or
> binding at the moment, you'll have to work with Ulf to get it to
> drive your hardware then.

Yep.

> >   * The fact that that regulator on this board is actually two
> >     regulators in parallel that needs to be controlled in parallel
> >     too. Here, it will probably require a new regulator driver to
> >     combine two regulators into one.
>=20
> I don't yet understand what it means to control them in parallel.
> Do you mean the hardware uses two outputs to support a higher
> current than you could do with one?

Yes.

> How critical is the timing? Would it be enough if the mmc
> code knew how to set more than one regulator and do them
> one at a time?

I don't think it's critical as in both should happen exactly at the
same time (but I've not really tried it either, so I'm not 100% sure).

And I don't think it's something the MMC core should deal with. The
device itself has a single pin to provide its power, it's the board
that is wired that way. The way I was seeing it was more that I needed
to create a regulator driver that would take two inputs, that the mmc
core would use. Last time I discussed it with Mark (Brown), it semes
like he was open to the idea, so I just need to find some time to do
just that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Fh5LqGQwq8YwuKb/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/BfaAAoJEBx+YmzsjxAgwRUQAJGxrKNog0nAFfKQvn95TY25
MJ0EjVyXwfhwOvzhCoi2oifC3u9iZiWug9gcp8LZlzz68twtKm0tSi4/Cfmc1AUm
uHquFzKkp4awBXkARbmFr289TUZ3WYns0GzIQofeuVAM3i3t9XAN/W2v2aAN6le7
pYfpTFLVfsJdzzQnFjzkK/VelnK5cPOOT1HHsDxdMn5qe+PfE4U2RG0bL4GJ89MY
02l4DrqeJpAqOT9EzuobPK0XRUmIQdhE4ddQpZbfs8eb8ZcriJ4zxyo4De8Slo+Q
5aQp6HvhHh+k7OcWlwHu4eF5hF8cCCQmuE5vZlt4TQMUyo9YpfkHxZN4tdwiC7Gj
L8/CVPDZ6DTt1Cl5hy+deyBylo2/nPIXGn+pyuIn8fMDWOvxjrKhVR7NiACCoG23
/YEfdPmKnyBNjzoMyIE3EAYJLdbP6+Cc0SdbRDpZZGPVFKNdWWS+8q8KgECtEqdv
yS8OjiuEsW3/Yi32zzi05rGf22wLd0yern8K11Y6VO0zYANZRy5DMhLNQNaNKG46
9ruTQdLip0nIyjX+iWy1CJbDRwv/lWDgDGxP98XmcFm+Xjxou2Q8gqjtPndy+GcU
ZZCCzsnAj+O9It5/WGFuZQuYHz4BDYt31gmJmFJ568Z78APJ1BWot1ilKeUP8kE1
Fp4yzMTrwJ8F3SmbP4rE
=Rb3T
-----END PGP SIGNATURE-----

--Fh5LqGQwq8YwuKb/--
