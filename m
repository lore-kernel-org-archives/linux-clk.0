Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 01:05:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: mvebu: Remove redundant dev_err call in
 armada_3700_periph_clock_probe()
Message-ID: <20160824080514.GZ6502@codeaurora.org>
References: <1471707065-29575-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471707065-29575-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/20, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
