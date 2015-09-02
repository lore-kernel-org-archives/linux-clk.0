Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Wed, 2 Sep 2015 16:33:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Roese <sr@denx.de>, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: spear600: Fix adc clock device name
Message-ID: <20150902110353.GE26744@linux>
References: <1441190517-20235-1-git-send-email-sr@denx.de>
 <20150902110213.GD26744@linux>
MIME-Version: 1.0
In-Reply-To: <20150902110213.GD26744@linux>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 02-09-15, 16:32, Viresh Kumar wrote:
> On 02-09-15, 12:41, Stefan Roese wrote:
> > The device name for the adc clock is incorrect. This results in the
> > IIO ADC driver to fail while probing for the clock. This patch
> > fixes the name and the ADC driver is now started correctly.
> > 
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Mike Turquette <mturquette@linaro.org>
> > ---
> >  drivers/clk/spear/spear6xx_clock.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
> > index 4f649c9..3e43244 100644
> > --- a/drivers/clk/spear/spear6xx_clock.c
> > +++ b/drivers/clk/spear/spear6xx_clock.c
> > @@ -316,7 +316,7 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
> >  	/* clock derived from apb clk */
> >  	clk = clk_register_gate(NULL, "adc_clk", "apb_clk", 0, PERIP1_CLK_ENB,
> >  			ADC_CLK_ENB, 0, &_lock);
> > -	clk_register_clkdev(clk, NULL, "adc");
> > +	clk_register_clkdev(clk, NULL, "d8200000.adc");
> >  
> >  	clk = clk_register_fixed_factor(NULL, "gpio0_clk", "apb_clk", 0, 1, 1);
> >  	clk_register_clkdev(clk, NULL, "f0100000.gpio");
> 
> Sigh. Its fixed for all other boards, but this.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Sending to Mike's updated email id.

-- 
viresh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
