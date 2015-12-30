Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: James Liao <jamesjj.liao@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1451456865-44139-6-git-send-email-jamesjj.liao@mediatek.com>
Cc: "Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 Shunli Wang" <shunli.wang@mediatek.com>, p.zabel@pengutronix.de
References: <1451456865-44139-1-git-send-email-jamesjj.liao@mediatek.com>
 <1451456865-44139-6-git-send-email-jamesjj.liao@mediatek.com>
Message-ID: <20151230235122.19557.8409@quark.deferred.io>
Subject: Re: [PATCH 5/5] reset: mediatek: mt2701 reset driver
Date: Wed, 30 Dec 2015 15:51:22 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi James,

Quoting James Liao (2015-12-29 22:27:45)
> From: Shunli Wang <shunli.wang@mediatek.com>
> =

> In infrasys and perifsys, there are many reset
> control bits for kinds of modules. These bits are
> used as actual reset controllers to be registered
> into kernel's generic reset controller framework.
> =

> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>

I'm repeating myself here: please Cc Philipp for reset patches (even if
the code lands in drivers/clk). Also, where is the DT binding
description for the mediatek,mt2701-infracfg compatible string?

Regards,
Mike

> ---
>  drivers/clk/mediatek/clk-mt2701.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk=
-mt2701.c
> index 2acc8c3..802ab5c 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -666,6 +666,8 @@ static void __init mtk_infrasys_init(struct device_no=
de *node)
>         if (r)
>                 pr_err("%s(): could not register clock provider: %d\n",
>                         __func__, r);
> +
> +       mtk_register_reset_controller(node, 2, 0x30);
>  }
>  CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt2701-infracfg", mtk_infrasys_in=
it);
>  =

> @@ -783,6 +785,8 @@ static void __init mtk_pericfg_init(struct device_nod=
e *node)
>         if (r)
>                 pr_err("%s(): could not register clock provider: %d\n",
>                         __func__, r);
> +
> +       mtk_register_reset_controller(node, 2, 0x0);
>  }
>  CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt2701-pericfg", mtk_pericfg_init);
>  =

> -- =

> 1.9.1
>=20
