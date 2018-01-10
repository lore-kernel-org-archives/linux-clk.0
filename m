Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:19:34 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: aspeed: Fix return value check in
 aspeed_cc_init()
Message-ID: <20180110211934.GN21040@codeaurora.org>
References: <1515116461-156320-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515116461-156320-1-git-send-email-weiyongjun1@huawei.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, Wei Yongjun wrote:
> In case of error, the function of_iomap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: a2e230c7b2ea ("clk: Add clock driver for ASPEED BMC SoCs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Same comment for this. I suspect coccinelle is finding this but
the semantic patch is not in the kernel repo?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
