Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Sep 2016 16:34:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: zx: register ZX296718 clocks
Message-ID: <20160902233402.GN12510@codeaurora.org>
References: <1469800698-9374-1-git-send-email-jun.nie@linaro.org>
 <1469800698-9374-2-git-send-email-jun.nie@linaro.org>
 <CABymUCP9dQnyYQLQgAr0AX-f69+co_Mnd=jmQqgN56G9KueN+Q@mail.gmail.com>
 <CABymUCPo2yNsLCjtX1uqZoNESLtUV0P4D8T8e6adONi8z46fiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CABymUCPo2yNsLCjtX1uqZoNESLtUV0P4D8T8e6adONi8z46fiQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/01, Jun Nie wrote:
> 
> Mike & Stephen,
> 
> Do you have any comments on version 2 patches? Thank you!
> 

Can this be moved to be a platform driver instead of using
CLK_OF_DECLARE? Unless there are some clks required for timers or
interrupt controllers it should be possible.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
