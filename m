Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1601887.i7XxTCUQZu@phil>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
 <1462206982-10444-3-git-send-email-heiko@sntech.de> <577B6162.3020609@rock-chips.com>
 <1601887.i7XxTCUQZu@phil>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Jul 2016 15:41:20 -0700
Message-ID: <CAD=FV=WQeK35+zLpdaLqn5ShFRrUBx1r2LzqS=_THsWqy6iV6g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: adjust clocks to their requested rate after
 parent changes
To: Heiko Stuebner <heiko@sntech.de>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Xing Zheng <zhengxing@rock-chips.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Tue, Jul 5, 2016 at 3:24 PM, Heiko Stuebner <heiko@sntech.de> wrote:
>> I tests found a problem, about set the freq order.
>> e.p:
>> [VPLL]
>>
>>      ------ [div] ----- dclk_vop
>> If I change VPLL freq 148.5M to 594M, dclk_vop freq will changed as:
>> 148.5M->24M->594M->1485.5M.
>> But we not hope the dclk_vop have a high freq,it will make the system
>> crash or make vop not work well.
>>
>> So if the VPLL is improve the freq, we need to set dclk_vop div first,
>> and than set VPLL freq.
>> If VPLL is reduce the freq, we need to set vpll first,and set dclk_vop
>> div.
>>
>> This is just a example,for all change parent freq, we need follow this
>> operation.
>> Do you have a better idea for this problem?
>
> In general it seems my simplicistic approach only really works for really
> simple clock-setups and thus is likely not really usable for general things.
>
> For the VPLL on the rk3399 we were discussion a different approach in [0],
> as VPLL usage (aka which vop gets to control it) is likely to complicated to
> have this done in the clock-framework-
>
> Doug wanted to take a look and add some thoughts and I guess he'll just do
> that after the 4th of july celebrations.

Right.  IMHO you should do something to _really_ make sure that one of
the VOPs is parented on either GPLL or CPLL and then let the other VOP
be in control of VPLL.  How we actually do that is up for debate.  I
still have it on my list of things to do to look at Heiko's response
to my previous proposal, but given that I'm currently backlogged from
the two day holiday and that I'm only a few days away from a week long
vacation (and subsequent backlog), I'm not 100% sure I'll get to it
soon.  :(  I'll do my best, though...

In addition to the link Heiko gave, you could also look at
<https://chromium-review.googlesource.com/#/c/354165/>.  That's also
not fully baked but is another way to possibly tackle the problem.

In general if there is only one clock tree under VPLL then you
shouldn't need to worry too much about things getting out of whack.


-Doug
