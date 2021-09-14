Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6F4C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 04:01:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1080160F58
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 04:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhINECZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 00:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhINECY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 00:02:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B34C061760
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 21:01:07 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g1so14276537lfj.12
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqV90RnceA3yUtnO20ku1+cBNKzKF42y3vDyfuFCg6I=;
        b=aymb2xNw9MWDQ5r1YExaL02R2WTT4y3lbBNUJ8uNopNlkPEkkjyy256PCafoeS7q7y
         UKpbxQcBXuQddeingdXPXg3aneXtL4WsuplQpEQZA1tHOcs+YufO5uCYTpjrRq27gWL5
         BG0InFWVu3lKlC/PopTnD3xQ1A5NdkHpqMkC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqV90RnceA3yUtnO20ku1+cBNKzKF42y3vDyfuFCg6I=;
        b=e5b05bKfqETvPXRi1bRvoE6GmdCLuaMptUkKRW+FnnfX3EzI1sz42RSu9Vzdd2vlFE
         T4UVGisRl86FTUwua5XTSkA+nolwmHHxIEkH8c3IMp1kmFDSXMzIjw+fkobDySAsEv6A
         xGK0hYaYG9/6ESrSKqeSUFzC4GgzARMFJsrqux8/QyUEvc79eAiWTSeCjl93U8/PSbLe
         8wXFkoUTp+DTaJUKvgIxNtbrkSei0GSjYYsJ4oq/QQGza23gtTkqt9c4ieCQvWQo7jl+
         PgWvgbtoNTdNuYqglooKq8kDlvPm3rJYJHqjYaD4h4u+j5nU01XVjUuHJowmjAeaFg38
         VTBw==
X-Gm-Message-State: AOAM531C47Q4KZcLFBg/ycIUN1NSHSHMn8/M74BrAmsqmBe93IhjdDKe
        KihsPZKiiCg+gAF+5ojOcpxPex7YrH1POEMDLBV94A==
X-Google-Smtp-Source: ABdhPJyXt6wQvXH4+CYasTSE55XYxX4nwPX+R/D4dbFHy4B3qEDKTJWWK07WS8HP4DQqmeU2wX22v89UmPkH5YLwkHw=
X-Received: by 2002:ac2:5d71:: with SMTP id h17mr11277423lft.670.1631592065978;
 Mon, 13 Sep 2021 21:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-19-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 12:00:55 +0800
Message-ID: <CAGXv+5HWT=9EzdhMvmHOS8Y+CpLyn5WZht_KP_YxzKG+x85AtQ@mail.gmail.com>
Subject: Re: [v3 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 14, 2021 at 10:18 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
