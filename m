MIME-Version: 1.0
In-Reply-To: <1509470994.13838.28.camel@baylibre.com>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
	<20170924200030.6227-10-jbrunet@baylibre.com>
	<150899557300.90597.9865127803541159465@resonance>
	<1509470994.13838.28.camel@baylibre.com>
Date: Tue, 31 Oct 2017 17:32:51 +0000
Message-ID: <CAEG3pNDFSn0_K4X66vn0LZ_1PeTfkEPB7YVDKQwFZtN2x=iH=w@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] clk: add clk_rate_exclusive api
From: Michael Turquette <mturquette@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi J=C3=A9r=C3=B4me,

On Tue, Oct 31, 2017 at 5:29 PM, Jerome Brunet <jbrunet@baylibre.com> wrote=
:
> On Thu, 2017-10-26 at 07:26 +0200, Michael Turquette wrote:
>> Hi Jerome,
>>
>> Quoting Jerome Brunet (2017-09-24 22:00:29)
>> > @@ -1778,6 +1867,50 @@ int clk_set_rate(struct clk *clk, unsigned long=
 rate)
>> >  EXPORT_SYMBOL_GPL(clk_set_rate);
>> >
>> >  /**
>> > + * clk_set_rate_exclusive - specify a new rate get exclusive control
>> > + * @clk: the clk whose rate is being changed
>> > + * @rate: the new rate for clk
>> > + *
>> > + * This is a combination of clk_set_rate() and clk_rate_exclusive_get=
()
>> > + * within a critical section
>> > + *
>> > + * This can be used initially to ensure that at least 1 consumer is
>> > + * statisfied when several consumers are competing for exclusivity ov=
er the
>> > + * same clock provider.
>>
>> Please add the following here:
>>
>>   Calls to clk_rate_exclusive_get() should be balanced with calls to
>>   clk_rate_exclusive_put().
>
> Oh indeed !
> I can do a resend with it or, if you prefer, you may directly amend the p=
atch.
> As you prefer

Previously we agreed that these should go onto the next -rc1 so that
they have more soak time. Being a very lazy person, may I ask you to
rebase the patches on -rc1 when it comes out (with this small change)
and then I'll pull them? You can send a PR directly if you like.

Best regards,
Mike

>
> Thanks
>
>>
>> Otherwise looks good to me.
>>
>> Best regards,
>> Mike
>
