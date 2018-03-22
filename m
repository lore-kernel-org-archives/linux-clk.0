Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its rate
In-Reply-To: <20180322101334.6705ab22@bbrezillon>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-4-boris.brezillon@bootlin.com> <87mv0j5wzz.fsf@anholt.net> <20180208185619.667a4daf@bbrezillon> <87vaf6v77r.fsf@anholt.net> <20180212102752.21e22328@bbrezillon> <152088968272.205167.14856461616755294568@swboyd.mtv.corp.google.com> <20180322101334.6705ab22@bbrezillon>
Date: Thu, 22 Mar 2018 09:38:43 -0700
Message-ID: <87woy4ukto.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> Hi Stephen,
>
> On Mon, 12 Mar 2018 14:21:22 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>
>> Quoting Boris Brezillon (2018-02-12 01:27:52)
>> > -Stephen Warren
>> > +Stefan Wahren
>> >=20
>> > On Fri, 09 Feb 2018 09:32:40 +0000
>> > Eric Anholt <eric@anholt.net> wrote:
>> >=20=20=20
>> > > Boris Brezillon <boris.brezillon@bootlin.com> writes:
>> > >=20=20=20
>> > > > On Thu, 08 Feb 2018 15:20:16 +0000
>> > > > Eric Anholt <eric@anholt.net> wrote:
>> > > >=20=20=20=20
>> > > >> Boris Brezillon <boris.brezillon@bootlin.com> writes:
>> > > >>=20=20=20=20=20
>> > > >> > All bcm2835 PLLs should be gated before their rate can be chang=
ed.
>> > > >> > Setting CLK_SET_RATE_GATE will let the core enforce that, but t=
his is
>> > > >> > not enough to make the code work in all situations. Indeed, the
>> > > >> > CLK_SET_RATE_GATE flag prevents a user from changing the rate w=
hile
>> > > >> > the clock is enabled, but this check only guarantees there's no=
 Linux
>> > > >> > users. In our case, the clock might have been enabled by the
>> > > >> > bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linu=
x never
>> > > >> > disables the PLL. So we have to make sure the PLL is actually d=
isabled
>> > > >> > before changing the rate.
>> > > >> >
>> > > >> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming=
 the audio domain clocks")
>> > > >> > Cc: <stable@vger.kernel.org>
>> > > >> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> > > >> > ---
>> > > >> >  drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
>> > > >> >  1 file changed, 13 insertions(+), 1 deletion(-)
>> > > >> >
>> > > >> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/cl=
k-bcm2835.c
>> > > >> > index 6c5d4a8e426c..051ce769c109 100644
>> > > >> > --- a/drivers/clk/bcm/clk-bcm2835.c
>> > > >> > +++ b/drivers/clk/bcm/clk-bcm2835.c
>> > > >> > @@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk=
_hw *hw,
>> > > >> >          u32 ana[4];
>> > > >> >          int i;
>> > > >> >=20=20
>> > > >> > +        /*
>> > > >> > +         * Normally, the CLK_SET_RATE_GATE flag prevents a use=
r from changing
>> > > >> > +         * the rate while the clock is enabled, but this check=
 only makes sure
>> > > >> > +         * there's no Linux users.
>> > > >> > +         * In our case, the clock might have been enabled by t=
he bootloader/FW,
>> > > >> > +         * and, since CLK_IGNORE_UNUSED flag is set, Linux nev=
er disables it.
>> > > >> > +         * So we have to make sure the clk is actually disable=
d before changing
>> > > >> > +         * the rate.
>> > > >> > +         */
>> > > >> > +        if (bcm2835_pll_is_on(hw))
>> > > >> > +                bcm2835_pll_off(hw);
>> > > >> > +=20=20=20=20=20=20
>> > > >>=20
>> > > >> I'm not sure this improves the situation.  If the PLL was on, then
>> > > >> presumably there's a divider using it and a CM clock using that, =
so
>> > > >> we'll probably end up driving some glitches on them.=20=20=20=20
>> > > >
>> > > > Hm, yes, but if someone is trying to change the rate of the PLL, a=
nd the
>> > > > core doesn't know other clks depend on this PLL (which is the case=
 if
>> > > > we reach this point), we're already in big trouble.
>> > > >=20=20=20=20
>> > > >>=20
>> > > >> Does the common clk framework have a way to disable unused clocks=
 from
>> > > >> the leaf clocks up to this root, before the general
>> > > >> disable-unused-clocks path happens late in the boot process?=20=
=20=20=20
>> > > >
>> > > > Not that I know of. What do you have in mind?=20=20=20=20=20
>> > >=20
>> > > I was hoping that Stephen Boyd or Mike might have an answer for this
>> > > problem.=20=20
>> >=20
>> > Having a generic solution for this sort of issue is definitely the
>> > way to go, but I think this temporary hack is needed to make HDMI/SDTV
>> > work properly. If we don't have it and the FW configures and enables
>> > PLLH with a rate that is different from the one the HDMI or SDTV
>> > encoder tries to set, we're screwed, because I doubt the CPRMAN block
>> > allows you to change the rate of the PLL when it's not gated. Which
>> > means the new rate is not applied and the clk user has no way of
>> > knowing that, which in turn means the display output is likely to not
>> > work properly the first time it's enabled.
>> >=20
>> > Of course, this all goes away the second time the HDMI/SDTV encoder is
>> > enabled, because then clk_disable_unprepare() is called which has the
>> > effect of disabling the PLL.
>> >=20=20=20
>>=20
>> There isn't any sort of API to disable unused clks from a leaf up to a
>> particular point in the tree. Actually, the disabling of unused clks
>> during late init makes the framework harder to maintain so expanding on
>> it is not high on the list of things to do.
>>=20
>> What exactly is going on here? It sounds like the framework isn't aware
>> of the 'on/off' boot state of certain clks (a known problem) and that's
>> causing some sort of problem when changing rates? This usually happens
>> with PLLs that are enabled at boot time and can't support their rate
>> changing when they're enabled. We really should start reading on/off
>> state and "hand off" that enabled state to something in the framework so
>> we at least know if a clk is enabled or not out of boot.

> everyone. You may have setups where some clks initialized/enabled by
> the FW/bootloader may rely on the PLL and its pre-configured rate and
> you don't want another clk user from messing up with the PLL.

FWIW, we are effectively doing this with how the PLLH dividers have
CLK_SET_RATE_PARENT set but, for example, PLLD_DSI* don't -- we don't
want the DSI clock to end up tweaking the clocks of all the devices
hanging off of PLLD.  The hardware is no different, we've just baked
this policy into the code.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqz3BMACgkQtdYpNtH8
nujcqg/+NqztOdfQ8tOvFH/eMKqlu2VDnYk52d4Ja5LfkBIdMwLt1CRLsKIzYMZ6
MZJImkJBHzkdUbZW/vuGrzhBu+VSO7UVGbYVt0sjK/OTWipWWtdwR8yB2vPat5Hc
fpBpVDG4ylVGieqfd1a5xYTqnKiVkW4kz2Z0jI0nQVcTEFL6XSCy4k/yvIJY7fS7
wSKaEZf/Ozc+MqJ5wZhAwJGBI4Bq0KrZ60nl7Icf0fsMU3DXiD+nf2aDJ2P7kz3z
ssb7GQpjd/ydSU+e+YBfo+J2VPx0QfXrmSptABceu1O++dnrWyF5PgtYxZ/AAoR5
Z6O2J21FFuV40P5Z+FxwMdoBNwz8IvmYJyMD/QBSsuO5x+U1FguXjdBR2e4Ao0JX
lzweQmyjDuoJ0aua6XZ3iWI0DN5L0TKTg0BaYvXDFp/wNEDJFu2wrbghZ6jqjRUv
pxFoAqxEAxEHYQYgLeHqCCQvKUeNvBYkjlZen0tixZfoOZPnA/jTcLhq0qyYuHut
xrrvgRMsOeYskgBkn7zF5wuyFwsk9YSCzPAfa2Z9GJlQPf7XQmk991BnyrfKsH76
xsehkV9e7xXc3A2G5mDWxyUz4KKZb65BQWQKrfd8T00bjuZlCT1Kee2/g63G3Y5i
/NfcMT9w7PARBhiGlST6HXyzoaHmjePkiUwmFBhNjvxnh7vrzn0=
=xpkH
-----END PGP SIGNATURE-----
--=-=-=--
