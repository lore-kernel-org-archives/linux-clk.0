Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <CAD=FV=X6at49s-8Wh3+RnLwNQr5RqDMvfJJF+TwvuhnurmQk1w@mail.gmail.com>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
	<1462206982-10444-3-git-send-email-heiko@sntech.de>
	<CAD=FV=X6at49s-8Wh3+RnLwNQr5RqDMvfJJF+TwvuhnurmQk1w@mail.gmail.com>
Date: Thu, 5 May 2016 17:49:39 -0700
Message-ID: <CAD=FV=WegPb3AMsUM+Rx_uZ3sMCGUFz-vEh_8WDTqTp1MHWOUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: adjust clocks to their requested rate after
 parent changes
From: Doug Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Xing Zheng <zhengxing@rock-chips.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	zhangqing <zhangqing@rock-chips.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, May 5, 2016 at 5:35 PM, Doug Anderson <dianders@chromium.org> wrote:
> I guess we don't care about errors here?
>
> ...maybe (?) we could ignore errors if we validated this rate change
> with PRE_RATE_CHANGE before attempting to change the parent clock, but
> I don't see the code doing this unless I missed it.

One other related thought: it seems like there should be code
_somewhere_ that decides whether to adjust the child dividers before
or after the parent clock changes.  Specifically if the parent clock
is increasing in speed we probably want to slow down the child clock
ahead of the parent's increase.  I don't see such code here, but again
I'm pretty good at missing things unless they are slapping me in the
face.  ;)

-Doug
