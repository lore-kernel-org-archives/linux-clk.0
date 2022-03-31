Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0819C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 31 Mar 2022 11:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbiCaLnB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Mar 2022 07:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiCaLmx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 07:42:53 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0701546BD;
        Thu, 31 Mar 2022 04:41:06 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id 1so19478550qke.1;
        Thu, 31 Mar 2022 04:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/ZqnW0LgKQLEY4IaJ/WNa8z5z7Yb6gZ+rRSVKouz3E=;
        b=tGCm3glpyaYG4a1m7/U7Gjcu8FtQExqat5MpnoTGLU4WtJzkrpsqR8itKG+N0jEXuV
         mBnr7UQYkrbhHaxXvXV8YwElo7jXZUuz36Si6NJAK0YxNp9dB2R0LLVKOjp+Do3aiY8d
         sZmcEncz10e6mwI/rV9hfYtej5NKIGxXXEtkxWFKmjDrBCpEhwj4CuadQOfjGpUCwa/8
         vTcJtf8kqh44v/KanuAE70Thk3yHyAtdq9QHmsVmEJj0WUlGLe3POq7BBT5G9Sbhmq1d
         P7Ujpowmidjy/3nreSx5VKdzGzMCAJgm1HqT6ANvzETOn6oVbvO9YVVxqQXWB+XqNTx2
         CJpQ==
X-Gm-Message-State: AOAM531USPCkr7zOTgNlhayWid8YUdpCg/ciKbogawn4X9I0pOM3cQvS
        JTNF2l1YmRK364bkUsJW0eYtcvWCh0qUfA==
X-Google-Smtp-Source: ABdhPJxBkTM6JICVo0P8GtvCViZoJtsZCa4Qq3ksd1oQuevbvrLrFYZdOCMkIF5nvr1TMzO3vMh4iw==
X-Received: by 2002:a05:620a:17a6:b0:67d:85e6:a86b with SMTP id ay38-20020a05620a17a600b0067d85e6a86bmr2813003qkb.771.1648726865235;
        Thu, 31 Mar 2022 04:41:05 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id bp31-20020a05622a1b9f00b002e21e80ecd8sm18789795qtb.45.2022.03.31.04.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 04:41:04 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2e5757b57caso250960537b3.4;
        Thu, 31 Mar 2022 04:41:04 -0700 (PDT)
X-Received: by 2002:a81:59c4:0:b0:2e5:c7c3:5d29 with SMTP id
 n187-20020a8159c4000000b002e5c7c35d29mr4448584ywb.512.1648726864297; Thu, 31
 Mar 2022 04:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com> <20220315154649.22343-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315154649.22343-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 13:40:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1nsyQxPTVK6v=zZBeXBE555uzTWCpCiTSDuRi__S6Hw@mail.gmail.com>
Message-ID: <CAMuHMdX1nsyQxPTVK6v=zZBeXBE555uzTWCpCiTSDuRi__S6Hw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a07g043: Add ethernet clock sources
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 15, 2022 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Ethernet reference clock can be sourced from PLL5_500 or PLL6. Add
> support for ethernet source clock selection using SEL_PLL_6_2 mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
