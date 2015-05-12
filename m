Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Sergej Sawazki <ce3a@gmx.de>, sboyd@codeaurora.org,
 sebastian.hesselbarth@gmail.com, mwelling@ieee.org, moinejf@free.fr
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1431333859-7224-1-git-send-email-ce3a@gmx.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Sergej Sawazki" <ce3a@gmx.de>
References: <1431333859-7224-1-git-send-email-ce3a@gmx.de>
Message-ID: <20150512233834.16410.23856@quantum>
Subject: Re: [PATCH 0/2] clk: si5351: Multisynth 6-7 fixes
Date: Tue, 12 May 2015 16:38:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Sergej Sawazki (2015-05-11 01:44:19)
> The second synthesis stage in the Si5351 clock generator consists of six
> *fractional* multisynth dividers (MS0 .. MS5) and two *even-integer* =

> dividers (MS6 and MS7). The current si5351 driver implementation does
> not handle MS6 and MS7 correctly, this leads to wrong rates on output 6 =

> and 7. This patch series fixes that.
> =

> Patch 1 fixes the divider calculation for multisynth 6 and 7.
> =

> Patch 2 fixes the divider re-calculation for multisynth 6 and 7.
> =

> Info: Base on branch 'clk-fixes'.
> =

> Sergej Sawazki (2):
>   clk: si5351: fix .round_rate for multisynth 6-7
>   clk: si5351: fix .recalc_rate for multisynth 6-7

Applied both patches to clk-next.

Regards,
Mike

> =

>  drivers/clk/clk-si5351.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> =

> -- =

> 1.9.1
>=20
