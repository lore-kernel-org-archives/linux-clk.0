Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:30:24 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>,
	Daniel Kurtz <djkurtz@chromium.org>, srv_heupstream@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: Move vendor's Kconfig into CCF menu section
Message-ID: <20160130003024.GA12841@codeaurora.org>
References: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/28, James Liao wrote:
> Move all vendor's Kconfig into CCF menu section to prevent
> new drivers putting their Kconfig files in a wrong place.
> 
> Some Kconigs need to modify at the same time to avoid build
> warnings.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
