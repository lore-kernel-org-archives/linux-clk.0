Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34487C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 163956108C
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbhG0Elw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhG0Elw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:41:52 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B85C061757
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:41:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so2441673pjb.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NnMeB9D1PDCqqXeMDn2tfizMDoghceb94CgirmLY5WE=;
        b=VDvbmJN73quQ8KOcHSbPXKWh4VmvtbZMrn8SdG88fNaYeJ8kGSDow9TKlVVkjkhlku
         iJshHr6RjwPTAYMNYMM2dLditJtDIzQMmBubUwgEr2i5SXxECyPiZsUChPQ5XaUTr293
         +5SNoKR3V4zVZOpMpfvC7fSOGqE6z0D+FUQPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnMeB9D1PDCqqXeMDn2tfizMDoghceb94CgirmLY5WE=;
        b=Ao6KFEaIozW071oWXprWj5xT2icFGnBv+UtMYj0FQ4WD0usQ4fnpyylih06VLHI1E9
         2b7L/YwL7bOxNIXYggJLwe1dRsR5jm3q31gGta8pGr23Sje4SmI44JPBYnUvleJWLQkk
         Q031WZncPRBfhGIrYD0tyZ+sRqEuOsN9wfD0LwAn2x7Djo6HNG7uqCcRUxbZJyXS4b5n
         gNyStETUMjhq/f6h9EGBKhviC+3hVteuR8Z+CSGEYZBj3E6ygW7r7qGxpXWqFnJs6+V6
         NKwqngD3E4jmr2mg4IMNwVTsTMvqsftd3qpdTQlL7VdT6jBGC6+eIpSY5qDC5xeAFIF1
         RVYw==
X-Gm-Message-State: AOAM530q7SoJyEvFiYl431jDq27t0KRQDFsR0+MhFOaIUlSi1kipZAro
        cvauwMH13sXI2zgoFOjfDGvnsygynq0mpACS/+CFJw==
X-Google-Smtp-Source: ABdhPJxZcyF8BWfebyjk7/Qh5DO6KidriFsLda2+2nQq0/LmRyIGrEeAG4AVJ6dYzM1CxThGnf699L4x+q6Hfo+gEkw=
X-Received: by 2002:a17:90a:f3cb:: with SMTP id ha11mr2394863pjb.144.1627360912409;
 Mon, 26 Jul 2021 21:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-13-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-13-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:41:41 +0800
Message-ID: <CAATdQgCJVjd2avYd-h4aQK02tNMKFJFbmfaE_waPVJHr=aJNhw@mail.gmail.com>
Subject: Re: [v14 12/21] clk: mediatek: Add MT8192 imgsys clock support
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

On Mon, Jul 26, 2021 at 7:12 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 imgsys and imgsys2 clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
