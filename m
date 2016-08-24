Return-Path: <mw@semihalf.com>
MIME-Version: 1.0
In-Reply-To: <20160823141603.GH20029@lunn.ch>
References: <1471933609-8456-1-git-send-email-mw@semihalf.com>
 <1471933609-8456-2-git-send-email-mw@semihalf.com> <20160823141603.GH20029@lunn.ch>
From: Marcin Wojtas <mw@semihalf.com>
Date: Wed, 24 Aug 2016 10:28:34 +0200
Message-ID: <CAPv3WKec7+xgy5gxc3e9SwVJ0T649odf+rXybje7SUkEu5gnhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: mvebu: set flags in CP110 gate clock
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	=?UTF-8?Q?Gregory_Cl=C3=A9ment?= <gregory.clement@free-electrons.com>,
	nadavh@marvell.com, Lior Amsalem <alior@marvell.com>, Tomasz Nowicki <tn@semihalf.com>,
	Grzegorz Jaszczyk <jaz@semihalf.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

HI Andrew,

2016-08-23 16:16 GMT+02:00 Andrew Lunn <andrew@lunn.ch>:
> On Tue, Aug 23, 2016 at 08:26:48AM +0200, Marcin Wojtas wrote:
>> Armada CP110 system controller comprise its own routine responsble
>> for registering gate clocks. Among others 'flags' field in
>> struct clk_init_data was not set, using a random values, which
>> may cause an unpredicted behavior.
>>
>> This patch fixes the problem by setting CLK_IS_BASIC flag for
>> all gated clocks of Armada 7k/8k SoCs family.
>>
>> Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system ...")
>>
>> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
>> ---
>>  drivers/clk/mvebu/cp110-system-controller.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
>> index 7fa42d6..0835e1d 100644
>> --- a/drivers/clk/mvebu/cp110-system-controller.c
>> +++ b/drivers/clk/mvebu/cp110-system-controller.c
>> @@ -144,6 +144,7 @@ static struct clk *cp110_register_gate(const char *name,
>>
>>       init.name = name;
>>       init.ops = &cp110_gate_ops;
>> +     init.flags = CLK_IS_BASIC;
>>       init.parent_names = &parent_name;
>>       init.num_parents = 1;
>
> Hi Marcin
>
> How about adding a memset for init? That would also help if new fields
> every get added to clk_init_data.
>

Sure, it can be added.

Best regards,
Marcin
