Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 10:42:24 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Qiufang Dai <qiufang.dai@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] clk: meson-axg: make local symbol
 axg_gp0_params_table static
Message-ID: <20171228184224.GN7997@codeaurora.org>
References: <1514431110-98277-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514431110-98277-1-git-send-email-weiyongjun1@huawei.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/clk/meson/axg.c:260:25: warning:
>  symbol 'axg_gp0_params_table' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
