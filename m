Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:05:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: zx296718: use builtin_platform_driver to
 simplify the code
Message-ID: <20160916230517.GV7243@codeaurora.org>
References: <1474031011-6700-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474031011-6700-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Use the builtin_platform_driver() macro to make the code simpler.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
