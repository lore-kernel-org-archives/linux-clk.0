Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Jacob Chen <jacobchen110@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, zhangqing@rock-chips.com, Xing Zheng <zhengxing@rock-chips.com>, Jacob Chen <jacob-chen@iotwrt.com>
Subject: Re: [PATCH v2 3/3] clk: rockchip: rk3288: make all niu clocks critical
Date: Sun, 22 Jan 2017 13:07:53 +0100
Message-ID: <4474818.6v0yI33TyK@phil>
In-Reply-To: <CAFLEztTwyjqz0-2LriDp2WAyPR-g28RZT3VPA5vfSK5SSHTx8Q@mail.gmail.com>
References: <1484718161-27702-1-git-send-email-jacob-chen@iotwrt.com> <1484718161-27702-3-git-send-email-jacob-chen@iotwrt.com> <CAFLEztTwyjqz0-2LriDp2WAyPR-g28RZT3VPA5vfSK5SSHTx8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Sonntag, 22. Januar 2017, 17:02:17 CET schrieb Jacob Chen:
> 2017-01-18 13:42 GMT+08:00 Jacob Chen <jacob-chen@iotwrt.com>:
> > NIU clocks are related to the interconnect and it's important to other
> > blocks. Since we don't have a driver to handle it, we should always
> > enable it to avoid casually close.
> > 
> > Make all of them critical,so that we don't have to each clock on its own
> > once things break.
> > 
> > Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>
> > ---
> > 
> >  drivers/clk/rockchip/clk-rk3288.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/rockchip/clk-rk3288.c
> > b/drivers/clk/rockchip/clk-rk3288.c index 3d02aa2..c50386c 100644
> > --- a/drivers/clk/rockchip/clk-rk3288.c
> > +++ b/drivers/clk/rockchip/clk-rk3288.c
> > @@ -808,8 +808,15 @@ static struct rockchip_clk_branch
> > rk3288_clk_branches[] __initdata = {> 
> >  static const char *const rk3288_critical_clocks[] __initconst = {
> >  
> >         "aclk_cpu",
> >         "aclk_peri",
> > 
> > +       "aclk_peri_niu",
> > +       "aclk_vio0_niu",
> > +       "aclk_vio1_niu",
> > +       "aclk_rga_niu",
> > 
> >         "hclk_peri",
> > 
> > +       "hclk_vio_niu",
> > +       "pclk_alive_niu",
> > 
> >         "pclk_pd_pmu",
> > 
> > +       "pclk_pmu_niu",
> > 
> >  };
> >  
> >  static void __iomem *rk3288_cru_base;
> > 
> > --
> > 2.7.4
> 
> I just got an another bug that caused by closed niu clock.
> Making niu clock always enabled is really useful, it could save me a
> lot of time.....
> 
> I just wonder why we don't do that before.  Would it have great impact
> on power consumption?

The niu clocks so far seemed to rely on the CLK_IGNORE_UNUSED flag. So all was 
well as long as nothing changed in the clock tree above those and I guess with 
more supported peripherals, some now make changes to the more common clocks 
and thus disable the nui clocks by accident.
