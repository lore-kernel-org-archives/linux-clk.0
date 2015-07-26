Return-Path: <romain.perier@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150726092705.183a44c3@bbrezillon>
References: <110607065.NoWaKp3mDJ@diego>
	<20150726092705.183a44c3@bbrezillon>
Date: Sun, 26 Jul 2015 14:16:57 +0200
Message-ID: <CABgxDoJ1sSRyzKco5v=WG0Dfi2cL6n9qXgQOLwbGuVLtDo2CDw@mail.gmail.com>
Subject: Re: [PATCH] clk: handle fixed-rate clocks correctly in clk_core_round_rate_nolock
From: Romain Perier <romain.perier@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi all,

A side effect produced by this issue was cpufreq complaining about
incorrect clk rate when it tried to change cpu frequency (on cpu0). It
is fixed now.

Tested-by: Romain Perier <romain.perier@gmail.com>

2015-07-26 9:27 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.c=
om>:
> Hi Heiko,
>
> On Sun, 26 Jul 2015 00:18:40 +0200
> Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
>> Commit 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype"=
)
>> changed the behaviour of clk_core_round_rate_nolock as it forgot to also
>> include the else conditional simply returning the clock rate for clocks
>> that neither have a parent or can determine their rate - for example
>> said fixed clocks.
>
> Indeed.
>
>>
>> This resulted in failures to set pll rates on rockchip socs, as it
>> returned the target pll rate as suitable rate for the 24MHz xin24m clock=
,
>> thus making the ccf want to set this fixed clock to 1.6GHz or similar.
>>
>> Fixes: 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype"=
)
>> Reported-by: Romain Perier <romain.perier@gmail.com>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Thanks,
>
> Boris
>
>> ---
>>  drivers/clk/clk.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 67f778b..819ffa6 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -802,6 +802,8 @@ static int clk_core_round_rate_nolock(struct clk_cor=
e *core,
>>               req->rate =3D rate;
>>       } else if (core->flags & CLK_SET_RATE_PARENT) {
>>               return clk_core_round_rate_nolock(parent, req);
>> +     } else {
>> +             req->rate =3D core->rate;
>>       }
>>
>>       return 0;
>
>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
