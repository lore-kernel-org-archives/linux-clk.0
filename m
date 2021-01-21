Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09B5C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 08:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B7C023788
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 08:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbhAUIjG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 03:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbhAUIi6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 03:38:58 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC8CC0613C1
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 00:38:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m22so1391896lfg.5
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 00:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ofxkHFJGV0K/pyc9hh8EY7WRXXK9HsgD8YalPwCco98=;
        b=fNPTX1X8Cjo5AmUzgpTQ8HKiwvPWPZ+jowm37wvY+K8FaOIjhkxZOobhkF8tdfI3zH
         kagWM0920Ok33HQQPvZUgzjAkompabZ0qLMjGfJRH2j7Q+bnjyleX1azJM9lN9H3EG8R
         8uT+MNMi2OsKa1uYqKNc0InOvRdSywBV59pHejv/YmgRn5H+yDzCBQ6d3JxwfC3nr4pA
         0dk3lHpqThpp1gDvZc6gbpYzY/vu8cU4jK7NMSrZxw1vlBi7j2x3sdScrhwJio2dUkiN
         aYUqHuC19EgBLXqbDaYL99NGV1hMgjcHPzEwMrXKTuS8IWXRPVKTynFUu4gssKgKLLGK
         jSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ofxkHFJGV0K/pyc9hh8EY7WRXXK9HsgD8YalPwCco98=;
        b=epBDq6fCM2KhT/70Ib46bAFwpf+6/3EooTdauRI7XJQrFUTVMDc5u7OIrJpkA+SyEb
         IVMIFlfy5QdWrcg0/tw4PiNgs6PK4qVvekRs21C3SLcnyYKfsrgEfDJ68EhXXy4CRUdz
         WOkq7GCBPF72PtoeD3GzUjxfj5rUxKZ2fuRTQKnOlZzO4aji1x0o3/RUkNUTbUKGpmdN
         JUAUTerZn2TJcbi36ZV/FJUXRoR/gjZqJ7i1blNXobqd4RVbcqnSW7db6XqyhS4SQS6e
         k/XGTrne5A39ahlW0wUf5C2vzdRHMpGZ4DXEWlUgbssGti+EqtHzCLJPhHSygrcsS/24
         plKg==
X-Gm-Message-State: AOAM53145Np+/oQhev8Ps2NBeaDxZupfC6KhCMgrkrO7zUKRBaF8szgp
        ly+NBHuPgtiplbW6CWLxRVyfwk/IVYy7h/eKt9nMyA==
X-Google-Smtp-Source: ABdhPJzxhPOk4sH3bG6R+e8lRkFfff9viovv2dxk4LK1p6Ihkh9B93ks1aRxSY1VMNgtcKtb7HT5tmrHWR2L13p7X6Y=
X-Received: by 2002:a19:6557:: with SMTP id c23mr5668040lfj.157.1611218295607;
 Thu, 21 Jan 2021 00:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20210120131026.1721788-1-arnd@kernel.org> <20210120131026.1721788-5-arnd@kernel.org>
In-Reply-To: <20210120131026.1721788-5-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 09:38:04 +0100
Message-ID: <CACRpkdYr8BOeRsSjNfktZxCSbaMyTw4c0+R8kvox7S+Z5JVwiA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: remove u300 driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 20, 2021 at 2:10 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
