Return-Path: <al.kochet@gmail.com>
Return-Path: <al.kochet@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/2] clk: rename clk_core_get_boundaries() to clk_hw_get_boundaries() and expose
From: Alexander Kochetkov <al.kochet@gmail.com>
In-Reply-To: <20171227010638.GP7997@codeaurora.org>
Date: Thu, 28 Dec 2017 15:41:20 +0300
Cc: linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 LAK <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>
Message-Id: <4B1BB338-F1F9-4231-BDCA-5FBB1F61BC44@gmail.com>
References: <1513872282-5370-1-git-send-email-al.kochet@gmail.com> <1513872282-5370-2-git-send-email-al.kochet@gmail.com> <20171221200743.GM7997@codeaurora.org> <8EC4D15B-4A89-43FA-953E-95AF81417067@gmail.com> <20171227010638.GP7997@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Initial thread here:
https://www.spinics.net/lists/linux-clk/msg21682.html


> 27 =D0=B4=D0=B5=D0=BA. 2017 =D0=B3., =D0=B2 4:06, Stephen Boyd =
<sboyd@codeaurora.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):=

>=20
> Are these limits the min/max limits that the parent clk can
> output at? Or the min/max limits that software has constrained on
> the clk?
>=20

Don=E2=80=99t know how to answer. For example, parent can output 768MHz,
but some IP work unstable with that parent rate. This issues was =
observed by
me and I didn=E2=80=99t get official confirmation from rockchip. So, I =
limit
such clock to 192MHz using clk_set_max_rate(). May be I have to limit =
clk rate
using another approach.

Anybody from rockchip can confirm that? Or may be contact me clarifying =
details?

> I haven't looked in detail at this
> rockchip_fractional_approximation() code, but it shouldn't be
> doing the work of both the child rate determination and the
> parent rate determination in one place. It should work with the
> parent to figure out the rate the parent can provide and then
> figure out how to achieve the desired rate from there.

Here is clock tree:

        clock                       rate
        -----                       ----
        xin24m                      24000000
          pll_gpll                    768000000
             gpll                       768000000
                i2s_src              768000000
                   i2s0_pre         192000000
                      i2s0_frac     16384000
                         sclk_i2s0  16384000

I limit i2s0_pre rate to 192MHz in order to I2S IP work properly.
rockchip_fractional_approximation() get called for i2s0_frac.
if i2s0_pre rate is 20x times less than i2s0_frac, than =
rockchip_fractional_approximation()
tries to set i2s0_pre rate to i2s_src rate. It tries to increase it=E2=80=99=
s parent rate in order
to maximise relation between nominator and denominator.

If I convert rockchip_fractional_approximation() to =
rockchip_determine_rate(), than I get
min=3D0, max=3D192MHz limits inside rockchip_determine_rate(). May be =
there should be
new logic inside clk framework based on some new clk flags, that will =
provide max=3D768MHz
for rockchip_determine_rate().

Also found, that rockchip_fractional_approximation() increase parents =
rate unconditionally
without taking into account CLK_SET_RATE_PARENT flag.

Stephen, thanks a lot for deep description of determine_rate() =
background. I=E2=80=99ll taking some
time thinking about possible solutions.

Regards,
Alexander.
