Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD81EC3DA7C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiL3IUG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbiL3IUD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:20:03 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843A29B
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:20:02 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id a64so17141755vsc.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+TD5tjlJr06e8+hQP4RV+wiuVFoaq9bvVuc6zSOft8=;
        b=G4a6pvhRGTZ+uAMtcCdHwuA4ZgJkdJU0jDmkG/nvCkmXcgsnqXemLPhxXO81lB0TFS
         IaDgSBZQmn0uHCvucOzFxZmiyuHTZYDEjApq8AoPo5BZk4tXTbddK1FhWkx6Bw1q3VbY
         pmHVDMFoV7aKFCGuflInLWDzdHvQnj1u3NPdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+TD5tjlJr06e8+hQP4RV+wiuVFoaq9bvVuc6zSOft8=;
        b=OfPXauVvLoP2Si9OcRuFCGqNWgP2PAhuygWWJoF/LIVDwLuMZAkHf1ElZzAEmkMl3M
         hL1RXQ32XK0HiuiO/2gmwOI98zXOJcOV5gFTDdu/YXD7I4fvLhyzlWl1Xe0chohccGTt
         qZMAC6i3mlZ6UBIjCl6W7BcWQjEcpCHLKHjjhzL2RDtRsi1nkIy/g8K0N9ODtlyVhm9C
         DCNCebE07U3wS3AK/KdqWGNwqGk9TwZU68raT63RAzKdwG124aJFmvs+QdWZoszjs3Jl
         CldaGMicDIfClCV+MrmcJ0Ty049gsU1OkEiR12B2VffkQwE0r+9/8w1ShPpGQ6t30aal
         /YGA==
X-Gm-Message-State: AFqh2kqPgDnr3KZ0rmchq4Piqk42QjtfF2wVgBrXxRrw+tc8DbHwTvwt
        kR8Gx96alwcXg5L6dFTXpBTrCEqBe9OtIx+AuqNHtg==
X-Google-Smtp-Source: AMrXdXuAQ+AfcldxK29BpiQ1dOQS6okUitNiNCau3Vs0Wew3cn4017tMWvd4ZScjpCBrohBQ69zYN+UWb45AMVugflU=
X-Received: by 2002:a67:fbc2:0:b0:3cc:fb59:8c71 with SMTP id
 o2-20020a67fbc2000000b003ccfb598c71mr24039vsr.65.1672388401627; Fri, 30 Dec
 2022 00:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-18-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:19:50 +0800
Message-ID: <CAGXv+5FeUfmw9iUyS=-XhkvGueZ9uMxH8G3V_KnB-2uKy48ccA@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] clk: mediatek: clk-mt8183: Join top_aud_muxes
 and top_aud_divs
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
> Join the two to register them in one shot.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
