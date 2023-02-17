Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BC9C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBQEKk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjBQEKg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:10:36 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8044C3D5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:10:35 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id v16so3176400vss.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=biYLXd6zLKOEnttLE3/cOU8elHlE+31ZWmdhQJR3c0g=;
        b=jXG1EnjySiZNlkImd2oRt2F05M1sX6iZ+1TAE3lOLJ18zaa8kVvrNECMIzjAeVEjdM
         ewMQHA5biBEwJzBbqHS9+OtOnca2urVimkY1pRAtermRsdwgkAILk7H4tPYzM+c1u7+I
         2lg2c1k2PE7GOjl4zEwclFgZOxcMG35sHFHIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biYLXd6zLKOEnttLE3/cOU8elHlE+31ZWmdhQJR3c0g=;
        b=inoMRt0WuRLff2DCnecyoEZt98wfB0llGERiz56IUDedxEYWaogVRunGy6QUN/MP/E
         B77LgrzKOJ/VzC1BktOVGpLnn+lXzrvgCIRt1Jps71j1F13Bx7CkcLmqJFNBrxF3BEuS
         QGMDzrO425S67Fj/dBphsyInmAt/vP3h4SWnEReackbCeK49mctaqoSo5Z6E2ZIUUcjO
         xSV8hzAYo8Q00OHVgd85mGiX0D0htB6Ho5fI0dzVYpISVGv3c1MQ7cfG+DwOpZBogdu8
         fbVyF4n30WInEJUnVSITNIiNxKWkKVp8116ZYoQY36rWyx/RKEZQAVyj5U1ROKyuyZK7
         yvGg==
X-Gm-Message-State: AO0yUKXYu36BdtAC8ZqCi8Z1gERLbU45A1OmKHLQ1m2lzgSJrJJIiNms
        e4//YXB355YuXLhHVvwUcP364tcGUAH6ZZbWIqqm8g==
X-Google-Smtp-Source: AK7set88DOusSbZcPo23P4TEtI/y5yijtupuoFWWF6867RetZ53dzqg0jKJ0+NELE4AX7JEyQJcRvQvZ7O2nrBwZax0=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1524838vso.60.1676607034730; Thu, 16 Feb
 2023 20:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-31-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:10:23 +0800
Message-ID: <CAGXv+5G+QXoG__8bSDcQxOUDThcQGpaVZoQy7h-BN_GASq8y+Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/47] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
