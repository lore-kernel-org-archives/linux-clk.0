Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 sean.wang@mediatek.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <7365f2286ff2cebcfb590715cb4a15dedd089046.1518895232.git.sean.wang@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <cover.1518895232.git.sean.wang@mediatek.com>
 <7365f2286ff2cebcfb590715cb4a15dedd089046.1518895232.git.sean.wang@mediatek.com>
Message-ID: <152123261872.225550.10226809804986023416@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: clock: mediatek: add missing required
 #reset-cells
Date: Fri, 16 Mar 2018 13:36:58 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting sean.wang@mediatek.com (2018-02-17 11:54:36)
> From: Sean Wang <sean.wang@mediatek.com>
> =

> All ethsys, pciesys and ssusbsys internally include reset controller, so
> explicitly add back these missing cell definitions to related bindings
> and examples.
> =

> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
