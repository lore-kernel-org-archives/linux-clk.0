Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tejas Patel <tejas.patel@xilinx.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525339535-25595-1-git-send-email-tejas.patel@xilinx.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tejas Patel <tejas.patel@xilinx.com>
References: <1525339535-25595-1-git-send-email-tejas.patel@xilinx.com>
Message-ID: <152640849867.34267.15407476518137265094@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: divider: Use round off divisor instead of round up
Date: Tue, 15 May 2018 11:21:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Tejas Patel (2018-05-03 02:25:35)
> divider_get_val() is used to find clock divisor which is
> giving round up value. So even though actual divisor is closer to
> round down integer value it will return round up integer value.
> This can result into large variation between expected clock rate and
> actual clock rate.
> =

> See for example:
> Parent rate is 1400MHz and desired child rate is 693MHz.
> So if we calculate simple divisor for child clock it would be
> 1400000000/693000000 =3D 2.02. But, because of roundup logic
> (DIV_ROUND_UP_ULL(1400000000, 693000000)) divisor returned from
> divider_get_val() will be 3.
> =

> So actual child rate would be (1400000000/3) =3D 466666667 instead of
> 693000000. Here, difference between expected child rate and actual child
> rate is approx 226MHz. So there is almost 32% error between desired and
> actual clock rate.
> =

> Fix this by using round off value (DIV_ROUND_CLOSEST_ULL) instead of
> round up/down.

Is your divider using the CLK_DIVIDER_ROUND_CLOSEST flag? When
divider_get_val() is called, the incoming rate should already be rounded
to something that is what the actual frequency would be so the rounding
here hopefully doesn't matter.

Maybe something is lost in translation though, because we do
round_rate() to figure out some divider based on a requested rate, and
then we return that rate we calculated that we can achieve to the
framework. In turn, that rate comes back into this divider_get_val()
function to get the divider out of the rate again. It's sort of annoying
how circular this is. Perhaps your example can show this call sequence
and the associated math gymnastics that go on and then I'll be convinced
that we need to update this part of the code.
