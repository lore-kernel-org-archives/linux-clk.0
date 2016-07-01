Return-Path: <megous@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
Date: Fri, 1 Jul 2016 02:50:57 +0200
MIME-Version: 1.0
In-Reply-To: <20160630204001.GC5485@lukather>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LoBQnUu9tEIxHSRSEDRqc30GuOUILAquA"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LoBQnUu9tEIxHSRSEDRqc30GuOUILAquA
Content-Type: multipart/mixed; boundary="HGm854pNb22xKpigWsQ8VmBJm23Fn17HX"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
In-Reply-To: <20160630204001.GC5485@lukather>

--HGm854pNb22xKpigWsQ8VmBJm23Fn17HX
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 30.6.2016 22:40, Maxime Ripard wrote:
> Hi,
>=20
> On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous@megous.com wrote:
>> From: Ondrej Jirman <megous@megous.com>
>>
>> PLL1 on H3 requires special factors application algorithm,
>> when the rate is changed. This algorithm was extracted
>> from the arisc code that handles frequency scaling
>> in the BSP kernel.
>>
>> This commit adds optional apply function to
>> struct factors_data, that can implement non-trivial
>> factors application method, when necessary.
>>
>> Also struct clk_factors_config is extended with position
>> of the PLL lock flag.
>=20
> Have you tested the current implementation, and found that it was not
> working, or did you duplicate the arisc code directly?

I have tested the current implementation, and it was not working. It
depended on some other factors, like the initial setup done by u-boot.
It didn't work reliably.

Then I reverse engineered arisc, in an effort to see what's the
difference, between mainline and BSP code.

>>  /**
>> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
>> + * register using an algorithm that tries to reserve the PLL lock
>> + */
>> +
>> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, =
struct factors_request *req)
>> +{
>> +	const struct clk_factors_config *config =3D factors->config;
>> +	u32 reg;
>> +
>> +	/* Fetch the register value */
>> +	reg =3D readl(factors->reg);
>> +
>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>=20
> So there was some doubts about the fact that P was being used, or at
> least that it was useful.

p is necessary to reduce frequencies below 288 MHz according to the
datasheet.

>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>> +
>> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
>> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
>> +
>> +	writel(reg, factors->reg);
>> +	__delay(20);
>> +
>> +	while (!(readl(factors->reg) & (1 << config->lock)));
>=20
> So, they are applying the dividers first, and then applying the
> multipliers, and then wait for the PLL to stabilize.

Not exactly, first we are increasing dividers if the new dividers are
higher that that what's already set. This ensures that because
application of dividers is immediate by the design of the PLL, the
application of multipliers isn't. So the VCO would still run at the same
frequency for a while gradually rising to a new value for example,
while the dividers would be reduced immediately. Leading to crash.

PLL
--------------------------
PRE DIV(f0) -> VCO(f1) -> POST DIV(f2)
   P             K,N           M

Example: (we set all factors at once, reducing dividers and multipliers
at the same time at 0ms - this should lead to no change in the output
frequency, but...)

-1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
 0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 2GHz       - boom
 1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 1.5GHz
 2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz

The current code crashes exactly at boom, you don't get any more
instructions to execute.

See.

So this patch first increases dividers (only if necessary), changes
multipliers and waits for change to happen (takes around 2000 cycles),
and then decreases dividers (only if necessary).

So we get:

-1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
 0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz   - no boom, multiplier
                                             reduced
 1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 0.75GHz
1.9ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 0.5GHz - we got PLL sync
 2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz   - and here we reduce div=
ider
at last

>> +
>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>> +
>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>=20
> However, this is kind of weird, why would you need to re-apply the
> dividers? Nothing really changes. Have you tried without that part?

See above, we either increase before PLL change, or reduce dividers
after the change. Nothing is re-applied.

> Since this is really specific, I guess you could simply make the
> clk_ops for the nkmp clocks public, and just re-implement set_rate
> using that logic.

I would argue that this may be necessary for other PLL clocks too, if
you can get out of bounds output frequency, by changing the dividers too
early or too late. So perhaps this code should be generalized for other
PLL clocks too, instead.

>=20
> You might also need to set an upper limit on P, since the last value
> (4) is not a valid one.

I think, that should be done by the factors calculation function already.=


> I guess you could do that by adding a max field in the __ccu_div
> structure.
>=20
> Maxime
>=20

regards,
  Ondrej


--HGm854pNb22xKpigWsQ8VmBJm23Fn17HX--

--LoBQnUu9tEIxHSRSEDRqc30GuOUILAquA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdb51AAoJEG5kJsZ3z+/xIXAP/j3ZbMnP2Y5AxNDuC9Y4BHyS
Vx52WNnXVQOm88HfVv2+NCWt7Hf4H/C78uWqrjG25kG/H5KeD+nmwQ0VI2eIdLbl
9GodHst+GnLM7ZLs9yWurgs/0AZ0td2TKIDRSWKw9b9vRNyNSG9Eg0Rm0/x3RZSF
GEssol7ufkZ1KMP/Uaw5SUAPrwedv4HuStiHuKNihFsx1fU42bBqnu6LlvNmreDC
HDf4CStmnlUCmoNw0XiaV9MaNhrWhaBsGkirwACQarh62QZuarULBCymSlzNtgJY
M97cPCAKSmhpH6fgZ+X/k55yNKvA9TX8FBcbdgO2uTVvWEzkvNUPOwfQIN3O9zEZ
O0AiBouIZZR3sf6LYsmmSHol/O10VLl/sNfDlx901rT+KQFyZ6eiREZ2y7tYLZlt
1IhU4UDwZx6izN4eYs3vABlhtdRG1Zo3YMJx7/H7L5gulXa+G/8VHUN5r2azZw7k
nCG9jOn6Z8ctZioAwkggOFioW6gLIgKSZgFJUeHTwwgv02+IrgZb6stsrWt0dlgT
qzKDNuvPh/fWQ8kGrryQV++1pFMJr6Tsh3yvOGmJRACYtzReRX5m6AXfS/8Cwztg
haQgff68VzgzgT0yrRZr0aWcx2yDUfo+haKAvZl+nxfWbtLxQvbue/4BqoRO/nLX
KN2tcQiPC04ZZMx7hhBr
=MRXO
-----END PGP SIGNATURE-----

--LoBQnUu9tEIxHSRSEDRqc30GuOUILAquA--
