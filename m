Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, elaine.zhang@rock-chips.com, jay.xu@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: rockchip: rk3399: export some necessary clock IDs
Date: Mon, 25 Apr 2016 23:12:45 +0200
Message-ID: <4907016.reVaWPNuy4@diego>
In-Reply-To: <1461150414-29638-2-git-send-email-zhengxing@rock-chips.com>
References: <1461150414-29638-1-git-send-email-zhengxing@rock-chips.com> <1461150414-29638-2-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Mittwoch, 20. April 2016, 19:06:49 schrieb Xing Zheng:
> We export some clock IDs for the reference drivers need them.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

I've split this one up quite a bit [0] [1] [2] [3]. Especially binding-
header and clock-driver changes should be in separate patches, as they
regularly need to live on different branches.

Also please don't cram to many unrelated changes into one patch and
make sure the patch description does explain the reason behind the
change enough.

But I've obviously applied the change after splitting, so please take
a look and shout if you disagree with something ;-)


Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.7-shared/clkids&id=f73b5042b9a9c45477246acd478bf49487197a31
[1] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.7-shared/clkids&id=003e6eb71ed3c884d55443cdb95b909374ade7bc
[2] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.7-shared/clkids&id=55df45843901847f33816f8246ca2538aadd339a
[3] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.7-clk/next&id=3f92a05440f92f2734c9b754af39afa3244dfb5b
