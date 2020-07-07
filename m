Return-Path: <SRS0=f0oj=AS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4F2C433DF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jul 2020 11:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D89B20739
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jul 2020 11:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYzj/o6y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgGGLj0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgGGLj0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jul 2020 07:39:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B820C08C5DF
        for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2020 04:39:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t25so44898495lji.12
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2020 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
        b=NYzj/o6y2s9Z+eCQgmRYfSgsgU7i2HsuCMcPIod16JgB0/R/Bp8K5TCpEG+jy+bcgs
         ZeWixYF2ok3de8HvQOPk2q8rgIBZzWFC0mNPOVLWT6rbSD+GQswrYk/COzA1BzWJTS0y
         drlNb9cBsjk6f3wweib0e8CQxPQBi+sIlqBDP8H9T9s4aZi38GCvzy1ivpwPO1RFCqDw
         TjSHlhqypVPuC7Pb0P50dC7mEjFGIXvCXjSG/GQxWvFPcZ++jU5mQN6Ide3Q+e/v2VlF
         reom+VCXprUs4I5+pCDFnZNjMgq7tRgBCHRMqtD75VEibK88tGJtAMoDnCZipsfMypao
         zqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
        b=B7+1YUF9U44D+TZgeCeL9JBJ7UkvcqFhV6J1XNydXv5p0u8EZyP0jQnXcNdIoF7kZY
         tiDi7ootA1CPsq0DiWDcjbmf/P3g4qUoIbOaBZ0k+5U4wbCOmSycHGBT4s1bDY72ZSJk
         COAI+feIGF5HRdL4SvjmEeEN5ioQe5SAzw47neezOxIf3AD1YCnUGeIgTMlb8Di7ufSo
         jXaypEzQdnDi4EK11ctcYadLwkr6u7o17EyE1fQg94ZMU3QE+N0u2JJ4tkpaWIC/XI6R
         pRVgYsE+aYYXwbEyxz4l2P50kZw16Fu6Am0Qgag1mGOHp+FIjfJXJ5/1D13JJVfQTk7A
         KQAA==
X-Gm-Message-State: AOAM533IuN0Zyj04wi380WgPZAfkqgypKOO+0Vii6wIHQlDoDpYVYaAR
        c4gPCDNlVc8Mz1mKno7eKa7a5tWi1XkmhIrKpnXJVA==
X-Google-Smtp-Source: ABdhPJzaNV7qDX5ofVny2CYGichkvvyZwwCuYiY/DXFU9tcXKWyULk7QdWCDcj7Zwb2TtLbaWFduqFOHtHKtVZ06ol4=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15946172ljg.100.1594121963989;
 Tue, 07 Jul 2020 04:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:39:13 +0200
Message-ID: <CACRpkdZAjwcHURd6wCQPrjHjEgiEiUApqVUff+70nwjRPyAwBw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] pinctrl: mediatek: update pinmux definitions for mt6779
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>

Patch applied.

Yours,
Linus Walleij
