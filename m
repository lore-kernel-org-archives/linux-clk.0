Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF1CC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 13:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19FA96101E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 13:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239692AbhHJN2c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 09:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238788AbhHJN2b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 09:28:31 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F20AC06179A
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 06:28:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g30so9255959lfv.4
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 06:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txwmknRtly19dwG2TwLijdSUyS9aLwYWp1obTuXBfoc=;
        b=uZbA+1J935R3usprafc8LRUQw8doPbVfcapR1X2WEhOvM+EX7M63d5ZsO0VAvsVNZS
         xc3FivfT6ubgZbfMXKz52jSnsZIMXiSe+40kgwcbMhimzux+MtLWI03TsIxYPR8J+FXy
         Fg5ItgR5ZgUAVtjsevhX75vxMeq6H4bInYp3SkK3AbY468I630NCUa9R16uQJpzFZaVl
         wSQXu0x1FHzzpXqhzKbQ58q8eGA3P6T88AslMArgdP9Yv7k4KPId9rJKhKVQ0lnvZMgF
         JJiyC3XFKOXLI7k7TQbwnJZ6QDbjb2mbVHMVLbZcReEvjhfrU1stahisnFI79GDgAQW9
         +JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txwmknRtly19dwG2TwLijdSUyS9aLwYWp1obTuXBfoc=;
        b=ifYKqZT130Njym5VXu25B13zvKSv+kuvy+KFdnVD1blRgG3+nIezj19E3+28GrnKoF
         84AnXT0xs4j1wFpSWQpGIotOxPBisPeknNirS15Fdlr8U2JhCgzlQN1selSUtoLguhAm
         WjYSJH2PTXDQfORoQi2owr1bcR5ztZUVrfToZRcBk7BCSx4SiysTTpjvAfbqUsDUER08
         9Y9lY3ICaDq/sWcK0Ndv9gp1Zzm9kbqzBC2ffExIpOu9cCemfh71Clzt+N23UC+nfcv+
         MjABpZJ8FefyGLxiWf0xFcZKIUkUYn/nv2JTtLPIQZipkWJeMRTvYVP2E/ckAdyVw8Ox
         qDBA==
X-Gm-Message-State: AOAM530I7Ck+Uk/oYLMra6T66GUVmtCHcYxOY1UtnIzBvq3gnxUh6jUF
        MIouN2qBUJIAi0B+SNpJZfUHb9VDHj0R1dCCZMQ54Q==
X-Google-Smtp-Source: ABdhPJwobs4y7d/rU3nBa6u5h3FCXzTiFu5hBR5q/ktt76N9parIbFxpmpXXOJKBBwsROkKpvYnYcohfRvGFRZM7pmY=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr22073687lfd.529.1628602087498;
 Tue, 10 Aug 2021 06:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com> <20210723022543.4095-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20210723022543.4095-7-jiaxun.yang@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:27:56 +0200
Message-ID: <CACRpkdYVcCW2yD_Xva+cog7i5C=YokMw+52i7iq0Nj2vVbWacA@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] pinctrl: pistachio: Make it as an option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 23, 2021 at 4:26 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> So it will be avilable for generic MIPS kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v3: Depend on OF as well

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
