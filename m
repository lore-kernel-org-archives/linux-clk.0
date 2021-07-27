Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73858C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 533F860FEE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhG0E1k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhG0E1i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:27:38 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912F2C061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:27:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e14so14378150plh.8
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXQhLU0KIJvDHX5sb6jl1W+wgDKUS1guQrE0JC7Yn3Y=;
        b=RKYTKymblzDOhbLv7PWiW7eSUaUlTkIvosw0kwN52o4QZ13MQ+pI3E3f9BLAXyxuRV
         zPgtVU+DORJ+W+MTaB1FlAT1p+dCRv1YFYa0QtARGTVKNCLUmTgFRwX+xdOLhdU6CXa8
         Qz56OKEZVFeHnr8rYzXRXJ5//xYDcWaG6H1Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXQhLU0KIJvDHX5sb6jl1W+wgDKUS1guQrE0JC7Yn3Y=;
        b=lFrZoE+e9N1IyMeaYtN1I7nLTPXI+v6gJJrVvY9+b5tcp7W/9yyksu1FcX/D7Pkg0n
         vyxRIA6pKgAs1TAqmWxbjffB1N+Gq9ErVAY+miTCutley+EDF2iClABex+h9a6GVtzgE
         KFIGHW3xfY6stYrWsTn8zjdZeCXudparvTDwOCyW4CCB1DX55K9Ju8j6ghsDImUwMuYx
         sqjCFwUfISP8hgbOOvuAumYDNsmSWoxgJ8yocjrca8H4ft924e4+zGi8W0m9dBSsXJUe
         FpY+tzwDTn8QWXOItmA0pAs2a5eKmNL7j5lifTRq9zdNApt41W2sayZp/LZgapAkl411
         YQKA==
X-Gm-Message-State: AOAM531SrFSn5WkAGPzlVgfpR7Z7q5mWF0JTALWj605+2btcPvz3GwRW
        XtbgNqI1OJSQawhe8/z8nDW19Svf4yllfuMLbeDCjw==
X-Google-Smtp-Source: ABdhPJxkczvv9x68Kqa5d1aZDdqcHw3Asoy9mySgxuq7/MfpZdsYtC1IRV3W3oHxZjYYhlcYOpCkAF6RuR5x8MDB0sg=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr6345723pls.60.1627360058151; Mon, 26 Jul
 2021 21:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com> <20210706061920.16013-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210706061920.16013-9-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:27:27 +0800
Message-ID: <CAATdQgCb5WxE3MjFzWsB5s-rjtTMGF7a3bNbrO8OmRiFrOLEGg@mail.gmail.com>
Subject: Re: [v13 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify
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

Hi,

On Tue, Jul 6, 2021 at 2:28 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
