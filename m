Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DE8C77B7F
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 13:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbjEHNGN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 09:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNGM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 09:06:12 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2377EB3;
        Mon,  8 May 2023 06:06:11 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a44a2637bso66843667b3.2;
        Mon, 08 May 2023 06:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551170; x=1686143170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sd9+twaj+RB0M0pmh2VaaClvtKIhAj9F7sjdY05FZ20=;
        b=XDWcoz0zDoiOjMIx7Em9sZHXF6v79+y9Pg+FCOeBPkPMnq3dyOa0Pr88/cG1wzlim0
         Nur6uY3Get0NysuogSmyJM4WD88s6rfuRU86K5K1QfoQXRWdN65Hgw5ztYTpowkmaRI8
         S8FAXphjgfSUubG9ev4di7L5CSpHVn2jjupbKko7ZMfU2XltR7ymLWIqRPTUVvrX+gvK
         MGq5qDgjBV9MQ2hOeGdm7zmgcSQiDKHAqtDKCDvY57NvIwzPa/9ZGNryW0LVGJDDYLNq
         dg5+o79vqI2WkFsb9k4qCalqPne3f2FuvQRMxcIkr6/DDywTwjv7qRlcW69MYoIcAh+s
         1Irw==
X-Gm-Message-State: AC+VfDzCo/CuzUWSVm8oXKnBt3G0Wz12NPJ03uxQfJcNucV80TW3s+Ep
        +qTNCaPfSNPRx0V+Q2zQsoLwHXqbycL94g==
X-Google-Smtp-Source: ACHHUZ5RyrT6Z+hYbjHUXhKLLrEMTP0h5YwezuwueK9qoz86HiGNTaneRk+Phbv5C3lW62jIiUL+cw==
X-Received: by 2002:a81:a106:0:b0:55a:2cdb:55c9 with SMTP id y6-20020a81a106000000b0055a2cdb55c9mr10301313ywg.3.1683551170013;
        Mon, 08 May 2023 06:06:10 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o138-20020a0dcc90000000b0054fb931adefsm2500916ywd.4.2023.05.08.06.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:06:09 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55a44a2637bso66843157b3.2;
        Mon, 08 May 2023 06:06:09 -0700 (PDT)
X-Received: by 2002:a25:db07:0:b0:b8f:62b7:e03c with SMTP id
 g7-20020a25db07000000b00b8f62b7e03cmr11713538ybf.1.1683551168990; Mon, 08 May
 2023 06:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org> <20230507133906.15061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507133906.15061-3-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:05:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW34j2dq+frYCOw9a8F+sbNpWsEw4NJRbadeFQPnSH+8A@mail.gmail.com>
Message-ID: <CAMuHMdW34j2dq+frYCOw9a8F+sbNpWsEw4NJRbadeFQPnSH+8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: rs9: Fix .driver_data content in i2c_device_id
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, May 7, 2023 at 3:39 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible = "renesas,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'
>
> Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
