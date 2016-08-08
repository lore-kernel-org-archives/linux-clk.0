Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Mon, 8 Aug 2016 14:42:41 +0800
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
Message-ID: <20160808064241.GA30622@leoy-linaro>
References: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
 <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Amit,

On Mon, Aug 08, 2016 at 11:23:31AM +0530, Amit Kucheria wrote:
> On Mon, Aug 8, 2016 at 9:07 AM, Leo Yan <leo.yan@linaro.org> wrote:
> > In current kernel config 'CONFIG_STUB_CLK_HI6220' is disabled by
> > default, as result stub clock driver has not been registered and
> > CPUFreq driver cannot work.
> 
> I have a related patch that has been pending for a while:
> https://lkml.org/lkml/2016/6/20/375 but it was tied only to the
> thermal driver.

I also have concern this patch may duplicate with yours.

> Is the stub mandatory for the architecture? Will other SoCs in the
> family will use the same stub?

I don't think stub driver is mandartory for archtitecture and it's
only used by Hi6220 on Hikey. AFAIK, currently stub driver is only used
by CPU frequency change.

The logic is:
  Thermal cooling device driver
      `-> CPUFreq DT driver
              `-> Stub clock driver

ARM is working on Hikey for EAS profiling, so usually the use case is
to enable CPUFreq driver and stub clock driver. Sometimes it only
need enable this driver without thermal driver; so this is why we
cannot rely on thermal driver to enable stub clock driver.

I'm open-minded if you have better idea to enable it.

> > This patch is to enable stub clock driver in config for ARCH_HISI.
> >
> > Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  drivers/clk/hisilicon/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
> > index 3f537a0..9e0a95e 100644
> > --- a/drivers/clk/hisilicon/Kconfig
> > +++ b/drivers/clk/hisilicon/Kconfig
> > @@ -23,5 +23,6 @@ config RESET_HISI
> >  config STUB_CLK_HI6220
> >         bool "Hi6220 Stub Clock Driver"
> >         depends on COMMON_CLK_HI6220 && MAILBOX
> > +       default ARCH_HISI
> >         help
> >           Build the Hisilicon Hi6220 stub clock driver.
> > --
> > 1.9.1
> >
