Return-Path: <brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <c8d28664-e0fb-5a02-3c5b-b78684f87648@lechnology.com>
References: <20180625152920.11549-1-brgl@bgdev.pl> <20180625152920.11549-2-brgl@bgdev.pl>
 <241fed6e-b414-feac-8e6c-39713c5e665e@lechnology.com> <CAMRc=MdTdoL9qsrMAxhCTaQM7HGrAPpTVjDuHQ81Q5O-QMNcYQ@mail.gmail.com>
 <c8d28664-e0fb-5a02-3c5b-b78684f87648@lechnology.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Jun 2018 18:09:45 +0200
Message-ID: <CAMRc=MdsTAz7rd6W0M8gcmY0-PfNY9RGW6hxrfhECecbkm2E1g@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: davinci: psc-dm365: use two lookup entries for
 the aemif clock
To: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-06-25 18:06 GMT+02:00 David Lechner <david@lechnology.com>:
> On 06/25/2018 11:01 AM, Bartosz Golaszewski wrote:
>>
>> 2018-06-25 17:53 GMT+02:00 David Lechner <david@lechnology.com>:
>>>
>>> On 06/25/2018 10:29 AM, Bartosz Golaszewski wrote:
>>>>
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> We want to be able to get the clock both from the board file by its
>>>> con_id and from the aemif driver by dev_id.
>>>
>>>
>>>
>>> What about the other SoCs? Don't they need this change as well?
>>>
>>
>> So I double checked and turns out I missed one other board that's
>> affected by this series and calls clk_get() from machine code:
>> dm644x-evm.
>>
>> I'll fix it in v2.
>
>
> The ti-aemif platform driver also does clk_get(). Don't you need
> lookups to make that work as well? For example, DA830 doesn't have
> a clock lookup for aemif at all.
>

Right, I'll check that too.

Thanks,
Bart
