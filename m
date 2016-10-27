Return-Path: <sboyd@codeaurora.org>
Date: Thu, 27 Oct 2016 16:33:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Loc Ho <lho@apm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: xgene: Don't call __pa on ioremaped address
Message-ID: <20161027233344.GF26139@codeaurora.org>
References: <1477610508-7449-1-git-send-email-labbott@redhat.com>
 <ccea4ce8-5607-c164-f90a-291075bcc13e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <ccea4ce8-5607-c164-f90a-291075bcc13e@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/27, Laura Abbott wrote:
> On 10/27/2016 04:21 PM, Laura Abbott wrote:
> >
> >@@ -269,7 +267,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
> > 		xgene_clk_write(data, pclk->param.csr_reg +
> > 					pclk->param.reg_csr_offset);
> > 		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
> 
> Bah, this got fixed locally but didn't get amended. I'll remove
> the format here in a v2 assuming there are no other objections.
> 

Include a Fixes: tag too? It would be nice if sparse complained
about __pa used on an __iomem pointer too.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
