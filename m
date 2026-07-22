Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C435B650
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727782; cv=pass; b=l4T3GEHdnc7o6l73470NE8ULsAe/P3teXZyng+PMjxGxfp3spFE5UE/pyDKVi+JTAfxnS+s+dwuiw8d7+vxiRPWIZlRmDp66OMS62tgO+KDdMUp/SGSZ/JrFNbISQCXbLivBwMSo20h6KM6XzBxvx8WSTnozXt1D102GhPtDcgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727782; c=relaxed/simple;
	bh=iKn7Ypvlwlp/hjia+e8vqgOC5ulYbG461fSNChP8iE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qu5hX2qnizvanZCy7aub9pykKyZaNNZvV3jntzOn9Y08UN/exTy+J248VHtD6eijIy0/YdkWJvhtLBP1LyCKTiy/49Ir/MkK+I4BFBMhl+i2sA6SOXkJALtsb9bDJVxNYh8SIHiuIpe/m1jxl4H8evtjvfR3StehwDV6RILNtjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ek9GKQz0; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ek9GKQz0"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1670dad7a8so1425065866b.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784727778; cv=none;
        d=google.com; s=arc-20260327;
        b=W3OEVgBKvz/jmMU3hYonu6xlN0UsMWhOqrlqv2SJndkWMOpFB0zcZY695cSsvXFq7Q
         33BYYOzdF8B+O3xtDnUVMuL4oT8zb7ZP5bQ+MuqF/sEKRS6KeDPe3DRE90aVciC7oFK8
         Lai3bj/VJ/SmkVOlzuLuCpjHJWR8tYOhDYi42pai4ADuken2cYPuDCDbIoWxCo1jYx47
         tGA4mHE5X/wNXnG98OZbvSdouNhOEw8jsNa0zXjXAm80am/rg2bAAbrd10HwUyC5eGJH
         92xcHh0EWIwSKshor4by7zP7LhfHPSN6yWubbXdNpyq+XTCKWXRYDhGk4KynDh3ZF7hY
         z7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        fh=6N+ekJXWLYTqL+/n1jppo482k+0Ofp3Le9JmRHitDwI=;
        b=GWgzmGbx5otCyrR+tNES6tjLYyKCKuW42inPzdRSpT+FxnX8jV0YgLRDKq+oGFZ0UV
         juuikhufZeo6NJ3uWH9yVvEkoPJvGmy6/X1kHtC1MvRDklg9fohM/qg7Wo8anDQiwDDg
         +VinB6ws+LPZ7pNshl6JsOLXN7J8lQ1sMRbaAfw+cjV1pfla9Jsp4uqXuP9pzA+tIZm8
         tGReG2A0uTcYZLv7vLk/kmmn8Rm8oi9aoi48xfNOeX0EX1qU3+j99GqpeBQ1yHxrlmef
         Msv1zXjQdsHv7q+r/wh1La/kUHOx+dD649PZOlVMJ63LSXXsAKI7FqUGJ/SwOZPCbLGt
         s6mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784727778; x=1785332578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        b=ek9GKQz0wQDk9g1TdhU1+S0ilwG9/8QQG5o5lauWUsYIYPaOaiDPi0SIqY4EJeHCe4
         E0ARiUkOR0C0KmltGFdamGh29/OpiPYqQpo8/Ih5Su8olUUKfwUCOerorRMD816BkcbI
         rAHoxhpwnM9+3kUfPZChIiTkjwUvhzB5N3g5CxJlp8aik+nKg5U9DPcFljknIPRXVFjp
         9a+eZOvfsfX9N7MuIeCV5gPIph2HSJHuuLzZEhH47tnaP646GTbhu8Q71+HGNE/ALpZ+
         /uOqNmKwLN1OCWR4VnasOyu/BU48nwkdhMSGJG9h63VhbFgipgDHq1+3IizrlUjXqlCl
         6nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727778; x=1785332578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        b=bZsHQpq/95oxZgm9+xG7AsLAzMKbeNz9X6mM1ycc5r4tr2SukrFO6QFdZDl8gVKsGz
         EPqk8fLWkGcy3k2/7qYuoSDvNZbYqOeVQgSEPMX4abfPawCwMBxC+JHihVBkeVrv6Yx8
         EDOD8RturCkUnZf6ohCLq95SK7bUfXSYXRohDBsaJXqcTtxdtYXM3CzJgNEnSXta2GGx
         6+YlwmdeE5lUavGHVXNj4r3X0ndFWOk9/uegt98WgoPdQeicuJHSlOjw4YUgifi7y9Dw
         mLpOMkLLLHRZGqFqliDknhmwhrfBj52Bnjca45tN7jQSbDHqFJAnZ8jIsm1u54Ft7HYM
         h9oA==
X-Forwarded-Encrypted: i=1; AHgh+Rqsj1taXT3Odq0zN6MVMadrTfpYsn0Qix/B7+QCvroCCQaW08YfH6P7PsEYLsu9MPQgZwlX3uRmWRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiP7SPMulEIL+rOmaHPdCjINhgU2gfPSt2gKnGaN2K3BkSfD2Y
	cPBCML45D3bK2JW+rXdvCaIlfvU1dKMe/SbWG8MPfvIQjrS5ICrWkwlNhZhryKDA5QxM/RLZgi6
	lWF1lbLtKK1VK8vZ9LLYBwTuou1m6xPfUMjlup4uH8d7X0I9t5dONfD+S2g==
X-Gm-Gg: AR+sD12Xh4ndmpQz8O42xZf7RMl8nH02NmA22DlB9fkR2EXrFl0JePPbvKWTM5To/OV
	Beyp/MK8cB0y0N72BXDs5yVIYZtZwdpMvX5BDzy2HKsAJQfYaXZQkaQLrE4INLZg9+IyZZbc1Qq
	gFIlAq+L0Tz2g80MvCq8Ekajo80FQrZefFB7/zC6gUQTOvUtoPJ9zhexizfX8b+GU+0zE/C/EaJ
	jTERIktQ3exqQpv8c1/J6e+BvT4UdSrCMhbS/gJShJgNCyLi90B0aLtfpO4e7FQV6oLMfnVQy6L
	rY13svL92ma8m1BWCQ==
X-Received: by 2002:a17:907:3cc3:b0:c1c:2aa5:322b with SMTP id
 a640c23a62f3a-c1c2aa53339mr232997666b.2.1784727778174; Wed, 22 Jul 2026
 06:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de> <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
In-Reply-To: <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 17:42:46 +0400
X-Gm-Features: AUfX_myGX12qd4burJ5mB183OFZAM6Miq0O2zuOdAg4Lag83kZHUHWOe4T-69Po
Message-ID: <CAKTNdwGVMMa1KDCiGscEy-H9WmjvmsGyJs4tBs7R4Byp7nim8g@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Wyon Bi <bivvy.bi@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, 
	YouMin Chen <cym@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 4:59=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > Hi Quentin,
> >
> > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 7/21/26 9:17 PM, Alexey Charkov wrote:
> >>> When the PLL rates table was first committed for RK3588 (and later re=
used
> >>> for RK3576), the fractional PLL coefficient was defined as an unsigne=
d
> >>> value, while the TRM clearly states that it is a two's complement 16-=
bit
> >>> value.
> >>>
> >>> Rockchip's downstream kernel later revised the fractional PLL code [1=
] to
> >>> account for the two's complement nature of the coefficient, but that
> >>> change wasn't upstreamed.
> >>>
> >>> Change the PLL table definition to use two's complement for the
> >>> fractional coefficient and update its users accordingly.
> >>>
> >>> Note that a negative fractional coefficient is meant to be subtracted=
 from
> >>> the next larger integer multiplier, so the _m values in the table are
> >>> also adjusted accordingly for the two negative-k entries.
> >>>
> >>> While at it, fix the denominator of the fractional PLL calculation to=
 use
> >>> 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Secti=
on
> >>> 2.13.1.4 Setting Guide on P, M, S, and K):
> >>>
> >>> Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> >>>
> >>> Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc0=
5dcc3a51e85ae531749e6270bf9b9212d [1]
> >>> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3=
588")
> >>> Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3=
576")
> >>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>> ---
> >>> Not adding Cc stable, because while this fixes a real bug it's not a
> >>> regression, as the issue was introduced in the same commit that added=
 the
> >>> RK3576/RK3588 support.
> >>>
> >>
> >> I don't think this is a valid reason :)
> >
> > I believe Linus frowns upon changes like "it never worked, but we've
> > fixed it now" being submitted as fixes. It's been broken for years,
> > and since nobody complained yet, going via the normal development path
> > (i.e. -next) seems perfectly fine to me.
> >
>
> My bet is because of the Fixes: it'll get backported anyway even if you
> don't put Cc: stable. In any case, I don't care too much :)

Maybe... I can try to shout loudly when/if I get the email from Greg's
autopicker bot :)

> >> In any case, this patch is doing too many things at once. I see the
> >> following things that would warrant individual patches:
> >>
> >> 1) fix the wrong denominator, stable candidate IMO,
> >
> > I could split this one out, but since it's a trivial one-liner, I'd
> > like to hear what Heiko prefers.
> >
> >> 2) fix the table (using unsigned int still), to match what Rockchip di=
d
> >> in their downstream fork (maybe check they did maths properly first :)=
 )
> >> stable candidate IMO, except if they are related to 1) in which case
> >> squash with 1),
> >
> > Not related to 1), but directly related to 3). The old table was
> > calculated using a flawed logic as if the k is unsigned and purely
> > additive (and thus k > 32767 stayed at the lower value of m), while in
> > reality the hardware subtracts negative k from m (thus k < 0 should
> > come with m++).
> >
>
> Yeah ok, I missed that we aren't using the signed decimal value in
> rockchip_rk3588_pll_recalc_rate() and thus k > 32767 really is used as a
> positive k, instead of the signed value (thus negative).
>
> > This is confirmed by manual recalculation of effective PLL rates under
> > both approaches:
> > - If k is treated as unsigned and purely additive (valid logic, but
> > doesn't match the hardware) the effective rate lands within 40 Hz of
> > the target for the affected table entries
>
> Valid logic, but the hardware won't actually do that at all and be
> completely off (as it'll subtract for anything above 32767, as the s16
> MSB will be 1).

Yes, exactly. But at least that logic was internally consistent for
the parallel universe in which k would have been truly unsigned and
treated by the hardware as such, and for that universe the existing
PLL table makes sense. Not for our actual universe though.

> > - If k is treated as signed and subtracted from the next higher m
> > (similarly valid logic, matches what the TRM says and also what the
> > updated vendor kernel does) the effective rate lands within 40 Hz of
> > the target for the updated table entries
> > - If the parameters are mixed and matched, there is a 2 MHz delta
> > (five orders of magnitude difference)
> >
> > So I don't believe that splitting the table updates across commits is h=
elpful.
> >
>
> I agree, because it currently is sound logic but result in broken
> hardware. I honestly understood the commit log as "the register is s16,
> so I'll just switch the kernel driver to use that to better match the
> hardware" (i.e., a cosmetic change). Maybe really highlight that the
> current approach resulted in completely wrong clock rates (as k cannot
> be > 32767).

Fair enough, I will highlight it in the commit description. Thanks for
pointing it out!

> >> 3) switch to signed integers wherever applicable, not stable candidate
> >> IMO (but eventually may be backported to facilitate backports of futur=
e
> >> fixes),
> >
> > See above.
> >
>
> Agreed. A reworded commit log would be nice to highlight they are indeed
> related.

Ack

> >>> Note that there is a separate unrelated issue with the rate table, na=
mely
> >>> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MH=
z,
> >>> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> >>> entries in the table end up with Fvco < 3 GHz, which according to the
> >>> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GH=
z.
> >>> To be revisited separately.
> >>> ---
> >>>    drivers/clk/rockchip/clk-pll.c    | 8 ++++----
> >>>    drivers/clk/rockchip/clk-rk3576.c | 4 ++--
> >>>    drivers/clk/rockchip/clk-rk3588.c | 4 ++--
> >>>    drivers/clk/rockchip/clk.h        | 8 ++++----
> >>>    4 files changed, 12 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/cl=
k-pll.c
> >>> index 6b853800cb6b..f445b01aabd0 100644
> >>> --- a/drivers/clk/rockchip/clk-pll.c
> >>> +++ b/drivers/clk/rockchip/clk-pll.c
> >>> @@ -13,6 +13,7 @@
> >>>    #include <linux/delay.h>
> >>>    #include <linux/clk-provider.h>
> >>>    #include <linux/iopoll.h>
> >>> +#include <linux/math64.h>
> >>>    #include <linux/regmap.h>
> >>>    #include <linux/clk.h>
> >>>    #include "clk.h"
> >>> @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc=
_rate(struct clk_hw *hw, unsigned
> >>>
> >>>        if (cur.k) {
> >>>                /* fractional mode */
> >>> -             u64 frac_rate64 =3D prate * cur.k;
> >>> +             s64 frac_rate64 =3D (s64)prate * cur.k;
> >>>
> >>> -             postdiv =3D cur.p * 65535;
> >>> -             do_div(frac_rate64, postdiv);
> >>> -             rate64 +=3D frac_rate64;
> >>> +             postdiv =3D cur.p * 65536;
> >>> +             rate64 +=3D div_s64(frac_rate64, postdiv);
> >>>        }
> >>>        rate64 =3D rate64 >> cur.s;
> >>>
> >>> diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip=
/clk-rk3576.c
> >>> index 2557358e0b9d..63f229e73a45 100644
> >>> --- a/drivers/clk/rockchip/clk-rk3576.c
> >>> +++ b/drivers/clk/rockchip/clk-rk3576.c
> >>> @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_=
rates[] =3D {
> >>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> >>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> >>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> >>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> >>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
> >>
> >> For some reason Rockchip didn't fix this for RK3576 in their vendor
> >> kernel, so it's still using the value from RK3588 from before the comm=
it
> >> you pointed at.
> >
> > Looks like an oversight on their end.
> >
> >>> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip=
/clk-rk3588.c
> >>> index 75d42fea2a11..24baa0ef9bf3 100644
> >>> --- a/drivers/clk/rockchip/clk-rk3588.c
> >>> +++ b/drivers/clk/rockchip/clk-rk3588.c
> >>> @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_=
rates[] =3D {
> >>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> >>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> >>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >>>        RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
> >>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> >>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> >>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >>
> >> Are you sure this is proper? Rockchip changed 51117 to 51119 (so -1441=
9
> >> to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you
> >> linked.
> >
> > This change of theirs is not explained in the commit and is not
> > related to the code changes they are introducing, so I'm reluctant to
> > blindly copy it. I also suspect that reducing the magnitude of the
> > negative k will result in overshooting the requested rate (but haven't
> > checked).
> >
> > -15730 results in a -41.504 Hz delta vs. requested
> > -14419 results in a -32.959 Hz delta vs. requested
> >
> > So yes, this is proper.
> >
>
> Please specify this in the commit log, since you point at Rockchip's
> vendor kernel and don't actually implement two's complement with the
> same values in the table.

Ack

> >>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
> >>
> >> In the commit you provided, they also change this line (though they
> >> don't change k, so unsure why (if) that is related). Wondering if this
> >> isn't related to the denominator fix they also have done in the same c=
ommit?
> >
> > It's unrelated and unexplained, so I decided not to change it until a
> > valid rationale is discovered. Their kernel never used 65535 in the
> > denominator, FWIW.
> >
>
> It actually did use 65535 for some part, c.f. line 1601 (- column in the
> diff):
>
> n =3D div64_u64((uint64_t)ppm * 65535 * fbdiv, 100000);
>
> but that is guarded by CONFIG_ROCKCHIP_CLK_COMPENSATION which isn't
> enabled except for rv1126_defconfig, so I guess we don't care here indeed=
 :)

Yes, well that part is unrelated, so it doesn't count :)

> Looks good to me!

Thank you for looking into it and for your feedback!

Best regards,
Alexey
