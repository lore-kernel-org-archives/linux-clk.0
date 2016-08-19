Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 17:15:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Daniel Kurtz <djkurtz@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v10 1/9] clk: mediatek: remove __init from clk
 registration functions
Message-ID: <20160819001544.GP361@codeaurora.org>
References: <1471332629-15722-1-git-send-email-erin.lo@mediatek.com>
 <1471332629-15722-2-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471332629-15722-2-git-send-email-erin.lo@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Erin Lo wrote:
> From: James Liao <jamesjj.liao@mediatek.com>
> 
> Remove __init from functions that will be used by init functions
> that support probe deferral.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
