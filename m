Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A08C4320A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED87861078
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhG0Eog (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbhG0Eof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:44:35 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4ACC061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:44:35 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so2343837pja.5
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Upw3Kqn05tBN6OFp46vi1aIozZmbzcynjmLNKwgK9po=;
        b=gmugk18f4PMAnQoxaFPvxBgivCKZbUuZkqcDUby/i98d7b9mBsBeFnXnEp/X9Tiieu
         JckgJXJSmLdT/PVRLt3m5n5MomEp6aMIzhfofL7ilEqv0xRd5YsKE8AEWqX+B0TLgYHJ
         ijecndFTtmrZ/kGQEV0mzd+c9Q/bvjRHqDfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Upw3Kqn05tBN6OFp46vi1aIozZmbzcynjmLNKwgK9po=;
        b=KMDmOWGimcktFOhtV8KXgKPBiZDY0/HX1Pvm3f+iLcMoBt80tfph2b/ZRtACF503Qy
         XVmnqSzSZZnx9hTHnv/3GcUmusuSvOy2QWqE8QlGNsgfRflLYPM6cc64w3yv0jvFEVO3
         QW1jC4MMyh1MfPW6zO8vWnx8fHOmdThm3yF4kpSWvESOJLe63/MRHapRUDPaR2lRy2LG
         0GbE/B+sCa7QjlCathRZt1soh/P9QTnt4EHHSQd+wtQ0/WJLQg8ngVY1L1bRQ63Nv3jz
         L+5Vkbo5bcqLfTs4Al/D0xqUom64vssxH3wkgctWsQU2cfFBQuJGeqzjDZmTV57FMKyX
         9yZQ==
X-Gm-Message-State: AOAM531xz8ZfidunQYq4OgCzKNN8E3UIUkviImEZvAdFpIAxQhnm3DR2
        H8MzPKEFyHZIEHI7G+Inx74t0mdIGANVwSy2RsZGqw==
X-Google-Smtp-Source: ABdhPJyZyDPgsADtQXma5p4ApMONsh5r1xW3sEcgGcnCFWSzk3ZBPkyUa/IuSLHWVrLfUjjrIU8rcRz6q4kHA6Sc2g8=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr21092441pgd.317.1627361074754;
 Mon, 26 Jul 2021 21:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-17-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-17-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:44:24 +0800
Message-ID: <CAATdQgDwQtqbYyUXo1c7sufwchGqZ7CntB1eHhksNVfSZ68hmg@mail.gmail.com>
Subject: Re: [v14 16/21] clk: mediatek: Add MT8192 mfgcfg clock support
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

On Mon, Jul 26, 2021 at 7:09 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 mfgcfg clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
