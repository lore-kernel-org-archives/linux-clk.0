Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B6339380
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718060; cv=pass; b=Omq9DbKkqK4Bx4fYWIOj/06TASbbxGv2tCjIkfZ+k29iX5i159M1DeQWnGHDSvZheUsCFoTnvOAKMfntdB94Ux0G2iYJTGBMDbmt/sQkvmGurfc3ZyGBCPp7B1t9ESo5SQWEC3vaJmMhOSXEOYXgTEBq+7krVb9FQAECqjkl8eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718060; c=relaxed/simple;
	bh=EJqTgDZi26XYpD5YsxQMbZ0ssidrF9c7Qwt+X2BlPMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz/WrNjFG8rftS8Bok/rZXkaTgZnAdtI7SYbOTQkU1QgYAygpAv+7jDh7MSFoRW8nLZ63S0l+m2cKSJ/BdBxuJc0/TYWI4nLaUDgqGPFrH2Y1BmhVprp039/UXGfo2kta19Osr/Nj8uZjG2OHagSPHm4wBcoF/DmCfplKG/KknY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Y4Hh2CHc; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Y4Hh2CHc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15f360851aso1380134566b.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 04:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784718056; cv=none;
        d=google.com; s=arc-20260327;
        b=eSi4IJ1vQJhAAqRtQpixDsznsG/1mkKe6e5Dq7lzwbhYGBk6HNCK4JrU/DHBWlFtrP
         COF9RPn5J00WCome9wIYOj8/txA0cyQqECsLgf046zZg1a5sGH+emyK08f5/mUoq7obC
         1JOg9o/t1gxZm6xMoMPEcPTT8Or+mQr2ZmTurZQmhuxRFvOcHRW721eVUBpiUxn04nmj
         elRRJOeTV7KFvR3Luk6hq2PZTqiYbVWmnFz9AaWKEcEOBlgjvyooIjkeJtAgzPTa3UNu
         R+TSOAj/ThCASu997FgLU9/UBKr15pN0LKv/B88+fym/iiU2xqbmuGEo/l52C7bqA/99
         0FLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        fh=WLyPz36IdLh9+wHC8R4E1FKOYx1azGc/K3J/c/kO/3o=;
        b=iIIJxqx4o5pfGc1OogxrwOFD7eud1sjsRDqdNp5cGc3ht6GwhHjuOxvMvpzbf2T4a/
         U71aM/NF6tS2sAHfXUxJAY+aCb+hIUyX6Fm/c2RJbDmWTToX+CJP/X42auuHkPDGjz3J
         x+NTyxEAKivj4mBqnjT19GysD2l4ZIXZim/AFxFkNfZWj4ZWiA+dYg/6e5Ymy8lxT7gG
         ZbnFAs85yZ8NTpy5ZZycAFCfRKpostRh7+uPEN1RhP0maPjIwN2xtPZiVeYOrWjYdivp
         49wLFsHMy4DyIE5RgjCY0W6poqO/C0x0WAm7DV5YrOmdsfgaWzlXFYN0q+GF+9dcrLkp
         wvZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784718056; x=1785322856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        b=Y4Hh2CHcEgJKYkoRuXYZtGXdScp/mCdUTPYBg//pdX61DSckYDp4Aj1s13a1lEEHff
         Eos9wflQr3VdNpm7ZPHzXR5KwqTHYc3FM0XszpiUhh/D+j9eDavSbKjnk5V5dUxb8QQr
         yIgWnyJDYJHAIygIwlkcPHFUCm0owdE0v7OBsLyA6WCHnYpxNEXI7nMSl8fe9XVs2fNs
         Il3MuGmVu5Du02vdxCclovF8fOa+C8Tr80C+4IiLD4KxjGgbYkbM5CuBMzRwB3WjiMLs
         RHXkaQajShLiZlKFJDYwuYY03/jNtMx8rsbAPHLerDwAHP58QnGtuI8XMkCL1wn7lsYi
         d8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718056; x=1785322856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        b=E7Z1c0x/O+uaNb5mjWNTku2Tqtmkf60DfFO+GKRhy6OoZHcnSK3XCQqmYUKECgXJuO
         UjelVnVJm61OJ1u6JQWnyK9Qz2C5MHpzbCz9mbDtGM1mVrrTV+yG4NQB2u+dDIcOke/J
         ckT/vSvW02kZOczmwnQD4TxcswlxMmwk1EVKRStedp5B9DL412PB1Ol2wYxnMHLZGWcH
         7570rYw7oki2QZISV3/hdbfsij9t0q3G9+zPuubZJkyymI64NN2IoRSV8cPqB7ZqmbY+
         C3stQN093BeHdJU51I3ppRKM2QuHQJRX6w2m3lifRbdlRnyDAVaUgDk4sUkk+pi9PfKS
         8eSg==
X-Forwarded-Encrypted: i=1; AHgh+RpXaM32744eNwFWlr1mohniOPGGC0+3DeuOokRw5kUE/wnFfLXidKXvffgvjK+sjjgFE8hDbqL/IWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZyZrqq/pE/7WxYynPFczu5yc0nrDC8lQPIhkWkJcLyq31frlf
	BzaU7/HBvBi55/Zo0EVnxrQXbVzorBgf+E7aqCaa9wSPsmwl0rP2M2R/wNcv0g5Ke7WE/NVjjgH
	EIw6o2YRJlsIDk57NVYQby2JydGCScHn9F6oj55lXVw==
X-Gm-Gg: AR+sD12CLQ1ipellXExa9uV91/nQ6o4P2ajHMLCOR81uZLqpfOi98k3/3mssovoR/hU
	11wDJkFM5jfdrP1WJqmxbTLKiT4ihxZY8uLE5ssK+q1tYR64CuVPZTe0zvTj6jQgUtWryUi5FY7
	DPiA0bwTc51CFSFpwKpqoxa68GrvbvZobwvwbgjgOsQrD5y3lGgNCl+AWLg20sIgeRJABv2yeiO
	q/U+KmsKQRwk7piCp15jiBM2Im8TxrokOTo4HONpj3BiTIaImN//dAPrFQcCCDZbTaqT+bDPIEq
	iS0+ek+ICZMMqj28nA==
X-Received: by 2002:a17:907:1c06:b0:c11:efec:6ca9 with SMTP id
 a640c23a62f3a-c16b4699a22mr1050333866b.8.1784718055604; Wed, 22 Jul 2026
 04:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net> <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
In-Reply-To: <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 15:00:47 +0400
X-Gm-Features: AUfX_mzRWfigiVNLTvEoa0ag8xHY_819uFONXMG9otmafQymn25GMsMrwN75lQY
Message-ID: <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
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

Hi Quentin,

On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alexey,
>
> On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > When the PLL rates table was first committed for RK3588 (and later reus=
ed
> > for RK3576), the fractional PLL coefficient was defined as an unsigned
> > value, while the TRM clearly states that it is a two's complement 16-bi=
t
> > value.
> >
> > Rockchip's downstream kernel later revised the fractional PLL code [1] =
to
> > account for the two's complement nature of the coefficient, but that
> > change wasn't upstreamed.
> >
> > Change the PLL table definition to use two's complement for the
> > fractional coefficient and update its users accordingly.
> >
> > Note that a negative fractional coefficient is meant to be subtracted f=
rom
> > the next larger integer multiplier, so the _m values in the table are
> > also adjusted accordingly for the two negative-k entries.
> >
> > While at it, fix the denominator of the fractional PLL calculation to u=
se
> > 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
> > 2.13.1.4 Setting Guide on P, M, S, and K):
> >
> > Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> >
> > Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05d=
cc3a51e85ae531749e6270bf9b9212d [1]
> > Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK358=
8")
> > Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK357=
6")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> > Not adding Cc stable, because while this fixes a real bug it's not a
> > regression, as the issue was introduced in the same commit that added t=
he
> > RK3576/RK3588 support.
> >
>
> I don't think this is a valid reason :)

I believe Linus frowns upon changes like "it never worked, but we've
fixed it now" being submitted as fixes. It's been broken for years,
and since nobody complained yet, going via the normal development path
(i.e. -next) seems perfectly fine to me.

> In any case, this patch is doing too many things at once. I see the
> following things that would warrant individual patches:
>
> 1) fix the wrong denominator, stable candidate IMO,

I could split this one out, but since it's a trivial one-liner, I'd
like to hear what Heiko prefers.

> 2) fix the table (using unsigned int still), to match what Rockchip did
> in their downstream fork (maybe check they did maths properly first :) )
> stable candidate IMO, except if they are related to 1) in which case
> squash with 1),

Not related to 1), but directly related to 3). The old table was
calculated using a flawed logic as if the k is unsigned and purely
additive (and thus k > 32767 stayed at the lower value of m), while in
reality the hardware subtracts negative k from m (thus k < 0 should
come with m++).

This is confirmed by manual recalculation of effective PLL rates under
both approaches:
- If k is treated as unsigned and purely additive (valid logic, but
doesn't match the hardware) the effective rate lands within 40 Hz of
the target for the affected table entries
- If k is treated as signed and subtracted from the next higher m
(similarly valid logic, matches what the TRM says and also what the
updated vendor kernel does) the effective rate lands within 40 Hz of
the target for the updated table entries
- If the parameters are mixed and matched, there is a 2 MHz delta
(five orders of magnitude difference)

So I don't believe that splitting the table updates across commits is helpf=
ul.

> 3) switch to signed integers wherever applicable, not stable candidate
> IMO (but eventually may be backported to facilitate backports of future
> fixes),

See above.

> > Note that there is a separate unrelated issue with the rate table, name=
ly
> > the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
> > which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> > entries in the table end up with Fvco < 3 GHz, which according to the
> > TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
> > To be revisited separately.
> > ---
> >   drivers/clk/rockchip/clk-pll.c    | 8 ++++----
> >   drivers/clk/rockchip/clk-rk3576.c | 4 ++--
> >   drivers/clk/rockchip/clk-rk3588.c | 4 ++--
> >   drivers/clk/rockchip/clk.h        | 8 ++++----
> >   4 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
> > index 6b853800cb6b..f445b01aabd0 100644
> > --- a/drivers/clk/rockchip/clk-pll.c
> > +++ b/drivers/clk/rockchip/clk-pll.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/delay.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/iopoll.h>
> > +#include <linux/math64.h>
> >   #include <linux/regmap.h>
> >   #include <linux/clk.h>
> >   #include "clk.h"
> > @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_r=
ate(struct clk_hw *hw, unsigned
> >
> >       if (cur.k) {
> >               /* fractional mode */
> > -             u64 frac_rate64 =3D prate * cur.k;
> > +             s64 frac_rate64 =3D (s64)prate * cur.k;
> >
> > -             postdiv =3D cur.p * 65535;
> > -             do_div(frac_rate64, postdiv);
> > -             rate64 +=3D frac_rate64;
> > +             postdiv =3D cur.p * 65536;
> > +             rate64 +=3D div_s64(frac_rate64, postdiv);
> >       }
> >       rate64 =3D rate64 >> cur.s;
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/c=
lk-rk3576.c
> > index 2557358e0b9d..63f229e73a45 100644
> > --- a/drivers/clk/rockchip/clk-rk3576.c
> > +++ b/drivers/clk/rockchip/clk-rk3576.c
> > @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_ra=
tes[] =3D {
> >       RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >       RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >       RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> > -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> > +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >       RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >       RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >       RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >       RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >       RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> > -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> > +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >       RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >       RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >       RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>
> For some reason Rockchip didn't fix this for RK3576 in their vendor
> kernel, so it's still using the value from RK3588 from before the commit
> you pointed at.

Looks like an oversight on their end.

> > diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/c=
lk-rk3588.c
> > index 75d42fea2a11..24baa0ef9bf3 100644
> > --- a/drivers/clk/rockchip/clk-rk3588.c
> > +++ b/drivers/clk/rockchip/clk-rk3588.c
> > @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_ra=
tes[] =3D {
> >       RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >       RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >       RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> > -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> > +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >       RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >       RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >       RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
> >       RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >       RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >       RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> > -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> > +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>
> Are you sure this is proper? Rockchip changed 51117 to 51119 (so -14419
> to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you
> linked.

This change of theirs is not explained in the commit and is not
related to the code changes they are introducing, so I'm reluctant to
blindly copy it. I also suspect that reducing the magnitude of the
negative k will result in overshooting the requested rate (but haven't
checked).

-15730 results in a -41.504 Hz delta vs. requested
-14419 results in a -32.959 Hz delta vs. requested

So yes, this is proper.

> >       RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >       RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >       RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>
> In the commit you provided, they also change this line (though they
> don't change k, so unsure why (if) that is related). Wondering if this
> isn't related to the denominator fix they also have done in the same comm=
it?

It's unrelated and unexplained, so I decided not to change it until a
valid rationale is discovered. Their kernel never used 65535 in the
denominator, FWIW.

Best regards,
Alexey
