Return-Path: <SRS0=UhmE=4G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CAAC34026
	for <linux-clk@archiver.kernel.org>; Tue, 18 Feb 2020 12:55:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D082720659
	for <linux-clk@archiver.kernel.org>; Tue, 18 Feb 2020 12:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgBRMzW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Feb 2020 07:55:22 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44370 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgBRMzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Feb 2020 07:55:22 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so19926144oia.11
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2020 04:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=wT538E2yeXhdAbLdX+E97i1bBFY4CFx+RpRhZlQ+JW0=;
        b=pA6A7Ad+gaOsldx7VMG/AIktn1mPOSrs2nVeQbU2TAiaW9dTPJiRKvt0vNBVbJfusz
         mCfMn/sWSR0OEzed+fjAB8GVMuX7aWoYfQ2ZQI+HW0avZKwzUC7O/RF1UPYWUvMukIt9
         AJ3aksfxEJr1iZA93K4Jcsj9Kyzx+9EU2jTTnz/fX59cmDFpqOoFKDVge6I2TNB7hG6w
         Dg5+L88I9nmZ4TVfeBiUpmsfzkQi3zOESBKX9fynXnAA3mYBs9F/eUcB/6nPK9t8obMe
         OjK8eqWl5NHMWYqYpIJqouDRowIS3pHn163Gnm0pqlH5DSxJTmF9tRhZbP8khu8Jc6Ex
         IXWw==
X-Gm-Message-State: APjAAAUcphJdzPS8hiBz5PBm92Qtv3knE10SfrlN6wsyylSPYTCFanb4
        AZoGru/EUMHHT6K4Ao7RTqMofVaUJanEf3f/PhQ=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mt1397002oif.54.1582030521511;
 Tue, 18 Feb 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20200218112525.5834-1-geert+renesas@glider.be>
In-Reply-To: <20200218112525.5834-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Feb 2020 13:55:00 +0100
Message-ID: <CAMuHMdVAOknhwO2J-vkRSO47uJJn873J-4mPvAMq+vQgE_nk9Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Remove use of ARCH_R8A7796
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 18, 2020 at 12:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
> CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
> ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

 ARCH_R8A7795 in the one-line summary, of course (thank you patchwork-bot ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
