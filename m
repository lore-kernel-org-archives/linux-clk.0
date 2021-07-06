Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DB8C07E96
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 09:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92C0261995
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 09:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhGFJOa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jul 2021 05:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhGFJO3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jul 2021 05:14:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4569DC061760
        for <linux-clk@vger.kernel.org>; Tue,  6 Jul 2021 02:11:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a18so37070941lfs.10
        for <linux-clk@vger.kernel.org>; Tue, 06 Jul 2021 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBkKGziaj4RSYQU8gwfk0FrmJer1D24V4dZYAbmnoxs=;
        b=XS5wTUCdxHC15PUxyxDqrPhwXwxUA3j52nH+yxpG+pfSfYIAtn+iiV4InkG5nO9rSV
         +M68go/eB308e1uJfEQgo+bf9/gZtsOHZri7NHZ68wOMy1Pcfz3NBQW0fmyEM/NiQe+d
         guci0TayPEt9dmWmJp+YYbalVT1NA+kiuaIlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBkKGziaj4RSYQU8gwfk0FrmJer1D24V4dZYAbmnoxs=;
        b=Y+i6qMJ50+uh+/x8YhRG4Wn07JrbbQV/JMBP9QGsiaTiQXyZiLcs587MT2gozR4jGe
         Jm+yHJRkAfO8nMHeNAKJ9q+fyedzHjOynsaQTysV8Fze2ZxYlpULoUe0wqTsGQUEWX3+
         I3qloByl4Tnd1rno+77SuirT66S004bKRbJZlvEhCCK9htYkQ+KnfFltpRBCLq9BAngg
         mpRjW2O60z2MoIvcgL7UZKaQdMH9vV8YttjBGB6NMsrn+S0jSf2irVPgUnvxF8cZFYLl
         +JVnzm+Ib3rDA+T8Q8ApUotw6pPyH931CM7spELx2k6n+v44AeTcwRtv1+ObuoBCjYB2
         Ncig==
X-Gm-Message-State: AOAM533vjruhktgqFiCZuumKUTO3vvfAmHBLM8ZX/GEBaLfpJPDhH+Cs
        N/XYmMvPkDTIpB5PTpQhuPRxNs3oKfI8zO6XvoMmR4dXVNqQtA==
X-Google-Smtp-Source: ABdhPJygTAoCzUuSlXy2SSRDYl6kk7yXXtcJN9JToMMi6g5XXB+H+1QY3X3T5IW2n3XK0DbgU6raZl/fZlssaegBtgA=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr14742181lfh.342.1625562709577;
 Tue, 06 Jul 2021 02:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-11-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-11-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 6 Jul 2021 17:11:38 +0800
Message-ID: <CAGXv+5H-+cjbvivtAs0p=8o-ifkfqyWhSHBus=KBRwZW2wERLQ@mail.gmail.com>
Subject: Re: [PATCH 10/22] clk: mediatek: Add MT8195 ipesys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 7:08 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock provider

It would be better if you could provide some more context for the patch,
such as what hardware subsystem / group does this belong to, what do
these clocks feed into? And in the case of supporting multiple clock
controllers in one driver, what led you to group them in the same
driver?

This applies to all your patches. The single statement "Add xxx clock
provider" is simply repeating what the subject already says.

The code looks OK.

Thanks
ChenYu

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
