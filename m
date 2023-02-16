Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73AAC61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 07:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBPH5T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjBPH5Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 02:57:16 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C0046D4B
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:56:56 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id j18so797379vkd.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+hrs2lAK+lA6xPSkPZh7f/c9FRJJboss5C8HsTnhGs=;
        b=VgoIMVhlFRtACzCN4hRa5+1Xi3pMJaBh96u+PgzGqHoDb9prJ0ayTGydLKG6Hm8wGY
         uMEFLNL07BW38H+oSAENCKGMlLRbEGukgcjjR0+ojtyIt9a5qEblrq1HAYdspZp1cQvH
         J67LUKdKoAl3g6dyDWhm4/20YnUKxGfw3l/Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+hrs2lAK+lA6xPSkPZh7f/c9FRJJboss5C8HsTnhGs=;
        b=smSVTO9qxZMbM3/BAx3Pi/eZkV98KMft4VNCw1KMvRqqSzyizxlHRcklcwGPOCI7fH
         UwiLLIxHLjP33b04SNms9eLAiAcand4lFm2+bTkGZiOcKTMAKsbplrUzExoGrTpDW0dQ
         2YCXrfebhR9WSAM2/s5pjN4seaiNQtgiwlsTSTXdMt3ChNgioxfjppxNzBoayhpnj87c
         Oghuh75BTNveT74r/pAIajFRlwm4Lphth+zo7FYQqw0k6uiMUsdlzCQ/t9flduS7+3Ul
         WSP6OGl/dL4O7iwwOiLccb6QoI+l7tIVffPcc4Ym+Ji5bJaLdswmjda3gvmD8C8uTiHt
         L7ZQ==
X-Gm-Message-State: AO0yUKW+OQ4cQeyu91XrVbuMSrshFc2D0BAOKQRZ3uVG3M5NVfg2i2BR
        RgBLos2SD6jjFDaeUMlpQtoN1UjIrp89XiRIyzzH3w==
X-Google-Smtp-Source: AK7set8Eqn9R6ofXaO/748ltgZlu/6B9VwxQwEV+syUHvhvMASt7xjoJPSBrlG/SL+2wb0Fic8N+2YfU1QUTcbDeKso=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr780867vke.2.1676534208435; Wed, 15 Feb
 2023 23:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-13-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 15:56:37 +0800
Message-ID: <CAGXv+5HDpAY1=s6966Dzv-d5Qp1XB7F-MkwR6QiHP+DWoznkXA@mail.gmail.com>
Subject: Re: [PATCH v2 12/47] clk: mediatek: mt8365: Join top_misc_mux_gates
 and top_misc_muxes arrays
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating this driver to the simple probe mechanism,
> join the audio gates to the top_misc_mux_gates array of mtk_composite
> clocks in one top_misc_muxes array.
>
> While at it, since the `apll_i2s0_parents` array is for all i2s clocks,
> rename that to `apll_i2s_parents`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
