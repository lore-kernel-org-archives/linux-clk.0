Return-Path: <vincent.legoll@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170705211518.GU22780@codeaurora.org>
References: <1499011768-8046-1-git-send-email-vincent.legoll@gmail.com> <20170705211518.GU22780@codeaurora.org>
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Thu, 6 Jul 2017 09:25:05 +0200
Message-ID: <CAEwRq=pt=pk5YkuEqerKhLPAu9Y+jVgbWcAnJ7Sbm3b+hAHfmg@mail.gmail.com>
Subject: Re: [PATCH] Make Common clock framework a menuconfig to ease
 disabling it all
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux Kernel ML <linux-kernel@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Wed, Jul 5, 2017 at 11:15 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 07/02, Vincent Legoll wrote:
>> -menu "Common Clock Framework"
>> +menuconfig COMMON_CLK_FRAMEWORK
>> +     tristate "Common Clock Framework"
>>       depends on COMMON_CLK
>
> Wouldn't this put the clk drivers inside the drivers menu?

This does not move anything (at least I think), it just change the
already existing submenu into a menuconfig, which you can
choose to disable as a whole, which disable everything inside
that menuconfig. Maybe there are side effects visible outside
of this menu.

> Which is already quite large right now.

That's right, and I'm willing to tackle at least a part of this
problem, first by making it easier to disable whole chunks
at once.

> Plus this makes common clk
> tristate which so far we haven't supported. No thanks.

OK that was an oversight, I'll revisit later (going for the low
hanging fruits). But this is moot anyways, you should drop
that patch because it introduces new compile warnings on
ARM.

Sorry

-- 
Vincent Legoll
