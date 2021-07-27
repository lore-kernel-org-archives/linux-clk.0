Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A15CC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E02CC60FE4
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235027AbhG0ErX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbhG0ErX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:47:23 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D395AC061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:47:23 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n10so14503299plf.4
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZrbt9yR8hbrQ8uYyC/1sSAYUKzr6dRf2IBuVuefs44=;
        b=M9rmhyJs0OAWFelfhkQwSWB48PlkyYfaxXouNKWkCTVZK5xj1A5A07a2FTc+WX50vx
         X9FWYB5LhBrtwtqOkD3mwjzsfFTNcUAiTalq8AU305lAgHdmskc6dPLVGWnAkhwxIhya
         qTtn3xB6e/XzKGTGhf5NqtsbbnhSwHgbTd71k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZrbt9yR8hbrQ8uYyC/1sSAYUKzr6dRf2IBuVuefs44=;
        b=SNBHoR/fc99qdr3giv/nqyyZ9NuFpBF3F4a/Gc0b0BBeGuhgGujPrK06EVIGlNNdy3
         Y8y5l62Q0flrgfMSCm2qNKDFwOd4EiLu4YkcSI45abe/ipL2ZuwMg3RM6xhk0HkJ2eoU
         D4UoSImp1LXbwkyMOrF/QlQfY9V+9K2wiaFk5DCe54MM6gDH9jwHhf6HRPV8mmF/ZJOE
         iyJPwFUYDXM77OMqGQVVnO041Pozg7v6Dlb5S5tsN48h/qcxtt5JzT4tZmF1YrprH1L8
         jJBWJ4lSgei1itmxfpxpmS7ple6yVueNIx1STeZn4aPXi1Sxb9CH+9a/r+E0A2jT8XFH
         VQ3g==
X-Gm-Message-State: AOAM5300VqFAgUGQW3Ye2m3Xjkvven3gJmz0bsb1C4Tz2JcXCJcVmUrK
        er3kemPfTDURREhYJBStuQf5/tfzAZb36gzY4TfETA==
X-Google-Smtp-Source: ABdhPJyMrzz2w0ZyuzNoS3umV6X1k23qvdWBuG/YbXZPQ68RCfZGsiO8UslIzHyStg5/1car2IaVGcpVboN/TDltUzc=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr2318141pjn.112.1627361243434;
 Mon, 26 Jul 2021 21:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-21-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-21-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:47:12 +0800
Message-ID: <CAATdQgCzVffmJ=CQ0JqFQPjreySQNUsfNamjP05m8Jq+e5g=gQ@mail.gmail.com>
Subject: Re: [v14 20/21] clk: mediatek: Add MT8192 vdecsys clock support
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 7:11 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 vdecsys and vdecsys soc clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
