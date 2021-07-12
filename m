Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19946C07E99
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jul 2021 09:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF83960FE9
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jul 2021 09:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbhGLJmh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jul 2021 05:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382035AbhGLJk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jul 2021 05:40:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC66C0613E5
        for <linux-clk@vger.kernel.org>; Mon, 12 Jul 2021 02:38:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q18so42147992lfc.7
        for <linux-clk@vger.kernel.org>; Mon, 12 Jul 2021 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fxJCUCjSlgXxGDjLXHj9U/H++hzbmhE6H12woYxnzEo=;
        b=kEXIVazNxdPeQjIQRJkZ34NK8TOWTN8cN3PTg4u6h+qBpMX/8NP2QnXimoDsrD47U1
         Nx9WHbWZ5zUBwObZWK89MK5QKklyaL19EKODkPwj8rr8NhSRf6ZHb7DGRkq9nGOS6W6s
         rlmPcHBaJlpyL6qugKjw7qGyQhPNR06FjEh2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fxJCUCjSlgXxGDjLXHj9U/H++hzbmhE6H12woYxnzEo=;
        b=lkMirMTOl+tKaI3u5F5Ecj72657r/+h1VHz8c0Io/AWaR46xewv81Q/0e+05j+qQxV
         E6OwZRdR8nDn8ls0B6fOrAHNxQdi1eYURCcHeKmnF0rDxZh+CfhQXFSXzuacqRpMtB45
         8S6F+AoRma6CKDE7YwnlThXyu/Jfmk9JlZrdIl1KISuhSU52ek6y25ijvFd9UyunOHyK
         3x8hMHLZs0Teh++pLvLRXFAMatWsRdwtSjQO66wUA19bPGqA1LmGWQ+RE5mQQGq2Ffws
         V0NlQGZXuylygNDiRYWKTf0ZogzZ/O/iYkMLxzwu55upl+Are3+dVtuy5+dpBd2akCZj
         SlGg==
X-Gm-Message-State: AOAM531UY/KKScw93SDWCwM3eik/POuyqbz+lgJlOdQmngTX006HYNKg
        ahF0P4ELqP8Sl9dTa7RDx1NTajOvSgS8v3INejc99g==
X-Google-Smtp-Source: ABdhPJxQC8DmA5HEXaqu0oHdMTjSbon83tv6yVWxtwXNhe/ty5TRr6RQ+xzlTDU/2wgHcAMAinpsKbdHUu82InisZBc=
X-Received: by 2002:a19:858b:: with SMTP id h133mr20580359lfd.656.1626082687405;
 Mon, 12 Jul 2021 02:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-3-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 12 Jul 2021 17:37:56 +0800
Message-ID: <CAGXv+5Hn2YE5yhX61z375vzJufsYyWNBkB07zMUqcPty0YxAaQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] clk: mediatek: Add dt-bindings of MT8195 clocks
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Jun 17, 2021 at 7:02 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 clock dt-bindings, include topckgen, apmixedsys,
> infracfg_ao, pericfg_ao and subsystem clocks.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8195-clk.h | 989 +++++++++++++++++++++++++
>  1 file changed, 989 insertions(+)

This is a really long list. I don't think all of them need to be exposed,
especially the intermediate ones in TOPCKGEN. In such cases the not-to-be-
exposed clock indices could be moved to a header file in the driver directory,
or simply left out.

The Allwinner/sunxi-ng drivers do the former while the Rockchip drivers do
the latter. The Mediatek clock drivers are more similar in structure and
design to the Rockchip ones.


Regards
ChenYu
