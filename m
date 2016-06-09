Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 9 Jun 2016 12:12:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
	broonie@kernel.org, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Subject: Re: [RESEND PATCH v5 1/5] mfd: RK808: Add RK818 support
Message-ID: <20160609111201.GA1388@dell>
References: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
 <20160608141735.GE14888@dell>
 <5759277D.7090101@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <5759277D.7090101@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

On Thu, 09 Jun 2016, Wadim Egorov wrote:
> On 08.06.2016 16:17, Lee Jones wrote:
> > On Thu, 02 Jun 2016, Wadim Egorov wrote:
> >
> >> The RK818 chip is a power management IC for multimedia and handheld
> > "Power Management IC (PMIC)"
> >
> >> devices. It contains the following components:
> >>
> >> - Regulators
> >> - RTC
> >> - Clkout
> > Clocking
> >
> >> - battery support
> > Battery support
> >
> >> Both chips RK808 and RK818 are using a similar register map.
> > "Both RK808 ad RK818 chips"
> >
> >> So we can reuse the RTC and Clkout functionality.
> > Swap '.' for ','.
> >
> >> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> >> ---
> >>  drivers/mfd/Kconfig       |   4 +-
> >>  drivers/mfd/rk808.c       | 231 ++++++++++++++++++++++++++++++++++++++--------
> >>  include/linux/mfd/rk808.h | 162 ++++++++++++++++++++++++++++++--
> >>  3 files changed, 350 insertions(+), 47 deletions(-)

[...]

> >> -struct rk808_reg_data {
> >> -	int addr;
> >> -	int mask;
> >> -	int value;
> >> -};
> > Why are you moving this to the header?
> 
> It is now part of the rk808 struct.

Why?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
