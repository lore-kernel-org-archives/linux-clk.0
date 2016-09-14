Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 11:14:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, carlo@caione.org,
	khilman@baylibre.com, serveralex@gmail.com,
	paul.gortmaker@windriver.com, Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH -next] meson: clk: Use builtin_platform_driver to
 simplify the code
Message-ID: <20160914181438.GN7243@codeaurora.org>
References: <1473508969-2776-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473508969-2776-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/10, Wei Yongjun wrote:
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
