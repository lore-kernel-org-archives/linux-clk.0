Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Jun 2017 13:41:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mturquette@baylibre.com, shawnguo@kernel.org, Anson.Huang@nxp.com,
	ping.bai@nxp.com
Subject: Re: [PATCH 9/9] clk: imx: add imx7ulp clk driver
Message-ID: <20170620204152.GS4493@codeaurora.org>
References: <1494856763-6543-1-git-send-email-aisheng.dong@nxp.com>
 <1494856763-6543-10-git-send-email-aisheng.dong@nxp.com>
 <20170620020119.GQ4493@codeaurora.org>
 <20170620094256.GF6805@b29396-OptiPlex-7040>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170620094256.GF6805@b29396-OptiPlex-7040>
List-ID: <linux-clk.vger.kernel.org>

On 06/20, Dong Aisheng wrote:
> On Mon, Jun 19, 2017 at 07:01:19PM -0700, Stephen Boyd wrote:
> > 
> > Any reason why it can't be a platform driver? If not, please add
> > some comment explaining why.
> > 
> 
> Timer is using it at early stage. GIC seems not although standard
> binding claim possible clock requirement.
> Others still not sure.
> 
> What your suggestion?
> Convert timer to platform driver and make clock as platform driver as well?
> 

The timer can't be a platform driver because it would be too
late. The clock driver could register whatever clks are required
for the timer/GIC in a CLK_OF_DECLARE_DRIVER hook, and then leave
the rest to a platform driver. This way we get some of the device
driver framework in this code.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
