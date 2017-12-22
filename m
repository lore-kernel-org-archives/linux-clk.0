Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Fri, 22 Dec 2017 10:54:48 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mturquette@baylibre.com, shawnguo@kernel.org, Anson.Huang@nxp.com,
	ping.bai@nxp.com
Subject: Re: [PATCH V2 02/10] clk: reparent orphans after critical clocks
 enabled
Message-ID: <20171222025448.GC24403@b29396-OptiPlex-7040>
References: <1499946435-7177-1-git-send-email-aisheng.dong@nxp.com>
 <1499946435-7177-3-git-send-email-aisheng.dong@nxp.com>
 <20171102073609.GT30645@codeaurora.org>
 <20171220143322.GC30461@b29396-OptiPlex-7040>
 <20171221183233.GK7997@codeaurora.org>
 <20171222015507.GE7997@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171222015507.GE7997@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Dec 21, 2017 at 05:55:07PM -0800, Stephen Boyd wrote:
> On 12/21, Stephen Boyd wrote:
> > 
> > Ok. Great. I'm going to apply this patch now into clk-next to
> > look for regressions on other platforms. If this was the only
> > questionable thing about this series then I think I can apply the
> > rest of it without you needing to resend. I'll check today.
> > 
> 
> I pushed it into clk-imx7ulp and merged that into clk-next. You
> can use that patch in your series.
> 

Okay, great.

Thanks

Regards
Dong Aisheng
