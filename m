Return-Path: <pdeschrijver@nvidia.com>
Date: Thu, 13 Apr 2017 16:50:45 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH] clk: Add requested rate to clock summary output
Message-ID: <20170413135045.GW30730@tbergstrom-lnx.Nvidia.com>
References: <1490188803-13034-1-git-send-email-pdeschrijver@nvidia.com>
 <20170412164856.GP7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20170412164856.GP7065@codeaurora.org>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 12, 2017 at 09:48:56AM -0700, Stephen Boyd wrote:
> On 03/22, Peter De Schrijver wrote:
> > From: Alex Frid <afrid@nvidia.com>
> > 
> > Added requested rate to clock summary output and to clock dump. This is
> > useful for clock tree debugging. Also expand the clock name field in the
> > clock tree debugfs output to provide room for deep multi-tier trees like
> > on Tegra.
> > 
> > Signed-off-by: Alex Frid <afrid@nvidia.com>
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> We should print out all the consumers (struct clks) and their
> requested rates + prepare/enable counts instead. req_rate is sort
> of an internal variable that records what the last aggregated
> rate was. I'm not sure if we want to expose that to debugfs.
> 

While this certainly would provide more information, I think it would also
make the summary quite large. Hence the just printing the aggregate rate
seems a reasonable compromise. Maybe the consumers and requested rates
can be exposed in a file in the per clock directory. The prepare and enable
counts are not maintained per consumer today, so that's not possible?

Peter.

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
