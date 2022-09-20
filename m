Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D421C54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 20 Sep 2022 12:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiITMWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Sep 2022 08:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiITMWW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 08:22:22 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F86373901;
        Tue, 20 Sep 2022 05:22:21 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 16E066601F6E;
        Tue, 20 Sep 2022 13:22:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663676540;
        bh=d5C1UKHSt0P8rgevUzVZlIrzp+iptSFeKnmBaNqfAx8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mF9gZIO1aOqTgoLykkQMAflYNNiPZ8Oi5tMxaUkgST6FrWwxKo0ySbVOkiqVJgwDf
         xxDg3pYhlMSk1qFHx8IKPXyLyLnZ+qSl/lQWWn/xlNa+WqGINMfEyTBURD3ElpMbPw
         YyaJth9oSYylURi12Sy9farhIOhhAoiP7dtbNBbhUDRJUYsVAsm3y/YbtOJLnppu6z
         v5IAbVSxy8GY3Mbl+d9K8AO1QP/tlIosQZSU0O2iJ47USgJqW0+YNST8sU/wXu54D4
         Otwcaxki2aVvSJaH2DVEowJaxn5Mw16sia808+hpc7ZBYIOdnbZ5F1zcBhmNPual0P
         uaDsHHZ0mDk5g==
Message-ID: <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
Date:   Tue, 20 Sep 2022 14:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-16-4844816c9808@baylibre.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-16-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..91212b7610e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,7 +15,10 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/reset.h>
>   #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>   
>   #include <video/videomode.h>
>   
> @@ -66,10 +69,14 @@ struct mtk_dpi {
>   	struct drm_bridge *next_bridge;
>   	struct drm_connector *connector;
>   	void __iomem *regs;
> +	struct reset_control *reset_ctl;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>   	struct clk *pixel_clk;
> +	struct clk *dpi_sel_clk;
>   	struct clk *tvd_clk;
> +	struct clk *hdmi_cg;


You're adding new clocks and then you're making *all clocks*, including the
already existing ones... optional.

That looks seriously odd.... can you please give a devicetree example for
MT8195 in the next version, perhaps in the cover letter?

Would also make it easier to test this entire big series.

Regards,
Angelo

