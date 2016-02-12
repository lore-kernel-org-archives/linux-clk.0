Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <3862076.Cf1OAGsbuq@phil>
Cc: linux-clk@vger.kernel.org,  linux-rockchip@lists.infradead.org
References: <3862076.Cf1OAGsbuq@phil>
Message-ID: <20160212021936.3210.79199@quark.deferred.io>
Subject: Re: [GIT PULL] first bunch of rockchip clock changes for 4.6
Date: Thu, 11 Feb 2016 18:19:36 -0800
List-ID: <linux-clk.vger.kernel.org>

Hello Heiko,

Quoting Heiko Stuebner (2016-02-11 05:00:02)
> Yakir Yang (1):
>       clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for hclk_v=
io_bus

Thanks for sending the very readable PR. One question below,

We'll likely have critical clock and handoff clock support merged in the
next few days. I'm starting to audit any new CLK_IGNORE_UNUSED flag
usage to see if it should use either of those two flags. Is the above
patch a candidate?

Thanks,
Mike
