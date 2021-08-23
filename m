Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C3C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4720561250
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhHWGlV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 02:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbhHWGlU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 02:41:20 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA387C061757
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:40:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id l18so22011086lji.12
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOSScg11+0lHrDw6MS1CV2sNd8OdE1zWDqg1qjqqW2Y=;
        b=PYypPGwhJKWIPHwv0PNNxvgnPr8zgWPvGUeVW/uOkbS0Yv1LkNwjUiYPwyaBu+NxwW
         dYV+82j3pW0jpoHiJeHbehsfiEC8JgTXafrSgSTiLwmlPR+F4eg9qpAJg72XDqbx9Mvc
         gvHQPEr4y/JXHUQ4fJSKsQdp9nRZWGHp+2Lh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOSScg11+0lHrDw6MS1CV2sNd8OdE1zWDqg1qjqqW2Y=;
        b=K0ScTL1SZhbQT6tsTtGuSicn8tIpe6Zj+OSlyFzG5Mj2qQick5okw7ZSblTTWHbdso
         xsBLS6O3NKJqvYhtADnpAv3wmtXitj82OTELRS6QbkI1nXi+fRAWV4N0TQnMHCC9Sz4o
         I4uyR8l0EAKNRuixrqukta+AUdo7l5wDSwsq5otM3m8UQ+hxkWAnUzBWNopYmljs9OIl
         UalC98bwUKz1h1s26MuF8JPv2Cn0zwYf+i4N7q9szqpLNHM6G4XD2Pf47UvGaPHNShot
         uCKvDCiESWoHnw346zsV9Ytp0XBF8Y1HrtC1GiMgSAUlmu1BJq9VHjHwJJznLAuonfOi
         UfOg==
X-Gm-Message-State: AOAM5320A3xnuvspfEX2tkIEfFOhdCaltyUaKYricPtgEhnb631PV0+Z
        81oCx69ThvOVKmF3/jKUcJ2MdXzpufu2Mzxrf3t0JQ==
X-Google-Smtp-Source: ABdhPJzCaNaaScS5j8xwc/H16iJK+VtsRDRaMiPRceRnRRAxbyhImqfGwZYwLIHLdB0yA9X834FjhBCHEBgVDLi4C9I=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr25865507ljl.23.1629700837011;
 Sun, 22 Aug 2021 23:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-5-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-5-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 14:40:26 +0800
Message-ID: <CAGXv+5G8WUW5ByA12ELrUvHVshwj2nm2wMLYZeFt82g4C7BXpw@mail.gmail.com>
Subject: Re: [v2 04/24] clk: mediatek: Add API for clock resource recycle
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:18 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> In order to avoid resource leak when fail clock registartion appears,

Typo. Please fix if you respin a new version.

> so add the common interface to handle it.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
