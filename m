Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681EFC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49C3360E09
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbhG0Ei0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbhG0EiZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:38:25 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91595C061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:38:25 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m1so16068221pjv.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hCM6aDqQlj672QNNN33XxbB1KA2gsQSovUNFK/0sjFg=;
        b=DrDU/26Z3jIjjNMzkvdGR9rNb1RDbCZPotepcGCH0snHc/AmzgHXAzzH0SdjaQ1mPy
         GY84SAdyMr7tNwk6wdulckqzhOojnOhPlp/dW/054ErgQUwYUzUSNHZfm7Pks2+gHnFQ
         klizi6BgKspN3ulK9gCMxeE/OjsQa4b5VJpiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hCM6aDqQlj672QNNN33XxbB1KA2gsQSovUNFK/0sjFg=;
        b=RSTIhHZyIjfcrSUbAF2WPTonC8TetapFJzYrbwWChU9bFO6+QE96SkpU93jjjGZwL3
         HsJ/naibLjawpDDrSh8ivBEUdvr/T1Gp9r1THCF345zybxTIP5V+OGFAnwL7mYLxOR1H
         lTyocPv/v5LIvcUe6hWBABQb8vvLX8CX7kP7yJgydszhjq1zSKDKD1sdDi+x1p9qd4XZ
         6Hoz2DIwXQOMZJc7kpZx/xJu3aD4bDpDRHZ5MvpaVhCiUdUUnsPblHNFm0vTFtq8mKKt
         C6VFt/iUJJZRDluqo74Go7gqj04jle4bkGW/3ImfL6t5cjfqZGhuVLexR3yTnGnHmLKJ
         7sQA==
X-Gm-Message-State: AOAM532Ev2n4qs8IvOjDc0umQ7QRTSQhYK8M+I10hBj3sLxS3A/6CRMl
        /tt+LGPD77Xgz/VjNiu0Fh18vjmwmaLd+ilXbeaM4Q==
X-Google-Smtp-Source: ABdhPJw1I0ipQcf1mUHF8PpOYbrM0NpOo6vsm3gZYflpD3/0aDHJFNjYHGyNJztuit7nHdXSI3z60HYGFeYYm9x7nKY=
X-Received: by 2002:aa7:81d8:0:b029:308:1d33:a5fa with SMTP id
 c24-20020aa781d80000b02903081d33a5famr20861701pfn.55.1627360705046; Mon, 26
 Jul 2021 21:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-9-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:38:13 +0800
Message-ID: <CAATdQgDxBeDCHKy52XCk8bGNA=fcMFMMf9Q5SZZ4L5SZO9xdYQ@mail.gmail.com>
Subject: Re: [v14 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify
 clock providers
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 7:00 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
