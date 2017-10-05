Return-Path: <sboyd@codeaurora.org>
Date: Thu, 5 Oct 2017 10:22:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Jeremy McNicoll <jeremymc@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: export clk_bulk_prepare
Message-ID: <20171005172207.GD457@codeaurora.org>
References: <20171005121301.584338-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171005121301.584338-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 10/05, Arnd Bergmann wrote:
> The ARM allmodconfig build fails in linux-next, since one

Which version of linux-next? I merged a patch for this already
and pushed it out a day or two ago.

> clk interface was accidentally never exported but is now
> used by an mmc driver:
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
