MIME-Version: 1.0
In-Reply-To: <1513627578.29566.6.camel@baylibre.com>
References: <20171218170007.28042-1-jbrunet@baylibre.com>
	<20171218190303.GV7997@codeaurora.org>
	<1513627578.29566.6.camel@baylibre.com>
Date: Mon, 18 Dec 2017 12:12:51 -0800
Message-ID: <CAEG3pNBi13BCPcftf=mj5LJh3JQQi+Q7C5QLZwoy6LG__krJXA@mail.gmail.com>
Subject: Re: [PATCH] clk: check ops pointer on clock register
From: Michael Turquette <mturquette@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome & Stephen,

On Mon, Dec 18, 2017 at 12:06 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Mon, 2017-12-18 at 11:03 -0800, Stephen Boyd wrote:
>> On 12/18, Jerome Brunet wrote:
>> > Nothing really prevents a provider from (trying to) register a clock
>> > without providing the clock ops structure.
>> >
>> > We do check the individual fields before using them, but not the
>> > structure pointer itself. This may have the usual nasty consequences when
>> > the pointer is dereferenced, mostly likely when checking one the field
>> > during the initialization.
>>
>> Yes, that nasty consequence should be a kernel oops,
>
> Precisely
>
>> and the
>> developer should notice that before submitting the driver for
>> inclusion.
>
> Agreed. But people may make mistakes, which is why (at least partly) we
> do checks, isn't it ?

Agreed the developers should test before submitting, but procedurally
generated clocks (e.g. registering clocks in a loop using a
predictable register map, etc) could lead to a situation where a
developer doesn't test every possible iteration.

Hypothetical, but easy easy easy to fix with Jerome's patch.

>
>> I don't think we really care to return an error here
>> if this happens.
>>
>
> I don't understand why we would let a oops happen when can catch the error
> properly ?
>

Agreed with Jerome on this one.

Let's flip it on its head: any downside to this patch? If not I can merge.

Regards,
Mike
