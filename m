Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FA3C67871
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJXX6S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbiJXX5s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:57:48 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD28340C83
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:12:58 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id c31so930673uae.10
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+gEm7VONyS7UVuTvPLRkcNvl41HQoqLdSHbzsMHTSs=;
        b=L3OSNOGMw4rOVmweIhebxGViBIgNhvyR7qzGaKgUw7RRl//uC1ARvYqlv1B6DAI1BS
         m5BT0qCELCZs/zAsS7JKiewTklsvv+bD/SVebEh2sCIBcm0zyOhHgrqmM58CUBQ2nHAm
         fOPt9JPgaFukt2vCQv1bnnfXkmpIpv6g4q6O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+gEm7VONyS7UVuTvPLRkcNvl41HQoqLdSHbzsMHTSs=;
        b=0QfsniVH8nnXtynalTLMDNAUxYdqdkpHEGm4uWs9C/x6rpYRMkzm2Mwn3zvLRgjfpr
         cWqklITaiGAB8+yb2M2jvwvuQ1//TfFjiy/hFjOhWLs7lTVwrbiXR3Fyn7wZH/AQRyfl
         wKq/5yjjZDa5bYKSvZjMLgIi2w1qVVvPbOy7qawBYSLAX0IvQtURxxQmo8sSYgBYDh/6
         tL9//zNfzBZxYY8hPxF5IQc4hwKOa+3TgoAD6lgwYZOCKlmzaGwzoAy0xU2+HzWxtrq/
         7FoYmtkBp3OtaHxa1R0gZrv0IULwCUJhYU2+OA/L2U1UWumt+V7vnwivmKPVGQIXqPnF
         ORIA==
X-Gm-Message-State: ACrzQf0Ut5CnVYug8YfrPDGmHjmRvpn/wTsGYnRm3NpMtDl1R6OtJWGo
        cJpx0ajepEFQ58c2mNWB5LHlOfv76xWW5NhgjGLYKw==
X-Google-Smtp-Source: AMsMyM5HAWHqJDUUEN4IizBWaZrMz7exN/+WucGtaa+xWdXV1aB7+frNt8M+3SYIkfMvqtKI2U2+EXEtnsKLuJ2uOgQ=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr20097126uas.43.1666649577519; Mon, 24
 Oct 2022 15:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-11-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:12:46 -0700
Message-ID: <CAGXv+5HoMAyLJ=25weerEsHNUt-pZj1E7Aj-mWvM+hoCvovpOA@mail.gmail.com>
Subject: Re: [PATCH 10/10] clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier
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
> Following the changes done to MT8183, MT8192, MT8195, register a
> clock notifier for MT8186, allowing safe clockrate updates for the
> MFG PLL.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
