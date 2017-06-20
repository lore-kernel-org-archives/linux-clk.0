Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Tue, 20 Jun 2017 17:32:21 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mturquette@baylibre.com, shawnguo@kernel.org, Anson.Huang@nxp.com,
	ping.bai@nxp.com
Subject: Re: [PATCH 6/9] clk: imx: add composite clk support
Message-ID: <20170620093221.GE6805@b29396-OptiPlex-7040>
References: <1494856763-6543-1-git-send-email-aisheng.dong@nxp.com>
 <1494856763-6543-7-git-send-email-aisheng.dong@nxp.com>
 <20170620020013.GP4493@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170620020013.GP4493@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 19, 2017 at 07:00:13PM -0700, Stephen Boyd wrote:
> On 05/15, Dong Aisheng wrote:
> > diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> > index 51b84e4..665777e 100644
> > --- a/drivers/clk/imx/clk.h
> > +++ b/drivers/clk/imx/clk.h
> > @@ -69,6 +69,12 @@ struct clk *imx_clk_busy_mux(const char *name, void __iomem *reg, u8 shift,
> >  			     u8 width, void __iomem *busy_reg, u8 busy_shift,
> >  			     const char **parent_names, int num_parents);
> >  
> > +struct clk *imx_clk_composite(const char *name,
> > +			      const char * const *parent_names,
> > +			      int num_parents, bool mux_present,
> > +			      bool rate_present, bool gate_present,
> > +			      void __iomem *reg);
> > +
> >  struct clk *imx_clk_fixup_divider(const char *name, const char *parent,
> >  				  void __iomem *reg, u8 shift, u8 width,
> >  				  void (*fixup)(u32 *val));
> > @@ -209,5 +215,4 @@ static inline struct clk *imx_clk_mux_flags(const char *name,
> >  struct clk *imx_clk_cpu(const char *name, const char *parent_name,
> >  		struct clk *div, struct clk *mux, struct clk *pll,
> >  		struct clk *step);
> > -
> 
> Noise?
> 

Yes, got by mistake.
Will remove.

Regards
Dong Aisheng
