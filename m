Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:12:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
	mark.rutland@arm.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>
Subject: Re: [PATCH v2 2/4] clk: mediatek: add the option for determining PLL
 source clock
Message-ID: <20171102081205.GG11011@codeaurora.org>
References: <cover.1507174799.git.sean.wang@mediatek.com>
 <b90d46284cb527d1412352606912f5e8d18b3e53.1507174799.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <b90d46284cb527d1412352606912f5e8d18b3e53.1507174799.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/05, sean.wang@mediatek.com wrote:
> From: Chen Zhong <chen.zhong@mediatek.com>
> 
> Since the previous setup always sets the PLL using crystal 26MHz, this
> doesn't always happen in every MediaTek platform. So the patch added
> flexibility for assigning extra member for determining the PLL source
> clock.
> 
> Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
