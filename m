Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 18 Jan 2017 17:56:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
Message-ID: <20170118165612.zkjaj36kedg64rjw@lukather>
References: <20161125002852.18097-1-megous@megous.com>
 <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
 <20170109095946.6esbfx6pafega5cd@lukather>
 <557330d0-2dcd-2211-8538-51c4d6b68834@megous.com>
 <20170116164300.j2zvjkxr7c5h5hyo@lukather>
 <f1ccd8ce-df6c-8204-71ab-2f774ac269d5@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pvlc5rruhahqbl7f"
In-Reply-To: <f1ccd8ce-df6c-8204-71ab-2f774ac269d5@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--pvlc5rruhahqbl7f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 16, 2017 at 05:51:30PM +0100, Ond=C5=99ej Jirman wrote:
> Hi Maxime,
>=20
> Dne 16.1.2017 v 17:43 Maxime Ripard napsal(a):
> >> It does lock up quickly with mainline ccu_nkmp_find_best algorithm
> >> for finding factors.
> >>
> >> Even with linux kernel, it breaks. It's just more difficult to hit the
> >> right conditions. I got oops only right after boot when running cpuburn
> >> to trigger thermal_zone issued OPP change, if I first run some cpupower
> >> commands. That's why I wrote this program to stress test various CPU_P=
LL
> >> change/factor selection algorithms independently of everything else, to
> >> get more predictable and quicker testing results.
> >=20
> > Understood. Do you have the code available somewhere?
>=20
> It's a bit messy, but it's here:
>=20
> https://github.com/megous/h3-firmware/blob/master/main.c

Awesome, thanks!

> >>>> What works is selecting NKMP factors so that M is always 1 and P is
> >>>> anything other than /1 only for frequencies under 288MHz. As mandate=
d by
> >>>> the H3 datasheet. Mainline ccu_nkmp_find_best doesn't respect these
> >>>> conditions. With that I can change CPUX frequencies randomly 20x a
> >>>> second so far indefinitely without the main CPU ever locking up.
> >>>>
> >>>> Please drop or revert this patch. It is not a correct approach to the
> >>>> problem. I'd suggest dropping the entire clock notifier mechanism, t=
oo,
> >>>> unless it can be proven to work reliably.
> >>>
> >>> It has been proven to work reliably on a number of other SoCs.
> >>
> >> Unless it was stress tested like this with randomy changed settings, I
> >> doubt you can call it reliable. It may just be very hard to hit the
> >> issue on linux with particular OPP/thermal zone configuration. That's
> >> because the issue is dependent on before and after NKMP values. People
> >> may have just been lucky so far.
> >=20
> > Yes, or maybe we just have OPPs that just don't trigger a low enough P
> > factor.
> >=20
> > There's no rush anyway, the H3 cpufreq support is not enabled at the
> > moment, so that code basically does nothing for the moment.
> >=20
> > What's your current plan to fix that? I guess the easiest (and most
> > likely to be reusable) would be to allow for clock tables, instead of
> > using the generic approach. We might have some other clocks (like
> > audio or video) that would need such a precise tuning in the future
> > too.
>=20
> My proposed solution is this for M factor (H3 specific solution):
>=20
> https://github.com/megous/linux/commit/88be3d421e958579026135d8acec4b3983=
958738

This one is fine.

> and this for P factor:
>=20
> https://github.com/megous/linux/commit/d7f274ed0c13fa9b4099445cb6bf9b2f8f=
2cfa8a
>=20
> Perhaps it should be configurable if the P limitation is not universal
> for all NKMP clocks. But I haven't read all the datasheets.

And this is exactly what I wanted to avoid, for the reason you're
giving :)

This is some generic code, and yet you're putting a clock and SoC
specific limit in there. You have two ways to deal with that. Either
come up with some generic throttling mecanism to force a particular
value above or below a given threshold, but that might be tedious to
do, and require some significant rework.

Or you can use a table, which is generic and should be relatively
easy. I really think this is the most straightforward solution, and
even more so since we just want to support a limited number of
frequencies in this case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pvlc5rruhahqbl7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYf54jAAoJEBx+YmzsjxAgmXcP/229OI51g7Vc/JKMoHTZwRJY
iZah+QNOQ/Nl/AggGKELW3ZRX5FegWskYUAUNlJOh2yfQJlTbkuDZl0+yNEBXWAp
NMUMsiFMfj9icn6e72yvY1DqKFYIZY/+Q1/N4ipQCoi+wqrgxu2JkM3twDsi96JZ
3rrOsKdbP54YgKnTUO6SVKo+EiY1nnM1dyvKEYzQd79D9OwL1ECdCBY1UjVMRWIl
wmDpzOldWgQxjk7If7F+XiJGN1G9BKBW1koe9Yh4ZFc0+9p75chHxzkEekt2eZzp
dNjNBBKRl1fNeUh4DM7rId1Kl84Xrvznu1FXFvBJp5cTvPlTcn/xzs/Y9MNLSp4G
wFC5dy3r3YFQuGsnoOs7ND7BZNmcs7wJiCKqxJETdPLPjd6tvZcB+TqBsGswG4jJ
1iCvDyc3g9ZN//VVbtLbhHce4CNlQ+8fAnjFeuvmoVcEJ2wip07HD/wHr5b5s63P
YbgzNcDieeGYj6O9ScsETv9Ngh1hGcCvaHQmTRVfR7bpgP0GkD+5EUeEZERJ3gAd
388xfj8ToBVGj6xYK+yxbeUkfTwRmP+w18i4/IoLbKoWfe8Noe4ARTYejC8d2PhU
BlFX1cyeBtIODz9mx28FkWbTddNjShnmqteSRKlbXxo53EN5+VDQd07xzBUuBusy
ywJPcau/+AeocWXWLMTy
=BoLt
-----END PGP SIGNATURE-----

--pvlc5rruhahqbl7f--
