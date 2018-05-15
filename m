Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ryder Lee <ryder.lee@mediatek.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <dc75b5b289d1f6e4914e60543c2611f387f0c164.1523944160.git.ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        chunhui dai <chunhui.dai@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Ryder Lee <ryder.lee@mediatek.com>
References: <dc75b5b289d1f6e4914e60543c2611f387f0c164.1523944160.git.ryder.lee@mediatek.com>
Message-ID: <152642274258.237094.4546092795485779715@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v1] clk: mediatek: correct the clocks for MT2701 HDMI PHY module
Date: Tue, 15 May 2018 15:19:02 -0700
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ryder Lee (2018-04-17 05:30:27)
> The hdmitx_dig_cts clock signal is not a child of clk26m,
> and the actual output of the PLL block is derived from
> the tvdpll via a configurable PLL post-divider.
> =

> It is used as the PLL reference input to the HDMI PHY module.
> =

> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Chunhui Dai <chunhui.dai@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---

Applied to clk-next
