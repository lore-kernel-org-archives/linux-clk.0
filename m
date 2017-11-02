Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:12:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
	mark.rutland@arm.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>
Subject: Re: [PATCH v2 3/4] clk: mediatek: add clock support for MT7622 SoC
Message-ID: <20171102081203.GF11011@codeaurora.org>
References: <cover.1507174799.git.sean.wang@mediatek.com>
 <9d8aa50c0e9f45e7a7fbb3e0682e7d8ed72a0205.1507174799.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9d8aa50c0e9f45e7a7fbb3e0682e7d8ed72a0205.1507174799.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/05, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add all supported clocks exported from every susbystem found on MT7622 SoC
> such as topckgen, apmixedsys, infracfg, pericfg , pciessys, ssusbsys,
> ethsys and audsys.
> 
> Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
