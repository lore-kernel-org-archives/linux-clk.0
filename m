Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC2AC433DB
	for <linux-clk@archiver.kernel.org>; Fri, 22 Jan 2021 10:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B03C238EE
	for <linux-clk@archiver.kernel.org>; Fri, 22 Jan 2021 10:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbhAVKZL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Jan 2021 05:25:11 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:39087 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbhAVKOt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Jan 2021 05:14:49 -0500
Received: by mail-ot1-f44.google.com with SMTP id i30so4577680ota.6;
        Fri, 22 Jan 2021 02:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8EssF6du+uw1E1rDa+AbYuMfnmhdTUj5y8sfaOSS9o=;
        b=GasYpGTwY/Qs0aWAcpOMqwCL82o7G3wZkfoU2Looi/kHY4GAzKKJQfZgDkW0aFJfFT
         IdQWTqH6M1s4g960iiYxQTkwcJLKQlZFGqYAHrpd/z5wB718h/sQ2uv38cP6b0+zAbu2
         gtb0LNXrYiFwWxJBNehzQmYK0RZji3O6dEXDjREH3gsY4Rv5Y0FZ9XDlcYmmTcdVLCYn
         5luCCPJFC7HdbURUheOnLSB8b4XdHHH/fyocBXWUjeZyOZykrvu2SVYlidKLz5XJh+Fw
         H2la/H5sAdRYTwsX+HFDDAPmuexFda5pMThkqy23X0mPnISLQrMKBcqLfeVImnhJNfz/
         oYpA==
X-Gm-Message-State: AOAM531Pv//4Ocd0IR4j0jncAvIFi76r4LQtlvhB0RzQ81fDHwMIebje
        QzFCp54g6wcxZQZGJeQ87J+gy+6xRBdeLCipk9UZyA7AY2k=
X-Google-Smtp-Source: ABdhPJxFbxT0GCXDH/SzRhqEqk7YhC8mhJUGAhyLxPXK0nbdqurWbRqAnsrHr4e3U+i+1lwpsALX4G6ZzYjBXAw+t8k=
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr2772152otr.145.1611310414558;
 Fri, 22 Jan 2021 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com> <20210121095420.5023-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121095420.5023-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:13:23 +0100
Message-ID: <CAMuHMdUKHq7t2VNCzqnM18jecq9baPhKEzOKStnrmwnti33i5w@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] arm64: dts: renesas: Add I2C0,1,6 support for
 falcon board
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 21, 2021 at 10:56 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * enabled busses 0,1,6 (the ones with devices attached)
> * moved to falcon-cpu.dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 as
"arm64: dts: renesas: falcon: Add I2C0,1,6 support".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
