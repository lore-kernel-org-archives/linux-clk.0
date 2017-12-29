Return-Path: <al.kochet@gmail.com>
Return-Path: <al.kochet@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/2] clk: rename clk_core_get_boundaries() to clk_hw_get_boundaries() and expose
From: Alexander Kochetkov <al.kochet@gmail.com>
In-Reply-To: <20171229001417.GC7997@codeaurora.org>
Date: Fri, 29 Dec 2017 11:52:38 +0300
Cc: linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 LAK <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>
Message-Id: <C7AA677C-664F-4305-B74D-B13F3FF0A199@gmail.com>
References: <1513872282-5370-1-git-send-email-al.kochet@gmail.com> <1513872282-5370-2-git-send-email-al.kochet@gmail.com> <20171221200743.GM7997@codeaurora.org> <8EC4D15B-4A89-43FA-953E-95AF81417067@gmail.com> <20171227010638.GP7997@codeaurora.org> <4B1BB338-F1F9-4231-BDCA-5FBB1F61BC44@gmail.com> <20171229001417.GC7997@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


> 29 =D0=B4=D0=B5=D0=BA. 2017 =D0=B3., =D0=B2 3:14, Stephen Boyd =
<sboyd@codeaurora.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):=

>=20
> I'm asking if the rate is capped on the consumer side with
> clk_set_max_rate() or if it's capped on the clk provider side to
> express a hardware constraint.
I do that using clk_set_max_rate() at provider size inside clk-rk3188.c.

>=20
> Sounds like there are some things to be figured out here still. I
> can take a closer look next week. Maybe Heiko will respond before
> then.

I will be very grateful for the ideas. I can continue to work on this =
next
week too.

Happy New Year and Merry Christmas!

Regards,
Alexander.
