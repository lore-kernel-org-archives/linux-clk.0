Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Doug Anderson <dianders@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Xing Zheng <zhengxing@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, zhangqing <zhangqing@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH 2/3] clk: adjust clocks to their requested rate after parent changes
Date: Sun, 08 May 2016 22:34:41 +0200
Message-ID: <3005442.vcrD3GKCxP@phil>
In-Reply-To: <CAD=FV=WegPb3AMsUM+Rx_uZ3sMCGUFz-vEh_8WDTqTp1MHWOUQ@mail.gmail.com>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de> <CAD=FV=X6at49s-8Wh3+RnLwNQr5RqDMvfJJF+TwvuhnurmQk1w@mail.gmail.com> <CAD=FV=WegPb3AMsUM+Rx_uZ3sMCGUFz-vEh_8WDTqTp1MHWOUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 5. Mai 2016, 17:49:39 schrieb Doug Anderson:
> Hi,
> 
> On Thu, May 5, 2016 at 5:35 PM, Doug Anderson <dianders@chromium.org> wrote:
> > I guess we don't care about errors here?
> > 
> > ...maybe (?) we could ignore errors if we validated this rate change
> > with PRE_RATE_CHANGE before attempting to change the parent clock, but
> > I don't see the code doing this unless I missed it.
> 
> One other related thought: it seems like there should be code
> _somewhere_ that decides whether to adjust the child dividers before
> or after the parent clock changes.  Specifically if the parent clock
> is increasing in speed we probably want to slow down the child clock
> ahead of the parent's increase.  I don't see such code here, but again
> I'm pretty good at missing things unless they are slapping me in the
> face.  ;)

yep, but that problem of a divider exceeding a requested rate temporarily
exist currently already, even before this change ;-)

Recently we did fix it on a small-scale for composite-clocks though [0].


Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/commit/drivers/clk/clk-composite.c?h=clk-next&id=9e52cec04fd3b9b686f9256151b47fe61f7c28ef
