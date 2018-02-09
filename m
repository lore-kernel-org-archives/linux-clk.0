Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its rate
In-Reply-To: <20180208185619.667a4daf@bbrezillon>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-4-boris.brezillon@bootlin.com> <87mv0j5wzz.fsf@anholt.net> <20180208185619.667a4daf@bbrezillon>
Date: Fri, 09 Feb 2018 09:32:40 +0000
Message-ID: <87vaf6v77r.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> On Thu, 08 Feb 2018 15:20:16 +0000
> Eric Anholt <eric@anholt.net> wrote:
>
>> Boris Brezillon <boris.brezillon@bootlin.com> writes:
>>=20
>> > All bcm2835 PLLs should be gated before their rate can be changed.
>> > Setting CLK_SET_RATE_GATE will let the core enforce that, but this is
>> > not enough to make the code work in all situations. Indeed, the
>> > CLK_SET_RATE_GATE flag prevents a user from changing the rate while
>> > the clock is enabled, but this check only guarantees there's no Linux
>> > users. In our case, the clock might have been enabled by the
>> > bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linux never
>> > disables the PLL. So we have to make sure the PLL is actually disabled
>> > before changing the rate.
>> >
>> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the au=
dio domain clocks")
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> > ---
>> >  drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
>> >  1 file changed, 13 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm28=
35.c
>> > index 6c5d4a8e426c..051ce769c109 100644
>> > --- a/drivers/clk/bcm/clk-bcm2835.c
>> > +++ b/drivers/clk/bcm/clk-bcm2835.c
>> > @@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk_hw *hw,
>> >  	u32 ana[4];
>> >  	int i;
>> >=20=20
>> > +	/*
>> > +	 * Normally, the CLK_SET_RATE_GATE flag prevents a user from changing
>> > +	 * the rate while the clock is enabled, but this check only makes su=
re
>> > +	 * there's no Linux users.
>> > +	 * In our case, the clock might have been enabled by the bootloader/=
FW,
>> > +	 * and, since CLK_IGNORE_UNUSED flag is set, Linux never disables it.
>> > +	 * So we have to make sure the clk is actually disabled before chang=
ing
>> > +	 * the rate.
>> > +	 */
>> > +	if (bcm2835_pll_is_on(hw))
>> > +		bcm2835_pll_off(hw);
>> > +=20=20
>>=20
>> I'm not sure this improves the situation.  If the PLL was on, then
>> presumably there's a divider using it and a CM clock using that, so
>> we'll probably end up driving some glitches on them.
>
> Hm, yes, but if someone is trying to change the rate of the PLL, and the
> core doesn't know other clks depend on this PLL (which is the case if
> we reach this point), we're already in big trouble.
>
>>=20
>> Does the common clk framework have a way to disable unused clocks from
>> the leaf clocks up to this root, before the general
>> disable-unused-clocks path happens late in the boot process?
>
> Not that I know of. What do you have in mind?=20

I was hoping that Stephen Boyd or Mike might have an answer for this
problem.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp9argACgkQtdYpNtH8
nugogQ//SSkqKPehDEo05anOPzReww5XjTNWYZpT6DVinAVUjQvpYtjn4nnR9hO8
kjhiD2HKpHNKFyBOhewmlSGkwSQB5JaNDpKpTYg2PrhQS2IshV0Kg+uOgIw2BJbF
HmUnNa4ZReFH6M0VMmc0CgefSyTd+HxIg5uk/LJ6Zc8zkeTNwiM2a/Hq2jLHmO9J
4vwstvJ5JFcV37pXSo8NUN6eS1WDGEJmDKPzZG1G0JfwCSvl80WXDhr4IJlo/Lkg
IWmP5wVFjYNtfjoCkT0+kU9VWD4OMhgNl44jgSMH9OO7TNJOZTyEHsKMrufmFlpz
SLALWp/5JOBcUx7dNo3+pkd6tJKzvPSc6lLi52wFn+U2/sy6N8ogs0rw1SjEF6OD
ZbrFiqRxplDSa4tCNcwgywCZeGGGwHOVT1fLrZQWA3FaWgpOMK2mdCT5ECKgEnlu
J8equYZviVdeu8Iv4AVBzL9nw+c7ui5UncciB7mUkLWZxJv+S8a5ZjVEqYcHejVs
5XQkIlMZm4+kcP8wSXZfAJcj9/SLyzLX4aq/U4q4OVcpPbnjpRkmP6/GVkN41Jks
6YoznpaOqcqEwDr7GaUi3WwfSRKtesVV4Wy9OZWQ9y+ZBPBwD8bPY3W2Il0KN7eg
fEDEHm1eioBlnqhfCwTmoWlUBQuWiX39/RZEniklBBb0uFApiMA=
=1kxr
-----END PGP SIGNATURE-----
--=-=-=--
