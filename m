Return-Path: <andre.przywara@arm.com>
Subject: Re: [PATCH] clk: sunxi: allow PLL6 clock to be reused
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <1456105198-25295-1-git-send-email-andre.przywara@arm.com>
 <CAGb2v66Fkvpqay+pNYjN1KP_KSUmv-du+PVSsyeuK+Y7bzEt+g@mail.gmail.com>
 <56CAD72D.7050102@arm.com> <20160225181105.GE4736@lukather>
Cc: Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Message-ID: <56CF6ADD.1000803@arm.com>
Date: Thu, 25 Feb 2016 20:58:05 +0000
MIME-Version: 1.0
In-Reply-To: <20160225181105.GE4736@lukather>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 25/02/16 18:11, Maxime Ripard wrote:
> On Mon, Feb 22, 2016 at 09:38:53AM +0000, Andre Przywara wrote:
>>>> diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-factors.h
>>>> index 1e63c5b..3a7da86 100644
>>>> --- a/drivers/clk/sunxi/clk-factors.h
>>>> +++ b/drivers/clk/sunxi/clk-factors.h
>>>> @@ -36,6 +36,7 @@ struct factors_data {
>>>>         void (*getter)(struct factors_request *req);
>>>>         void (*recalc)(struct factors_request *req);
>>>>         const char *name;
>>>> +       int name_idx;
>>>
>>> I would drop the .name field. It was a bad workaround
>>> due to limitations of the factors clk code at the time
>>> by me. We really shouldn't hard-code the name if we want
>>> to reuse the driver.
>>
>> I know what you mean (my first thought, too) and I totally agree, but we
>> need it still for PLL5, which does not carry the original name in the DT
>> output names.
>> So at least this workaround here does not work, I guess we have to come
>> up with something different - which would be a different patch.
>> I can take a look into this later.
> 
> Actually, it could be easily worked around. Always take the first
> clock output name, take whatever is before '_', and you can remove the
> name field entirely.

Yeah, I was thinking about that, too, but wanted to give an easy patch a
try first.

> Jens did something along these lines here:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/379900.html

Indeed, I stumbled upon this by accident today. Looks great on the first
glance: using .self first, then the stub till the underscore. I can
review and test this, if needed.

> Maybe we should simply rebase this patch, and remove the part that
> falls back on the name field.

I am totally fine with this!

Thanks!
Andre.
