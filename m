Return-Path: <boris.brezillon@bootlin.com>
Date: Thu, 8 Feb 2018 18:49:35 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Warren
 <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Mike Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: bcm2835: De-assert/assert PLL reset signal
 when appropriate
Message-ID: <20180208184935.126eec48@bbrezillon>
In-Reply-To: <87po5f5x7l.fsf@anholt.net>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
	<20180208134338.24590-3-boris.brezillon@bootlin.com>
	<87po5f5x7l.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Thu, 08 Feb 2018 15:15:42 +0000
Eric Anholt <eric@anholt.net> wrote:

> Boris Brezillon <boris.brezillon@bootlin.com> writes:
> 
> > In order to enable a PLL, not only the PLL has to be powered up and
> > locked, but you also have to de-assert the reset signal. The last part
> > was missing. Add it so PLLs that were not enabled by the FW/bootloader
> > can be enabled from Linux.
> >
> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/clk/bcm/clk-bcm2835.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> > index a07f6451694a..6c5d4a8e426c 100644
> > --- a/drivers/clk/bcm/clk-bcm2835.c
> > +++ b/drivers/clk/bcm/clk-bcm2835.c
> > @@ -602,6 +602,9 @@ static void bcm2835_pll_off(struct clk_hw *hw)
> >  	const struct bcm2835_pll_data *data = pll->data;
> >  
> >  	spin_lock(&cprman->regs_lock);
> > +	cprman_write(cprman, data->a2w_ctrl_reg,
> > +		     cprman_read(cprman, data->a2w_ctrl_reg) &
> > +		     ~A2W_PLL_CTRL_PRST_DISABLE);
> >  	cprman_write(cprman, data->cm_ctrl_reg,
> >  		     cprman_read(cprman, data->cm_ctrl_reg) |
> >  		     CM_PLL_ANARST);  
> 
> For turning off, the FW just does the equivalent of:
> 
> 	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
> 	cprman_write(cprman, data->a2w_ctrl_reg, A2W_PLL_CTRL_PWRDN);
> 
> How about we do that, instead?

Agreed.

> 
> > @@ -640,6 +643,10 @@ static int bcm2835_pll_on(struct clk_hw *hw)
> >  		cpu_relax();
> >  	}
> >  
> > +	cprman_write(cprman, data->a2w_ctrl_reg,
> > +		     cprman_read(cprman, data->a2w_ctrl_reg) |
> > +		     A2W_PLL_CTRL_PRST_DISABLE);
> > +
> >  	return 0;
> >  }  
> 
> I agree with this hunk -- they drop PRST at the very end, after lock.



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
