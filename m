Return-Path: <SRS0=uTOl=2M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2543EC3F68F
	for <linux-clk@archiver.kernel.org>; Sun, 22 Dec 2019 21:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E33692067C
	for <linux-clk@archiver.kernel.org>; Sun, 22 Dec 2019 21:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGUL+a5u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLVVqR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Dec 2019 16:46:17 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33163 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfLVVqR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Dec 2019 16:46:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so7912604lji.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2019 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZcIx7YpLr2GwG1ykVTlz7FG4UCDs7xiMGT6P40VL1Y=;
        b=xGUL+a5u2gNC7SD0yWthky38reNximiBmWxb5GMQlJr0b68gxhdUcWlSx+AdIaWiZq
         lsTN2EET85KoV1VZ+i8H3+8IhZKRu+UyC7Bw5E33r/4AiGQ4Nmfx9UwBnUC6Tl4e34zq
         qntZymmiOFubmoHVXwHKS5HoMXI0CLHMeCTfQPDXtDQdSS/Dpz7cBZyDBsUBT+X+3Vw/
         2tRBlyh5rkFo+SnxDe8x4b0pY1hhYNFJLkZ75gaWMPpmy9gl/KU3nTo15TUSsQP807jb
         9++E5s6r6cDIfZd3ltXcdYzGrfTdMjRD2b2wQ+Xrz0Ry0YnhRBMsB0YiZllB9S9dS0Bi
         GyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZcIx7YpLr2GwG1ykVTlz7FG4UCDs7xiMGT6P40VL1Y=;
        b=OpmsAwL8vrM7Uci/BkkXZg0Y92JNO+1Fn6LaxuV8V43aGID/d+2oxDVWcZZ/2ofGa7
         X9wpRPEsygJly2oQCtp4ZpNrUs8bmxUZMb2ZTr+U0fm8wFNzDhm0hkAk1S4YUmc1C2Sw
         z1ja18+MvI2duBQkjhpDJO1TfPAP/A0xxBG93Ehh6mKowro3t8RAXDUcEwbX507NGPUB
         C3YJX8cp9OnvjZPDAaU4aJ1Wcm8ipxg1AMF4Z/Nx/WUvxjFpdgleZ8xiRG5nWVDcjX0Y
         8yAM5gUBIJbYk2b0lhXi7NkYEqDr2z+FB23JENFMMvHX6L/OQXqn8SAkF7MqoGdLRlXm
         GbcQ==
X-Gm-Message-State: APjAAAU2Sg6ZzXCEpaMNegfRV5+Lnr7SzSGS18T8ibjyZanSFN7++oWa
        tqjYAuElyuggJBFZQTd0+AILCYaFd0c0uG47wkvazg==
X-Google-Smtp-Source: APXvYqziys8v4+MXOKTrDhKWcQ63s2cCMUVMradsUfyZNvEam8bNdMnrJ3z7gBEOnq5Fn5RWbh0I/CiFLIqBie187iE=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr16499195ljm.218.1577051175068;
 Sun, 22 Dec 2019 13:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20191222202928.14142-1-linus.walleij@linaro.org>
In-Reply-To: <20191222202928.14142-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 22 Dec 2019 22:46:03 +0100
Message-ID: <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: Initialize DSI clocks before registering
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Dec 22, 2019 at 9:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The DSI clocks need to be initialized properly and cannot
> rely on boot defaults, this is especially important for the
> U8420 SYSCLK variant of the PRCMU firmware which requires
> that you poke these registers right before trying to use
> the HS DSI clock. Some vital setup such as the PRCM_TVCLK_MGT
> register will not happen unless we call this making some
> displays fail to work on the U8420.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Sorry I got lost in the macros for CLK_MGT_ENTRY
that does poke these registers including PRCM_TVCLK_MGT.

I need to figure out what is actually going wrong with the
DSI clocks here.

Yours,
Linus Walleij
