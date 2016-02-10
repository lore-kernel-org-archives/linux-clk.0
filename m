Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: James Liao <jamesjj.liao@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Rob Herring" <robh@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1454665050-37776-5-git-send-email-jamesjj.liao@mediatek.com>
Cc: "John Crispin" <blogic@openwrt.org>, "Arnd Bergmann" <arnd@arndb.de>,
 "Sascha Hauer" <kernel@pengutronix.de>,
 "Daniel Kurtz" <djkurtz@chromium.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, "Shunli Wang" <shunli.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>
References: <1454665050-37776-1-git-send-email-jamesjj.liao@mediatek.com>
 <1454665050-37776-5-git-send-email-jamesjj.liao@mediatek.com>
Message-ID: <20160210200853.26445.15165@quark.deferred.io>
Subject: Re: [PATCH v6 4/7] clk: mediatek: Add MT2701 clock support
Date: Wed, 10 Feb 2016 12:08:53 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting James Liao (2016-02-05 01:37:27)
> +CLK_OF_DECLARE(mtk_topckgen, "mediatek,mt2701-topckgen", mtk_topckgen_in=
it);
> +CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt2701-infracfg", mtk_infrasys_in=
it);
> +CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt2701-pericfg", mtk_pericfg_init);
> +CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt2701-mmsys", mtk_mmsys_init);
> +CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt2701-imgsys", mtk_imgsys_init);
> +CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt2701-vdecsys", mtk_vdecsys_init);
> +CLK_OF_DECLARE(mtk_hifsys, "mediatek,mt2701-hifsys", mtk_hifsys_init);
> +CLK_OF_DECLARE(mtk_ethsys, "mediatek,mt2701-ethsys", mtk_ethsys_init);
> +CLK_OF_DECLARE(mtk_bdpsys, "mediatek,mt2701-bdpsys", mtk_bdpsys_init);
> +CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt2701-apmixedsys",

:-/

This is way too much CLK_OF_DECLARE and not enough Linux Driver Model.

I understand that some platforms really must initialize some clocks very
early, but can we please separate those into one table and call
CLK_OF_DECLARE on only that set, and then register the rest through a
platform_driver later on?

Best regards,
Mike
