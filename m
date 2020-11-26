Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066ECC56202
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 16:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB9AE21741
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 16:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WjDINmeA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391437AbgKZQmC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 11:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391361AbgKZQmC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 11:42:02 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E23C0617A7
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 08:42:01 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so3016282wme.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=v5wyIhDUOH2agq/x4cg8x2Wwtde7ho+Gjeh3QXf9gbE=;
        b=WjDINmeAfuyLwhVMnUMkS63eEhCvuYmnexSvPb4HPPNCvT20gVuwNTlIooBUfimO0X
         DsC9VQn/Y2ppGj7a5WEco41limooaxAdrRHNy1q4wP201MMP64/GByUXXIK7qbVmmkeN
         YCAR5K/ToDAJ3ofKUysI5lo4zXywfAUr5n0tIf/l8iofsySPLzCmrXG7y6T+CDrt0r6H
         tusi/vo2AVKY3m6g66HQmWdCB3Lzi1RhYSCyrWBIKGSnI7nr8Wl5s8rbWpVrzFIM2CEf
         TYtc/9v7nNpI/S3xem7HSvh3Au7ejkLb7r7CSYlchdb9x12JPFOTyiF03a3dPfSCkKCY
         oLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=v5wyIhDUOH2agq/x4cg8x2Wwtde7ho+Gjeh3QXf9gbE=;
        b=AE2ixNjKWduyxV7Wlyc0Wou0Q4vanWvEHbhSjzAR6EDSy6wD4gUhkSv9FI3qP+T2a3
         QuqO3QFIgJR9/xIZyiRauOlsGnpiXYiHT40tpbczopb2F/rXpUxlVsq1Z7ILJWEBw5Ql
         rFYbq1Z0X9Y9CCbHHh3dQKNeNWHlB92TCqy4OMDmyQdA2wSPpW3ddnWb+oI4xG1dOcXv
         aH2XzI9z18x1ma09G84PQCLHKG3Jwy2LxKhFFnf/1QSb0VjxdA/pgnew9DDAPup0n3uP
         ljCOfnMAdczdXqgsSlTmY72nE/nLm296ghz2fyX55/5KX2wEH16XwJ8xr14ADqhvovNc
         SO/Q==
X-Gm-Message-State: AOAM531AXkkFAzd7v+AlCVo69jSlu11htiNyN3rxHzb+6OVSTiNGF5Dm
        pZlGoZNZb6b9L+7gHHGARfngPw==
X-Google-Smtp-Source: ABdhPJzrDpc/4cZPXo1+i+uc6IDMIE98gACt8UkwYjpI0h+ejw9io3H5nFPd20XxRiMX9KO8y+04sQ==
X-Received: by 2002:a1c:b402:: with SMTP id d2mr4345453wmf.38.1606408920466;
        Thu, 26 Nov 2020 08:42:00 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id a14sm9596885wmj.40.2020.11.26.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 08:41:59 -0800 (PST)
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
In-reply-to: <20201126141600.2084586-1-narmstrong@baylibre.com>
Message-ID: <1j5z5sysrt.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 26 Nov 2020 17:41:58 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 26 Nov 2020 at 15:15, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This serie adss the MIPI DSI Host Pixel Clock used to feed the DSI pixel
> clock to the DSI Host controller.
>
> Unlike the AXG SoC, the DSI Pixel Clock has a supplementary mux, divider and gate
> stage before feeding the pixel clock to the MIPI DSI Host controller.
>
> Changes since v1 at [1]:
> - switch g12a_mipi_dsi_pxclk_sel flags to CLK_SET_RATE_NO_REPARENT
> - fix aligment of g12a_mipi_dsi_pxclk_div & g12a_mipi_dsi_pxclk parent_hws
>
> [1] https://lore.kernel.org/r/20201123163811.353444-1-narmstrong@baylibre.com
>
> Neil Armstrong (2):
>   dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>   clk: meson: g12a: add MIPI DSI Host Pixel Clock
>
>  drivers/clk/meson/g12a.c              | 74 +++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |  3 +-
>  include/dt-bindings/clock/g12a-clkc.h |  2 +
>  3 files changed, 78 insertions(+), 1 deletion(-)

Applied, Thx
