Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43296C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjBGGhf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjBGGhf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:37:35 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37631E1D0
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:37:33 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id r12so2294342uan.12
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S/mLwk8/VVBrhfa6+5lxSIlHkjJ4T6hr1YCCbT0Qg1g=;
        b=LY5C6x5ALQg9snkrab2Qwr3cZyZCKjr29UMJ20Do3DosX1QBg1T8SyPYUh5MVRWGG3
         Wp1XhTO8b5Rp9tVRvWtTrvtEKQWHbZ+zHh42Dc5+pWVjr+w8WqGlpssDEbKYqe2DzwUG
         u6jsRw/taNBb9+ptSvVuAMRaVhosHowZ4F7B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/mLwk8/VVBrhfa6+5lxSIlHkjJ4T6hr1YCCbT0Qg1g=;
        b=0dA5mgrqfQjnK3JoMjRvTlAr6ObtKMw0unmTt8GmHccT3ZsdXbbjXu96O2eWO5C5L9
         ldEz/Z3xdo9xlvChPu9ng+NKOz8F3ViuR2YfZA8xqZYOx2YRy1eoRXBTnqYbz4Ce+r8r
         YmvbABclxdPmmFdcPM5nIuX6Z7LXr1w5aKue5PMOyk3KkSUoW3VepfQ6FdjJYwM1UBiI
         T4LCGu4JZETAc2uqymvLT96rsg554m17Kl5XqMUaMSDibvVyGb/Fs4h4wJnt+ASRBD2W
         1LIx1mcvzjLymcQarR6X/ZBjH3N3Hp6IZWUCVFj9vQfFiAvbGizE062XNbdBzqEEClol
         HlIg==
X-Gm-Message-State: AO0yUKUP9pEYvZ8eksMP9JP3g/1NcXr5CUHlQtCpxh6WX2evQSJ/aShd
        awvMtpz56OfxLHVq+T+Hw5JkEYCvKUAfAfl/L1QjAg==
X-Google-Smtp-Source: AK7set+s3/+EOOTwnTt+Fj5G19N6k5DByCBAznUx9q6eZUWFVvTP5z6CKbaJ/gckiNnD/GCrTc7zSZxE0rfrQjty3MA=
X-Received: by 2002:ab0:76c4:0:b0:5f0:4676:e4f1 with SMTP id
 w4-20020ab076c4000000b005f04676e4f1mr411906uaq.44.1675751853046; Mon, 06 Feb
 2023 22:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-34-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:37:22 +0800
Message-ID: <CAGXv+5FjV4WdJcjtT_VXC3W02noPC9+qVGv=FVW6UmPXSeqksQ@mail.gmail.com>
Subject: Re: [PATCH v1 33/45] clk: mediatek: Switch to module_platform_driver()
 where possible
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
> Lots of clock drivers have got both .probe() and a .remove() callbacks:
> switch from builtin_platform_driver() to module_platform_driver() so
> that we actually register the .remove() callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

[...]

>  drivers/clk/mediatek/clk-mt8195-vpp0.c         | 2 +-
>  drivers/clk/mediatek/clk-mt8195-vpp1.c         | 2 +-

These two conflict with "clk: mediatek: remove MT8195 vppsys/0/1 simple_probe".
Since the rest of the vppsys stuff has been queued up, I'd like to see
that one get merged first so we don't have two drivers matching the same
compatible string.

This conflict also causes the last "clk: mediatek: Add MODULE_DEVICE_TABLE()
where appropriate" to not apply.

ChenYu
