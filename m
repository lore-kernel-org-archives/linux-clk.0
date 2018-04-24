Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 09:37:59 -0500
From: Rob Herring <robh@kernel.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie,
	matthias.bgg@gmail.com, mark.rutland@arm.com,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: gpu: mali-utgard: add
 mediatek,mt7623-mali compatible
Message-ID: <20180424143759.tyveqnfxtkmanosn@rob-hp-laptop>
References: <cover.1524044917.git.sean.wang@mediatek.com>
 <831e85ebdfdaba3c7b05ac8407a1584c20ba4a86.1524044917.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <831e85ebdfdaba3c7b05ac8407a1584c20ba4a86.1524044917.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 18, 2018 at 06:24:53PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> The MediaTek MT7623 SoC contains a Mali-450, so add a compatible for it
> and define its own vendor-specific properties.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
