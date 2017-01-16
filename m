Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 16 Jan 2017 17:43:00 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
Message-ID: <20170116164300.j2zvjkxr7c5h5hyo@lukather>
References: <20161125002852.18097-1-megous@megous.com>
 <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
 <20170109095946.6esbfx6pafega5cd@lukather>
 <557330d0-2dcd-2211-8538-51c4d6b68834@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tdpugw3be2dhaolc"
In-Reply-To: <557330d0-2dcd-2211-8538-51c4d6b68834@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--tdpugw3be2dhaolc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ondrej,

Sorry for the late reply,

On Mon, Jan 09, 2017 at 03:50:42PM +0100, Ond=C5=99ej Jirman wrote:
> Dne 9.1.2017 v 10:59 Maxime Ripard napsal(a):
> > On Sat, Jan 07, 2017 at 04:49:18PM +0100, Ond=C5=99ej Jirman wrote:
> >> Maxime,
> >>
> >> Dne 25.11.2016 v 01:28 megous@megous.com napsal(a):
> >>> From: Ondrej Jirman <megous@megous.com>
> >>>
> >>> When adjusting PLL_CPUX on H3, the PLL is temporarily driven
> >>> too high, and the system becomes unstable (oopses or hangs).
> >>>
> >>> Add a notifier to avoid this situation by temporarily switching
> >>> to a known stable 24 MHz oscillator.
> >>
> >> I have done more thorough testing on H3 and this approach with switchi=
ng
> >> to 24MHz oscillator does not work. Motivation being that my Orange Pi
> >> One still gets lockups even with this patch under certain circumstance=
s.
> >>
> >> So I have created a small test program for CPUS (additional OpenRISC C=
PU
> >> on the SoC) which randomly changes PLL_CPUX settings while main CPU is
> >> running a loop that sends messages to CPUS via msgbox.
> >>
> >> Assumption being that while CPUS is successfully receiving messages via
> >> msgbox, the main CPU didn't lock up, yet.
> >>
> >> With this I am able to quickly and thoroughly test various PLL_CPUX
> >> change and factor selection algorithms.
> >>
> >> Results are that bypassing CPUX clock by switching to 24 MHz oscillator
> >> does not work at all. Main CPU locks up in about 1 second into the tes=
t.
> >> Don't ask me why.
> >=20
> > You mean that you are changing the frequency behind Linux' back? That
> > won't work. There's more to cpufreq than just changing the frequency,
> > but also adusting the number of loops per jiffy for the new frequency
> > for example. I don't really expect that setup to work even on a
> > perfectly stable system. CPUFreq *has* to be involved, otherwise, that
> > alone might introduce bugs, and you cannot draw any conclusions
> > anymore.
>=20
> No, this has nothing to do with linux. I'm not running linux for this
> test. I'm running a small program on CPUS (Open RISC CPU) on the SoC
> loaded using FEL from USB.
>=20
> The main cpu is just pushing messages into msgbox in a loop, so that
> CPUS can determine that the main CPU is still running ok and give
> feedback to me over UART. Not even DRAM is involved. The programs are
> running from SRAM.
>=20
> This is the most direct test of PLL change stability that can be done on
> this SoC regardless of the OS. Not even CPU voltage switching is
> involved. I just set the maximum voltage and fiddle with CPU_PLL
> frequencies randomly, while waiting for the main CPU to lock up.

Ok.

> It does lock up quickly with mainline ccu_nkmp_find_best algorithm
> for finding factors.
>=20
> Even with linux kernel, it breaks. It's just more difficult to hit the
> right conditions. I got oops only right after boot when running cpuburn
> to trigger thermal_zone issued OPP change, if I first run some cpupower
> commands. That's why I wrote this program to stress test various CPU_PLL
> change/factor selection algorithms independently of everything else, to
> get more predictable and quicker testing results.

Understood. Do you have the code available somewhere?

> >> What works is selecting NKMP factors so that M is always 1 and P is
> >> anything other than /1 only for frequencies under 288MHz. As mandated =
by
> >> the H3 datasheet. Mainline ccu_nkmp_find_best doesn't respect these
> >> conditions. With that I can change CPUX frequencies randomly 20x a
> >> second so far indefinitely without the main CPU ever locking up.
> >>
> >> Please drop or revert this patch. It is not a correct approach to the
> >> problem. I'd suggest dropping the entire clock notifier mechanism, too,
> >> unless it can be proven to work reliably.
> >=20
> > It has been proven to work reliably on a number of other SoCs.
>=20
> Unless it was stress tested like this with randomy changed settings, I
> doubt you can call it reliable. It may just be very hard to hit the
> issue on linux with particular OPP/thermal zone configuration. That's
> because the issue is dependent on before and after NKMP values. People
> may have just been lucky so far.

Yes, or maybe we just have OPPs that just don't trigger a low enough P
factor.

There's no rush anyway, the H3 cpufreq support is not enabled at the
moment, so that code basically does nothing for the moment.

What's your current plan to fix that? I guess the easiest (and most
likely to be reusable) would be to allow for clock tables, instead of
using the generic approach. We might have some other clocks (like
audio or video) that would need such a precise tuning in the future
too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tdpugw3be2dhaolc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfPgQAAoJEBx+YmzsjxAgI8YP/1QhtsaTZqtfK+U+edUrG6xm
k1dk28jz1Fr9j3W5Px3Ddrf4TazUstl/+vUgs1eXMmW72zjr2k7sNa1FhKhdaQFW
f1P7vjKqyBn6YNoYpsZwKGq0QyXT32MyeRL4VN8wnPD3lbYLhkdbdj3uxBLmr0cB
hORYd3ut0Wge/H/1y/Zg5nZfYuVkoJVv0nr3UBy347UrTNkdNAcJM6q9gLkW5FyE
tv1myODsDiq+Pqw4yQjGAp0uG1reZeaWTXwlNyiKubiwIrvwMWn6uoXWBAI7FpvI
QBl0LGm6BZj4XNpQVANU1f9XbV+VNHb2Kc8WPen8J/XEjsUcNSEsd+sFTDchuP1u
YlHpBpDCtKPBlJ6jtNXMgYKBZnpqUEPx1B3+w/Ye/wdXR2iepcVaDQLouA4EqYqw
gD8Dam+OduKC1dmxZ4Eb7yTSF29H9DxRvzlqEh9naye1xHnpRzRvUwthIG3Phi5d
iAZnOpz3yd9XFEcuYit2g7o5mAOSUkJO2fWAC3abZThKrt5ad0OCpztZC9ggAe90
LIFiPQNwgr2OXO5VewhT2avL37YCKuAulBF2tCpFLiVkZpO2NcT2SGur4fxzbvAP
7iiLQEGkUEYiGkZl7r5DWqvnEjHy+Ac56UNIvad7wpY9a1YNff2uH8AAfjlhyxid
QGBDIIjrwfc81XjG6iLS
=AfOR
-----END PGP SIGNATURE-----

--tdpugw3be2dhaolc--
