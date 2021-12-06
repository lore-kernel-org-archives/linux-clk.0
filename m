Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F41C43217
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 15:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357693AbhLFPSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:18:21 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42679 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358090AbhLFPQ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 10:16:26 -0500
Received: by mail-ua1-f51.google.com with SMTP id t13so20168001uad.9;
        Mon, 06 Dec 2021 07:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aizL4V3R6kz8WyT46b5iR9KQsWFerEJyjc+TMAAR37s=;
        b=DvSLc5ZECUpLiQNTvggoWbjgSk/Z8eowSeBgdNSTlG6SJBIAg1DRIayBz93enz828q
         0wv4rNDM8qjhTagcie7xhFZvmjPuyQuo3HaHvYzMvsZPehnRj7oKBHYyy2WOLqIA7Vb/
         PuAWm68PGY3M9qU21Pt9MtkOYU32NCraqGvbUZaKpADcPsDH9sLZNVxh76yEvRR1SC7s
         +aO0nTgiR6PMq5SFWKATGAa0DBkoHOCZ/fKDpJ2D+eyWWAOLPN6+YHCZ8vENzVBXf8+R
         JSjRw5fxl0/6vcAau8mWJ11A/DwrzhkvUAC6qKRUbvWslfxZQnS0+KlSUiGL5REGronN
         ga+w==
X-Gm-Message-State: AOAM531VVWV3I8l/wvywsT1hOpyj3Ps5YZJwwbrwF77+CSY9icsapCwD
        gqFM5pX1OgRMvUy5PP2c39i1/8Mv52QnqQ==
X-Google-Smtp-Source: ABdhPJxuhn287b6ddzQ8GQW49BAYZ8lCqCZa7SuGLKLR7gD5FO8oMIC0u0iE1DkbERc0xc0uV3eoXQ==
X-Received: by 2002:ab0:3c9f:: with SMTP id a31mr42399445uax.134.1638803576964;
        Mon, 06 Dec 2021 07:12:56 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id y22sm4223565vsy.33.2021.12.06.07.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 07:12:56 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id s1so7021332vks.9;
        Mon, 06 Dec 2021 07:12:56 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr41059573vke.33.1638803576344;
 Mon, 06 Dec 2021 07:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20211130140724.10750-1-conor.dooley@microchip.com> <20211130140724.10750-2-conor.dooley@microchip.com>
In-Reply-To: <20211130140724.10750-2-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 16:12:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXy9B5B5tW6-nJ9J0aCGjHzy1C90ObA_7A2qz_NQphq-w@mail.gmail.com>
Message-ID: <CAMuHMdXy9B5B5tW6-nJ9J0aCGjHzy1C90ObA_7A2qz_NQphq-w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        david.abdurachmanov@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 30, 2021 at 3:06 PM <conor.dooley@microchip.com> wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> Add device tree bindings for the Microchip PolarFire system
> clock controller
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
