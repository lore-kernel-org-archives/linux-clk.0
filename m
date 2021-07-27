Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDF6C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FD7661078
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbhG0Er7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbhG0Er4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:47:56 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FFDC061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:47:56 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k4-20020a17090a5144b02901731c776526so2364386pjm.4
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGG7RdUKVnT/omOvzH3kep9Wm/lxv7TRThq47QpIc6U=;
        b=fPBwG3J8Gj98l4Fltb9Yei/aEYXt+b+10cEkqeUH2qfJlKpIYVmENKFdDMnfCmjMzc
         WZR0jfwmpiuDcihSVapgx48UBxugPpFm2BaibyPCX/L8pXurh8eN5TadhNDjTF0mrbT9
         B6IFMynY5O6UZIG80/lsQLdkaNZEMsFtS5v4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGG7RdUKVnT/omOvzH3kep9Wm/lxv7TRThq47QpIc6U=;
        b=ibuy3VLFGzngUIswOwhHmdbpKA3hYImkxZCdPUoQyi+Did4ZHTdaJLuve9gyJZZTeJ
         1J8Tzaqes8b6grp6YNEAKlWrs9pufmND36WyxqVFFcBA3ChRSTu3mmIOyMUm/brfQlhe
         P4Km/cG6EUVEqzjtxPus+Do1Dxh5/jqjyjehCZwkn07t/RHy+5ihiZPko4z4MNphyoxC
         IuU1KLmTl1jO2gR5Kdd3GsJx+o9wptm6rWMnXOnX0L80JguBwDdqZAEI7fbAf+8I+QPf
         afIwcJekpkIy7jGr41TZ97BtAhMvhYapPBk27iqjxN/5ptMekanfsxyTLRGZdaTsPZHT
         hQCg==
X-Gm-Message-State: AOAM5306FtJZkQn37l3cN1L30zcPtmkuGUuspKzHrAob6qLqmriv5cpo
        IcIz93J2pW1ScVQ9fxKfxt8Ak+7wSkVMODC8QShDjQ==
X-Google-Smtp-Source: ABdhPJySJP+/ZQoBEHFro/AzJ188fCTnIOO/lwuwj0nJAUhz+aPHfYkIzGrffavFmHSBLICxTeAXj4op7J6mUDK/CV8=
X-Received: by 2002:a17:90b:2251:: with SMTP id hk17mr2401217pjb.126.1627361276245;
 Mon, 26 Jul 2021 21:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-22-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-22-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:47:45 +0800
Message-ID: <CAATdQgDhiG_Omph14o-Wu79+4W1AVyC70o5Rdq3Q37T4cJ+xnA@mail.gmail.com>
Subject: Re: [v14 21/21] clk: mediatek: Add MT8192 vencsys clock support
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

On Mon, Jul 26, 2021 at 7:03 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 vencsys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
