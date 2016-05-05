Return-Path: <kernel@martin.sperl.org>
References: <1462348385-16167-1-git-send-email-kernel@martin.sperl.org> <87oa8ks49s.fsf@eliezer.anholt.net>
Mime-Version: 1.0 (1.0)
In-Reply-To: <87oa8ks49s.fsf@eliezer.anholt.net>
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <13F43ACC-85CA-4F5F-800D-E547BBA4CC73@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V5] clk: bcm2835: mark enabled clocks and pll with CLK_ENABLE_HAND_OFF
Date: Thu, 5 May 2016 22:29:07 +0200
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>



> On 05.05.2016, at 21:17, Eric Anholt <eric@anholt.net> wrote:
>=20
> kernel@martin.sperl.org writes:
>=20
>> From: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> The bcm2835 firmware enables several clocks and plls before
>> booting the linux kernel.
>>=20
>> These plls should never get disabled as it may result in a
>> stopped system clock and more.
>>=20
>> So during probing we check if the clock and plls are enabled
>> and if it is then mark that clock/pll with CLK_ENABLE_HAND_OFF.
>>=20
>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>> ---
>> drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>>=20
>> Note: This requires the CLK_ENABLE_HAND_OFF patch to be applied.
>>=20
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.=
c
>> index 0fc71cb..0663b6c 100644
>> --- a/drivers/clk/bcm/clk-bcm2835.c
>> +++ b/drivers/clk/bcm/clk-bcm2835.c
>> @@ -1211,6 +1211,15 @@ bcm2835_register_pll_divider(struct bcm2835_cprman=
 *cprman,
>>    divider->cprman =3D cprman;
>>    divider->data =3D data;
>>=20
>> +    /* if the pll-divider is running, then enable CLK_ENABLE_HAND_OFF */=

>> +    if ((cprman_read(cprman, data->a2w_reg) &
>> +         A2W_PLL_CHANNEL_DISABLE) =3D=3D 0) {
>> +        dev_dbg(cprman->dev,
>> +            "found firmware enabled pll_div %s - enabling hand off\n",
>> +            data->name);
>> +        init.flags |=3D CLK_ENABLE_HAND_OFF;
>> +    }
>=20
> I don't think we want this on dividers.  There are very few cases where
> a divider will be grabbed and prepare/enabled on its own, rather than as
> a side effect of a downstream clock being needed.  So, I think the
> dividers need to stay as being enabled/disabled automatically by the
> downstream clocks, like in the v3 patch you had sent.

With dividers not handled the rmmod amba_pl011 will crash the
machine (see my other email with all those issues I have reported) -=20
that is why I had to add the pll_divs as well...

There may be other scenarios that can also trigger this
kind of crash.

Only other approach might be that the firmware driver would
claim those relevant plls to keep the system stable. But the=20
question is: which ones would be needed?=
