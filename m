Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD783C636D6
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjBFLOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjBFLOr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:14:47 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034D91F5D8
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:14:46 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id i38so5937999vkd.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NGHFyTcXjv8iNfdtTbr4AjszKwZaLlLqNsZLgUMcwgg=;
        b=fJi7xo7rAQpGc5beT3G6uxHlyPXbm8EBAmZGqtAxOIkhN+KOdSG+tU5L1XQLpQEo5W
         MU/qSaKWCv6/mJnTd8Izbda1mbNB6ORd4LaZFSGNNZztZ9EBnAVAqNxYm+jWsdMctk6k
         KoeLvLO9FA6MlmGsQCJPGDYJrC/aIx0cYMytQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGHFyTcXjv8iNfdtTbr4AjszKwZaLlLqNsZLgUMcwgg=;
        b=mryt8zd7CU4tF+9Fh+kaWns0CU43eI7QWZuJNUNM3mfFCsdy6EQsgag4mSBdlBbDLT
         K77whhI8+QrEYt0ROTNodbTtmMpNJi8fS/B1FZPUS0Fh6tzLDeRKZvZUrJ0Z0flbr83c
         MvhZsj+W/ogRTj/dW9KFimRVrOcV11NVWDBDJrt6gmrghX6dK5eWYk80uoMN63jMxMbN
         ZR3ltHzbGHjD0soKJsmP6rjeJ4tkn9gkj8vkX6fyPqGsRHsvbN9TQEmoqt04sw0NBKlN
         tnYRrMCo83drdSx1V+lloyZNa3WwA6DJgeRZEFR3KS4mHlOzLsSxhsMLYn/TqVUFW8lc
         avAA==
X-Gm-Message-State: AO0yUKUrnaWAzp6yqysjxisi2ayZbG7z1vJy7u5U9gBHgtplHQXXPCGu
        oas7ssVWwoPSj9FX3pLWPPjb7u10WsuBqZyYN0urBQ==
X-Google-Smtp-Source: AK7set8Q/DuqU17rY4kMXr59FonOJqAzSVrz1tGjeFvBuiw+sVUO7B//FvH662hX89b8oClO3AoUxF7YZY9Z+PrN6Ac=
X-Received: by 2002:ac5:c744:0:b0:3ea:94ea:110b with SMTP id
 b4-20020ac5c744000000b003ea94ea110bmr2750821vkn.22.1675682085091; Mon, 06 Feb
 2023 03:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-4-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-4-moudy.ho@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 6 Feb 2023 19:14:34 +0800
Message-ID: <CAGXv+5E2U+vu4ZCwUxP5zTxSrV=H9JEL5+UB6LokGcjeH+roOQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] arm64: dts: mediatek: mt8195: add MUTEX
 configuration for VPPSYS
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> In MT8195, the MMSYS has two Video Processor Pipepline Subsystems
> named VPPSYS0 and VPPSYS1, each with specific MUTEX to control
> Start of Frame(SOF) and End of Frame (EOF) signals.
> Before working with them, the addresses, interrupts, clocks and power
> domains need to be set up in dts.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Probe tested only. I assume further testing requires the MDP3 driver.
