Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD22C636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 07:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjBGHmB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 02:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBGHmA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 02:42:00 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71C11207F
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 23:41:58 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id p10so15370643vsu.5
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 23:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uE0lGWdZyaZYupVoOlPc1Zzyv3h7cBesFWJPqSmSYqY=;
        b=XkJJ3Db/SnE0rTwTjvm7kiwHg1jTNa6/sChwMPAfAoHFHUBcSkNQVW2wPOvDVvnUFq
         X4WtiwT4iCyATTTR2FnqpM0kMuRmYS4I9C5PDmsu+hDfgYN+hB6p8u8n8K6wRLLU6BXH
         Mb4iySy/MNNKv+ovIpmhm2orDnz8GsGELbSKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uE0lGWdZyaZYupVoOlPc1Zzyv3h7cBesFWJPqSmSYqY=;
        b=eSCU+ulu//AE6+U2mJOsiO+0g7AKd4FOjTTyURYlhpvk6E80xhkVahtMDsx91nGaao
         2IdQ92Vgo88YKTAQRzXcwXGC5EmlD/VqAzy/K8lpHSYK10ykAPJqqtUI0vWfpz9FtmBX
         e2Wkof8tf8HQJV1Fhw8nfr0ZFoKRAc3Qw1KYXDjIItVKB2eGCfHya19p20gDvw/iIfzF
         Hgjxl7Mg6doENgNgzHpH6lMV2ShwYtnI9Y+ztqO2s5bcbfJ8aUM6QB/qHjo/nXSP58po
         joUyahIhQWBYkamrCdc1QmtzYkLTTsWJM/aLeUGOpKASlp/+eYMuvplcKfvP4XXhrlP3
         yXAg==
X-Gm-Message-State: AO0yUKVnJ1hJ/f1tjKm8E2RieXKm+8pF8dv1px5fxz7idmPqFf/CrjPq
        103w3QawlyxNN6avG5k7T4dTN/2TbqGzqfB/SCK3dg==
X-Google-Smtp-Source: AK7set+kp6yHndnEUWIKB4JnL60A6AS13GOVY3G3Vgsc9VlQgdDNPhv+dM/MOrBQx1MpjfxXUixa6oykjRd2tTyPAkE=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr598975vsv.85.1675755717868; Mon, 06 Feb
 2023 23:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-16-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 15:41:46 +0800
Message-ID: <CAGXv+5Fs+UtPgcjZXkhwBU=+HTv89o=xgk4cmsrFLB3FpQdNYw@mail.gmail.com>
Subject: Re: [PATCH v1 15/45] clk: mediatek: mt8167: Remove __initconst
 annotation from arrays
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
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The clock arrays are not used only during init but also during
> runtime: drop the __initconst annotation.

This should be squashed into the next patch, as by itself this one doesn't
make sense. That or the commit message should worded as if this is preparing
the drivers for the subsequent conversion to proper platform drivers.

Code changes look OK.


ChenYu
