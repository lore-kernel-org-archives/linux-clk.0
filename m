Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Feb 2017 15:01:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] clk: sunxi-ng: sun9i-a80: Fix wrong pointer passed
 to PTR_ERR()
Message-ID: <20170206230131.GL25384@codeaurora.org>
References: <20170206160926.8274-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170206160926.8274-1-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/06, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: 783ab76ae553 ("clk: sunxi-ng: Add A80 Display Engine CCU")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
