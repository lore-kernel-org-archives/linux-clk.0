Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1515143370.7439.62.camel@baylibre.com>
Subject: Re: [PATCH -next] clk: meson-axg: fix potential NULL dereference in
 axg_clkc_probe()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin
 Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Fri, 05 Jan 2018 10:09:30 +0100
In-Reply-To: <1515117059-176004-1-git-send-email-weiyongjun1@huawei.com>
References: <1515117059-176004-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-01-05 at 01:50 +0000, Wei Yongjun wrote:
> platform_get_resource() may return NULL, add proper
> check to avoid potential NULL dereferencing.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res == NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Looks good. Thank you.

Stephen, do you prefer to take this directly ?
