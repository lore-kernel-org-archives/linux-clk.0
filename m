Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9E2C10F1B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 04:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbiL3En7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Dec 2022 23:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiL3En5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Dec 2022 23:43:57 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1115515FE8
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 20:43:57 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id j1so4601185uan.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 20:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzc2DHU2nXa3yiV9mMwKUPwKVgPRmW21x4yoJc20iDQ=;
        b=O+5j9m2EbbdN1CTgzG9n6p7QaEu/2bzOyhgVdgBnfNFK3U7HDhsFqkDYWE4gR0f0bF
         hW+O7JWn6lS6NF4XGdWV+bp450v7+1oB7HtLLlJr1EgBX79cN+aov/EQWlyE+fSdDHQP
         62aGlzXzflNwo2OGQ77bdaJSsJ7a+AI48H8A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzc2DHU2nXa3yiV9mMwKUPwKVgPRmW21x4yoJc20iDQ=;
        b=3yguBE5g0E8M3KBJEyttZDJP4k4NRifsKKrMsDkMXfjeTNHTUdmGpu//g+hOJMGA3j
         Hk8miTUxB1wg4j+KFvgw/33uBAavOEBWL6tj9opTQw2sNQvlDHQW2w0SLQe9oAetjRH3
         3N34kveZhsaWovW+ZpBYVDtUP79hnuMCmazENZ3svH2oPJeAgHkw8C7OfICJSLk3mEmC
         YICJn+Q6LHHytI2Rl23BeZHuvtUwAJKiBVHlfyEm4+X65r/WUuDDR3/BiECPyb2MxScJ
         HAH4vxX3iIsoLNtiocY+1OV+jg2GaYIV09ujpXv+H/u4wksutFIJ0+VgymVSS1a3qBFy
         Q3TA==
X-Gm-Message-State: AFqh2kouU0rid7wNwj+cJE0ssFTVR/UC9vgSHevAaFSddBcPQCR+q+k/
        gbbmd9DEAFiHurDV15g23o9n+FJdgrCJkOZZ3lXYbw==
X-Google-Smtp-Source: AMrXdXtiQs6PVwO0EZw+110kG9yVpobNEk4D1l2z90lqtFZxqIG86YeOf7CwLTDHKuMvSgSq/MqegjK/bf+r4H56iww=
X-Received: by 2002:a9f:386b:0:b0:419:1620:be75 with SMTP id
 q40-20020a9f386b000000b004191620be75mr2785460uad.78.1672375436164; Thu, 29
 Dec 2022 20:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-7-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 12:43:45 +0800
Message-ID: <CAGXv+5FPDxxSd54478+6t0r9P7ytFYn7u6H3ezi4jYU=0R2CpA@mail.gmail.com>
Subject: Re: [PATCH v2 06/23] clk: mediatek: clk-mux: Propagate struct device
 for mtk-mux
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like done for other clocks, propagate struct device for mtk mux clocks
> registered through clk-mux helpers to enable runtime pm support.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Same comment as the previous patches, could we move struct device
to the first parameter?

Otherwise this looks good to me.

ChenYu
