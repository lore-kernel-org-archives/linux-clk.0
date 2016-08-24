Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 10:29:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH -next] clk: meson: Fix invalid use of sizeof in
 gxbb_aoclkc_probe()
Message-ID: <20160824172944.GA19826@codeaurora.org>
References: <1471882101-22347-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471882101-22347-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
