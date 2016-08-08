Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Mon, 8 Aug 2016 23:32:20 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH] clk: Hi6220: enable stub clock driver for ARCH_HISI
Message-ID: <20160808153220.GB5285@leoy-linaro>
References: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
 <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
 <20160808064241.GA30622@leoy-linaro>
 <CAHLCerObKvK2KZRQFWk2BpjEiRSskwUNs4csMMNRQGmjHF8nhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHLCerObKvK2KZRQFWk2BpjEiRSskwUNs4csMMNRQGmjHF8nhg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 08, 2016 at 08:12:21PM +0530, Amit Kucheria wrote:

[...]

> >> > diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
> >> > index 3f537a0..9e0a95e 100644
> >> > --- a/drivers/clk/hisilicon/Kconfig
> >> > +++ b/drivers/clk/hisilicon/Kconfig
> >> > @@ -23,5 +23,6 @@ config RESET_HISI
> >> >  config STUB_CLK_HI6220
> >> >         bool "Hi6220 Stub Clock Driver"
> >> >         depends on COMMON_CLK_HI6220 && MAILBOX
> >> > +       default ARCH_HISI
> 
> Instead of forcing this up on the entire arch, why not restrict it to
> just the cpufreq driver?  ARM_HISI_ACPU_CPUFREQ?

ARM_HISI_ACPU_CPUFREQ has been removed by 3920be471ce7f "cpufreq:
hisilicon: Use generic platdev driver". By default now platforms are
using drivers/cpufreq/cpufreq-dt-platdev.c.

> >> >         help
> >> >           Build the Hisilicon Hi6220 stub clock driver.
> >> > --
> >> > 1.9.1
> >> >
