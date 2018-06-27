Return-Path: <bgolaszewski@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1da88059-2d5b-f035-1d4c-9e21ae141017@ti.com>
References: <20180626092537.6737-1-brgl@bgdev.pl> <20180626092537.6737-5-brgl@bgdev.pl>
 <1da88059-2d5b-f035-1d4c-9e21ae141017@ti.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 27 Jun 2018 12:03:30 +0200
Message-ID: <CAMpxmJXpAECkA7FTLx-nR_w0ZEBUw_A7qpu2P6e_mS6k=pTsUQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] clk: davinci: psc-dm646x: use two lookup entries
 for the aemif clock
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>,
	Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-06-27 12:01 GMT+02:00 Sekhar Nori <nsekhar@ti.com>:
> On Tuesday 26 June 2018 02:55 PM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> We want to be able to get the clock both from the board file by its
>> con_id and from the aemif driver by dev_id.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I see the DM365 and DM644x EVM board files getting reference to aemif
> clock using just the con_id, but don't see that for DM646x. Am I
> overlooking something?
>
> Thanks,
> Sekhar

It's being done indirectly from mach-davinci/aemif.c. I guess we can
remove it again after last patch.

Bart
