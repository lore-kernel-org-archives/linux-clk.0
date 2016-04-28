Return-Path: <kernel@martin.sperl.org>
References: <1461770664-29384-1-git-send-email-kernel@martin.sperl.org> <87d1p9v5z5.fsf@eliezer.anholt.net>
Mime-Version: 1.0 (1.0)
In-Reply-To: <87d1p9v5z5.fsf@eliezer.anholt.net>
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <66DC3759-FEAB-4B65-BAB4-94D0C2BD70F8@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V3] clk: bcm2835: mark enabled clocks with CLK_ENABLE_HAND_OFF
Date: Thu, 28 Apr 2016 22:56:29 +0200
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>



> On 28.04.2016, at 22:22, Eric Anholt <eric@anholt.net> wrote:
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
>> So during probing we check if the clock is enabled
>> and if it is then mark that clock with CLK_ENABLE_HAND_OFF.
>> As a consequence this will also enable the corresponding
>> parent plls and pll-divs.
>>=20
>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> --
>=20
>> ---
>> drivers/clk/bcm/clk-bcm2835.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>=20
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.=
c
>> index 35f8de7..65d62c2 100644
>> --- a/drivers/clk/bcm/clk-bcm2835.c
>> +++ b/drivers/clk/bcm/clk-bcm2835.c
>> @@ -1251,7 +1251,14 @@ static struct clk *bcm2835_register_clock(struct b=
cm2835_cprman *cprman,
>>        init.flags |=3D CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
>>    }
>>=20
>> +    /* if the clock is running then enable HAND_OFF */
>> +    if (cprman_read(cprman, data->ctl_reg) & CM_ENABLE) {
>> +        dev_info(cprman->dev,
>> +             "found enabled clock %s - enabling hand off\n",
>> +             data->name);
>> +        init.flags |=3D CLK_ENABLE_HAND_OFF;
>> +    }
>> +
>=20
> The debug shouldn't be at dev_info() level, but other than that this
> seems like a good plan once CLK_ENABLE_HAND_OFF lands.

Until that point in time we can make those clocks critical.

I could split it into a 2 part patch first with critical and when we
have hand off then we can apply the second part that moves to
hand-off.

That way the current issue is solved - even if in a sub-optimal way.
But the path forward is shown.

Should I do this?

Martin=
