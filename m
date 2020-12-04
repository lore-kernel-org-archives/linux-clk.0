Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4A8C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Dec 2020 15:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C180E22B45
	for <linux-clk@archiver.kernel.org>; Fri,  4 Dec 2020 15:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgLDPUx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgLDPUw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Dec 2020 10:20:52 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2617C061A4F
        for <linux-clk@vger.kernel.org>; Fri,  4 Dec 2020 07:20:04 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id e7so5679262wrv.6
        for <linux-clk@vger.kernel.org>; Fri, 04 Dec 2020 07:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=Ut70wCtSDVM0bqYgXmAgggZNWzyipgwqsdsGJjhBqoQ=;
        b=j4C2JWHolEMbY0cQbERLHnxvJk+PT3gMBltNmTpp3rYpDIej3Bb6bDE4eSmsNb0zb7
         cgUKN/Hnxcr9mgckn2z4BsjsVL8KpQWYJnxiekJACFwon2uwu+LdO9FfY76kxy1MUYiG
         hUx+1cPmHCF9Cuf1TkbJsz11keCVoYMRNRUqFaGwnkjh8rUs9VvTzvYJQnn8BkHYB2JV
         zDH38s8cPZfhvgOQvBJ1B5qwpejKesaIfXbHqSImXRoyCXwRXZSXGyg6uWP6LK1qkg5g
         dURcOaHyPnXRrpZpW/AKMgE1c1BuIVI/3plmDWR+a5g/WTcoXA5RCNk1/yX2zNHqLCR1
         WwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=Ut70wCtSDVM0bqYgXmAgggZNWzyipgwqsdsGJjhBqoQ=;
        b=uU9ktfTygRA3/Pn9T62p6FHr1WzHLa0zzanxB6j6eL2svC8oDgOKIu4qSmc1BhnEsR
         ZfDMVScScgYCpU8HOPUpOuI415HW5FyqSM8MmaJAkC1204XmZAQOWq7YHk1EHaP6qneT
         fp+VDxSPySXjYjnF4P6bmXW8QCl8p2UGn25uoU6QS4dLrUE6hZInTdhqC8XCOceM/Otv
         0aImG9ZCc5kGXRnk69uSKNap63TRtHCZTiomPUW3ANH8qgQezGY9/BWt+DNuBQNQPolU
         YOYXRe3f09ETzNVeeCvV3gW9ja+onx7zAKyoSQ3T1BmabX+f3SX1x1/42wQvHv8UkRp5
         mT0A==
X-Gm-Message-State: AOAM5321yJCJZE3OqT0ysgqgQ5dM+dNeTpnSIB1oIj90zi/PRKC+59O7
        nildxieG9H+4ut0AkbZX7oGrAw==
X-Google-Smtp-Source: ABdhPJw0nUCfvQkmwhontRyFojOjTf3y9u3sd2tlbcu+vv1/3tZWslLF+HrOfUfmrNuKtCH1C0AZKA==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr5516583wrl.34.1607095203236;
        Fri, 04 Dec 2020 07:20:03 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id n123sm3685801wmn.7.2020.12.04.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 07:20:02 -0800 (PST)
References: <20201203222706.992440-1-arnd@kernel.org>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: select COMMON_CLK_MESON_VID_PLL_DIV
In-reply-to: <20201203222706.992440-1-arnd@kernel.org>
Message-ID: <1ja6utppi6.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 04 Dec 2020 16:20:01 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 03 Dec 2020 at 23:26, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, a g12a-only config produces a link error:
>
> aarch64-linux-ld: drivers/clk/meson/g12a.o:(.data+0xcb68): undefined reference to `meson_vid_pll_div_ro_ops'
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

Thanks for sending this fix.

Same change has already been applied:
https://patchwork.kernel.org/project/linux-clk/patch/20201118190930.34352-1-khilman@baylibre.com/

It was part of my last PR to Stephen

Jerome

> ---
>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..9a8a548d839d 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_AO_CLKC
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2

