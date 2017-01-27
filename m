Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:04:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	James Liao <jamesjj.liao@mediatek.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	Erin Lo <erin.lo@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170127000453.GM8801@codeaurora.org>
References: <20170124130704.14015da3@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170124130704.14015da3@endymion>
List-ID: <linux-clk.vger.kernel.org>

On 01/24, Jean Delvare wrote:
> If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
> be asked individually about each sub-driver. No means no.
> 
> Additionally, this driver shouldn't be proposed at all on non-mediatek
> builds, unless build-testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Reviewed-by: Andreas Färber <afaerber@suse.de>
> Reviewed-by: James Liao <jamesjj.liao@mediatek.com>
> Cc: Shunli Wang <shunli.wang@mediatek.com>
> Cc: Erin Lo <erin.lo@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
