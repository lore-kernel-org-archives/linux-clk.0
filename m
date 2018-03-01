Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 1 Mar 2018 16:41:51 -0600
From: Rob Herring <robh@kernel.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	srv_heupstream@mediatek.com
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: update MT2712 power dt-bindings
Message-ID: <20180301224151.bl3syre32pqfcsls@rob-hp-laptop>
References: <20180222054851.26096-1-weiyi.lu@mediatek.com>
 <20180222054851.26096-3-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180222054851.26096-3-weiyi.lu@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 22, 2018 at 01:48:47PM +0800, Weiyi Lu wrote:
> Add new power domains(MFG_SC1/MFG_SC2/MFG_SC3)
> for MT2712 according to ECO design change.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  include/dt-bindings/power/mt2712-power.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
