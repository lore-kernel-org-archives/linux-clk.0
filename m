Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170605201314.GI20170@codeaurora.org>
References: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
 <8b65e551-e6dd-cf5c-1b22-e1f1a5996d73@wwwdotorg.org> <0794f430-9761-c855-9a89-13d9871c5831@i2se.com>
 <6765be64-9cf6-4663-4182-5b63f27bfb93@raspberrypi.org> <20170601063937.GN20170@codeaurora.org>
 <215eea3c-febe-5aa4-9dbb-e1f170bc0b0d@raspberrypi.org> <20170602223432.GU20170@codeaurora.org>
 <35742698-9f04-fa57-60b0-eecb3d790e03@raspberrypi.org> <20170605201314.GI20170@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2017 09:22:11 +0200
Message-ID: <CAMuHMdUEkHmpadT40=ZxNzQE+A_r97KA8p45f=fA8z7Bt_8xig@mail.gmail.com>
Subject: Re: CLK_OF_DECLARE advice required
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Phil Elwell <phil@raspberrypi.org>, Stefan Wahren <stefan.wahren@i2se.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Mon, Jun 5, 2017 at 10:13 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/05, Phil Elwell wrote:
>> That sounds great, but it doesn't match my experience. Let me restate my
>> observations with a bit more detail.
>>
>> In this scenario there three devices in a dependency chain:
>>
>>   clock -> fixed-factor->clock -> uart.
>>
>> The Fixed Factor Clock is declared with OF_CLK_DECLARE, while the two platform
>> drivers use normal probe functions.
>>
>> 1) of_clk_init() calls encounter FFC in the list of clocks to initialise and
>> calls parent_ready on the device node.
>>
>> 2) The parent clock has not been initialised, so of_clk_get returns
>> -EPROBE_DEFER.
>>
>> 3) Steps 1 and 2 repeat until no progress is made, at which point the force
>> flag is set for one last iteration. This time the parent_ready check is skipped
>> and the code calls indirectly into _of_fixed_factor_clk_setup().
>>
>> 4) The FFC setup calls of_clk_get_parent_name, which returns a NULL that ends
>> up referred to by the parent_names field of clk_init_data structure indirectly
>> passed to clk_hw_register and clk_register.
>
> That's bad. Does "clock" in this scenario have a
> clock-output-names property so we can find the name of the parent
> of the fixed factor clock? That way we can describe the fixed
> factor to "clock" linkage. Without that, things won't ever work.

>> Is this behaviour as intended? I can see that the NULL parent name in steps 4
>> and 5 could be handled more gracefully, but the end result would be the same.
>>
>> Where and how is the "orphan" clock concept supposed to help, and what needs to
>> be fixed in this case?
>>
>
> The orphan concept helps here because of_clk_init() eventually
> forces the registration of the fixed factor clock even though the
> fixed factor's parent has not been registered yet. As you've
> determined though, that isn't working properly because the fixed
> factor code is failing to get a name for the parent. Using the
> clock-output-names property would fix that though.

Isn't clock-output-names deprecated for clocks with a single clock
output?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
