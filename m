Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@codeaurora.org,
 sean.wang@mediatek.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <cd26a3bdc9f29e237089395fbba93e28549ddf25.1519874655.git.sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 stable@vger.kernel.org
References: <cd26a3bdc9f29e237089395fbba93e28549ddf25.1519874655.git.sean.wang@mediatek.com>
Message-ID: <152149113631.242365.14902026013263544653@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: add binding for fixed-factor
 clock axisel_d4
Date: Mon, 19 Mar 2018 13:25:36 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting sean.wang@mediatek.com (2018-02-28 19:27:50)
> From: Sean Wang <sean.wang@mediatek.com>
> =

> Just add binding for a fixed-factor clock axisel_d4, which would be
> referenced by PWM devices on MT7623 or MT2701 SoC.
> =

> Cc: stable@vger.kernel.org
> Fixes: 1de9b21633d6 ("clk: mediatek: Add dt-bindings for MT2701 clocks")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> ---

Applied to clk-next
