Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FDDC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 08:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242411AbiFIIoW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242436AbiFIInA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 04:43:00 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5CEF6F;
        Thu,  9 Jun 2022 01:41:13 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id a184so13697356qkg.5;
        Thu, 09 Jun 2022 01:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M4fbvg4+7mZxGqgX0/rSfvFWe/Uwj0QhWrczwxwmPXk=;
        b=165IlljCoX7s5/LyOeeXlfYSB1dgqll28J/qdzOfYjRnVjWDCIPUPWrJ3KLSUzT2/l
         DYxYKrxVm9FXq6+6avS+dO6gte3ws+AOzwul9Rr52Loct2zga/Gjeo2AiFHgqrV2bkZ0
         n5WwfuU/Qn2+SweyTFvhenUYerwPEniesbYNohAW6fb3bm9ZrzyI0xZl8FA3uBMHhLS1
         4KKjgJ6/bMbMx8DDSrNbuDQaLcWdY+O9C4N+PPc6yZbWh25nm3/D/sGXC66JteNQ6tra
         8TpzQGkAWPBFmt02C366RlPn9dz/ejAP3XEdNlSYY8tXHVYRzlguDdLnK+1uKfTDifCN
         +u9A==
X-Gm-Message-State: AOAM5313Kj8YE0l+ZD1Yp90R1oP37l6sQ3R8EEZa7sgL/5iAt8ghxuYt
        lVsYd5OAPgTLSMnKm+GmjciiGD8DImSLeg==
X-Google-Smtp-Source: ABdhPJx9hBqwb6zBD7uXxqpAL/w0JNmgQjbRci/UijJj9OV7CzxYb0x5NzmTEiidBSGqkj/aeL5oBQ==
X-Received: by 2002:a05:620a:4086:b0:6a6:f8b3:6eed with SMTP id f6-20020a05620a408600b006a6f8b36eedmr6288321qko.777.1654764072420;
        Thu, 09 Jun 2022 01:41:12 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i187-20020a3786c4000000b0069fc13ce1fesm17841687qkd.47.2022.06.09.01.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:41:12 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id w2so40598908ybi.7;
        Thu, 09 Jun 2022 01:41:11 -0700 (PDT)
X-Received: by 2002:a25:cc53:0:b0:65c:b19c:fac1 with SMTP id
 l80-20020a25cc53000000b0065cb19cfac1mr37098351ybf.89.1654764071719; Thu, 09
 Jun 2022 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220603233437.21819-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603233437.21819-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 10:41:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURJ2oDym6ga=DtjE88ioC6hxb8+5mDi_LQ=XnVjcLUuw@mail.gmail.com>
Message-ID: <CAMuHMdURJ2oDym6ga=DtjE88ioC6hxb8+5mDi_LQ=XnVjcLUuw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779f0: Add SDHI0 clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Wolfram,

On Mon, Jun 6, 2022 at 7:05 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

> DTS patches will come soon. eMMC works fine, SD still needs to be
> tested.

Note that SD0H is not yet supported by this driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
