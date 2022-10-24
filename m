Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62110C67871
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiJXXzh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJXXzK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:55:10 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8472E303A80
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:11:37 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id w10so1127608qvr.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wgYeHWDY557XtHMLRtUX7OPU/EboVT6jtNmcPBSKxk=;
        b=ZajeYhpsV5Zdez+eRW07mbQARwemleDED0REBwglUw+M+wDur25dSDaISM+S6b3Es6
         oup67PnJPBPwupR2R5rvogQnsFM1bfaz433n7LttMdI+qoMqLCAW0lUl/52BHps/aNW/
         4s6um2wnBIb43aYtg8TtVqliJXipK3/drfa/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wgYeHWDY557XtHMLRtUX7OPU/EboVT6jtNmcPBSKxk=;
        b=ubh6DijQnWX9cbxy2GnCYXcxiU/CRjQz0scFvJ15GtnY5uhmOBaDkTJd6f01TFdxYs
         h14LpCHDaJcQdcxyRpd26vrOd1pV+EzexWKXWKw8qlLpsRkFMxAT82CI9Md2Xl4LDvLM
         XHwN53jJ6w8PFJ3CINb/KK9EgA9Ni+0m0sGvg4afBjuX+EgEqs63poCaWgbmotWTMpbt
         IlmqlRfjgBOAmZsvKepadWTh3av0LyeMdd2E9DQpymZFmcEcVpNFCMkdZjk7FHNUwolZ
         f8qgOOB55AxiYoJPWbwU2aflNgQeLjy2CQ+CCZO0tOo2eZFxAzek2wtgjtKW1oQs3XD8
         cR7A==
X-Gm-Message-State: ACrzQf2768Q7KMUs7n4nZu7wqqeg8XqPwb7aflvhWM4rxLUwiZcAueFp
        uUtJ4iPPkw0wi5n95Ncj+vk7aG0aKJBA6U4zDvAZcSTukR6GiQ==
X-Google-Smtp-Source: AMsMyM4mB7pDUnJT5RpxnXEdEdWK0HwNgbfB+RNRZIgkDSL7pmpqSenH7TsBHZDWAklXfskjjMRaoRopr8Q8KHKkp7M=
X-Received: by 2002:a05:6102:38c9:b0:3a9:7206:b99e with SMTP id
 k9-20020a05610238c900b003a97206b99emr20722488vst.65.1666649482560; Mon, 24
 Oct 2022 15:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-10-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:11:11 -0700
Message-ID: <CAGXv+5HHAD_grwNXk-gVorY=p6DidHGqBgVHZhX5B2j5Vv-_Ew@mail.gmail.com>
Subject: Re: [PATCH 09/10] clk: mediatek: mt8186-mfg: Propagate rate changes
 to parent
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Propagate the rate changes to MFG_BG3D's parent on MT8186 to allow
> for proper GPU DVFS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
