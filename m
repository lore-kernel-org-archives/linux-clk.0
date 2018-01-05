Return-Path: <sboyd@codeaurora.org>
Date: Fri, 5 Jan 2018 08:24:38 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] clk: meson-axg: fix potential NULL dereference in
 axg_clkc_probe()
Message-ID: <20180105162438.GB21040@codeaurora.org>
References: <1515117059-176004-1-git-send-email-weiyongjun1@huawei.com>
 <1515143370.7439.62.camel@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515143370.7439.62.camel@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, Jerome Brunet wrote:
> On Fri, 2018-01-05 at 01:50 +0000, Wei Yongjun wrote:
> > platform_get_resource() may return NULL, add proper
> > check to avoid potential NULL dereferencing.
> > 
> > This is detected by Coccinelle semantic patch.
> > 
> > @@
> > expression pdev, res, n, t, e, e1, e2;
> > @@
> > 
> > res = platform_get_resource(pdev, t, n);
> > + if (!res)
> > +   return -EINVAL;
> > ... when != res == NULL
> > e = devm_ioremap(e1, res->start, e2);
> > 
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> 
> Looks good. Thank you.
> 
> Stephen, do you prefer to take this directly ?

Yes. Will do today.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
