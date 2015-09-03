Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAObsKAyKVM-Y4XZJZ-dPXnZZpQ4_ytovkshAXCWj6UFU7-XGw@mail.gmail.com>
References: <20150724232045.GA14059@www.outflux.net> <CAAObsKBp-hPknWUxJxJGPV1RTj+Q_yc+xxVG315FjQXk9_CK2g@mail.gmail.com>
 <CAGXu5jKnvPw=LM6uynk532AzON1hoD+PmA0t-eA4oOfW=R986w@mail.gmail.com> <CAAObsKAyKVM-Y4XZJZ-dPXnZZpQ4_ytovkshAXCWj6UFU7-XGw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 3 Sep 2015 09:57:02 +0200
Message-ID: <CAAObsKC4s8M3NgvSn2NS8jginvdnQNZmYydt_Zswz992=yTW0w@mail.gmail.com>
Subject: Re: [PATCH] clk_register_clkdev: handle callers needing format string
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 5 August 2015 at 15:09, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On 31 July 2015 at 21:03, Kees Cook <keescook@chromium.org> wrote:
>> On Fri, Jul 31, 2015 at 2:13 AM, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>>> On 25 July 2015 at 01:20, Kees Cook <keescook@chromium.org> wrote:
>>>> Many callers either use NULL or const strings for the third argument of
>>>> clk_register_clkdev. For those that do not, this is a risk for format
>>>> strings being accidentally processed (for example in device names). This
>>>> adds the missing "%s" arguments to make sure format strings will not leak
>>>> into the clkdev.
>>>>
>>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>>> ---
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>>>> index 41cd87c67be6..97d9fb7e89ad 100644
>>>> --- a/drivers/clk/tegra/clk.c
>>>> +++ b/drivers/clk/tegra/clk.c
>>>> @@ -296,7 +296,7 @@ void __init tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
>>>>
>>>>         for (i = 0; i < num; i++, dev_clks++)
>>>>                 clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
>>>> -                               dev_clks->dev_id);
>>>> +                               "%s", dev_clks->dev_id);
>>>
>>> This causes clocks to be registered with a dev_id string of "(null)",
>>> which is causing lookups that used to succeed before to fail.
>>
>> Oh yuck. Yeah, clk_register_clkdev handles a NULL argument differently
>> than other format-string style functions. Using
>> clk_register_clkdev(..., dev_clks->dev_id ? "%s" : NULL,
>> dev_clks->dev_id) seems really ugly to work around this, though.
>> Perhaps the format string capability should be removed?
>
> Yeah, that sounds good to me. At least, I don't see as that good of an
> idea to save a few lines of code by making the API so prone to
> mistakes.
>
> Could this patch be removed from linux-next in the meantime?

Stephen, Mike,

the Tegra portion of this patch is wrong because it registers some
clocks with a dev_id of "(null)", which is really inconvenient when
debugging because one cannot tell from the logs if it's NULL or that
actual string.

Could this be reverted?

Thanks,

Tomeu

> Thanks,
>
> Tomeu
>
>> -Kees
>>
>> --
>> Kees Cook
>> Chrome OS Security
