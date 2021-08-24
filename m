Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979CEC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 12:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 783466127B
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 12:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237288AbhHXM3d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbhHXM3d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 08:29:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33C2C061757
        for <linux-clk@vger.kernel.org>; Tue, 24 Aug 2021 05:28:48 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d16so37357416ljq.4
        for <linux-clk@vger.kernel.org>; Tue, 24 Aug 2021 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Y3VzmMgbICYRNQw2DHv21oB4Sxs/J+2L7op01Yxapw=;
        b=UQ7C1T7UlxeZmatVqou6+y7UVfvzWmz4J+ta/cZGSPeq81w19oxQ4IYE1oQIdVEdYO
         EQwxcHhhkuUN96VtLspi89zSaH2zc1SWdCWstFc/JbsB4kBUBJE1zs5/iJHdvzNwD2Bi
         PRISOJO5sOd2MnHwENefobDFeY0cLHhsyM5sOuFqzDAgcRIn6vrjWI6vKqatKcgxkpbN
         2P2Lu1qjGHS+MrE2Uu2+ba3P9b7D1qMKDit09dLILWJQ4H+k6m7jMV6GcPFfmdxSxvic
         dzq+gToxB4rG7bjK/lM+GrcSdpFAHPejeYGjrckfGfoEjxDVwEGN0c9Ubc1PGb6Sr2qe
         dCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Y3VzmMgbICYRNQw2DHv21oB4Sxs/J+2L7op01Yxapw=;
        b=SXEpBKOEifNvGumVkcGzzvnFH58yV8yRJWALSLu2Lp+axCfG3PDTwy7Elxdw5Gv/Rf
         TrCmUNQbP9l7QmtpBy6gkYb1TyGm9wVPvBaGj2JVVvsN4hSja1uS2YHm47U9ICjJLpE5
         7/2vzdnfBtbKJLXqLv1gYSjXMRUzEz4cUo3l4lVypLcp/qJ5EVTGZBo4C8xf4NqCc0yJ
         jEtaHbQzsSv7KrVncP2QHrOGgRkFs7qnRtMCQSx9ww2TVgFGwnYPafbgt7j4wfuytSuf
         QdtyFaiCoHhE4YVXprkpeu4+6Q95v9IHMLuyhRj1x4Uy5cKX1Nf9Dw7W5BifHarj/CUp
         NNww==
X-Gm-Message-State: AOAM533VF967YtE5fExAvN8A3q58cv3Sk9kG2c95SGDfW/MpMUWdCD++
        ZVCISFRz1KW1lse0xz30iBM9YysqkVAv/fdBW9Y=
X-Google-Smtp-Source: ABdhPJz0itHk0Ti0tnwhGXGcqOeA6MKzmMcD3KjeZ03+QJzvcwh4ck96KTcEEE+jRZ67J8H/tRpr0g12vLFWZGJJqck=
X-Received: by 2002:a2e:84ca:: with SMTP id q10mr31887428ljh.490.1629808127327;
 Tue, 24 Aug 2021 05:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210819202036.2084782-1-marex@denx.de>
In-Reply-To: <20210819202036.2084782-1-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 24 Aug 2021 09:28:36 -0300
Message-ID: <CAOMZO5DsfdBxZLWpLRaBXF5KwWY5JZUx9PJ7PGGNa+VfucHzDQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mn: Add M7 core clock
To:     Marek Vasut <marex@denx.de>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Thu, Aug 19, 2021 at 5:20 PM Marek Vasut <marex@denx.de> wrote:
>
> Add missing M7 core clock entry to the iMX8MN clock driver.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
