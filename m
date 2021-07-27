Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F587C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC5A56023F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbhG0Ekv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbhG0Ekt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:40:49 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59129C061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:40:49 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3168456pjf.4
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZkLU5+I68BDSpPUBxl1D1RwJQIxuQUsCqbOXE0ZiPA=;
        b=dONWso6Xo2S65eXHJ3a6MOLOGmiJLOocwrJ8F9zzqt+sh1tr4IOowdeANx5B4QRv3J
         uW9rYNyF6I/HJg2TCbpnsogvvQv4aU2gaJTuRnjia9nr6Tzgrs47MsnPWdGxZjgIomNu
         /WRyPRS2yydvYLgsviGGRJSGKoHvDQ6AEdV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZkLU5+I68BDSpPUBxl1D1RwJQIxuQUsCqbOXE0ZiPA=;
        b=L/RepGz0YqJQ2yxrlBeK5yldk8WWwcK0raRdzQFd9mLhOSx0VplFXIWqilJPIYG+sx
         ZQvoyprMikRNZ79uv8m7gD3vThR5sCdZPZV/PD3Rr/W/S4fgWqZhuiLW6Jx+aDKM2AHT
         YQOEtR5CPPsdRq6Ib/q2csD7Xu5MjOknynkdA7Zx1c6lL/U7qRLHDsGiZTtv3Ni78Ov8
         TTiWMJk2FhBZP2/y8q7Hy4qzDlYmJpsfyz0cwjRXUt3NmChZqDWIL9CPCAW7nIJ1r4dl
         I55gcY9dEb6D3iuh4V/E3jcvoYJVbIEpdehZmBOsU5mWJE9hIRkebFitKCovfIvfwVu6
         cMQA==
X-Gm-Message-State: AOAM531gQAC/62ncafN4MMqFM/++SDyLzR2pdY8etNufh1sMg5sePm1K
        hdz+4EVCsZ1Y8jk29CGyp6DQdz/H7vCbwGrf/G2Mfw==
X-Google-Smtp-Source: ABdhPJwsbl6R45nDXufrB/990yLoLfbG3vMw+gUt78UIcaNlMR4EJGIo1SDOVr+Sotax4A15ROr6FzxBbyl2wFCd0WM=
X-Received: by 2002:aa7:8387:0:b029:395:a683:a0e6 with SMTP id
 u7-20020aa783870000b0290395a683a0e6mr10051268pfm.12.1627360848905; Mon, 26
 Jul 2021 21:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-11-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-11-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:40:37 +0800
Message-ID: <CAATdQgD63DTWWq1chx4n3sMEc_Y4ghnx4z6gOa=feFkBGsy4uw@mail.gmail.com>
Subject: Re: [v14 10/21] clk: mediatek: Add MT8192 audio clock support
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
> Add MT8192 audio clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
