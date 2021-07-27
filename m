Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D05C4320A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 647A860E09
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhG0EjS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhG0EjR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:39:17 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1EAC061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:39:17 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f13so3880806plj.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PXqkOOR1pOtYMzsgwXDzf42bCaKreSWxIwhWwvEeqtI=;
        b=AG59QGBYG2d8MJl+DmYb3WwVZKqVqgzyq3bnKbAV3gdhJeC91VtLz4113YUwJCoQO2
         Ct39sGCQGldasZApaM/KRIgysBJ9pVrgbJOVYVEgnlU1m/CalsRwAnIXsQNVX/lFkB+N
         bLBfyxvcMlkA0M8Dq7eyk8XbnByWU0n/wYTRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PXqkOOR1pOtYMzsgwXDzf42bCaKreSWxIwhWwvEeqtI=;
        b=R/Pgnaj96WNPXT5ydWRDfdOVWrB9y1tsjNW8HnGE6v0o5dxcq5z3cxbTaGdHHxPmwB
         kksz9hBtZcB79Ac8w7qEzh/gzTpzqh/5CVigOjZLiKBaPBjFVdeVPwvO5GPw/cqCpnkM
         qhLy8p1cfCbmdPXUFpv5+vWjztCofv+TgSbgFarKPs2yYSIgbWzFfwBQq77UQSpkQ7Q6
         fN3cXkDtFBYuq+6ODHdHpps8W94Jg5tCX8xkzoczDAhwEbIiLTpukh2WK/qmP8ezWJe1
         hiY9ti5PO/IUtWxOu7TgB3CCb/Nah7k+33YuFPew+j9ON+z5a1NdCWCvOgBUh2olLbWR
         1ayg==
X-Gm-Message-State: AOAM533IhRyd8VaWO/Slb7yfdTDTwsg9Bu+W3Cf68ksvSJHNAR5GaPpw
        YD+SWvI+H/atbsy55l/WCZU2fYzrEagkoRRKR3tFlA==
X-Google-Smtp-Source: ABdhPJzk2XckOwQ6RCK2+Om3VQvLRLUz2rIVS0DubiOZfADOQ28pfm6zggkraLwAfixhBtKFGDUi7GmMyCICb0wLD1U=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr21076455pgd.317.1627360756729;
 Mon, 26 Jul 2021 21:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-10-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-10-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:39:05 +0800
Message-ID: <CAATdQgAGEqDyPJ7bnPsCow+BAFYJMdOs_mk8XCkz5Yy66x07mw@mail.gmail.com>
Subject: Re: [v14 09/21] clk: mediatek: Add MT8192 basic clocks support
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

On Mon, Jul 26, 2021 at 7:03 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 basic clock providers, include topckgen, apmixedsys,
> infracfg and pericfg.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
