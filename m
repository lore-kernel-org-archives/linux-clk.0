Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1451986291.3391.5.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] reset: mediatek: mt2701 reset controller
 dt-binding file
From: Philipp Zabel <p.zabel@pengutronix.de>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
	srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Daniel Kurtz
	 <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, Shunli Wang
	 <shunli.wang@mediatek.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Tue, 05 Jan 2016 10:31:31 +0100
In-Reply-To: <1451975422-31174-6-git-send-email-jamesjj.liao@mediatek.com>
References: <1451975422-31174-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1451975422-31174-6-git-send-email-jamesjj.liao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, den 05.01.2016, 14:30 +0800 schrieb James Liao:
> From: Shunli Wang <shunli.wang@mediatek.com>
> 
> Dt-binding file about reset controller is used to provide
> kinds of definition, which is referenced by dts file and
> IC-specified reset controller driver code.
> 
> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> ---
>  .../dt-bindings/reset-controller/mt2701-resets.h   | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt2701-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt2701-resets.h b/include/dt-bindings/reset-controller/mt2701-resets.h

No new files in include/dt-bindings/reset-controller, please.
This should go into include/dt-bindings/reset.

regards
Philipp
