Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 16:44:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de,
	jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com, arnd@arndb.de,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: mediatek: group drivers under indpendent menu
Message-ID: <20171222004417.GY7997@codeaurora.org>
References: <971cc0e25dcf32e19bdc93a2bb0dec4cbda2fce7.1513741266.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <971cc0e25dcf32e19bdc93a2bb0dec4cbda2fce7.1513741266.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/20, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Getting much MediaTek clock driver have been added to CCF, so it's
> better adding the cleanup for grouping drivers under the independent
> menu to simplify configuration selection. In addition, really trivial
> fixups for typos are added in the same patch.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
