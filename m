Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Sun, 12 Jun 2016 19:52:04 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	anson.huang@nxp.com, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/11] clk: imx6ul: fix pll clock parents
Message-ID: <20160612115204.GB32690@shlinux2>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
 <1465396420-27064-7-git-send-email-aisheng.dong@nxp.com>
 <20160612114353.GE20243@tiger>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160612114353.GE20243@tiger>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jun 12, 2016 at 07:43:53PM +0800, Shawn Guo wrote:
> On Wed, Jun 08, 2016 at 10:33:36PM +0800, Dong Aisheng wrote:
> > pllx_bypass_src mux shouldn't be the parent of pllx clock
> > since it's only valid when when pllx BYPASS bit is set.
> > Thus it is actually one parent of pllx_bypass only.
> > 
> > Instead, pllx parent should be fixed to osc according to
> > reference manual.
> > Other plls have the same issue.
> > 
> > e.g. before fix, the pll tree is:
> > osc                                      6            6    24000000          0 0
> >    pll1_bypass_src                       0            0    24000000          0 0
> >       pll1                               0            0   792000000          0 0
> >          pll1_bypass                     0            0   792000000          0 0
> >             pll1_sys                     0            0   792000000          0 0
> > 
> > After the fix, it's:
> > osc                                      6            6    24000000          0 0
> >    pll1                                  0            0   792000000          0 0
> >       pll1_bypass                        0            0   792000000          0 0
> >          pll1_sys                        0            0   792000000          0 0
> > 
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> I squashed 7 ~ 11 into one patch and applied it, thanks.
> 

I'm fine.
Thanks

Regards
Dong Aisheng

> Shawn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
