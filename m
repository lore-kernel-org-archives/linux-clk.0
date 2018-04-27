Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 15:11:37 -0500
From: Rob Herring <robh@kernel.org>
To: sean.wang@mediatek.com
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	mark.rutland@arm.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: reset: mediatek: add entry for
 Mali-450 node to refer
Message-ID: <20180427201137.it43l2gcdvsn32au@rob-hp-laptop>
References: <cover.1524816502.git.sean.wang@mediatek.com>
 <d9f327fa30c987ac9cf3a349551bbaa037d1b24a.1524816502.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d9f327fa30c987ac9cf3a349551bbaa037d1b24a.1524816502.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 27, 2018 at 04:14:45PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Just add binding for a required reset referenced by Mali-450 on MT7623
> or MT2701 SoC.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  include/dt-bindings/reset/mt2701-resets.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
