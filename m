Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096AEC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C387421D79
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbhADLoK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbhADLoK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 06:44:10 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93865C061794
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 03:43:29 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id r5so26968748eda.12
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 03:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=jsQiv7cqKQrSj23j2G0kt6dWNWQkHHnDW/6TeXSTB6Q=;
        b=vHbUmqWI85jcwU/YZBtf+CTTbe8UempEi5UCoJs0Ja1Q9sTILX4QZpqu0AdrImXUtL
         MDppO3UN6vFDSeERlmX+dvoCNHHbLp+5T4OPwv81x5ogJU+/U4QdWP6AlygXtQ/ohseW
         yCa+l5ewdXhkM4kVwz5N475I7feEFEVPfx5dbq3kfyh2SeAjkCQsWQuvfZ2bgZ3PNl4X
         7Ju/zcZSlVggCQItJEhW5GWud96kKs9fG0FfMpnVw5LK71p6X3Ny+Vf8Wz/J9QhQZG46
         U05gejwRXZePz83QiF9FEw0AC/A3snns++n+9hWMbaDqW6ugm+lJPLwjJJ5nAl8EjHeC
         194w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=jsQiv7cqKQrSj23j2G0kt6dWNWQkHHnDW/6TeXSTB6Q=;
        b=DOXN9H/QouJ1BkRitpggGOCxfAqpLuWaCvOAqS64Mxc/g1yHuKDbKpywJfs8sMWDPf
         EsQ4T5VEhbWOWyr763C2kBzFFJ6/mPLwRabsZes/L5blK/dzafX6CbbbvZ40a6YWdbGF
         ECoK0oBLzFxZ2inuxEP/PjYF+JTzSbYfZ/bjNyCpjDb24o/0V9Ms9OLri5nAezVVE0+O
         8ESFFzmkGwAOXspmfP8k0K7/gzE+rIjCfMOQN6TFw147kNCtYgAqmwcxQIkD+EIGg6un
         Vu9eAprYH4Rw3DHB1YpHEB2M3FzYyYCwlZM7V6agjC3rmCkpxUEP8t8CczwVx6kiN/Cp
         Q3IA==
X-Gm-Message-State: AOAM530bltO9PZeY+uR2FS+zn2uXm6sy5nmsBSqkTxHeF9mZb1opUHxK
        pu3vHtyWxaAshZ9EIVNmGs0pwg==
X-Google-Smtp-Source: ABdhPJzYKRRnB7KPDJCGg14sKuBusAL0e/wFDhro0DqKxc4vzJIBbCO1KQ8x6pq9q47v9j2Cc12bmg==
X-Received: by 2002:aa7:dc0d:: with SMTP id b13mr70450856edu.170.1609760608380;
        Mon, 04 Jan 2021 03:43:28 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id f13sm23221758ejf.42.2021.01.04.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:43:27 -0800 (PST)
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: meson: three small clk-pll fixes
In-reply-to: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jzh1pvsf4.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 12:43:27 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 26 Dec 2020 at 13:15, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> while working on some changes for the 32-bit SoCs I hit a corner-case
> in the HDMI PLL: there's some rate doubling going. The PLL only locks
> in a specific rate range but the M/N table is not aware of that. This
> means for now (I am planning to fix that) that we can end up in a 
> ituation where the PLL doesn't lock and meson_clk_pll_set_rate() is
> supposed to still behave in this case. So here's three small patches
> for that.
>
> For me it's fine to queue these patches for -next. I am not aware of
> any breakage upstream, only some of my pending patches prefer to have
> these fixes.
>
> Slightly unrelated: if you know anything about that clock doubling then
> please let me know!
>
>
> Best regards,
> Martin
>
>
> Martin Blumenstingl (3):
>   clk: meson: clk-pll: fix initializing the old rate (fallback) for a
>     PLL
>   clk: meson: clk-pll: make "ret" a signed integer
>   clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
>
>  drivers/clk/meson/clk-pll.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, Thx
