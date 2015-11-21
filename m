Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 17:05:01 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ray Jui <rjui@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	Simran Rai <ssimran@broadcom.com>
Subject: Re: [PATCH 2/3] clk: iproc: Add support for Cygnus audio clocks
Message-ID: <20151121010501.GA19156@codeaurora.org>
References: <1447870089-2382-1-git-send-email-rjui@broadcom.com>
 <1447870089-2382-3-git-send-email-rjui@broadcom.com>
 <20151121002119.GA28998@codeaurora.org>
 <564FC186.5010608@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <564FC186.5010608@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Ray Jui wrote:
> 
> 
> On 11/20/2015 4:21 PM, Stephen Boyd wrote:
> >On 11/18, Ray Jui wrote:
> >>diff --git a/drivers/clk/bcm/clk-iproc.h b/drivers/clk/bcm/clk-iproc.h
> >>index 8988de7..e2a7748 100644
> >>--- a/drivers/clk/bcm/clk-iproc.h
> >>+++ b/drivers/clk/bcm/clk-iproc.h
> >>@@ -194,5 +215,11 @@ void __init iproc_asiu_setup(struct device_node *node,
> >>  			     const struct iproc_asiu_div *div,
> >>  			     const struct iproc_asiu_gate *gate,
> >>  			     unsigned int num_clks);
> >>+void __init iproc_audiopll_clk_setup(struct device_node *node,
> >>+				const struct iproc_pll_ctrl *pll_ctrl,
> >>+				const struct iproc_pll_vco_param *vco,
> >>+				unsigned int num_vco_entries,
> >>+				const struct iproc_clk_ctrl *clk_ctrl,
> >>+				unsigned int num_clks);
> >
> >We don't need __init in header files. And is this even used or
> >defined anywhere?
> >
> 
> Does it make more sense if I add an incremental patch to remove all
> of the __init in this header?

That patch is welcome.

> 
> Ah, this is a mistake. cygnus_audiopll_clk_init is already defined
> in clk-cygnus.c and is meant to call iproc_pll_clk_setup to set up
> the clock. iproc_pll_clk_setup is already declared in this header.
> 
> iproc_audiopll_clk_setup should be removed here.
> 

Ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
