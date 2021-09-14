Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBDBC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEAD2610CC
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239306AbhIND76 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239029AbhIND76 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 23:59:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2064CC061574
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:58:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i7so9556814lfr.13
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TYXx01U0tDECSy7JDqKTFZRqiHgt/31FBTGRy6ai3aA=;
        b=Or/gbQnA/XUU1D0ryVjELuysSlbT7/4W5uQGeLVh/UkzA8/EtOLCc0nk5xLeF8QzmI
         MPf7MkjVCVqbsYc+RRT+81skOJNJcbF3sVvJ0kuF591Cx6rAG53s8BsXhUX/2u3D3PJx
         h0VzBUzzlgCmN6FQpivbNysemdpSXUR2BMNAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TYXx01U0tDECSy7JDqKTFZRqiHgt/31FBTGRy6ai3aA=;
        b=pdeJRRsvKS3+LG2g2yJa0Sna/SlIFBWqFA9wkd/mDec8E+vOIR1pUdbJapuwixCiyF
         xFOBtqq7pGnYsBimNkJN9mFa7h5qJgPj+Z/nSo9KlUlrvQdt09f41jTk22yhlgJqpmsz
         EVtr+8lHbUiu6Gj7LG1urxFbNRMiov5gBD8fY8WmAm7EF7TYAwVo7e0wPPL42V1FergP
         MRjPGSXWcwfKbt/1DsXbdVaQYfhVKBXg/dXdH+7pF9tMeDMucd3vHZPn/x6T2jJbvE7O
         /5GevB5S1OUyVVOpAKqnrYNF3+4vBnhIgseVFmU9gnYPvf5D6QZ/Ue5N8/tGJr6eI2Bx
         Y8pg==
X-Gm-Message-State: AOAM531dlRBRtarLsJBsRZFmwdQSMN/+h/hOAwif/03Kfg/LEFRSN3B8
        ZS5vOo8S1aulIy2g937TXy0Ty9paETD61+Mj3Lm4uw==
X-Google-Smtp-Source: ABdhPJzetqrZuHRb1zBUZBl5jXsCnNOeo26KfVllB6gntAeKb2VwkVaIX25CHsz0cvvtPbAOwKiYRScSOdl42Yuj8qg=
X-Received: by 2002:a05:6512:c16:: with SMTP id z22mr12235087lfu.482.1631591919573;
 Mon, 13 Sep 2021 20:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-14-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 11:58:28 +0800
Message-ID: <CAGXv+5Gic9ws8f89DyRhmqtb+ua8kFocNLnHLPrPU_3V=v2L-Q@mail.gmail.com>
Subject: Re: [v3 13/24] clk: mediatek: Add MT8195 ipesys clock support
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

On Tue, Sep 14, 2021 at 10:17 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
