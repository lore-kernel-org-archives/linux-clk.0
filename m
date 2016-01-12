Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1452594132.4292.17.camel@pengutronix.de>
Subject: Re: [PATCH v3 6/6] reset: mediatek: Add MT2701 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, John
 Crispin <blogic@openwrt.org>, Sascha Hauer <kernel@pengutronix.de>, Daniel
 Kurtz <djkurtz@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Shunli Wang <shunli.wang@mediatek.com>
Date: Tue, 12 Jan 2016 11:22:12 +0100
In-Reply-To: <1452587470-61506-7-git-send-email-jamesjj.liao@mediatek.com>
References: <1452587470-61506-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1452587470-61506-7-git-send-email-jamesjj.liao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, den 12.01.2016, 16:31 +0800 schrieb James Liao:
> From: Shunli Wang <shunli.wang@mediatek.com>
> 
> In infrasys and perifsys, there are many reset
> control bits for kinds of modules. These bits are
> used as actual reset controllers to be registered
> into kernel's generic reset controller framework.
> 
> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
