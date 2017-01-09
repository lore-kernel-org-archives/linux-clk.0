Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 9 Jan 2017 10:59:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
Message-ID: <20170109095946.6esbfx6pafega5cd@lukather>
References: <20161125002852.18097-1-megous@megous.com>
 <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wdyexf75nukvhbdl"
In-Reply-To: <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--wdyexf75nukvhbdl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2017 at 04:49:18PM +0100, Ond=C5=99ej Jirman wrote:
> Maxime,
>=20
> Dne 25.11.2016 v 01:28 megous@megous.com napsal(a):
> > From: Ondrej Jirman <megous@megous.com>
> >=20
> > When adjusting PLL_CPUX on H3, the PLL is temporarily driven
> > too high, and the system becomes unstable (oopses or hangs).
> >=20
> > Add a notifier to avoid this situation by temporarily switching
> > to a known stable 24 MHz oscillator.
>=20
> I have done more thorough testing on H3 and this approach with switching
> to 24MHz oscillator does not work. Motivation being that my Orange Pi
> One still gets lockups even with this patch under certain circumstances.
>=20
> So I have created a small test program for CPUS (additional OpenRISC CPU
> on the SoC) which randomly changes PLL_CPUX settings while main CPU is
> running a loop that sends messages to CPUS via msgbox.
>=20
> Assumption being that while CPUS is successfully receiving messages via
> msgbox, the main CPU didn't lock up, yet.
>=20
> With this I am able to quickly and thoroughly test various PLL_CPUX
> change and factor selection algorithms.
>=20
> Results are that bypassing CPUX clock by switching to 24 MHz oscillator
> does not work at all. Main CPU locks up in about 1 second into the test.
> Don't ask me why.

You mean that you are changing the frequency behind Linux' back? That
won't work. There's more to cpufreq than just changing the frequency,
but also adusting the number of loops per jiffy for the new frequency
for example. I don't really expect that setup to work even on a
perfectly stable system. CPUFreq *has* to be involved, otherwise, that
alone might introduce bugs, and you cannot draw any conclusions
anymore.

> What works is selecting NKMP factors so that M is always 1 and P is
> anything other than /1 only for frequencies under 288MHz. As mandated by
> the H3 datasheet. Mainline ccu_nkmp_find_best doesn't respect these
> conditions. With that I can change CPUX frequencies randomly 20x a
> second so far indefinitely without the main CPU ever locking up.
>=20
> Please drop or revert this patch. It is not a correct approach to the
> problem. I'd suggest dropping the entire clock notifier mechanism, too,
> unless it can be proven to work reliably.

It has been proven to work reliably on a number of other SoCs.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wdyexf75nukvhbdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYc18OAAoJEBx+YmzsjxAgtLYP+gMJkEWqKHg84aIHnL+OtOGD
Hfkl+AGTvanHcwPxapcr6M8RADi92BltPtyEJJOSf25ArRaazKdEUxkymuwslqnB
cUNw3imWWEyE4ZchqKd03+vBfxzYFgVR2ytPo7g7wGRGgQsi07+CtyJFC2y0H1aH
t4XdC/F39B8//ZKAl9YgAp5h9vz4CnUqJF14Lhz0dcaBeaU9CoMtzjZ8MBJ+WJ54
mWAMVDWuxpwkJW9h5b6ympGOR3TkCKPckQndQ6jomgb152UHB6TLkDhoRpkO03ql
Zuxjw68jTPa7WLnoop2qebUO1K1WekR/ylw0Z+LnXebp8yJgLzeINAifs123qq94
QDYmdOwXIi+aw0WALNgOIXIRHJkU76E3Gtg6BZ8aRdCX7IOdIevkUn65NG5AGDmP
KgvOu0lxHKk8VM682RVoK22HVN9HQBVf8NeFRWPuPC79zGMuDXMIvk3xxvrEkAIK
RDEK6TkNwseqQ4+lWEaDEWwIe/lGRZ0RA8v3C7W9KZE3J8tKHL44oz8bLR5zNevr
QLQlLdET+lRPn1ZrqPKq3P+u8ylLLCnPVM+oar4Ji8nsThShTVHs1/N9ZfIC9/Po
IFARij8iMXyGZJTmJfvYRDX628sJS6CsYA/DGvJlvUcyByqth/K+br0atZXn57C+
EX6/L/rUDPhI13PaRqpp
=ZREn
-----END PGP SIGNATURE-----

--wdyexf75nukvhbdl--
