Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 14:29:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH -next] clk: gxbb: use builtin_platform_driver to simplify
 the code
Message-ID: <20160815212958.GF361@codeaurora.org>
References: <1470664520-9604-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470664520-9604-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/08, Wei Yongjun wrote:
> Use the builtin_platform_driver() macro to make the code simpler.
> 
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
