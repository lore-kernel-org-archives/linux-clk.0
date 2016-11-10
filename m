Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Nov 2016 14:08:49 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next] clk: tegra: dfll: Use builtin_platform_driver to
 simplify the code
Message-ID: <20161110220849.GH16026@codeaurora.org>
References: <1478791224-21510-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1478791224-21510-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/10, Wei Yongjun wrote:
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
