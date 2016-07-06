Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <577C6152.4010702@rock-chips.com>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
 <1462206982-10444-3-git-send-email-heiko@sntech.de> <577B6162.3020609@rock-chips.com>
 <1601887.i7XxTCUQZu@phil> <577C6152.4010702@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Jul 2016 16:01:42 -0700
Message-ID: <CAD=FV=WAZ125yjG0rAEodSL3LLdBAEx24k+uWYbYYqNCpnYByQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: adjust clocks to their requested rate after
 parent changes
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Xing Zheng <zhengxing@rock-chips.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Tue, Jul 5, 2016 at 6:39 PM, Elaine Zhang <zhangqing@rock-chips.com> wrote:
> OK, Regardless of the VPLL and vop.
> The current software of clock, there are some problems.
> e.p:
> [GPLL]
>        ------ [div] ----- aclk_perilp
> If I set GPLL 1200M use "assigned-clock-rate".My be the default div of
> aclk_perilp is 2, GPLL default freq is 600M.
> If I set GPLL first,the aclk_perilp freq will changed as
> 300M->600M->300M.But aclk_perilp 600M is a unsafety.It will make the system
> crash.
> Aclk_perilp is sizeoff at 300M.It not allowed over frequency.
>
> So if I init the PLL freq use "assigned-clock-rate", I need to list it's
> child clk, make sure it's child clk div is enough,make sure the child clk
> freq is below the  sizeoff freq.
>
> Do you have a better idea for this problem?

As I understand it, this is a problem that the CCF has had for a long
time.  I'll probably get shot if our firmware guy ever reads this, but
I could suggest that one sane way to "solve" this is to say that
firmware should prepare the clock tree in such a way that the kernel
doesn't happen to run into this issue.  Honestly I think that's why
we've never happened to run into this before.  ...but even I think
that's pretty ugly.

Another very ugly (and non-landable) way to solve this is to do this
in device tree:

* Set GPLL to something known slow, like 300M
* Set aclk_perilp to 300M / 4 = 75M
* Set GPLL to 1200M
* Poof, aclk_perilp is now magically the rate you want.


Presumably one nice way to "solve" this cleanly is to somehow add the
max clock rate into the code and adjust the divider (or parent) of a
clock to always make sure that it was under the max.  I'm not sure if
you could do this somehow using PRE_RATE_CHANGE notifiers or if you'd
need to touch the CCF itself.  I suspect the later.


-Doug
